<cfcomponent>

	 <cffunction name="init">
		<cfset this.version = "0.9.4">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="ValidateThis" returntype="Any" access="public" output="false" hint="" mixin="model">
		<!--- TODO: check if validateThis rules exist for objectType --->
		<cfset var loc = {} />
		<cfset loc.validateThis = application.ValidateThis.validate(objectType="#variables.wheels.class.name#",theObject=this,Context="register") />
		<cfset loc.failures = loc.validateThis.GETFAILURESASSTRUCT() />
		
		<cfloop collection = #loc.failures# item = "loc.fieldname">
			<cfset this.AddError(property="#loc.fieldname#",message="#StructFind(loc.failures, loc.fieldname)#") />
		</cfloop>
		
		<!---
		<cfdump var="#loc.validateThis.GETERRORS()#">
		<cfdump var="#loc.validateThis#">
		<cfabort>
		--->
	</cffunction>
	
	<cffunction name="validateJS" returntype="Any" access="public" output="false" hint="" mixin="controller">
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

	<cffunction name="CheckDupNickname" access="public" output="false" returntype="any" hint="Checks for a duplicate UserName." mixin="model">
		<!--- This is just a "mock" method to test out the custom validation type --->
		<cfset var ReturnStruct = StructNew() />
		<cfset ReturnStruct.IsSuccess = false />
		<cfset ReturnStruct.FailureMessage = "That Nickname has already been used. Try to be more original!" />
		<cfif $propertyvalue("Nickname") NEQ "BobRules">
			<cfset ReturnStruct = StructNew() />
			<cfset ReturnStruct.IsSuccess = true />
		</cfif>
		<cfreturn ReturnStruct />		
	</cffunction>
	
	<!--- These UDFs are only required to make the demo look pretty --->
	<cffunction name="isRequired" returntype="any" output="false" hint="I am used to display an asterisk for required fields.  I only exist for this demo page - there are much better ways of doing this!" mixin="controller">
		<cfargument name="fieldName" type="any" required="yes" />
		<cfif StructKeyExists(RequiredFields,arguments.fieldName)>
			<cfreturn "<em>*</em> " />
		<cfelse>
			<cfreturn "" />
		</cfif>
	</cffunction>
	
	<cffunction name="isErrorMsg" returntype="any" output="false" hint="I am used to display error messages for a field.  I only exist for this demo page - there are much better ways of doing this!" mixin="controller">
		<cfargument name="fieldName" type="any" required="yes" />
		<cfif StructKeyExists(UniFormErrors,arguments.fieldName)>
			<cfreturn '<p id="error-UserName" class="errorField bold">#UniFormErrors[arguments.fieldName]#</p>' />
		<cfelse>
			<cfreturn "" />
		</cfif>
	</cffunction>
	
</cfcomponent>