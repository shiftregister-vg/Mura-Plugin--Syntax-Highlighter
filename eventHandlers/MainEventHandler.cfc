<cfcomponent extends="mura.plugin.pluginGenericEventHandler">

	<cffunction name="onRenderEnd" access="public" returntype="void" output="false">
		<cfargument name="event" />
		
		<cfset var $ = application.serviceFactory.getBean('MuraScope').init() />
		<cfset var local = {} />
		<cfset local.pluginDirectory = "#$.getConfigBean().getContext()#/plugins/#variables.pluginConfig.getDirectory()#" />
		<cfset local.regex = '<[pre][^<]+?>' />
		<cfset local.body = arguments.event.getValue('__MuraResponse__') />
		
		<cfif reFindNoCase(local.regex,local.body)>
		  <cfset local.brushArray = ['AppleScript','AS3','Bash','ColdFusion','Cpp','CSharp','Css','Delphi','Diff','Erlang','Groovy','Java','JavaFX','JScript','Perl','Php','Plain','PowerShell','Python','Ruby','Sass','Scala','Sql','Vb','Xml'] />
	      <cfsavecontent variable="local.css">
		  <cfoutput>
			  <link rel="stylesheet" type="text/css" href="#local.pluginDirectory#/css/shCore.css" />
			  <link rel="stylesheet" type="text/css" href="#local.pluginDirectory#/css/shThemeDefault.css" />
		  </cfoutput>
          </head></cfsavecontent>
		  <cfsavecontent variable="local.script"><cfoutput>
			  <script src="#local.pluginDirectory#/js/SyntaxHighlighter/shCore.js" type="text/javascript"></script>
			  <cfloop array="#local.brushArray#" index="local.brush">
			  <script src="#local.pluginDirectory#/js/SyntaxHighlighter/shBrush#local.brush#.js" type="text/javascript"></script>
			  </cfloop>
			  <script type="text/javascript">SyntaxHighlighter.all();</script></body>
		  </cfoutput></cfsavecontent>
		  <cfset local.body = replaceNoCase(local.body,'</head>',local.css,'ALL') />
		  <cfset local.body = replaceNoCase(local.body,'</body>',local.script,'ALL') />
		  <cfset arguments.event.setValue('__MuraResponse__',local.body) />
		</cfif>
	</cffunction>

</cfcomponent>