CREATE TABLE IF NOT EXISTS `cot_bbcode` (
  `bbc_id` int NOT NULL auto_increment,
  `bbc_name` varchar(100) collate utf8_unicode_ci NOT NULL,
  `bbc_mode` enum('str','ereg','pcre','callback') collate utf8_unicode_ci NOT NULL default 'str',
  `bbc_pattern` varchar(255) collate utf8_unicode_ci NOT NULL,
  `bbc_replacement` text collate utf8_unicode_ci NOT NULL,
  `bbc_container` tinyint NOT NULL default '1',
  `bbc_enabled` tinyint NOT NULL default '1',
  `bbc_priority` tinyint unsigned NOT NULL default '128',
  `bbc_plug` varchar(100) collate utf8_unicode_ci NOT NULL default '',
  `bbc_postrender` tinyint NOT NULL default '0',
  PRIMARY KEY  (`bbc_id`),
  KEY `bbc_enabled` (`bbc_enabled`),
  KEY `bbc_priority` (`bbc_priority`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DELETE FROM `cot_bbcode` WHERE `bbc_name` IN ('b', 'i', 'u', 's', 'center', 'left', 'right', 'justify', 'pre', 'nbsp',
	'email', 'quote', 'color', 'img', 'url', 'code', 'more', 'size', 'h', 'list', 'ol', 'li', 'li_short', 'table',
	'tr', 'th', 'td', 'hide', 'spoiler', 'thumb', 'pfs');

INSERT INTO `cot_bbcode` (`bbc_name`, `bbc_mode`, `bbc_pattern`, `bbc_replacement`, `bbc_container`, `bbc_enabled`, `bbc_priority`, `bbc_plug`, `bbc_postrender`) VALUES
('b', 'str', '[b]', '<strong>', 1, 1, 128, '', 0),
('b', 'str', '[/b]', '</strong>', 0, 1, 128, '', 0),
('i', 'str', '[i]', '<em>', 1, 1, 128, '', 0),
('i', 'str', '[/i]', '</em>', 1, 1, 128, '', 0),
('u', 'str', '[u]', '<span style="text-decoration:underline">', 1, 1, 128, '', 0),
('u', 'str', '[/u]', '</span>', 1, 1, 128, '', 0),
('s', 'str', '[s]', '<span style="text-decoration:line-through">', 1, 1, 128, '', 0),
('s', 'str', '[/s]', '</span>', 1, 1, 128, '', 0),
('center', 'str', '[center]', '<div style="text-align:center">', 1, 1, 128, '', 0),
('center', 'str', '[/center]', '</div>', 1, 1, 128, '', 0),
('left', 'str', '[left]', '<div style="text-align:left">', 1, 1, 128, '', 0),
('left', 'str', '[/left]', '</div>', 1, 1, 128, '', 0),
('right', 'str', '[right]', '<div style="text-align:right">', 1, 1, 128, '', 0),
('right', 'str', '[/right]', '</div>', 1, 1, 128, '', 0),
('justify', 'str', '[justify]', '<div style="text-align:justify">', 1, 1, 128, '', 0),
('justify', 'str', '[/justify]', '</div>', 1, 1, 128, '', 0),
('pre', 'str', '[pre]', '<pre>', 1, 1, 128, '', 0),
('pre', 'str', '[/pre]', '</pre>', 0, 1, 128, '', 0),
('nbsp', 'str', '[_]', '&nbsp;', 0, 1, 128, '', 0),
('email', 'callback', '\\[email=(\\w[\\._\\w\\-]+@[\\w\\.\\-]+\\.[a-z]+)\\](.+?)\\[/email\\]', 'return cot_obfuscate(''<a href="mailto:''.$input[1].''">''.$input[2].''</a>'');', 1, 1, 128, '', 0),
('quote', 'pcre', '\\[quote=(.+?)\\](.+?)\\[/quote\\]', '<blockquote><strong>$1:</strong><hr />$2</blockquote>', 1, 1, 128, '', 0),
('quote', 'pcre', '\\[quote\\](.+?)\\[/quote\\]', '<blockquote>$1</blockquote>', 1, 1, 128, '', 0),
('color', 'pcre', '\\[color=(#?\\w+)\\](.+?)\\[/color\\]', '<span style="color:$1">$2</span>', 1, 1, 128, '', 0),
('img', 'pcre', '\\[img\\]((?:http://|https://|ftp://)?[^"\\'';:\\?\\[]+\\.(?:jpg|jpeg|gif|png))\\[/img\\]', '<img src="$1" alt="" />', 1, 1, 128, '', 0),
('img', 'pcre', '\\[img=((?:http://|https://|ftp://)?[^\\]"\\'';:\\?]+\\.(?:jpg|jpeg|gif|png))\\]((?:http://|https://|ftp://)?[^\\]"\\'';:\\?]+\\.(?:jpg|jpeg|gif|png))\\[/img\\]', '<a href="$1"><img src="$2" alt="" /></a>', 1, 1, 128, '', 0),
('url', 'pcre', '\\[url=((?:http://|https://|ftp://)?[^\\s"\\'':\\[]+)\\](.+?)\\[/url\\]', '<a href="$1">$2</a>', 1, 1, 128, '', 0),
('url', 'pcre', '\\[url\\]((?:http://|https://|ftp://)?[^\\s"\\'':]+)\\[/url\\]', '<a href="$1">$1</a>', 1, 1, 128, '', 0),
('code', 'callback', '\\[code\\](.+?)\\[/code\\]', 'return ''<pre class="code">''.cot_bbcode_cdata($input[1]).''</pre>'';', 1, 1, 1, '', 0),
('more', 'str', '[more]', '<!--more-->', 1, 1, 128, '', 0),
('more', 'str', '[/more]', '&nbsp;', 1, 1, 128, '', 0),
('size', 'pcre', '\\[size=([1-2][0-9])\\](.+?)\\[/size\\]', '<span style="font-size:$1pt">$2</span>', 1, 1, 128, 'markitup', 0),
('h','pcre','\\[h([1-6])\\](.+?)\\[/h\\1\\]','<h$1>$2</h$1>',1,1,128,'',0),
('list','str','[list]','<ul>',1,1,128,'',0),
('list','str','[/list]','</ul>',1,1,128,'',0),
('ol','str','[ol]','<ol>',1,1,128,'',0),
('ol','str','[/ol]','</ol>',1,1,128,'',0),
('li','str','[li]','<li>',1,1,128,'',0),
('li','str','[/li]','</li>',1,1,128,'',0),
('li_short','pcre','\\[\\*\\](.*?)\\n','<li>$1</li>',0,1,128,'',0),
('table', 'str', '[table]', '<table>', 1, 1, 128, 'markitup', 0),
('table', 'str', '[/table]', '</table>', 1, 1, 128, 'markitup', 0),
('tr', 'str', '[tr]', '<tr>', 1, 1, 128, 'markitup', 0),
('tr', 'str', '[/tr]', '</tr>', 1, 1, 128, 'markitup', 0),
('th', 'str', '[th]', '<th>', 1, 1, 128, 'markitup', 0),
('th', 'str', '[/th]', '</th>', 1, 1, 128, 'markitup', 0),
('td', 'str', '[td]', '<td>', 1, 1, 128, 'markitup', 0),
('td', 'str', '[/td]', '</td>', 1, 1, 128, 'markitup', 0),
('hide', 'callback', '\\[hide\\](.+?)\\[/hide\\]', 'return $usr["id"] > 0 ? $input[1] : "<div class=\\"hidden\\">".$L["Hidden"]."</div>";', 1, 1, 150, 'markitup', 1),
('spoiler','pcre','\\[spoiler\\](.+?)\\[/spoiler\\]','<div style=\"margin:4px 0px 4px 0px\"><input type=\"button\" value=\"Show\" onclick=\"if(this.parentNode.getElementsByTagName(''div'')[0].style.display != '''') { this.parentNode.getElementsByTagName(''div'')[0].style.display = ''''; } else { this.parentNode.getElementsByTagName(''div'')[0].style.display = ''none''; }\" /><div style=\"display:none\" class=\"spoiler\">$1</div></div>',1,1,130,'markitup',0),
('spoiler', 'pcre', '\\[spoiler=([^\\]]+)\\](.+?)\\[/spoiler\\]', '<div style="margin:4px 0px 4px 0px"><input type="button" value="$1" onclick="if(this.parentNode.getElementsByTagName(''div'')[0].style.display != '''') { this.parentNode.getElementsByTagName(''div'')[0].style.display = ''''; } else { this.parentNode.getElementsByTagName(''div'')[0].style.display = ''none''; }" /><div style="display:none" class="spoiler">$2</div></div>', 1, 1, 130, 'markitup', 0),
('thumb', 'pcre', '\\[thumb=(.*?[^"\\'';:\\?]+\\.(?:jpg|jpeg|gif|png))\\](.*?[^"\\'';:\\?]+\\.(?:jpg|jpeg|gif|png))\\[/thumb\\]', '<a href="datas/users/$2"><img src="$1" alt="$2" /></a>', 1, 1, 128, '', 0),
('thumb', 'pcre', '\\[thumb\\](.*?[^"\\'';:\\?]+\\.(?:jpg|jpeg|gif|png))\\[/thumb\\]', '<a href="datas/users/$1"><img src="datas/thumbs/$1" /></a>', 1, 1, 128, '', 0),
('pfs', 'pcre', '\\[pfs\\](.*?[^"\\'';:\\?]+\\.(?:jpg|jpeg|gif|png|zip|rar|7z|pdf|txt))\\[/pfs\\]', '<strong><a href="datas/users/$1">$1</a></strong>', 1, 1, 128, '', 0);
