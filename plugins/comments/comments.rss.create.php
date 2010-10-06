<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=rss.create
[END_COT_EXT]
==================== */

/**
 * Comments system for Cotonti
 *
 * @package comments
 * @version 0.7.0
 * @author Cotonti Team
 * @copyright Copyright (c) Cotonti Team 2008-2010
 * @license BSD
 */

defined('COT_CODE') or die('Wrong URL');

/*
	Example of feeds:

	rss.php?c=comments&id=XX		=== Show comments from page "XX" ===		=== Where XX - is code or alias of page ===
	rss.php?c=comments				=== Show comments from all page ===
*/

cot_require('comments', true);
cot_require('page');

if ($c == 'comments')
{
	$defult_c = false;
	if ($id == 'all')
	{
		$rss_title = $L['rss_comments']." ".$cfg['maintitle'];
		$rss_description = $L['rss_comments_item_desc'];

		$sql = cot_db_query("SELECT c.*, u.user_name
			FROM $db_com AS c
				LEFT JOIN $db_users AS u ON c.com_authorid = u.user_id
			WHERE com_area = 'page' ORDER BY com_date DESC LIMIT ".$cfg['rss_maxitems']);
		$i = 0;
		while ($row = cot_db_fetchassoc($sql))
		{
			$items[$i]['title'] = $L['rss_comment_of_user']." ".$row['user_name'];

			$text = cot_parse($row['com_text'], $cfg['plugins']['comments']['markup']);
			if ((int)$cfg['plugin']['comments']['rss_commentmaxsymbols'] > 0)
			{
				$text .= (cot_string_truncate($text, $cfg['plugin']['comments']['rss_commentmaxsymbols'])) ? '...' : '';
			}
			$items[$i]['description'] = $text;
			// FIXME this section does not support page aliases!
			$items[$i]['link'] = COT_ABSOLUTE_URL.cot_url('page', "id=".strtr($row['com_code'], 'p', ''), '#c'.$row['com_id'], true);
			$items[$i]['pubDate'] = date('r', $row['com_date']);
			$i++;
		}
	}
	else
	{
		$page_id = $id;

		$rss_title = $L['rss_comments']." ".$cfg['maintitle'];

		$sql = cot_db_query("SELECT * FROM $db_pages WHERE page_id='$page_id' LIMIT 1");
		if (cot_db_affectedrows() > 0)
		{
			$row = cot_db_fetchassoc($sql);
			if (cot_auth('page', $row['page_cat'], 'R'))
			{
				$rss_title = $row['page_title'];
				$rss_description = $L['rss_comments_item_desc'];
				$page_args = empty($row['page_alias']) ? "id=$page_id" : 'al=' . $row['page_alias'];

				$sql = cot_db_query("SELECT c.*, u.user_name
					FROM $db_com AS c
						LEFT JOIN $db_users AS u ON c.com_authorid = u.user_id
					WHERE com_area = 'page' AND com_code='$page_id'
					ORDER BY com_date DESC LIMIT ".$cfg['rss_maxitems']);
				$i = 0;
				while ($row1 = cot_db_fetchassoc($sql))
				{
					$items[$i]['title'] = $L['rss_comment_of_user']." ".$row1['user_name'];
					$text = cot_parse($row1['com_text'], $cfg['parsebbcodecom']);
					if ((int)$cfg['plugin']['comments']['rss_commentmaxsymbols'] > 0)
					{
						$text .= (cot_string_truncate($text, $cfg['plugin']['comments']['rss_commentmaxsymbols'])) ? '...' : '';
					}
					$items[$i]['description'] = $text;
					$items[$i]['link'] = COT_ABSOLUTE_URL.cot_url('page', $page_args, '#c'.$row['com_id'], true);
					$items[$i]['pubDate'] = date('r', $row['com_date']);
					$i++;
				}
				// Attach original page text as last item
				$row['page_pageurl'] = (empty($row['page_alias'])) ? cot_url('page', 'id='.$row['page_id']) : cot_url('page', 'al='.$row['page_alias']);
				$items[$i]['title'] = $L['rss_original'];
				$items[$i]['description'] = cot_parse_page_text($row['page_id'], $row['page_type'], $row['page_text'], $row['page_pageurl']);
				$items[$i]['link'] = COT_ABSOLUTE_URL.cot_url('page', "id=$page_id", '', true);
				$items[$i]['pubDate'] = date('r', $row['page_date']);
			}
		}
	}
}

?>