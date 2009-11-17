<cfcomponent>
	 <cffunction name="init">
		<cfset this.version = "0.9.4">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="validateThis">
		<cfscript>
		ValidateThisConfig = {JSRoot="/javascripts/",definitionPath="/models/",propertyMode="cfwheels"};
		application.ValidateThis = createObject("component","ValidateThis.ValidateThis").init(ValidateThisConfig);
		</cfscript>
		<cfreturn application.ValidateThis>
	</cffunction>
			 
	<cffunction name="validateThisField" returntype="string" access="public" output="false">
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
	
	<cffunction name="validateThisSelect" returntype="string" access="public" output="false">
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
	<cffunction name="isRequired" returntype="any" output="false" hint="I am used to display an asterisk for required fields.  I only exist for this demo page - there are much better ways of doing this!">
		<cfargument name="fieldName" type="any" required="yes" />
		<cfif StructKeyExists(RequiredFields,arguments.fieldName)>
			<cfreturn "<em>*</em> " />
		<cfelse>
			<cfreturn "" />
		</cfif>
	</cffunction>
	
	<cffunction name="isErrorMsg" returntype="any" output="false" hint="I am used to display error messages for a field.  I only exist for this demo page - there are much better ways of doing this!">
		<cfargument name="fieldName" type="any" required="yes" />
		<cfif StructKeyExists(UniFormErrors,arguments.fieldName)>
			<cfreturn '<p id="error-UserName" class="errorField bold">#UniFormErrors[arguments.fieldName]#</p>' />
		<cfelse>
			<cfreturn "" />
		</cfif>
	</cffunction>
</cfcomponent>