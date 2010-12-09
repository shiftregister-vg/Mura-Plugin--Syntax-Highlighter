<!--- 
	Plugin: Syntax Highlighter
 --->

<cfinclude template="plugin/config.cfm" />

<cfsilent>
	<cfset request.brushes = [
				{styles=['applescript'],label='AppleScript',scriptName='AppleScript'},
				{styles=['actionscript3','as3'],label='ActionScript 3',scriptName='AS3'},
				{styles=['bash','shell'],label='Bash',scriptName='Bash'},
				{styles=['coldfusion','cf'],label='ColdFusion',scriptName='ColdFusion'},
				{styles=['cpp','c'],label='C++',scriptName='Cpp'},
				{styles=['c##', 'c-sharp', 'csharp'],label='C##',scriptName='CSharp'},
				{styles=['css'],label='CSS',scriptName='Css'},
				{styles=['delphi', 'pascal', 'pas'],label='Delphi / Pascal',scriptName='Delphi'},
				{styles=['diff','patch'],label='Differences',scriptName='Diff'},
				{styles=['erl', 'erlang'],label='Erlang',scriptName='Erlang'},
				{styles=['groovy'],label='Groovy',scriptName='Groovy'},
				{styles=['java'],label='Java',scriptName='Java'},
				{styles=['jfx', 'javafx'],label='Java FX',scriptName='JavaFX'},
				{styles=['js', 'jscript', 'javascript'],label='JavaScript',scriptName='JScript'},
				{styles=['perl', 'Perl', 'pl'],label='Perl',scriptName='Perl'},
				{styles=['php'],label='PHP',scriptName='Php'},
				{styles=['text', 'plain'],label='Plain Text',scriptName='Plain'},
				{styles=['powershell', 'ps'],label='PowerShell',scriptName='PowerShell'},
				{styles=['py', 'python'],label='Python',scriptName='Python'},
				{styles=['ruby', 'rails', 'ror', 'rb'],label='Ruby / Ruby on Rails',scriptName='Ruby'},
				{styles=['sass', 'scss'],label='Sass / SCSS',scriptName='Sass'},
				{styles=['scala'],label='Scala',scriptName='Scala'},
				{styles=['sql'],label='SQL',scriptName='Sql'},
				{styles=['vb', 'vbnet'],label='VisualBasic / VB.NET',scriptName='Vb'},
				{styles=['xml', 'xhtml', 'xslt', 'html'],label='XML / XHTML / XSLT / HTML',scriptName='Xml'}
			] />
</cfsilent>

<cfsavecontent variable="variables.body">
	<style>
	#languageList { list-style:none; }
	#languageList li { padding: 5px 7px 5px 7px; }
	#languageList li span { color:#666666; }
	#languageList li.even { background-color:#f2f2f2; }
	</style>
	<script type="text/javascript">
	jQuery(function($){
		$('#languageList li:even').addClass('even');
	});
	</script>
	<cfoutput>
	<h2>#request.pluginConfig.getName()#</h2>
	<p>Add syntax highlighting to your content with an easy to use syntax.</p>
	
	<h3>Example</h3>
	<p>
		Wrap the code to be highlighted with <strong><em>&lt;pre class="brush: {brush style}"&gt;</em></strong>{Place code here}<strong><em>&lt;/pre&gt;</em></strong> where <strong><em>{brush style}</em></strong> corresponds to one of the syntax styles below.
		YOu can read more about the Syntax Highlighter <a href="http://alexgorbatchev.com/SyntaxHighlighter/" target="_blank">here</a>. It is important to note that the &lt;script /&gt; syntax highlighting described there has been disabled in the plugin.
	</p>	
	
	<h3>Available Syntax Highlighting</h3>
	<ul id="languageList">
		<cfloop array="#request.brushes#" index="brush">
			<li><strong>#brush.label#</strong><br/><span><strong>Styles:</strong> <em>#arrayToList(brush.styles,', ')#</em></span></li>
		</cfloop>
	</ul>
	</cfoutput>
</cfsavecontent>

<cfoutput>#application.pluginManager.renderAdminTemplate(body=variables.body,pageTitle=request.pluginConfig.getName())#</cfoutput>