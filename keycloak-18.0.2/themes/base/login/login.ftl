<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
<div class="login" style="margin:10px; display:flex; flex-direction: column; align-items: center; height: 100px;">
    <div class="login_container" style=" width: 300px;
  display: flex;
  flex-direction: column;
  align-items: center;">
    <#if section = "header">
    <#elseif section = "form">
    <div id="kc-form">
      <div id="kc-form-wrapper" style =" border: solid lightgray 1px;
  padding: 20px;
  width: 300px;">
  
    <img style = " object-fit: contain; width: 100px; " class="login_logo" src="https://www.bitrefill.com/content/cn/b_rgb%3AFFFFFF%2Cc_pad%2Ch_720%2Cw_1280/v1569493391/amazon_it.jpg" >
    
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <#if !usernameHidden??>
                    <div class="${properties.kcFormGroupClass!}">
                       <h5 style="margin-bottom: 5px;
  font-weight: 700;">Email</h5>

                        <input style="height: 30px; margin-bottom: 10px; background-color: white; width: 98%;" tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off"
                               aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                        />

                        <#if messagesPerField.existsError('username','password')>
                            <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </span>
                        </#if>

                    </div>
                </#if>

                <div class="${properties.kcFormGroupClass!}">
                    <h5 style="margin-bottom: 5px;
  font-weight: 700;">Password</h5>
                    <input style="height: 30px;
  margin-bottom: 10px;
  background-color: white;
  width: 98%;" tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off"
                           aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                    />

                    <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                        <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </span>
                    </#if>

                </div>

                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                    <div id="kc-form-options">
                        <#if realm.rememberMe && !usernameHidden??>
                            <div class="checkbox">
                                <label style="font-size:15px; margin-bottom: 5px;
  font-weight: 300;">
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked>Ricordami
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> Ricordami
                                    </#if>
                                </label>
                            </div>
                        </#if>
                        </div>
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <#if realm.resetPasswordAllowed>
                                <span style = "margin-left:150px;"><a style="text-decoration: none;" tabindex="5" href="${url.loginResetCredentialsUrl}">Password dimenticata?</a></span>
                            </#if>
                        </div>

                  </div>
    </br>

                  <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                     <button style="background-color: #f0c14b;
  border: 1px solid;
  border-radius: 2px;
  width: 100%;
  height: 30px;
  color: black;
  border-color: #a88134 #9c7e31 #846a29 ;">Accedi </button>
                  </div>
</br>

                  <#if msg("legal_banner") != "legal_banner">
                    <div>
                        ${msg("legal_banner")}
                    </div>
                  </#if>
            </form>
        </#if>
        

        </div>
    
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span><a tabindex="6"
                                                 href="${url.registrationUrl}"><button style=" border: 1px solid;
  border-radius: 2px;
  width: 100%;
  height: 30px;
  color: black;
  border-color: gray;">Crea account amazon</button></a></span>
                
                </div>
            </div>
        </#if>
    </div>
    <#elseif section = "socialProviders" >
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                <hr/>
                <h4>${msg("identity-provider-login-label")}</h4>

                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                    <#list social.providers as p>
                        <a id="social-${p.alias}" class="${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                                type="button" href="${p.loginUrl}">
                            <#if p.iconClasses?has_content>
                                <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                            <#else>
                                <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                            </#if>
                        </a>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>
    </div>
</div>
</@layout.registrationLayout>
