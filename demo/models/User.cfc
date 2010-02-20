<cfcomponent extends="Model">
	<cffunction name="init">
		<cfset table("tbluser")>
		<cfset belongsTo(name="UserGroup", foreignKey="UserGroupId")>
		
		<!--- non persistent model property --->
		<cfset this.VerifyPassword  = "" >

		<cfset beforeValidation("ValidateThis")>
	</cffunction>	
</cfcomponent>