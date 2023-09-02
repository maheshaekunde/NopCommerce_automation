*** Settings ***
Documentation    This is resource file for Registration Functionality
Library          SeleniumLibrary
Variables        ../Locators/webelements.py

*** Keywords ***
Click on 'Register' link
    [Documentation]    User can click on Registration link which is located on header part of home page
    ...  After clicking on Registration page will open.
    click element   ${link_registration}

Select Radio Button
    [Documentation]    User should select gender radio button male or female
    page should contain radio button        ${rdo_btn_gender_male}
    radio button should not be selected    ${rdo_btn_gender_male}
    select radio button    ${rdo_btn_gender_male}


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

