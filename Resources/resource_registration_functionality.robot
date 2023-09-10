*** Settings ***
Documentation    This is resource file for Registration Functionality for 'NopCommerce.com'
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
    [Documentation]    Varify when user entering password and confirm password field is not same and Error message
    ...    'The password and confirmation password do not match.' should displayed.
    sleep    2
    ${txt}=     get text        ${warning_pass_not_matched}
    ${exp_txt}      set variable    The password and confirmation password do not match.
    log    ${txt}
    run keyword if    '${txt}'    ==   '${exp_txt}'     log
    ...    The password and confirmation password do not match displayed

Display Warning Message Entering the Existing Email
    [Documentation]    Varify when user entering existing email address and trying to register, varify warning
    ...    message:'The specified email already exists' should displayed.
    page should contain element    ${warning_exist_email}
    ${txt}=     get text    ${warning_exist_email}
    log    ${txt}
    ${warning}      run keyword and return status    page should contain element    ${warning_exist_email}  The specified email already exists
    IF    '${warning}'  ==  True
        log    Already email exist
    ELSE
        log    Failed
    END


Entering Invalide Email and Confirm Warning message
    [Documentation]    Verify when user entering wrong email address into email field,and varify
    ...   warning message:'Wrong email' is displayed
    [Arguments]    ${invalid_email}
    resource_registration_functionality.Click on 'Register' link
    Input Text    ${txt_email}    ${invalid_email}
    Sleep    2s    # Wait for the page to process
    ${warning_message_present}=    Run Keyword And Return Status    Should Contain Element    ${warning_wrong_email}    #Wrong email
    Log    The warning message is present: ${warning_message_present}
    Capture Page Screenshot    # Capture a screenshot for reference

Varify Mandatory Fields Marked with Red Asterisk
    [Documentation]    Verify all mandatory field are marked with red coloured asterisk symbol it means
    ...     user should fill this field compasory to register new user.
    resource_registration_functionality.Click on 'Register' link
    @{mandatory_fields}     get webelements    ${red_asterisk}
    FOR    ${element}   IN    @{mandatory_fields}
        ${txt_color}    get element attribute   ${element}    style
        run keyword if  '${txt_color}'    contains    'color: red'   Log    Field is mandatory and marked with red asterisk
        ...    ELSE    Log    Field is NOT marked as mandatory with a red asterisk
    END


Validate Mandatory Fields for Spaces
    [Documentation]    Verify whether the mandatory fields in register account are accepting only space.
    [Arguments]    ${firstname}   ${lastname}  ${email}   ${password}   ${conf_pass}
    # for firstname
    ${input_firstname_with_spaces}       "  ${firstname}  "
    Input Text    ${txt_firstname}    ${input_firstname_with_spaces}
    ${actual_text}    Get Text    ${txt_firstname}
    Should Be Equal As Strings    ${actual_text}    ${firstname}

    # for lastname
    ${input_lastname_with_space}        set variable    "   ${lastname}    "
    input text    ${txt_lastname}       ${input_lastname_with_space}
    ${actual_text}      get text    ${txt_lastname}
    should be equal as strings    ${actual_text}    ${lastname}

    # for Email
    ${input_email_with_space}       set variable    "   ${email}   "
    input text    ${txt_email}      ${input_email_with_space}
    ${actual_txt}       get text    ${txt_email}
    should be equal as strings    ${actual_txt}     ${input_email_with_space}

    # for password
    ${input_pass_with_space}        set variable    "    ${password}    "
    input text    ${txt_password}       ${input_pass_with_space}
    ${actual_txt}   get text    ${txt_password}
    should be equal as strings    ${actual_txt}     ${input_pass_with_space}

    # for confirm password
    ${input_conf_pass_with_space}       set variable    "    ${conf_pass}   "
    input text    ${txt_confirm_password}    ${input_conf_pass_with_space}
    ${actual_txt}       get text    ${txt_confirm_password}
    should be equal as strings    ${actual_txt}     ${input_conf_pass_with_space}


Varify Password and Confirm password are hidden by . symball
    [Documentation]    Varify when user entered text into password and confirm password fields, It should
    ...     be hidden by symball '.'
    ${password_text}=    get text      ${txt_password}
    ${confirm_password_text}=   get text    ${txt_confirm_password}
    log    ${password_text}
    log    ${confirm_password_text}
    should contain    ${password_text}      ........
    should contain    ${confirm_password_text}      ........


Navigating to Login page from Register page
    [Documentation]    User should be successfully navigate to the login page when clicked on
    ...     login link which is available at header of Register page.
    #varify login link is available
    element should be visible    ${link_login}
    # click on login link
    click element       ${link_login}
    # varify user navigated to login page
    wait until page contains element        ${return_customer_txt}
    page should contain                     Welcome, Please Sign In!
    # going back to register page
    go back
    # varify register page is visible
    page should contain                 Register

Navigating to Wishlist page from Register page
    [Documentation]    User should successfully navigate to Wishlist page when clicked on
    ...     Wishlist link which is available on header of Register page
    # varify wishlist link is available
    element should be visible    ${link_wishlist}
    # click wishlist link
    click element                ${link_wishlist}
    # varify user is navigated to wishlist page
    wait until page contains element            //h1[normalize-space()='Wishlist']
    page should contain                         Wishlist
    # Navigate to register page by clicking go back button for browser
    go back
    # varify register page is visible
    page should contain                 Register

Navigating to Shoping Cart page from Register page
    [Documentation]    User should successfully navigate to Shoping cart page when clicked on
    ...    shoping cart link
    # Varify shoping cart page is visible
    element should be visible       ${link_shoping_cart}
    # Click on shoping cart link
    click element                   ${link_shoping_cart}
    # Varify user is navigate to shoping cart page
    wait until page contains element        //h1[normalize-space()='Shopping cart']
    page should contain                     Shopping cart
    # Navigate to register page by clicking go back button for browser
    go back
    # varify register page is visible
    page should contain            Register

Varify Entering only Password field
    [Documentation]    User should fill the password text field but confirm password field should
    ...   be kept empty and varify Error message "Password is required." should display
    # entering password field
    [Arguments]    ${password}
    input text    ${txt_password}       ${password}
    # Clicking on register button
    click element       ${btn_register}
    # Varify warning message
    ${actual_warning}=      get text        ${warning_confirm_password}
    ${exp_warning}=         set variable    Password is required.
    should be equal as strings      ${actual_warning}       ${exp_warning}

Varify Heading Url Title
    [Documentation]    Varify the page heading, page url and page title from register an account page
    # validate page heading
    [Arguments]    ${register}  ${url}  ${title}
    page should contain    ${register}
    # validate page url
    ${act_url}      get location
    should be equal as strings    ${act_url}     ${url}
    # validate page title
    ${act_title}    get title
    should be equal as strings    ${act_title}    ${title}

Click on 'Login' link
    [Documentation]    Clickin on Login link avaialble on header
    element should be visible    ${link_login}
    click element    ${link_login}

Varify Registration from login page
    [Documentation]    Varify navigation of registration page from login page
    element should be visible    ${btn_register_on_login}
    click element    ${btn_register_on_login}
    [Arguments]                ${register_txt}
    page should contain        ${register_txt}

Click on My Account link
    [Documentation]    Clicking my account link available in footer part of home page
    element should be visible    ${link_my_account}
    click element                ${link_my_account}
    element should be visible    ${btn_register_on_login}
    click element    ${btn_register_on_login}
    [Arguments]                ${register_txt}
    page should contain        ${register_txt}

