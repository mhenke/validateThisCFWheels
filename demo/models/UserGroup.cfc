<cfcomponent extends="Model">
<!---
<cfset User = application.Reactor.createRecord("User").load(userId=Form.UserId) />
--->

	<cffunction name="init">
		<cfset table("tblusergroup")>
	</cffunction>

</cfcomponent>