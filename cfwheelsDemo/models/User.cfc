<cfcomponent extends="Model">

	<cffunction name="init">
		<cfset table("tbluser")>
		<cfset belongsTo(name="UserGroup", foreignKey="UserGroupId")>
	</cffunction>

</cfcomponent>