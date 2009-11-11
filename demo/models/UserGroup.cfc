<cfcomponent extends="Model">
<!---
<cfset UserTO = application.Reactor.createRecord("User").load(userId=Form.UserId) />
--->

	<cffunction name="init">
		<cfset table("tblusergroup")>
	</cffunction>

</cfcomponent>