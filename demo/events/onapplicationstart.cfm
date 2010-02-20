<!--- Place code here that should be executed on the "onApplicationStart" event. --->

<cfscript>
ValidateThisConfig = {JSRoot="/javascripts/",definitionPath="/models/",propertyMode="cfwheels"};
application.ValidateThis = createObject("component","ValidateThis.ValidateThis").init(ValidateThisConfig);
</cfscript>