<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=admin.rightsbyitem.case
[END_COT_EXT]
==================== */

/**
 * Forum rights by item
 *
 * @package Cotonti
 * @version 0.7.0
 * @author Neocrome, Cotonti Team
 * @copyright Copyright (c) Cotonti Team 2008-2010
 * @license BSD
 */

(defined('COT_CODE') && defined('COT_ADMIN')) or die('Wrong URL.');

cot_require('forums');

$forum = $db->query("SELECT * FROM $db_forum_sections WHERE fs_id='$io'")->fetch();
$title = ' : '.htmlspecialchars($forum['fs_title'])." (#".$io.")";

?>