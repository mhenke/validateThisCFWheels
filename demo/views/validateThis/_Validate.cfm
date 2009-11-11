<cfoutput>
<!--- We need the UserService to get our Business Object and to Perform an Update --->
<cfset UserService = UserTO />

<!--- Default the validation failures to an empty struct --->
<cfset UniFormErrors = {} />

<!--- Are we displaying a form or processing a form? --->
<cfif StructKeyExists(Form,"Processing")>
	<cfset Result = UserService.updateUser(theId=Form.UserId,args=Form,Context=Form.Context) />
	<cfset UniFormErrors = Result.getFailuresForUniForm() />
	<cfset SuccessMessage = Result.getSuccessMessage() />
	<cfset UserTO = Result.getTheObject() />
<cfelse>
	<cfset UserTO = UserService.getUser(theId=Form.UserId) />
</cfif>
<cfif UserTO.hasUserGroup()>
	<cfset UserGroupId = UserTO.getUserGroup().getUserGroupId() />
<cfelse>
	<cfset UserGroupId = 0 />
</cfif>

<!--- Get the list of required fields to use to dynamically add asterisks in front of each field --->
<cfset RequiredFields = UserTO.getRequiredFields(Form.Context) />

<!--- If we want JS validations turned on, get the Script blocks to initialize the libraries and for the validations themselves, and include them in the <head> --->
<cfif NOT Form.NoJS>
	<cfset ValInit = UserTO.getInitializationScript() />
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
	<cfset ValidationScript = UserTO.getValidationScript(Form.Context) />
	<cfhtmlhead text="#ValidationScript#" />
</cfif>
</cfoutput>