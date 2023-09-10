*** Settings ***
Documentation    This is resource file for Login Functionality for 'NopCommerce.com'
Library    SeleniumLibrary
Variables    ../Locators/webelements.py

*** Keywords ***
Click on Login link
    [Documentation]    User can click on Login link which is located on header part of home page
    ...    login page should be open
    click element    ${link_login}

Enter Email
    [Documentation]    User can enter there registered email adderess in email field
    [Arguments]     ${email}
    input text    ${txt_email}      ${email}

Enter Password
    [Documentation]    User can enter there registered password in password field
    [Arguments]    ${password}
    input text    ${txt_password}   ${password}

Click on Login button
    [Documentation]    User can click login button to sign in into application
    click element    ${btn_login}

Varify Login page after signin
    [Documentation]    User should successfuly signin into login page and varify user navigated to
    ...    login page
    [Arguments]    ${text}
    page should contain     ${text}

Varify Warning message for Entering Invalid Input
    [Documentation]    User should enter invalide email address and invalide password, warning message
    ...   'Login was unsuccessful. Please correct the errors and try again.No customer account found'
    ...     should display on page.
    run keyword and ignore error    Warning message for Invalide Credential
    run keyword and ignore error    Warning message for Empty Credential


Warning message for Invalide Credential
    page should contain element                ${warning_invalid_email}
    ${act_warning_message}=     get text       ${warning_invalid_email}
    log                                        ${act_warning_message}
    ${massege}=     run keyword and return status    page should contain    No customer account found

Warning message for Empty Credential
    page should contain element                 ${warning_email}
    ${act_warning_message}=     get text        ${warning_email}
    log                                         ${warning_email}
    ${message}=     run keyword and return status    page should cotain     Please enter your email

Click and Varify Forgot Password Link
    [Documentation]    User can click on forgot password link to recover the password
    page should contain element    ${link_forgot_password}
    click element                  ${link_forgot_password}
    page should contain             Password recovery
    title should be                 nopCommerce demo store. Password Recovery

Select Remember me? Checkbox
    [Documentation]    User can select checkbox before login with correct creditials
    page should contain checkbox        RememberMe
    checkbox should not be selected     RememberMe
    select checkbox                     RememberMe


Varify login input by Keys
    [Documentation]    User can varify login page by pressing keyboard keys, to move use
    ...     TAB key and to hite login button use RETURN key
    [Arguments]    ${email}     ${password}
    input text     ${txt_email}              ${email}
    press keys     ${txt_password}           ${password}     TAB
    press keys     NONE                                      TAB
    press keys     NONE                                      TAB
    press keys     ${btn_login}                              RETURN

Navigate Back and Varify Already Login
    [Documentation]    User can click on go back button of browser and user should not
    ...     logout from application
    go back
    ${text}     get text    ${already_login}
    page should contain     ${text}

Click on Logout button
    [Documentation]    User can click on logout button
    click element    ${link_logout}

Go Back and Varify Login
    [Documentation]    User can click on logout and press go back button from browser
    ...    and user should not sign in
    go back
    element should not be visible    ${txt_myaccount}
