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

class InformationObjectFindingAidAction extends sfAction
{
  // export an object w/relations as an XML document with selected schema
  public function execute($request)
  {
    if (isset($this->getRoute()->resource) && sfContext::getInstance()->user->isAuthenticated())
    {
      $id = $this->getRoute()->resource->id;

      // TODO: Make this use gearman.yml?
      $gmClient = new Net_Gearman_Client('localhost:4730');
      $gmClient->arGenerateFindingAid(array(
        'id' => $id,
        'url' => $request->getHttpHeader('referer')
      ));

      $jobStatus = QubitProperty::getOneByObjectIdAndName($id, 'finding_aid_status');
      if ($jobStatus === null)
      {
        $jobStatus = new QubitProperty;
      }

      $jobStatus->setObjectId($id);
      $jobStatus->setName('finding_aid_status');
      $jobStatus->setScope('information_object');
      $jobStatus->setValue('generating');
      $jobStatus->save();
    }

    $this->redirect($request->getHttpHeader('referer'));
  }
}
