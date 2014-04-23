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
 * Various raw SQL queries to manipulate notes
 *
 * @package    AccesstoMemory
 * @subpackage pdo
 * @author     Mike G <mikeg@artefactual.com>
 */

class QubitNoteQueries
{
  public static function deleteByObjectId($id)
  {
    $rows = QubitPdo::fetchAll('SELECT id FROM note WHERE object_id=?', array($id));
    
    foreach ($rows as $note)
    {
      QubitPdo::prepareAndExecute('DELETE FROM note_i18n WHERE id=?', array((int)$note->id));
      QubitPdo::prepareAndExecute('DELETE FROM note WHERE id=?', array((int)$note->id));
      QubitObjectQueries::deleteById((int)$note->id);
    }
  }
}