<!-- BEGIN: MAIN -->
	<div id="ajaxBlock">
		<h2>{PHP.L.Structure}</h2>
<!-- BEGIN: MESSAGE -->
			<div class="error">
				<h4>{PHP.L.Message}</h4>
				<p>{MESSAGE_TEXT}</p>
			</div>
<!-- END: MESSAGE -->
		<ul class="follow">
			<li>
				<a title="{PHP.L.Configuration}" href="{ADMIN_STRUCTURE_URL_CONFIG}">{PHP.L.Configuration}</a>
			</li>
			<li>
<!-- IF {PHP.lincif_conf} -->
				<a href="{ADMIN_STRUCTURE_URL_EXTRAFIELDS}">{PHP.L.adm_extrafields_desc}</a>
<!-- ELSE -->
				{PHP.L.adm_extrafields_desc}
<!-- ENDIF -->
			</li>
		</ul>
<!-- BEGIN: OPTIONS -->
		<form name="savestructure" id="savestructure" action="{ADMIN_STRUCTURE_UPDATE_FORM_URL}" method="post">
		<table class="cells">
			<tr>
				<td class="width20">{PHP.L.Path}:</td>
				<td class="width80">{ADMIN_STRUCTURE_PATH}</td>
			</tr>
			<tr>
				<td>{PHP.L.Code}:</td>
				<td>{ADMIN_STRUCTURE_CODE}</td>
			</tr>
			<tr>
				<td>{PHP.L.Title}:</td>
				<td>{ADMIN_STRUCTURE_TITLE}</td>
			</tr>
			<tr>
				<td>{PHP.L.Description}:</td>
				<td>{ADMIN_STRUCTURE_DESC}</td>
			</tr>
			<tr>
				<td>{PHP.L.Icon}:</td>
				<td>{ADMIN_STRUCTURE_ICON}</td>
			</tr>
			<tr>
				<td>{PHP.L.Group}:</td>
				<td>{ADMIN_STRUCTURE_GROUP}</td>
			</tr>
			<tr>
				<td>{PHP.L.adm_tpl_mode}:</td>
				<td>{ADMIN_STRUCTURE_TPLMODE}</td>
			</tr>
			<tr>
				<td>{PHP.L.adm_sortingorder}:</td>
				<td class="{ADMIN_STRUCTURE_ODDEVEN}">{ADMIN_STRUCTURE_ORDER}{ADMIN_STRUCTURE_WAY}</td>
			</tr>
			<!-- BEGIN: EXTRAFLD -->
			<tr>
				<td>{ADMIN_STRUCTURE_EXTRAFLD_TITLE}:</td>
				<td class="{ADMIN_STRUCTURE_ODDEVEN}">{ADMIN_STRUCTURE_EXTRAFLD}</td>
			</tr>
			<!-- END: EXTRAFLD -->
			<tr>
				<td>{PHP.L.adm_enableratings}:</td>
				<td>{ADMIN_STRUCTURE_RATINGS}</td>
			</tr>
			<tr>
				<td>{PHP.L.adm_postcounters} :</td>
				<td><a href="{ADMIN_STRUCTURE_RESYNC}" class="ajax">{PHP.L.Resync}</a></td>
			</tr>
			<tr>
				<td class="valid" colspan="2"><input type="submit" class="submit" value="{PHP.L.Update}" /></td>
			</tr>
		</table>
		</form>
<!-- END: OPTIONS -->
<!-- BEGIN: DEFULT -->
		<h3>{PHP.L.editdeleteentries}:</h3>
		<form name="savestructure" id="savestructure" action="{ADMIN_STRUCTURE_UPDATE_FORM_URL}" method="post" class="ajax">
		<table class="cells">
			<tr>
				<td class="coltop width10">{PHP.L.Path}</td>
				<td class="coltop width10">{PHP.L.Code}</td>
				<td class="coltop width15">{PHP.L.Title}</td>
				<td class="coltop width10">{PHP.L.TPL}</td>
				<td class="coltop width10">{PHP.L.Group}</td>
				<td class="coltop width15">{PHP.L.Order}</td>
				<td class="coltop width10">{PHP.L.Pages}</td>
				<td class="coltop width20">{PHP.L.Action}</td>
			</tr>
