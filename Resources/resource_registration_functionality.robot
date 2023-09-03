*** Settings ***
Documentation    This is resource file for Registration Functionality
Library          SeleniumLibrary
Variables        ../Locators/webelements.py

*** Keywords ***
Click on 'Register' link
    [Documentation]    User can click on Registration link which is located on header part of home page
    ...  After clicking on Registration page will open.
    click element   ${link_registration}

Select Gender Radio Button
    [Documentation]    User should select gender radio button male or female
    page should contain radio button        ${rdo_btn_gender_male}
#    radio button should not be selected    ${rdo_btn_gender_male}
    [Arguments]    ${gender}
    select radio button    Gender   ${gender}

Enter Firstname
    [Documentation]   Entering First Name as Elon
    [Arguments]    ${fistname}
    input text    ${txt_firstname}      ${fistname}

Enter Lastname
    [Documentation]    Entering Lastname as Musk
    [Arguments]    ${lastname}
    input text    ${txt_lastname}   ${lastname}

Enter Email
    [Documentation]    Entering Email Address as elonmusk@gmail.com
    [Arguments]    ${email}
    input text    ${txt_email}      ${email}

Enter Password
    [Documentation]    Entering passwords as elon@123
    [Arguments]    ${password}
    input text     ${txt_password}  ${password}

Enter Confirm Password
    [Documentation]    Entering confirm password as elon@123
    [Arguments]    ${confim_password}
    input text    ${txt_confirm_password}   ${confim_password}

Click on Register button
    [Documentation]    Clicking on register button, User should be logged in, navigate to register page and
    ...  'Your registration Completed' message should be displayed on the page.
    click element    ${btn_register}
    sleep    3

    ${message}=    Run Keyword And Return Status   page should contain element   ${successful_message}  Your registration Completed
    IF    '${message}' == 'True'
        log     Registration successful
    ELSE
        log     Registration unsuccessful
    END

Click on 'Continue' button
    [Documentation]    After successful registration click on 'continue' button which navigate to
    ...    'My Account' page and confirm email should be sent to registered email address.
    click element   ${btn_continue}
    sleep    2

    ${myacount}=    run keyword and return status    page should contain element  ${txt_myaccount}     My account
    IF    '${myacount}' == 'True'
        log    Navigated to My account page.
    ELSE
        log    Navigation to My account page is failed
    END

Select Date of birth from dropdown option
    [Documentation]    Selecting day option from date of birth dropdown menu
    page should contain element    ${dd_day}
    [Arguments]    ${day}   ${month}    ${year}
    select from list by label   DateOfBirthDay     ${day}
    select from list by label   DateOfBirthMonth   ${month}
    select from list by label   DateOfBirthYear    ${year}

Enter Company Name
    [Documentation]    Enter Company name as Nvidia India
    page should contain element    ${txt_company_name}
    [Arguments]    ${company}
    input text    ${txt_company_name}   ${company}

Varify Newsletter checkbox is selected
    [Documentation]    Varify that newsletter checkbox is already selected
    page should contain checkbox    ${txt_newsletter}
    checkbox should be selected     ${txt_newsletter}

Varify Newsletter checkbox is Unselected
    [Documentation]    Varify that user should uncheck newsletter chechbox
    page should contain element     ${txt_newsletter}
    ${checkbox}=    run keyword and return status    checkbox should be selected    ${txt_newsletter}
    log    ${checkbox}

#    IF    '${checkbox}'  ==   'True'
#        log    Newsletter checkbox is already Checked
#        unselect checkbox    ${txt_newsletter}
#    ELSE
#        log    Still Newsletter checkbox is Checked
#    END

Navigating to Register page from login page
    [Documentation]    User should click on login link which is available on home page
    ...    then click on Register button to varify Register an account page
    page should contain link    ${link_login}
    click element    ${link_login}
    # Varify user is navigated to login page
    ${login}=  run keyword and return status    page should contain element     ${confim_login_text}    Welcome, Please Sign In!
    log to console    ${login}
    IF    '${login}'  ==  'True'
        log    Login page is available
    ELSE
        log    Login page is not available
    END
    #clicking on register button
    click element    ${btn_register_on_login}
    # varify user is navigated to register page
    ${register}=    run keyword and return status   page should contain element     ${registration_txt}     Register
    log to console    ${register}
    IF '${register}'  ==  'True'
        log   Navigating to register page is passed
    ELSE
        log   Navigating to register page is failed
    END

Display Warning Message for Firstname
    [Documentation]    Varify for Firstname warning message 'First name is required.' should be displeyed
    ${firstname}=   get text    ${warning_firstname}
    ${exp_warning}      set variable    First name is required.
    log   ${firstname}
    Run Keyword If    '${firstname}' == '${exp_warning}'    Log    Warning message for firstname is displayed

Display Warning Message for Lastname
    [Documentation]    Varify for Firstname warning message 'Last name is required.' should be displayed
    page should contain element    ${warning_lastname}
    ${lastname}=    get text   ${warning_lastname}
    ${exp_warning}      set variable    Last name is required.
    log   ${lastname}
    run keyword if  '${lastname}'   ==  '${exp_warning}'    log     Warning message for lastname is displayed

Display Warning Message for Email
    [Documentation]    Varify for Email warning message 'Email is required.' should be displayed
    page should contain element     ${warning_email}
    ${email}=       get text    ${warning_email}
    ${exp_warning}      set variable    Email is required.
    log     ${email}
    run keyword if    '${email}'  ==  ${exp_warning}    log    Warning message for lastname is displayed


Display Warning Message for Password
    [Documentation]    Varify for Password warning message 'Password is required.' should be displayed
    page should contain element     ${warning_password}
    ${password}=    get text    ${warning_password}
    ${exp_warning}    set variable    Password is required.
    run keyword if  '${password}'   ==    '${exp_warning}'  log    Warning message for password is displayed


Display Warning Message for Confirm Password
    [Documentation]   Varify for Confirm Password warning message 'Password is required.' should be displayed
    page should contain element    ${warning_confirm_password}
    ${confim_password}=    get text    ${warning_confirm_password}
    ${exp_warning}      set variable    Password is required.
    run keyword if '${confim_password}'   ==   '${exp_warning}'  log  Warning message for confirm password is displayed

Display Warning Message for both Passwords not matched
    [Documentation]    Varify when user entering password and cofirm password field is not same and Error message
    ...    'The password and confirmation password do not match.' should displayed.
    ${txt}=     get text        ${warning_pass_not_matched}
    ${exp_txt}      set variable    The password and confirmation password do not match.
    log    ${txt}
    run keyword if    '${txt}'    ==   '${exp_txt}'     log
    ...    The password and confirmation password do not match displayed

