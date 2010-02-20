<cfcomponent extends="Controller">

	<cffunction name="init">
		 <cfset filters(through="setupDemo,validateJS",only="index,create") >
	</cffunction>
	
	<cffunction name="create">
		<!--- populate user object with form values --->
		<cfset User = model("user").new(params.User) />
		
		<cfset existsUser = model("user").exists(key=params.userid) />

		<cfif existsUser>
			<cfset resultSave = model("user").updateByKey(params.userid, params.User)>
		<cfelse>
			<cfset resultSave = User.Save()>
		</cfif>
		
		<cfset renderPage(action="index") />
	</cffunction>
	
	<cffunction name="index">
		<cfset User = model("user").findOne(where="userid=#params.User.userid#", include="usergroup")>
	    <cfif not IsObject(User)>
			<cfset User = model("User").new() />
	        <cfset flashInsert(message="User #params.User.userid# was not found")>
	    </cfif>
	</cffunction>
	
	<cffunction name="setupDemo">
		<cfparam name="params.User.userid" default="0" />
		<cfparam name="SuccessMessage" default="" />
		<cfset UniFormErrors = {} />
		<!--- Set up parameters for the Demo --->
		<cfparam name="params.NoJS" default="false" />
		<cfparam name="params.Context" default="Register" />
			
		<cfif params.Context EQ "Profile">
			<cfset PageHeading = "Editing an existing User" />
			<cfset params.User.userid = 1 />
		<cfelse>
			<cfset PageHeading = "Registering a new User" />
		</cfif>
		
		<cfset usergroup = model("UserGroup").findAll() />
	</cffunction>
	
	<cffunction name="CheckDupNickname">
		<cfset renderPage(layout=false) />
	</cffunction>
</cfcomponent>