<!-- BEGIN: ROW -->
			<tr>
				<td class="centerall {ADMIN_STRUCTURE_ODDEVEN}">{ADMIN_STRUCTURE_PATHFIELDIMG}{ADMIN_STRUCTURE_PATH}</td>
				<td class="centerall {ADMIN_STRUCTURE_ODDEVEN}">{ADMIN_STRUCTURE_CODE}</td>
				<td class="centerall {ADMIN_STRUCTURE_ODDEVEN}">{ADMIN_STRUCTURE_TITLE}</td>
				<td class="centerall {ADMIN_STRUCTURE_ODDEVEN}">{ADMIN_STRUCTURE_TPL_SYM}</td>
				<td class="centerall {ADMIN_STRUCTURE_ODDEVEN}">{ADMIN_STRUCTURE_GROUP}</td>
				<td class="centerall {ADMIN_STRUCTURE_ODDEVEN}">
					{ADMIN_STRUCTURE_ORDER}
					<br />
					{ADMIN_STRUCTURE_WAY}
				</td>
				<td class="centerall {ADMIN_STRUCTURE_ODDEVEN}">{ADMIN_STRUCTURE_PAGECOUNT}</td>
				<td class="centerall action {ADMIN_STRUCTURE_ODDEVEN}">
					<a title="{PHP.L.Rights}" href="{ADMIN_STRUCTURE_RIGHTS_URL}">{PHP.R.admin_icon_rights2}</a><a title="{PHP.L.Options}" href="{ADMIN_STRUCTURE_OPTIONS_URL}" class="ajax">{PHP.R.admin_icon_config}</a><!-- IF {PHP.dozvil} --><a title="{PHP.L.Delete}" href="{ADMIN_STRUCTURE_UPDATE_DEL_URL}" class="ajax">{PHP.R.admin_icon_delete}</a><!-- ENDIF --><a href="{ADMIN_STRUCTURE_JUMPTO_URL}" title="{PHP.L.Pages}" >{PHP.R.admin_icon_jumpto}</a></td>
			</tr>
<!-- END: ROW -->
			<tr>
				<td class="valid" colspan="8"><input type="submit" class="submit" value="{PHP.L.Update}" /> <a href="{ADMIN_PAGE_STRUCTURE_RESYNCALL}" class="ajax">{PHP.L.Resync}</a></td>
			</tr>
		</table>
		</form>
		<p class="paging">
			{ADMIN_STRUCTURE_PAGINATION_PREV}{ADMIN_STRUCTURE_PAGNAV}{ADMIN_STRUCTURE_PAGINATION_NEXT} <span class="a1">{PHP.L.Total}: {ADMIN_STRUCTURE_TOTALITEMS}, {PHP.L.adm_polls_on_page}: {ADMIN_STRUCTURE_COUNTER_ROW}</span>
		</p>

		<h3>{PHP.L.addnewentry}:</h3>
		<form name="addstructure" id="addstructure" action="{ADMIN_STRUCTURE_URL_FORM_ADD}" method="post" class="ajax">
		<table class="cells">
			<tr>
				<td class="width20">{PHP.L.Path}:</td>
				<td class="width80">{ADMIN_STRUCTURE_PATH} {PHP.L.adm_required}</td>
			</tr>
			<tr>
				<td>{PHP.L.Code}:</td>
				<td>{ADMIN_STRUCTURE_CODE} {PHP.L.adm_required}</td>
			</tr>
			<tr>
				<td>{PHP.L.Title}:</td>
				<td>{ADMIN_STRUCTURE_TITLE} {PHP.L.adm_required}</td>
			</tr>
			<tr>
				<td>{PHP.L.Description}:</td>
				<td>{ADMIN_STRUCTURE_DESC}</td>
			</tr>
			<tr>
				<td>{PHP.L.Icon}:</td>
				<td>{ADMIN_STRUCTURE_ICON}</td>
			</tr>
			<tr>
				<td>{PHP.L.Group}:</td>
				<td>{ADMIN_STRUCTURE_GROUP}</td>
			</tr>
			<tr>
				<td>{PHP.L.Order}:</td>
				<td>{ADMIN_STRUCTURE_ORDER}{ADMIN_STRUCTURE_WAY}</td>
			</tr>
			<!-- BEGIN: EXTRAFLD -->
			<tr>
				<td>{ADMIN_STRUCTURE_EXTRAFLD_TITLE}:</td>
				<td>{ADMIN_STRUCTURE_EXTRAFLD}</td>
			</tr>
			<!-- END: EXTRAFLD -->
			<tr>
				<td class="valid" colspan="2">
					<input type="submit" class="submit" value="{PHP.L.Add}" />
				</td>
			</tr>
		</table>
		</form>
<!-- END: DEFULT -->
	</div>
<!-- END: MAIN -->