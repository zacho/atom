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
 * A bare bones worker to test Gearman / AtoM jobs
 *
 * @package    symfony
 * @subpackage jobs
 */

class arImportCsvJob extends arBaseJob
{
  public function run($parameters)
  {
    $this->addRequiredParameters(array('path'));
    parent::run($parameters);

    $path = sfConfig::get('sf_root_dir') . '/uploads/metadata/' . $parameters['path'];

    try
    {
      $this->info("Importing csv " . $path);

      $importer = new QubitCsvImport;
      $importer->indexDuringImport = true;
      $importer->import($path);
    }
    catch (Exception $e)
    {
      $this->error($e->__toString());
      return false;
    }

    $this->job->setStatusCompleted();
    $this->job->save();

    return true;
  }
}
