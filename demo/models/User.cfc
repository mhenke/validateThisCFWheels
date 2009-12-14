<cfcomponent extends="Model">
	<cffunction name="init">
		<cfset table("tbluser")>
		<cfset belongsTo(name="UserGroup", foreignKey="UserGroupId")>
		
		<cfset this.UserGroup = "" >
		
		<!--- non persistant model property --->
		<cfset this.VerifyPassword  = "" >
		
		<!--- <cfset validatesPresenceOf(properties="UserName,NickName,UserPass")> --->
		<cfset beforeValidation("ValidateThis")>
	</cffunction>	 
</cfcomponent>