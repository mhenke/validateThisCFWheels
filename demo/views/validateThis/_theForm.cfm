<cfparam name="User.likeCheese" default="" />
<cfparam name="User.likeChocolate" default="" />
<cfparam name="User.ALLOWCOMMUNICATION" default="" />
<cfparam name="User.CommunicationMethod" default="" />

<cfoutput>
<h1>ValidateThis! Integrated BO Demo - with CFWheels</h1>
<h3>#PageHeading# (JavaScript Validations are <cfif params.NoJS>OFF<cfelse>ON</cfif>)</h3>
<h3>#flash("message")#</h3>

<div>#errorMessagesFor("User")#</div>

<div class="formContainer">
	#startFormTag(action="create", name="frmMain", class="uniForm", id="frmMain")#

	<fieldset class="inlineLabels">
		<legend>Access Information</legend>

	 	#validateThisField(
			formHelper="textField",
  			label="Email Address",
            objectName="User",
			labelPlacement="before",
            property="UserName",
            validationMessage="Validations: Required, Must be a valid Email Address.",
			class="textInput")#
		
		#validateThisField(
			formHelper="textField",
  			label="Nickname",
            objectName="User",
			labelPlacement="before",
            property="Nickname",
            validationMessage="Validations: Custom - must be unique. Try ''BobRules''.",
			class="textInput")#
			
		#validateThisField(
			formHelper="passwordField",
  			label="Password",
            objectName="User",
			labelPlacement="before",
            property="UserPass",
            validationMessage="Validations: Required, Must be between 5 and 10 characters, Must be the same as the Verify Password field.",
			class="textInput")#
			
		#validateThisField(
			formHelper="passwordField",
  			label="Verify Password",
            objectName="User",
			labelPlacement="before",
            property="VerifyPassword",
            validationMessage="Validations: Required, Must be between 5 and 10 characters, Must be the same as the Password field.",
			class="textInput")#
		
		#validateThisSelect(
			property="UserGroupId",
			options=usergroup,
			label="User Group",
			objectName="User",
			includeBlank="Select one...",
			validationMessage="Validations: Required.",
			class="textInput")#
			
	</fieldset>
	
	<fieldset class="inlineLabels">
		<legend>User Information</legend>
		
		#validateThisField(
			formHelper="textField",
  			label="Salutation",
            objectName="User",
			labelPlacement="before",
            property="Salutation",
			class="textInput")#
			
		#validateThisField(
			formHelper="textField",
  			label="First Name",
            objectName="User",
			labelPlacement="before",
            property="FirstName",
			class="textInput")#
		
		#validateThisField(
			formHelper="textField",
  			label="Last Name",
            objectName="User",
			labelPlacement="before",
            property="LastName",
			class="textInput")#
		
		<div class="ctrlHolder">
		<p class="label">Do you like Cheese?</p>
		#radioButtonTag(label="Yes", name="USER[likeCheese]", value="1", labelPlacement="after", class="inlineLabel", for="LikeCheese-1", checked=iif(User.likeCheese EQ 1,true,false),class="inlineLabel",id="LikeCheese-1")#
		#radioButtonTag(label="No", name="USER[likeCheese]", value="0", labelPlacement="after", class="inlineLabel", for="LikeCheese-0", checked=iif(User.likeCheese EQ 1,false,true),class="inlineLabel",id="LikeCheese-2")#
		</div>
		
		<div class="ctrlHolder">
		<p class="label">Do you like Chocolate?</p>
		#radioButtonTag(label="Yes", name="USER[likeChocolate]", value="1", labelPlacement="after", class="inlineLabel", checked=iif(User.likeChocolate EQ 1,true,false),class="inlineLabel",id="likeChocolate-1")#
		#radioButtonTag(label="No", name="USER[likeChocolate]", value="0", labelPlacement="after", class="inlineLabel", checked=iif(User.likeChocolate EQ 1,false,true),class="inlineLabel",id="likeChocolate-1")#
		</div>
		
		#validateThisField(
			formHelper="textField",
  			label="What do you like?",
            objectName="User",
			labelPlacement="before",
            property="LikeOther",
			class="textInput")#
		
		#validateThisField(
			formHelper="textField",
  			label="How much money would you like?",
            objectName="User",
			labelPlacement="before",
            property="howMuch",
			class="textInput")#
		
		<div class="ctrlHolder">
		<p class="label">Allow Communitcation</p>
		#radioButtonTag(label="Yes", name="USER[ALLOWCOMMUNICATION]", value="1", labelPlacement="after", class="inlineLabel", checked=iif(User.ALLOWCOMMUNICATION EQ 1,true,false),class="inlineLabel",id="AllowCommunication-1")#
		#radioButtonTag(label="No", name="USER[ALLOWCOMMUNICATION]", value="0", labelPlacement="after", class="inlineLabel", checked=iif(User.ALLOWCOMMUNICATION EQ 1,false,true),class="inlineLabel",id="AllowCommunication-2")#
		</div>
		
		#selectTag(name="USER[CommunicationMethod]", options="Phone,Email,Pony Express",includeBlank="Select one...",label="Communication Method", selected="#User.CommunicationMethod#", prependToLabel="<div class='ctrlHolder'>", append="<p class='formHint'>Validations: Required if Allow Communication? is true.</p></div>",class="selectInput",id="CommunicationMethod")#
	
	</fieldset>

	<div class="buttonHolder">
		<input type="hidden" name="userid" value="#params.User.userid#" />
		<input type="hidden" name="Context" value="#params.context#" />
		<input type="hidden" name="NoJS" value="#params.noJS#" />
		<input type="hidden" name="Processing" value="true" />
		
		#submitTag()#
	</div>

	#endFormTag()#
</div>
</cfoutput>