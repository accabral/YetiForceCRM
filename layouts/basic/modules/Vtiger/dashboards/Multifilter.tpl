{*<!-- {[The file is published on the basis of YetiForce Public License 3.0 that can be found in the following directory: licenses/LicenseEN.txt or yetiforce.com]} -->*}
{strip}
	{assign var=ACCESSIBLE_USERS value=\App\Fields\Owner::getInstance()->getAccessibleUsers()}
	{assign var=ACCESSIBLE_GROUPS value=\App\Fields\Owner::getInstance()->getAccessibleGroups()}
	{assign var=CURRENTUSERID value=$USER_MODEL->getId()}
	<!-- tpl-Base-Dashboards-Multifilter -->
	<div class="js-multifilterControls tpl-dashboards-Multifilter dashboardWidgetHeader"
		 data-js="container|data-widgetid"
		 data-widgetid="{$WIDGET->get('id')}">
		<div class="row">
			<div class="col-md-8">
				<div class="dashboardTitle" title="{\App\Language::translate($WIDGET->getTitle(), $MODULE_NAME)}">
					<strong>{\App\Language::translate($WIDGET->getTitle(), $MODULE_NAME)}</strong></div>
			</div>
			<div class="col-md-4">
				<div class="box float-right">
					<a class="js-widget-settings btn btn-sm btn-light" data-js="click">
						<span class="fas fa-cog" title="{\App\Language::translate('LBL_SETTINGS')}"
							  data-js="click"></span>
					</a>
					{include file=\App\Layout::getTemplatePath('dashboards/DashboardHeaderIcons.tpl', $MODULE_NAME)}
				</div>
			</div>
		</div>
	</div>
	<div class="dashboardWidgetContent">
		<div class="js-settings-widget row no-gutters mb-1 pb-1 border-bottom d-none"
			 data-js="class:.js-settings-widget">
			<hr class="widgetHr"/>
			<div class="col-sm-12">
				<div class="input-group input-group-sm">
					<select name="customMultiFilter"
							class="js-select select2 widgetFilter form-control customFilter"
							data-js="container" multiple="multiple"
							title="{\App\Language::translate('LBL_CUSTOM_FILTER')}">
						{assign var=CUSTOM_VIEWS value=CustomView_Record_Model::getAll()}
						{foreach key=GROUP_LABEL item=GROUP_CUSTOM_VIEWS from=$CUSTOM_VIEWS}
							{foreach item="CUSTOM_VIEW" from=$GROUP_CUSTOM_VIEWS}
								{if !(\App\Privilege::isPermitted({$GROUP_CUSTOM_VIEWS->module->name}))}
									{continue}
								{/if}
								<option title="{\App\Language::translate($GROUP_CUSTOM_VIEWS->module->name)}"
										data-module="{$GROUP_CUSTOM_VIEWS->module->name}"
										value="{$GROUP_CUSTOM_VIEWS->get('cvid')}" {if in_array($GROUP_CUSTOM_VIEWS->get('cvid'),$WIDGET_ACTIVE_FILTERS)} selected {/if}>
									{\App\Language::translate($GROUP_CUSTOM_VIEWS->module->name,$GROUP_CUSTOM_VIEWS->module->name)}
									-{\App\Language::translate($GROUP_CUSTOM_VIEWS->get('viewname'), $GROUP_CUSTOM_VIEWS->module->name)}
								</option>
							{/foreach}
						{/foreach}
					</select>
				</div>
			</div>
		</div>
		<div class="js-multifilterContent contents" data-js="container">
		</div>
	</div>
	<!-- /tpl-Base-Dashboards-Multifilter -->
{/strip}
