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
 * Various raw SQL queries to manipulate relations
 *
 * @package    AccesstoMemory
 * @subpackage pdo
 * @author     Mike G <mikeg@artefactual.com>
 */

class QubitRelationQueries
{
  /**
   * Delete relation based on subject id
   *
   * @param int id  The subject id
   */
  public static function deleteBySubjectId($id)
  {
    self::deleteByColAndValue('subject_id', $id);
  }

  /**
   * Delete relation based on object id
   *
   * @param int id  The object id
   */
  public static function deleteByObjectId($id)
  {
    self::deleteByColAndValue('object_id', $id);
  }

  /**
   * Delete relation its id
   *
   * @param int id  The relation id
   */
  public static function deleteById($id)
  {
    QubitPdo::prepareAndExecute('DELETE FROM relation_i18n WHERE id=?', array($id));
    QubitPdo::prepareAndExecute('DELETE FROM relation WHERE id=?', array($id));
    QubitObjectQueries::deleteById($id);
  }

  /**
   * Delete relation based on column name and value
   *
   * @param int id  The subject id
   */
  private static function deleteByColAndValue($column, $value)
  {
    $query = sprintf('SELECT id FROM relation WHERE %s=?', $column);

    $ids = QubitPdo::fetchAll($query, array($value));
    foreach ($ids as $row)
    {
      self::deleteById((int)$row->id);
    }
  }
}

