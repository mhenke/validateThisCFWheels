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
			 
	<cffunction name="validateThisField" returntype="string" access="public" output="false" mixin="controller">
		<cfargument name="property" type="String" required="true" />
		<cfargument name="label" type="String" required="true" />
		<cfargument name="validationMessage" type="String" default="" />
		
		<cfset var return = "" />
		
		<cfset arguments.id = arguments.property/>
		<cfset arguments.label = "#isRequired(arguments.id)##arguments.label#"/>
		<cfset arguments.prependToLabel="<div class='ctrlHolder'>#isErrorMsg(arguments.id)#" />
		<cfset arguments.append='<p class="formHint">#arguments.validationMessage#</p></div>' />
		
		<cfset return = arguments.formHelper & "(argumentCollection=arguments)"/>
		
		<cfreturn evaluate(return)> 
	</cffunction>
	
	<cffunction name="validateThisSelect" returntype="string" access="public" output="false" mixin="controller">
		<cfargument name="property" type="String" required="true" />
		<cfargument name="label" type="String" required="true" />
		<cfargument name="validationMessage" type="String" default="" />
	
		<cfset var return = "" />
		
		<cfset arguments.id = arguments.property />
		
		<cfsavecontent variable="return">	
		<cfoutput>	
			<div class="ctrlHolder">
				#isErrorMsg(arguments.id)#
				<label for="#arguments.label#">#isRequired(arguments.id)##arguments.label#</label>
					<cfset arguments.label = "" />
					 #select(argumentCollection=arguments)#
				<p class="formHint">#arguments.validationMessage#</p>
			</div>
		</cfoutput>
		</cfsavecontent>
		
		<cfreturn return> 
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