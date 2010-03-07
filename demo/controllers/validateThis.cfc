<cfcomponent extends="Controller">

	<cffunction name="init">
		 <cfset filters(through="setupDemo,validateJS",only="index,profile,register") >
	</cffunction>
	
	<!--- create --->
	<cffunction name="register">
		<cfset User = model("User").new(params.User)>
		
		<cfif User.save()>
			<cfset flashInsert(message="The User was created successfully.")>
			<cfset redirectTo(action="index",params="context=profile&nojs=#params.nojs#&key=#User.UserID#")>
		<cfelse>
			<cfset flashInsert(message="There was an error creating the User.")>
			<cfset renderPage(action="index")>
		</cfif>
	</cffunction>
	
	<!--- update --->
	<cffunction name="profile">
		<cfset User = model("User").findByKey(params.USERID)>
		
		<cfif User.update(params.user)>
			<cfset flashInsert(message="The User was updated successfully.")>
			<cfset redirectTo(action="index",params="context=#params.context#&nojs=#params.nojs#&key=#params.USERID#")>
		<cfelse>
			<!---
			<cfdump var="#User.HasErrors()#">
			<cfdump var="#User.ALLERRORS()#">
			<cfdump var="#User#">
			<cfabort>
			--->
			<cfset flashInsert(message="There was an error updating the User.")>
			<cfset renderPage(action="index")>
		</cfif>
		
	</cffunction>
	
	<cffunction name="index">
		<cfif StructKeyExists(params,"key")>
			<cfset User = model("user").findOne(where="userid=#params.key#", include="usergroup")>
		    <cfif not IsObject(User)>
				<cfset User = model("User").new() />
		        <cfset flashInsert(message="User #params.key# was not found")>
		    </cfif>	
		<cfelse>
			<cfset User = model("User").new()>
		</cfif>
	</cffunction>
	
	<cffunction name="setupDemo">
		<cfparam name="SuccessMessage" default="" />
		<cfset UniFormErrors = {} />
		<!--- Set up parameters for the Demo --->
		<cfparam name="params.NoJS" default="false" />
		<cfparam name="params.Context" default="Register" />
		<cfparam name="PageHeading" default="Registering a new User" />

		<cfif params.Context EQ "Profile">
			<cfset PageHeading = "Editing an existing User" />
			<cfparam name="params.key" default="1" />
		</cfif>
		
		<cfset usergroup = model("UserGroup").findAll() />
	</cffunction>
	
	<cffunction name="CheckDupNickname">
		<cfset set(renderPage(layout="false")) />
	</cffunction>
</cfcomponent>