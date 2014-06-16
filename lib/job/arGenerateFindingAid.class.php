<?php

/*
 * This file is part of the Access to Memory (AtoM) software.
 *
 * Access to Memory (AtoM) is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Access to Memory (AtoM) is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Access to Memory (AtoM).  If not, see <http://www.gnu.org/licenses/>.
 */

/**
 * @package    AccesstoMemory
 * @author     Mike G <mikeg@artefactual.com
 */

class arGenerateFindingAid extends Net_Gearman_Job_Common
{
  private $dispatcher = null;
  private $resourceId = 0;

  public function run($options)
  {
    $this->dispatcher = sfContext::getInstance()->getEventDispatcher();
    $appRoot = dirname(__FILE__) . '/../..';

    // --------------------------------------------------------------------

    $this->log('Generating finding aid...');
    $this->resourceId = $options['id'];

    try
    {
      $resource = QubitInformationObject::getById($this->resourceId);
      if (!$resource)
      {
        $this->log('Error: Could not find an information object with id=' . $this->resourceId);
        $this->setStatus(false);
        return false;
      }

      // Determine language(s) used in the export
      $exportLanguage = sfContext::getInstance()->user->getCulture();
      $sourceLanguage = $resource->getSourceCulture();

      $eadFileHandle = tmpfile();
      $foFileHandle = tmpfile();

      if (!$eadFileHandle || !$foFileHandle)
      {
        $this->log('Failed to create temporary file.');
        $this->setStatus(false);
        return false;
      }

      $eadFilePath = $this->getTmpFilePath($eadFileHandle);
      $foFilePath = $this->getTmpFilePath($foFileHandle);

      // Call generate EAD task
      $exportTask = new eadExportTask($this->dispatcher, new sfFormatter);
      $exportTask->run("--single-id=$resource->id $eadFilePath");

      // Crank the XML through XSL stylesheet and fix header / fonds URL
      $eadXslFilePath = $appRoot . '/lib/task/pdf/ead-pdf.xsl';
      $saxonPath = $appRoot . '/lib/task/pdf/saxon9he.jar';

      $eadFileString = file_get_contents($eadFilePath);

      fprintf($eadFileHandle, "%s", $this->fixHeader($eadFileString,
        isset($options['url']) ? $options['url'] : null));

      $pdfPath = sfConfig::get('sf_web_dir') . DIRECTORY_SEPARATOR . self::getFindingAidPath($this->resourceId);;
      $junk = array();

      exec(sprintf("java -jar '%s' -s:'%s' -xsl:'%s' -o:'%s'",
        $saxonPath, $eadFilePath, $eadXslFilePath, $foFilePath), $junk, $exitCode);

      if ($exitCode != 0)
      {
        $this->log('Transforming the EAD with Saxon has failed');
        $this->setStatus(false);
        return false;
      }

      // Use FOP generated in previous step to generate PDF
      exec(sprintf("fop -r -d -fo '%s' -pdf '%s'", $foFilePath, $pdfPath), $junk, $exitCode);

      if ($exitCode != 0)
      {
        $this->log('Converting the EAD FO to PDF has failed.');
        $this->setStatus(false);
        return false;
      }

      $this->log("PDF generated successfully: $pdfPath");

      fclose($eadFileHandle); // Will delete the tmp file
      fclose($foFileHandle);
    }
    catch (Exception $e)
    {
      $this->log(sprintf('Exception: %s', $e->getMessage()));
      $this->setStatus(false);
      return false;
    }

    $this->log('Job finished.');
    $this->setStatus(true);

    return true;
  }

  private static function fixHeader($xmlString, $url = null)
  {
    // Apache FOP requires certain namespaces to be included in the XML in order to process it.
    $xmlString = preg_replace('(<ead .*?>|<ead>)', '<ead xmlns:ns2="http://www.w3.org/1999/xlink" ' .
        'xmlns="urn:isbn:1-931666-22-9" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">', $xmlString);

    if ($url !== null)
    {
      // Since we call the EAD generation from inside Symfony and not as part as a web request,
      // the url was returning symfony://weirdurlhere. We can get around this by passing the referring url into
      // the job as an option when the user clicks 'generate' and replace the url in the EAD manually.
      $xmlString = preg_replace('/<eadid(.*?)url=\".*?\"(.*?)>/', '<eadid$1url="' . $url . '"$2>', $xmlString);
    }

    return $xmlString;
  }

  private function log($message)
  {
    $this->dispatcher->notify(new sfEvent($this, 'gearman.worker.log', array('message' => $message)));
  }

  private function getTmpFilePath($handle)
  {
    $meta_data = stream_get_meta_data($handle);
    return $meta_data['uri'];
  }

  private function setStatus($success)
  {
    $jobStatus = QubitProperty::getOneByObjectIdAndName($this->resourceId, 'finding_aid_status');
    if ($jobStatus === null)
    {
      $jobStatus = new QubitProperty;
    }

    $jobStatus->setObjectId($this->resourceId);
    $jobStatus->setName('finding_aid_status');
    $jobStatus->setScope('information_object');

    $jobStatus->setValue(($success) ? 'generated' : 'error');
    $jobStatus->save();
  }

  public static function getStatus($id)
  {
    $jobStatus = QubitProperty::getOneByObjectIdAndName($id, 'finding_aid_status');
    if ($jobStatus !== null)
    {
      return $jobStatus->value;
    }

    return 'none';
  }

  public static function getFindingAidPath($id)
  {
    return 'downloads/' . $id . '.pdf';
  }
}
