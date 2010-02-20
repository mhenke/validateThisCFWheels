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
		
		#textField(label="#isRequired('UserName')#Email Address",
            objectName="User",
			labelPlacement="before",
			prependToLabel="<div class='ctrlHolder'>#isErrorMsg('UserName')#",
			append='<p class="formHint">Validations: Required, Must be a valid Email Address.</p></div>',
            property="UserName",
			class="textInput",
			id="UserName")#
			
	   #textField(label="#isRequired('Nickname')#Nickname",
            objectName="User",
			labelPlacement="before",
			prependToLabel="<div class='ctrlHolder'>#isErrorMsg('Nickname')#",
			append='<p class="formHint">Validations: Custom - must be unique. Try ''BobRules''.</p></div>',
            property="Nickname",
			class="textInput",
			id="Nickname")#
			
		#passwordField(label="#isRequired('UserPass')#Password",
            objectName="User",
			labelPlacement="before",
			prependToLabel="<div class='ctrlHolder'>#isErrorMsg('UserPass')#",
			append='<p class="formHint">Validations: Required, Must be between 5 and 10 characters, Must be the same as the Verify Password field.</p></div>',
            property="UserPass",
			class="textInput",
			id="UserPass")#
				
		#passwordField(label="#isRequired('VerifyPassword')#Verify Password",
            objectName="User",
			labelPlacement="before",
			prependToLabel="<div class='ctrlHolder'>#isErrorMsg('VerifyPassword')#",
			append='<p class="formHint">Validations: Required, Must be between 5 and 10 characters, Must be the same as the Password field.</p></div>',
            property="VerifyPassword",
			class="textInput",
			id="VerifyPassword")#
				
		<div class="ctrlHolder">
				#isErrorMsg('UserGroupId')#
				<label for="Communication Method">#isRequired('UserGroupId')#User Group</label>
					 #select(property="UserGroupId",
						options=usergroup,
						objectName="User",
						includeBlank="Select one...",
						class="textInput",
						id="UserGroupId")#
			<p class="formHint">Validations: Required.</p>
		</div>
			
	</fieldset>
	
	<fieldset class="inlineLabels">
		<legend>User Information</legend>
		
		#textField(label="#isRequired('Salutation')#Salutation",
            objectName="User",
			labelPlacement="before",
			prependToLabel="<div class='ctrlHolder'>#isErrorMsg('Salutation')#",
			append='<p class="formHint">Validations: A regex ensures that only Dr, Prof, Mr, Mrs, Ms, or Miss (with or without a period) are allowed.</p></div>',
            property="Salutation",
			class="textInput",
			id="Salutation")#
		
		#textField(label="#isRequired('FirstName')#First Name",
            objectName="User",
			labelPlacement="before",
			prependToLabel="<div class='ctrlHolder'>#isErrorMsg('FirstName')#",
			append='<p class="formHint">Validations: Required on Update.</p></div>',
            property="FirstName",
			class="textInput",
			id="FirstName")#
		
		#textField(label="#isRequired('LastName')#Last Name",
            objectName="User",
			labelPlacement="before",
			prependToLabel="<div class='ctrlHolder'>#isErrorMsg('LastName')#",
			append='<p class="formHint">Validations: Required on Update OR if a First Name has been specified during Register.</p></div>',
            property="LastName",
			class="textInput",
			id="LastName")#
			
		<div class="ctrlHolder">
			<p class="label">Do you like Cheese?</p>
				<label for="likeCheese-1" class="inlineLabel">
				#radioButtonTag(
				name="likeCheese", objectName="User", property="LikeCheese", value=1, id="LikeCheese"
				)#Yes
				</label>
				<label for="likeCheese-0" class="inlineLabel">
				#radioButtonTag(
				name="likeCheese", objectName="User", property="LikeCheese", value=0, id="LikeCheese", checked="1"
				)#No
				</label>
		</div>
		
		<div class="ctrlHolder">
			<p class="label">Do you like Chocolate?</p>
				<label for="likeChocolate-1" class="inlineLabel">
				#radioButtonTag(
				name="likeChocolate", objectName="User", property="LikeChocolate", value=1, id="LikeChocolate"
				)#Yes
				</label>
				<label for="likeChocolate-0" class="inlineLabel">
				#radioButtonTag(
				name="likeChocolate", objectName="User", property="LikeChocolate", value=0, id="LikeChocolate", checked="1"
				)#No
				</label>
		</div>
		
		#textField(label="#isRequired('LikeOther')#What do you like?",
            objectName="User",
			labelPlacement="before",
			prependToLabel="<div class='ctrlHolder'>#isErrorMsg('LikeOther')#",
			append='<p class="formHint">Validations: Required if neither Do you like Cheese? nor Do you like Chocolate? are true.</p></div>',
            property="LikeOther",
			class="textInput",
			id="LikeOther")#
			
		#textField(label="#isRequired('howMuch')#How much money would you like?",
            objectName="User",
			labelPlacement="before",
			prependToLabel="<div class='ctrlHolder'>#isErrorMsg('howMuch')#",
			append='<p class="formHint">Validations: Numeric - notice that an invalid value is redisplayed upon server side validation failure.</p></div>',
            property="howMuch",
			class="textInput",
			id="HowMuch")#
				
		<div class="ctrlHolder">
			<p class="label">Allow Communication</p>
				<label for="AllowCommunication-1" class="inlineLabel">
				#radioButtonTag(
				name="AllowCommunication", objectName="User", property="AllowCommunication", value=1, id="AllowCommunication1"
				)#Yes
				</label>
				<label for="AllowCommunication-0" class="inlineLabel">
				#radioButtonTag(
				name="AllowCommunication", objectName="User", property="AllowCommunication", value=0, id="AllowCommunication2", checked="1"
				)#No
				</label>
		</div>
		
		<div class="ctrlHolder">
				#isErrorMsg('CommunicationMethod')#
				<label for="Communication Method">#isRequired('CommunicationMethod')#Communication Method</label>
					 #select(property="CommunicationMethod",
						options="Phone,Email,Pony Express",
						objectName="User",
						includeBlank="Select one...",
						class="textInput",
						id="CommunicationMethod")#
			<p class="formHint">Validations: Required if Allow Communication? is true.</p>
		</div>
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