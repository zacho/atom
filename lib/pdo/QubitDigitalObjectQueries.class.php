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
 * Various raw SQL queries to manipulate digital objects
 *
 * @package    AccesstoMemory
 * @subpackage pdo
 * @author     Mike G <mikeg@artefactual.com>
 */

class QubitDigitalObjectQueries
{
  /**
   * Delete a digital object by its id
   *
   * @param int id  The digital object id
   */
  public static function deleteById($id)
  {
    $ioId = self::getInformationObjectId($id);

    // Delete derivatives
    $derivs = self::getDerivativesByParentId($id);
    foreach ($derivs as $derivative)
    {
      self::deleteById($derivative->id);
    }

    // Delete associated slug
    QubitSlugQueries::deleteByObjectId($id);

    // Delete relations
    // TODO: Delete rights rows if relation type = 168
    QubitRelationQueries::deleteBySubjectId($id);
    QubitRelationQueries::deleteByObjectId($id);

    // Delete the digital_object itself and the underlying object
    QubitPdo::prepareAndExecute('DELETE FROM digital_object WHERE id=?', array($id));
    QubitObjectQueries::deleteById($id);

    // Update search index
    if ($ioId)
    {
      $io = QubitInformationObject::getById($ioId);

      if ($io)
      {
        QubitSearch::getInstance()->update($io); 
      }
    }
  }

  /**
   * Get derivatives' data given specified digital object id
   *
   * @param int id  The digital object id
   * @return mixed  Derivative digital object data
   */
  public static function getDerivativesByParentId($id)
  {
    return QubitPdo::fetchAll('SELECT * FROM digital_object WHERE parent_id=?', array($id));
  }

  /**
   * Get information object data that a digital object is attached to
   *
   * @param int id  The digital object id
   * @return mixed  The information object id that this digital object is attached to
   */
  public static function getInformationObjectId($id)
  {
    return QubitPdo::fetchColumn('SELECT information_object_id FROM digital_object WHERE id=?', array($id));
  }
}