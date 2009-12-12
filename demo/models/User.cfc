<cfcomponent extends="Model">
	<cffunction name="init">
		<cfset table("tbluser")>
		<cfset belongsTo(name="UserGroup", foreignKey="UserGroupId")>
		<!--- <cfset validatesPresenceOf(properties="UserName,NickName,UserPass")> --->
		<cfset beforeValidation("ValidateThis")>
	</cffunction>	
</cfcomponent>