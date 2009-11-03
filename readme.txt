Using ValidateThis with CFWheels


requires:
# CFWheels 0.9.4
# ValidateThis 0.851
 
Download ValidateThis
Unzip validateThis's zip and place the validateThis folder in webroot of with the cfwheels application.
 
Exampe Of Directory Layout:
webroot
==index.cfm
==IsapiRewrite4.ini
==Application.cfc
====wheels
====views
====models
====events
====controllers
====validateThis
 
In events/onapplicationstart.cfm place this code:
<cfscript>
ValidateThisConfig = {JSRoot="/javascripts/",definitionPath="/models/"};
application.ValidateThis = createObject("component","ValidateThis.ValidateThis").init(ValidateThisConfig);
</cfscript>
 
Unzip the validateThisCFWheels.zip file into CFWheel's webroot.
 
Reload your cfwheels application.
Example: http://localhost/index.cfm?reload=true
 
You should be good to go now.
 
ValidateThis/CFWheels Demo:
http://localhost/index.cfm/validateThis