*** Settings ***
Documentation    Varify the working of Log in functionality for 'NopCommerce.com'
Library     SeleniumLibrary
Resource    ../Resources/resource_browsers.robot
Resource    ../Resources/resource_login_functionality.robot

Suite Setup             resource_browsers.Open Chrome Browser
Suite Teardown          resource_browsers.Close My Browser

*** Test Cases ***
TC 001
    [Documentation]    Validate logging into the application using valid credentials
    [Tags]    Snoke testing
    Login with Valid Credentials

TC 002
    [Documentation]    Validate logging into the application using Invalid credentials(i.e. Invalid email address
    ...    and Invalid Password) and warning message:'No customer account found' should displayed
    [Tags]    Sanity testing
    Login with Multiple Credentials     john@gmail.com      abcdef

TC 003
    [Documentation]    Validate logging into the application using Invalid email address and Valid password and
    ...    warning message:'No customer account found' should displayed
    [Tags]    Sanity testing
    Login with Multiple Credentials     john@gmail.com      12345678

TC 004
    [Documentation]    Validate logging into application using Valid email address and Invalid password and
    ...     warning message:'No customer account found' should displayed
    [Tags]    Sanity testing
    Login with Multiple Credentials     maekunde@gmail.com      abcdefg

TC 005
    [Documentation]    Validate logging into application without providing any credentials and
    ...    warning message:'Please enter your email' should displayed
    [Tags]    Sanity Testing
    Login with Multiple Credentials     ${EMPTY}        ${EMPTY}

TC 006
    [Documentation]    Validate 'Forgot Password' link is available in login page and it is working
    [Tags]    Sanity Testing
    Validate Forgot Password Link

TC 007
    [Documentation]    Validate logging into application by selecting 'Remember me?' checkbox.
    [Tags]    Sanity Testing
    Validate Remember me functionality

TC 008
    [Documentation]     Validate logging into application using keyboard keys (Tab and Enter)
    [Tags]    Sanity testing
    Login Using Keyboard Keys

TC 009
    [Documentation]    Validate Logging into the application and browsing back using
    ...    browser back button and user should not logout
    [Tags]    Smoke testing
    Login and Browse Back

TC 010
    [Documentation]    Validate Logging out from appliaction and browsing back using Browser
    ...     back button and user should not signin
    [Tags]    Smoke testing
    Logout and Browse Back

TC 012
    [Documentation]    Validate the logging into the application using inactive credentials
    [Tags]    Smoke testing
    Login Using Inactive Credentials




*** Keywords ***
Login with Valid Credentials
    resource_login_functionality.Click on Login link
    resource_login_functionality.Enter Email            maekunde@gmail.com
    resource_login_functionality.Enter Password         12345678
    resource_login_functionality.Click on Login button
    resource_login_functionality.Varify Login page after signin    My account

Login with Multiple Credentials
    resource_login_functionality.Click on Login link
    [Arguments]    ${email}     ${password}
    resource_login_functionality.Enter Email            ${email}
    resource_login_functionality.Enter Password         ${password}
    resource_login_functionality.Click on Login button
    resource_login_functionality.Varify Warning message for Entering Invalid Input

Validate Forgot Password Link
    resource_login_functionality.Click on Login link
    resource_login_functionality.Click and Varify Forgot Password Link

Validate Remember me functionality
    resource_login_functionality.Click on Login link
    resource_login_functionality.Enter Email            maekunde@gmail.com
    resource_login_functionality.Enter Password         12345678
    resource_login_functionality.Select Remember me? Checkbox
    resource_login_functionality.Click on Login button
    resource_login_functionality.Varify Login page after signin    My account

Login Using Keyboard Keys
    resource_login_functionality.Click on Login link
    resource_login_functionality.Varify login input by Keys    maekunde@gmail.com   12345678
    resource_login_functionality.Varify Login page after signin    My account

Login and Browse Back
    resource_login_functionality.Click on Login link
    resource_login_functionality.Enter Email            maekunde@gmail.com
    resource_login_functionality.Enter Password         12345678
    resource_login_functionality.Click on Login button
    resource_login_functionality.Varify Login page after signin    My account
    resource_login_functionality.Navigate Back and Varify Already Login

Logout and Browse Back
    resource_login_functionality.Click on Login link
    resource_login_functionality.Enter Email            maekunde@gmail.com
    resource_login_functionality.Enter Password         12345678
    resource_login_functionality.Click on Login button
    resource_login_functionality.Varify Login page after signin    My account
    resource_login_functionality.Click on Logout button
    resource_login_functionality.Go Back and Varify Login


Login Using Inactive Credentials
    resource_login_functionality.Click on Login link
    resource_login_functionality.Enter Email            maekunde@gmail.com
    resource_login_functionality.Enter Password         12345678
    resource_login_functionality.Click on Login button
