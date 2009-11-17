<cfcomponent extends="Controller">

	<cffunction name="init">
		 <cfset filters(through="setupDemo,validateJS",only="index") >
	</cffunction>
	
	<cffunction name="create">
		<!--- populate user object with form values --->
		<cfset User = model("user").new(params.userTo) />
		
		<!--- Validate the object using ValidateThis! --->
		<cfset Result = application.ValidateThis.validate(theObject=User,objectType="User",Context=params.Context,results=params.userTo) />

		<!--- If validations passed, save the record --->
		<cfif Result.getIsSuccess()>
			<cfset UserTO.save() />
			<cfset SuccessMessage = "The User has been saved!" />
		<cfelse>
			<cfset SuccessMessage = "" />
		</cfif>
		
	 	<cfset existsUser = model("user").exists(key=params.userTo.userid) />
		
		<cfif existsUser>
			<cfset result = model("user").updateByKey(params.userTo.userid, params.userTo)>
		<cfelse>
			<cfset newUser = model("user").new(params.userTo) />
			<cfset result = newUser.Save()>
		</cfif>

		<cfif result>
			<cfset flashInsert(success="User #params.userTo.userid# saved successfully.") />
		<cfelse>
			<cfset flashInsert(success="User #params.userTo.userid# NOT SAVED successfully.") />
		</cfif>
		
		<cfset renderPage(action="index") />
	</cffunction>
	
	<cffunction name="index">
		<cfset userTo = model("user").findOne(where="userid=#params.userTo.userid#", include="usergroup")>
		<!--- <cfset UserTO = model("User").findOne(where="userid=#params.userTo.userid#", include="usergroup")>  --->
	    <cfif not IsObject(userTo)>
			<cfset userTo = model("User").new() />
	        <cfset flashInsert(success="User #params.userTo.userid# was not found")>
	    </cfif>
	</cffunction>
	
	<cffunction name="setupDemo">
		<cfparam name="params.userTo.userid" default="0" />
		<cfparam name="SuccessMessage" default="" />
		<cfset UniFormErrors = {} />
		<!--- Set up parameters for the Demo --->
		<cfparam name="params.NoJS" default="false" />
		<cfparam name="params.Context" default="Register" />
			
		<cfif params.Context EQ "Profile">
			<cfset PageHeading = "Editing an existing User" />
			<cfset params.userTo.userid = 1 />
		<cfelse>
			<cfset PageHeading = "Registering a new User" />
		</cfif>
		
		<cfset usergroup = model("UserGroup").findAll() />
	</cffunction>
	
	<cffunction name="validateJS">
		<!--- Get the list of required fields to use to dynamically add asterisks in front of each field --->
		<cfset RequiredFields = application.ValidateThis.getRequiredFields(objectType="User",Context=params.Context) />
		
		<!--- If we want JS validations turned on, get the Script blocks to initialize the libraries and for the validations themselves, and include them in the <head> --->
		<cfif NOT params.NoJS>
			<cfset ValInit = application.ValidateThis.getInitializationScript() />
			<cfhtmlhead text="#ValInit#" />
			<!--- Some formatting rules specific to this form --->
			<cfsavecontent variable="headJS">
				<script type="text/javascript">
				$(document).ready(function() {
					jQuery.validator.setDefaults({ 
						errorClass: 'errorField', 
						errorElement: 'p', 
						errorPlacement: function(error, element) { 
							error.prependTo( element.parents('div.ctrlHolder') ) 
						}, 
						highlight: function() {}
					});
				});
				</script>
			</cfsavecontent>	
			<cfhtmlhead text="#headJS#" />
			<cfset ValidationScript = application.ValidateThis.getValidationScript(objectType="User",Context=params.Context) />
			<cfhtmlhead text="#ValidationScript#" />
		</cfif>
	</cffunction>
	
</cfcomponent>