<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <div class="container" style="margin: 10px;
  display: flex;
  flex-direction: column;
  align-items: center;
  height: 100px;">
  <div class="registration" style="width: 300px;
  display: flex;
  flex-direction: column;
  align-items: center;">
    <#if section = "header">
    <#elseif section = "form">
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post" style="border: solid lightgray 1px;
  padding: 20px;
  width: 300px;">
        <img style = " object-fit: contain; width: 100px; " class="login_logo" src="https://www.bitrefill.com/content/cn/b_rgb%3AFFFFFF%2Cc_pad%2Ch_720%2Cw_1280/v1569493391/amazon_it.jpg" >
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label "for="firstName" class="${properties.kcLabelClass!}"><h4 style = " font-size:15px;font-weight: 500;
  margin-bottom: 20px;">Nome</h4></label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input style="height: 30px;
  margin-bottom: 10px;
  background-color: white;
  width: 98%;" type="text" id="firstName" class="${properties.kcInputClass!}" name="firstName"
                           value="${(register.formData.firstName!'')}"
                           aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                    />

                    <#if messagesPerField.existsError('firstName')>
                        <span id="input-error-firstname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                        </span>
                    </#if>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="lastName" class="${properties.kcLabelClass!}"><h4 style = " font-size:15px;font-weight: 500;
  margin-bottom: 20px;">Cognome</h4></label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input style="height: 30px;
  margin-bottom: 10px;
  background-color: white;
  width: 98%;" type="text" id="lastName" class="${properties.kcInputClass!}" name="lastName"
                           value="${(register.formData.lastName!'')}"
                           aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                    />

                    <#if messagesPerField.existsError('lastName')>
                        <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                        </span>
                    </#if>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="email" class="${properties.kcLabelClass!}"><h4 style = " font-size:15px;font-weight: 500;
  margin-bottom: 20px;">${msg("email")}</h4></label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input style="height: 30px;
  margin-bottom: 10px;
  background-color: white;
  width: 98%;" type="text" id="email" class="${properties.kcInputClass!}" name="email"
                           value="${(register.formData.email!'')}" autocomplete="email"
                           aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                    />

                    <#if messagesPerField.existsError('email')>
                        <span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('email'))?no_esc}
                        </span>
                    </#if>
                </div>
            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="username" class="${properties.kcLabelClass!}"><h4 style = " font-size:15px;font-weight: 500;
  margin-bottom: 20px;">${msg("username")}</h4></label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input style="height: 30px;
  margin-bottom: 10px;
  background-color: white;
  width: 98%;" type="text" id="username" class="${properties.kcInputClass!}" name="username"
                               value="${(register.formData.username!'')}" autocomplete="username"
                               aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                        />

                        <#if messagesPerField.existsError('username')>
                            <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>
            </#if>

            <#if passwordRequired??>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password" class="${properties.kcLabelClass!}"><h4 style = " font-size:15px;font-weight: 500;
  margin-bottom: 20px;">${msg("password")}</h4></label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input style="height: 30px;
  margin-bottom: 10px;
  background-color: white;
  width: 98%;" type="password" id="password" class="${properties.kcInputClass!}" name="password"
                               autocomplete="new-password"
                               aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                        />

                        <#if messagesPerField.existsError('password')>
                            <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password-confirm"
                               class="${properties.kcLabelClass!}"><h4 style = " font-size:15px;font-weight: 500;
  margin-bottom: 20px;">Conferma password</h4></label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input style="height: 30px;
  margin-bottom: 10px;
  background-color: white;
  width: 98%;" type="password" id="password-confirm" class="${properties.kcInputClass!}"
                               name="password-confirm"
                               aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                        />

                        <#if messagesPerField.existsError('password-confirm')>
                            <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>
            </#if>

            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>
            
            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span><a style = "text-decoration:none; font-size:15px;"href="${url.loginUrl}"><< Torna al login</a></span>
                    </div>
                </div>
                </br>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <button style="border: 1px solid;
  border-radius: 2px;
  width: 100%;
  height: 30px;
  color: black;
  border-color: gray;">Registrati</button>
                </div>
            </div>
        </form>
    </#if>
    </div>
    </div>
</@layout.registrationLayout>