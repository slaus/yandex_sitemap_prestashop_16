<div style="width: 700px; margin: 0 auto;">
</div>
{if isset($smarty.get.validation)}
	<div class="conf confirm" style="width: 710px; margin: 0 auto;">
		{l s='Your Sitemaps were successfully created. Please do not forget to setup the url' mod='yasitemap'} <a href="{$yasitemap_store_url|escape:'htmlall':'UTF-8'}{$shop->id|intval}_index_yasitemap.xml" target="_blank"><span style="text-decoration: underline;">{$yasitemap_store_url|escape:'htmlall':'UTF-8'}{$shop->id|intval}_index_yasitemap.xml</a></span> {l s='in your Google Webmaster account' mod='yasitemap'}.
</div>
<br/>
{/if}
{if isset($google_maps_error)}
	<div class="error" style="width: 710px; margin: 0 auto;">		
		{$google_maps_error|escape:'htmlall':'UTF-8'}<br />	
	</div>
{/if}
{if isset($yasitemap_refresh_page)}
	<fieldset style="width: 700px; margin: 0 auto; text-align: center;">
		<legend><img src="{$module_dir|escape:'htmlall':'UTF-8'}logo.gif" alt="" />{l s='Your Sitemaps' mod='yasitemap'}</legend>
		<p>{$yasitemap_number|intval} {l s='Sitemaps were already created.' mod='yasitemap'}<br/>
		</p>
		<br/>
		<form action="{$yasitemap_refresh_page|escape:'htmlall':'UTF-8'}" method="post" id="yasitemap_generate_sitmap">
			<img src="../img/loader.gif" alt=""/>
			<input type="submit" class="button" value="{l s='Continue' mod='yasitemap'}" style="display: none;"/>
		</form>
	</fieldset>
{else}
	{if $yasitemap_links}
		<fieldset style="width: 700px; margin: 0 auto;">
			<legend><img src="{$module_dir|escape:'htmlall':'UTF-8'}logo.gif" alt="" />{l s='Your Sitemaps' mod='yasitemap'}</legend>
			{l s='Please set up the following Sitemap URL in your Google Webmaster account:' mod='yasitemap'}<br/> 
			<a href="{$yasitemap_store_url|escape:'htmlall':'UTF-8'}{$shop->id|intval}_index_yasitemap.xml" target="_blank"><span style="color: blue;">{$yasitemap_store_url|escape:'htmlall':'UTF-8'}{$shop->id|intval}_index_yasitemap.xml</span></a><br/><br/>
			{l s='This URL is the master Sitemap and refers to:' mod='yasitemap'}
			<div style="max-height: 220px; overflow: auto;">
				<ul>
					{foreach from=$yasitemap_links item=yasitemap_link}
						<li><a target="_blank" style="color: blue;" href="{$yasitemap_store_url|escape:'htmlall':'UTF-8'}{$yasitemap_link.link|escape:'htmlall':'UTF-8'}">{$yasitemap_link.link|escape:'htmlall':'UTF-8'}</a></li>
						{/foreach}
				</ul>
			</div>
			<p>{l s='Your last update was:' mod='yasitemap'} {$yasitemap_last_export|escape:'htmlall':'UTF-8'}</p>
		</fieldset>
	{/if}
	<br/>
	{if ($yasitemap_customer_limit.max_exec_time < 30 && $yasitemap_customer_limit.max_exec_time > 0) || ($yasitemap_customer_limit.memory_limit < 128 && $yasitemap_customer_limit.memory_limit > 0)}
		<div class="warn" style="width: 700px; margin: 0 auto;">
			<p>{l s='For a better use of the module, please make sure that you have' mod='yasitemap'}<br/>
			<ul>
				{if $yasitemap_customer_limit.memory_limit < 128 && $yasitemap_customer_limit.memory_limit > 0}
					<li>{l s='a minimum memory limit of 128MB' mod='yasitemap'}</li>
					{/if}
					{if $yasitemap_customer_limit.max_exec_time < 30 && $yasitemap_customer_limit.max_exec_time > 0}
					<li>{l s='a minimum max execution time of 30 sec' mod='yasitemap'}</li>
					{/if}
			</ul>
			{l s='You can edit these limits in your php.ini. For more details, please contact your hosting providers.' mod='yasitemap'}</p>
	</div>
{/if}
<br/>
<form action="{$yasitemap_form|escape:'htmlall':'UTF-8'}" method="post">
	<fieldset style="width: 700px; margin: 0 auto;">
		<legend><img src="{$module_dir|escape:'htmlall':'UTF-8'}logo.gif" alt="" />{l s='Configure your Sitemap' mod='yasitemap'}</legend>
		<p>{l s='Several Sitemaps will be generated depending on how your server is configured and on the number of products activated in your catalog.' mod='yasitemap'}<br/></p>
		<div class="margin-form">
			<label for="yasitemap_frequency" style="width: 235px;">{l s='How often do you update your store?' mod='yasitemap'}
				<select name="yasitemap_frequency">
					<option{if $yasitemap_frequency == 'always'} selected="selected"{/if} value='always'>{l s='always' mod='yasitemap'}</option>
					<option{if $yasitemap_frequency == 'hourly'} selected="selected"{/if} value='hourly'>{l s='hourly' mod='yasitemap'}</option>
					<option{if $yasitemap_frequency == 'daily'} selected="selected"{/if} value='daily'>{l s='daily' mod='yasitemap'}</option>
					<option{if $yasitemap_frequency == 'weekly' || $yasitemap_frequency == ''} selected="selected"{/if} value='weekly'>{l s='weekly' mod='yasitemap'}</option>
					<option{if $yasitemap_frequency == 'monthly'} selected="selected"{/if} value='monthly'>{l s='monthly' mod='yasitemap'}</option>
					<option{if $yasitemap_frequency == 'yearly'} selected="selected"{/if} value='yearly'>{l s='yearly' mod='yasitemap'}</option>
					<option{if $yasitemap_frequency == 'never'} selected="selected"{/if} value='never'>{l s='never' mod='yasitemap'}</option>
				</select></label>
		</div>
		<label for="yasitemap_check_image_file" style="width: 526px;">{l s='Check this box if you wish to check the presence of the image files on the server' mod='yasitemap'}
			<input type="checkbox" name="yasitemap_check_image_file" value="1" {if $yasitemap_check_image_file}checked{/if}></label>
		<label for="yasitemap_check_all" style="width: 526px;"><span>{l s='check all' mod='yasitemap'}</span>
			<input type="checkbox" name="yasitemap_check_all" value="1" class="check"></label>
		<br class="clear" />
		<p for="yasitemap_meta">{l s='Which page don\'t you want to include in your Sitemap:' mod='yasitemap'}</p>
		<ul>
			{foreach from=$store_metas item=store_meta}
				<li style="float: left; width: 200px; margin: 1px;">
					<input type="checkbox" class="yasitemap_metas" name="yasitemap_meta[]"{if in_array($store_meta.id_meta, $yasitemap_disable_metas)} checked="checked"{/if} value="{$store_meta.id_meta|intval}" /> {$store_meta.title|escape:'htmlall':'UTF-8'} [{$store_meta.page|escape:'htmlall':'UTF-8'}]
				</li>
			{/foreach}
		</ul>
		<br/>
		<div class="margin-form" style="clear: both;">
			<input type="submit" style="margin: 20px;" class="button" name="SubmitYasitemap" onclick="$('#yasitemap_loader').show();" value="{l s='Generate Sitemap' mod='yasitemap'}" />{l s='This can take several minutes' mod='yasitemap'}
		</div>
		<p id="yasitemap_loader" style="text-align: center; display: none;"><img src="../img/loader.gif" alt=""/></p>
	</fieldset>
