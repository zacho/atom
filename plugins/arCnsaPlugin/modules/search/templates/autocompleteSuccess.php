<?php if ($descriptions->getTotalHits() > 0): ?>
  <section>
    <?php // echo image_tag('/images/icons-small/icon-archival-small.png', array('width' => '24', 'height' => '24')) ?>
    <ul>
      <?php foreach ($descriptions->getResults() as $hit): ?>
        <li>
          <?php echo link_to(get_search_i18n_highlight($hit, 'title.autocomplete'), array('module' => 'informationobject', 'slug' => current($hit->slug))) ?>
          <strong><?php echo $levelsOfDescription[current($hit->levelOfDescriptionId)] ?></strong>
        </li>
      <?php endforeach; ?>
      <?php if ($descriptions->getTotalHits() > 6): ?>
        <li class="showall"><?php echo link_to(__('all matching descriptions'), array('module' => 'search', 'action' => 'index') + $sf_request->getParameterHolder()->getAll()) ?></li>
      <?php endif; ?>
    </ul>
  </section>
<?php endif; ?>

<?php if (0 && $repositories->getTotalHits() > 0): ?>
  <section>
    <?php echo image_tag('/images/icons-small/icon-institutions-small.png', array('width' => '24', 'height' => '24')) ?>
    <ul>
      <?php foreach ($repositories->getResults() as $hit): ?>
        <li><?php echo link_to(get_search_i18n_highlight($hit, 'authorizedFormOfName.autocomplete'), array('module' => 'repository', 'slug' => current($hit->slug))) ?></li>
      <?php endforeach; ?>
      <?php if ($repositories->getTotalHits() > 3): ?>
        <li class="showall"><?php echo link_to(__('all matching institutions'), array('module' => 'repository', 'action' => 'browse') + $sf_request->getParameterHolder()->getAll()) ?></li>
      <?php endif; ?>
    </ul>
  </section>
<?php endif; ?>

<?php if (0 && $actors->getTotalHits() > 0): ?>
  <section>
    <?php echo image_tag('/images/icons-small/icon-people-small.png', array('width' => '24', 'height' => '24')) ?>
    <ul>
      <?php foreach ($actors->getResults() as $hit): ?>
        <li><?php echo link_to(get_search_i18n_highlight($hit, 'authorizedFormOfName.autocomplete'), array('module' => 'actor', 'slug' => current($hit->slug))) ?></li>
      <?php endforeach; ?>
      <?php if ($actors->getTotalHits() > 3): ?>
        <li class="showall"><?php echo link_to(__('all matching people & organizations'), array('module' => 'actor', 'action' => 'browse') + $sf_request->getParameterHolder()->getAll()) ?></li>
      <?php endif; ?>
    </ul>
  </section>
<?php endif; ?>

<?php if (0 && $places->getTotalHits() > 0): ?>
  <section>
    <?php echo image_tag('/images/icons-small/icon-places-small.png', array('width' => '24', 'height' => '24')) ?>
    <ul>
      <?php foreach ($places->getResults() as $hit): ?>
        <li><?php echo link_to(get_search_i18n_highlight($hit, 'name.autocomplete'), array('module' => 'term', 'slug' => current($hit->slug))) ?></li>
      <?php endforeach; ?>
      <?php if ($places->getTotalHits() > 3): ?>
        <li class="showall"><?php echo link_to(__('all places'), array('module' => 'taxonomy', 'slug' => 'places')) ?></li>
      <?php endif; ?>
    </ul>
  </section>
<?php endif; ?>

<?php if (0 && $subjects->getTotalHits() > 0): ?>
  <section>
    <?php echo image_tag('/images/icons-small/icon-subjects-small.png', array('width' => '24', 'height' => '24')) ?>
    <ul>
      <?php foreach ($subjects->getResults() as $hit): ?>
        <li><?php echo link_to(get_search_i18n_highlight($hit, 'name.autocomplete'), array('module' => 'term', 'slug' => current($hit->slug))) ?></li>
      <?php endforeach; ?>
      <?php if ($subjects->getTotalHits() > 3): ?>
        <li class="showall"><?php echo link_to(__('all subjects'), array('module' => 'taxonomy', 'slug' => 'subjects')) ?></li>
      <?php endif; ?>
    </ul>
  </section>
<?php endif; ?>
