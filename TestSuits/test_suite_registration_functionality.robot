*** Settings ***
Documentation    This is Test suite file to execute test cases for Registration Functionality
Library        SeleniumLibrary
Resource    ../Resources/resource_browsers.robot
Resource    ../Resources/resource_registration_functionality.robot

Suite Setup             resource_browsers.Open Chrome Browser
Suite Teardown          resource_browsers.Close My Browser

*** Test Cases ***
TC 001
    [Documentation]    Testcase 001 Validate Registering an Account by providing only the mandatory fields
    [Tags]    Smoke testing
    Validate Registering an Account by providing only the mandatory fields


*** Keywords ***
Validate Registering an Account by providing only the mandatory fields
    resource_registration_functionality.Click on 'Register' link
    resource_registration_functionality.Enter Firstname           Elon
    resource_registration_functionality.Enter Lastname            Musk
    resource_registration_functionality.Enter Email               elonmusk8@gmail.com
    resource_registration_functionality.Enter Password            elon@123
    resource_registration_functionality.Enter Confirm Password    elon@123
    resource_registration_functionality.Click on Register button
    resource_registration_functionality.Click on 'Continue' button











