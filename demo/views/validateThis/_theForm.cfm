<cfparam name="userTo.likeCheese" default="" />
<cfparam name="userTo.likeChocolate" default="" />
<cfparam name="userTo.ALLOWCOMMUNICATION" default="" />
<cfparam name="userTo.CommunicationMethod" default="" />

<cfoutput>
<h1>ValidateThis! Integrated BO Demo - with CFWheels</h1>
<h3>#PageHeading# (JavaScript Validations are <cfif params.NoJS>OFF<cfelse>ON</cfif>)</h3>
<cfif Len(SuccessMessage)><h3>#SuccessMessage#</h3></cfif>
<div class="formContainer">
	#startFormTag(action="create", name="frmMain", class="uniForm", id="frmMain")#

	<fieldset class="inlineLabels">
		<legend>Access Information</legend>

	 	#validateThisField(
			formHelper="textField",
  			label="Email Address",
            objectName="UserTO",
			labelPlacement="before",
            property="UserName",
            validationMessage="Validations: Required, Must be a valid Email Address.",
			class="textInput")#
		
		#validateThisField(
			formHelper="textField",
  			label="Nickname",
            objectName="UserTO",
			labelPlacement="before",
            property="Nickname",
            validationMessage="Validations: Custom - must be unique. Try ''BobRules''.",
			class="textInput")#
			
		#validateThisField(
			formHelper="passwordField",
  			label="Password",
            objectName="UserTO",
			labelPlacement="before",
            property="UserPass",
            validationMessage="Validations: Required, Must be between 5 and 10 characters, Must be the same as the Verify Password field.",
			class="textInput")#
			
		#validateThisField(
			formHelper="passwordField",
  			label="Verify Password",
            objectName="UserTO",
			labelPlacement="before",
            property="VerifyPassword",
            validationMessage="Validations: Required, Must be between 5 and 10 characters, Must be the same as the Password field.",
			class="textInput")#
		
		#validateThisSelect(
			property="UserGroupId",
			options=usergroup,
			label="User Group",
			objectName="UserTO",
			includeBlank="Select one...",
			validationMessage="Validations: Required.",
			class="textInput")#
			
	</fieldset>
	
	<fieldset class="inlineLabels">
		<legend>User Information</legend>
		
		#validateThisField(
			formHelper="textField",
  			label="Salutation",
            objectName="UserTO",
			labelPlacement="before",
            property="Salutation",
			class="textInput")#
			
		#validateThisField(
			formHelper="textField",
  			label="First Name",
            objectName="UserTO",
			labelPlacement="before",
            property="FirstName",
			class="textInput")#
		
		#validateThisField(
			formHelper="textField",
  			label="Last Name",
            objectName="UserTO",
			labelPlacement="before",
            property="LastName",
			class="textInput")#
		
		<div class="ctrlHolder">
		<p class="label">Do you like Cheese?</p>
		#radioButtonTag(label="Yes", name="likeCheese", value="1", labelPlacement="after", class="inlineLabel", for="LikeCheese-1", checked=iif(userTo.likeCheese EQ 1,true,false),class="inlineLabel",id="LikeCheese-1")#
		#radioButtonTag(label="No", name="likeCheese", value="0", labelPlacement="after", class="inlineLabel", for="LikeCheese-0", checked=iif(userTo.likeCheese EQ 0,true,false),class="inlineLabel",id="LikeCheese-2")#
		</div>
		
		<div class="ctrlHolder">
		<p class="label">Do you like Chocolate?</p>
		#radioButtonTag(label="Yes", name="likeChocolate", value="Yes", labelPlacement="after", class="inlineLabel", checked=iif(userTo.likeChocolate EQ 1,true,false),class="inlineLabel",id="likeChocolate-1")#
		#radioButtonTag(label="No", name="likeChocolate", value="No", labelPlacement="after", class="inlineLabel", checked=iif(userTo.likeChocolate EQ 0,true,false),class="inlineLabel",id="likeChocolate-1")#
		</div>
		
		#validateThisField(
			formHelper="textField",
  			label="What do you like?",
            objectName="UserTO",
			labelPlacement="before",
            property="LikeOther",
			class="textInput")#
		
		#validateThisField(
			formHelper="textField",
  			label="How much money would you like?",
            objectName="UserTO",
			labelPlacement="before",
            property="howMuch",
			class="textInput")#
		
		<div class="ctrlHolder">
		<p class="label">Allow Communitcation</p>
		#radioButtonTag(label="Yes", name="ALLOWCOMMUNICATION", value="Yes", labelPlacement="after", class="inlineLabel", checked=iif(userTo.ALLOWCOMMUNICATION EQ 1,true,false),class="inlineLabel",id="AllowCommunication-1")#
		#radioButtonTag(label="No", name="ALLOWCOMMUNICATION", value="No", labelPlacement="after", class="inlineLabel", checked=iif(userTo.ALLOWCOMMUNICATION EQ 0,true,false),class="inlineLabel",id="AllowCommunication-2")#
		</div>
		
		#selectTag(name="CommunicationMethod", options="Phone,Email,Pony Express",label="Communication Method", selected="#userTo.CommunicationMethod#", prependToLabel="<div class='ctrlHolder'>", append="<p class='formHint'>Validations: Required if Allow Communication? is true.</p></div>",class="selectInput",id="CommunicationMethod")#
	
	</fieldset>

	<div class="buttonHolder">
		<input type="hidden" name="userid" value="#params.userTo.userid#" />
		<input type="hidden" name="Context" value="#params.context#" />
		<input type="hidden" name="NoJS" value="#params.noJS#" />
		<input type="hidden" name="Processing" value="true" />
		
		#submitTag()#
	</div>

	#endFormTag()#
</div>
</cfoutput>