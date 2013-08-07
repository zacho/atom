<?php $sf_response->addJavaScript('date') ?>

<div class="section">

  <h3><?php echo __('Dates of existence').' <span class="form-required" title="'.__('This is a mandatory element.').'">*</span>' ?></h3>

  <table class="multiRow">
    <thead>
      <tr>
        <th style="width: 40%">
          <?php echo __('Date') ?>
        </th><th style="width: 30%">
          <?php echo __('Start') ?>
        </th><th style="width: 30%">
          <?php echo __('End') ?>
        </th>
      </tr>
    </thead><tbody>

      <?php $i = 0; foreach ($resource->getDatesOfExistenceEvents() as $item): ?>

        <?php $form->getWidgetSchema()->setNameFormat("editDates[$i][%s]") ?>

        <tr class="<?php echo 0 == $i % 2 ? 'even' : 'odd' ?> related_obj_<?php echo $item->id ?> date">
          <td>
            <div class="animateNicely">
              <input type="hidden" name="editDates[<?php echo $i ?>][id]" value="<?php echo $item->id ?>"/>
              <?php echo $form->getWidgetSchema()->renderField('date', $item->getDate(array('cultureFallback' => true))) ?>
            </div>
          </td><td>
            <div class="animateNicely">
              <?php echo $form->getWidgetSchema()->renderField('startDate', Qubit::renderDate($item->startDate)) ?>
            </div>
          </td><td>
            <div class="animateNicely">
              <?php echo $form->getWidgetSchema()->renderField('endDate', Qubit::renderDate($item->endDate)) ?>
            </div>
          </td>
        </tr>

        <?php $i++ ?>
      <?php endforeach; ?>

      <?php $form->getWidgetSchema()->setNameFormat("editDates[$i][%s]") ?>

      <tr class="<?php echo 0 == $i % 2 ? 'even' : 'odd' ?> date">
        <td>
          <div class="animateNicely">
            <?php echo $form->date ?>
          </div>
        </td><td>
          <div class="animateNicely">
            <?php echo $form->startDate ?>
          </div>
        </td><td>
          <div class="animateNicely">
            <?php echo $form->endDate ?>
          </div>
        </td>
      </tr>

    </tbody>
  </table>

  <div class="description">
    <?php echo __('Record the dates of existence of the entity being described. For corporate bodies include the date of establishment/foundation/enabling legislation and dissolution. For persons include the dates or approximate dates of birth and death or, when these dates are not known, floruit dates. Where parallel systems of dating are used, equivalences may be recorded according to relevant conventions or rules. Specify in the Rules and/or conventions element (5.4.3) the system(s) of dating used, e.g. ISO 8601." (ISAAR 5.2.1)') ?>
  </div>

</div>
