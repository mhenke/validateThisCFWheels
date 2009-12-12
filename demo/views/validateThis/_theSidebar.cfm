<!---
	
	Copyright 2008, Bob Silverberg
	
	Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in 
	compliance with the License.  You may obtain a copy of the License at 
	
		http://www.apache.org/licenses/LICENSE-2.0
	
	Unless required by applicable law or agreed to in writing, software distributed under the License is 
	distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or 
	implied.  See the License for the specific language governing permissions and limitations under the 
	License.
	
--->
<cfoutput>
<p>Welcome to the <strong>ValidateThis!</strong> Simple Service Integration Demo Page.
	<ul><strong>Demo Options:</strong>
		<cfoutput>
		<cfif params.NoJS>
			<li>#linkTo(text="Turn on JS Validations",controller="validateThis",action="index",params="NoJS=false&Context=#Context#")#</li>
		<cfelse>
			<li>
			#linkTo(text="Turn off JS Validations",controller="validateThis",action="index",params="NoJS=true&Context=#Context#")#
			</li>
		</cfif>
		<li>
			#linkTo(text="Register a New User",controller="validateThis",action="index",params="NoJS=#NoJS#")#
		</li>
		<li>
			#linkTo(text="Edit an Existing User",controller="validateThis",action="index",params="Context=Profile&NoJS=#NoJS#")#
		</li>
		<li>
			#linkTo(text="Back to the Home Page",controller="validateThis",action="index")#
		</li>
		</cfoutput>
	</ul>
</p>
<p>This sample form includes hints which indicate the various validations that have been defined for the business object that underlies the form.</p>
<p>Use the text links above to toggle JavaScript validations to see both the client-side and server-side validations in action.</p>
<p>All of the validations are driven by a simple xml file, which is used to define the business rules that apply.  You can view the xml file <a href="/models/user.xml" target="_blank">here</a>.</p>
<p>The code for this demo integrates ValidateThis into the application via the ValidateThis service object, which is simpler than integrating the framework directly into your business objects.  This sample also uses Reactor as an ORM.</p>
<p>Please refer to <a href="http://www.silverwareconsulting.com/index.cfm/ValidateThis" target="_blank">my blog</a> for more detailed information about the framework.</p>
</cfoutput>