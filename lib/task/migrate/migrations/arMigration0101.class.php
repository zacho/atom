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

/*
 * Include sub-item level "part" in the levels of description taxonomy
 *
 * @package    AccesstoMemory
 * @subpackage migration
 */
class arMigration0101
{
  const
    VERSION = 101, // The new database version
    MIN_MILESTONE = 1; // The minimum milestone required

  /**
   * Upgrade
   *
   * @return bool True if the upgrade succeeded, False otherwise
   */
  public function up($configuration)
  {
    // Add new term 'dates of existence'
    $term = new QubitTerm;
    $term->id = QubitTerm::DATES_OF_EXISTENCE_ID;
    $term->parentId = QubitTerm::ROOT_ID;
    $term->taxonomyId = QubitTaxonomy::EVENT_TYPE_ID;
    $term->name = 'Dates of existence';
    $term->culture = 'en';
    $term->save();

    // Get actors with dates of existence
    $sql = sprintf("SELECT t1.id, dates_of_existence, culture
      FROM %s t1
      INNER JOIN %s t2
      ON t1.id = t2.id
      WHERE dates_of_existence
      IS NOT NULL;", QubitActor::TABLE_NAME, QubitActorI18n::TABLE_NAME);

    foreach (QubitPdo::fetchAll($sql) as $item)
    {
      $datesOfExistence[$item->id][$item->culture] = $item->dates_of_existence;
    }

    // Create dates of existence events
    foreach ($datesOfExistence as $actorId => $dates)
    {
      $event = new QubitEvent;
      $event->actorId = $actorId;
      $event->typeId = QubitTerm::DATES_OF_EXISTENCE_ID;

      foreach ($dates as $culture => $content)
      {
        $event->setDate($content, array('culture' => $culture));
      }

      $event->save();
    }

    // Remove dates_of_existence column from database
    $sql = sprintf("ALTER TABLE %s
      DROP COLUMN dates_of_existence;", QubitActorI18n::TABLE_NAME);

    QubitPdo::modify($sql);

    return true;
  }
}
