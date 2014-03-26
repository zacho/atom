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
 * Gearman client task
 *
 * @package    symfony
 * @subpackage task
 */
class gearmanClientTask extends sfBaseTask
{
  protected function configure()
  {
    $this->addArguments(array(
      new sfCommandArgument('id', sfCommandArgument::REQUIRED, 'ID of the information object to generate a finding aid for.')
    ));

    $this->addOptions(array(
      new sfCommandOption('application', null, sfCommandOption::PARAMETER_OPTIONAL, 'The application name', true),
      new sfCommandOption('env', null, sfCommandOption::PARAMETER_REQUIRED, 'The environment', 'cli'),
    ));

    $this->namespace        = 'test';
    $this->name             = 'gearman-client';
    $this->briefDescription = 'Gearman client test for generating PDFs';
    $this->detailedDescription = <<<EOF
EOF;
  }

  protected function execute($arguments = array(), $options = array())
  {
    error_reporting(E_ALL);
    $configuration = ProjectConfiguration::getApplicationConfiguration($options['application'], $options['env'], false);
    $context = sfContext::createInstance($configuration);

    // Using the current context, get the event dispatcher and suscribe an event in it
    $context->getEventDispatcher()->connect('gearman.worker.log', array($this, 'gearmanWorkerLogger'));

    $gmClient = new Net_Gearman_Client('localhost:4730');
    $set = new Net_Gearman_Set();
    $task = new Net_Gearman_Task('arGenerateFindingAid', array('id' => $arguments['id']));

    print "Adding task and running.\n";

    $set->addTask($task);
    $gmClient->runSet($set);

    print "Done.\n";
  }

  public function gearmanWorkerLogger(sfEvent $event)
  {
    $this->logSection('gearman-pdf-gen', $event['message']);
  }
}