</form><br />

<p class="info" style="width: 680px; margin: 10px auto;{if $prestashop_version == '1.4'} background: url('../img/admin/help2.png') no-repeat scroll 6px 6px #BDE5F8; border: 1px solid #00529B; border-radius: 3px 3px 3px 3px; color: #00529B; font-family: Arial,Verdana,Helvetica,sans-serif; font-size: 12px; margin-bottom: 15px; min-height: 32px; padding: 10px 5px 5px 40px;{/if}">
	<b style="display: block; margin-top: 5px; margin-left: 3px;">{l s='You have two ways to generate Sitemap:' mod='yasitemap'}</b><br /><br />
	1. <b>{l s='Manually:' mod='yasitemap'}</b> {l s='using the form above (as often as needed)' mod='yasitemap'}<br />
	<br /><span style="font-style: italic;">{l s='-or-' mod='yasitemap'}</span><br /><br />
	2. <b>{l s='Automatically:' mod='yasitemap'}</b> {l s='Ask your hosting provider to setup a "Cron task" to load the following URL at the time you would like:' mod='yasitemap'}
	<a href="{$yasitemap_cron|escape:'htmlall':'UTF-8'}" target="_blank">{$yasitemap_cron|escape:'htmlall':'UTF-8'}</a><br /><br />
	{l s='It will automatically generate your XML Sitemaps.' mod='yasitemap'}<br /><br />
</p>
{/if}
<script type="text/javascript">
$(document).ready(function() {
	
	if ($('.yasitemap_metas:checked').length == $('.yasitemap_metas').length)
		$('.check').parent('label').children('span').html("{l s='uncheck all' mod='yasitemap'}");
	
	
	$('.check').toggle(function() {
		$('.yasitemap_metas').attr('checked', 'checked');
		$(this).parent('label').children('span').html("{l s='uncheck all' mod='yasitemap'}");
	}, function() {
		$('.yasitemap_metas').removeAttr('checked');
		$(this).parent('label').children('span').html("{l s='check all' mod='yasitemap'}");
	});
});
</script>
