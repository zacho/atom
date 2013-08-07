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

class sfIsaarPluginDatesComponent extends EventEditComponent
{
  public static
    $NAMES = array(
      'date',
      'endDate',
      'startDate');

  public function processForm()
  {
    $params = array();
    if (isset($this->request->editDates))
    {
      $params = $this->request->editDates;
    }

    $dontDeleteIds = array();
    foreach ($params as $item)
    {
      // Continue only if user typed something
      if (1 > strlen($item['date'])
        && 1 > strlen($item['endDate'])
          && 1 > strlen($item['startDate']))
      {
        continue;
      }

      $this->form->bind($item);
      if ($this->form->isValid())
      {
        $this->event = null;
        if (isset($item['id']))
        {
          $this->event = QubitEvent::getById($item['id']);
        }
        if (is_null($this->event))
        {
          $this->event = new QubitEvent;
          $this->event['actorId'] = $this->resource->id;
        }

        $this->event->typeId = QubitTerm::DATES_OF_EXISTENCE_ID;

        foreach ($this->form as $field)
        {
          if (isset($item[$field->getName()]))
          {
            $this->processField($field);
          }
        }

        $this->event->save();
        $dontDeleteIds[] = $this->event->id;
      }
    }

    foreach ($this->resource->getDatesOfExistenceEvents() as $item)
    {
      if (false === array_search($item->id, $dontDeleteIds))
      {
        $item->delete();
      }
    }
  }
}
