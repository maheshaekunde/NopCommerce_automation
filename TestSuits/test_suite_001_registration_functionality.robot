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

TC 002
    [Documentation]    Testcase 002 Validate Registering an Account by providing all the fields
    [Tags]    Sanity testing
    Validate the Registering an account by providing all the fields

TC 003
    [Documentation]    Testcase 003 Validate the Registration account by unselecting checkbox for 'Newsletter' fields
    [Tags]    Sanity testing
    Validate the Registration account by selected checkbox for 'Newsletter' fields

TC 004
    [Documentation]    Testcase 004 Validate different ways to navigating to 'Register' page
    [Tags]    Sanity testing
    Validate different ways to navigating to 'Register' page

TC 005
    [Documentation]    Validate proper warning message are displayed for the mandatory fields,
    ...     when you do not provide any fields in the 'Register' account page.
    [Tags]    Smoke testing
    Validate warning message are displayed for the mandatory fields by not provide any fields

TC 006
    [Documentation]    Validate the Registration account by unselecting checkbox for 'Newsletter' fields
    ...     when user is register an account
    [Tags]    Sanity Testing
    Validate the Registration account by unselecting checkbox for 'Newsletter' fields

TC 007      #failed "warning message is not showing in automation testing
    [Documentation]    Validate the Registering an Account by entering different password in 'Password' fields.
    ...  password= elon@123 and confirm password= elon@abc  both password are different so testcase should fail
    [Tags]    Sanity testing
    Validate the Registering an Account by entering different password in 'Password' fields.

TC 008
    [Documentation]    Validate the Registering an Account by entering the existing account details
    ...    (ie. Existing email address)
    [Tags]    Sanity testing
    Validate the Registering an Account by entering the existing Email

TC 009
    [Documentation]    Validate the Registering an Account by entering an invalid email address into the Email
    ...    field and Varifing warning message:'Wrong email' should display.
    [Tags]    Smoke testing
    Validate the Registering an Account by entering an Invalid Email Address
     [Template]    Entering Invalide Email and Confirm Warning message
     elonmusk
     elonmusk@gmail.
     @elonmusk@.com
     elonmusk@

TC 010      #failed due to style attribute is not available in html code.
    [Documentation]    Validate all the mandatory fields in the Register Account page are marked with
    ...    red color *(Asterisk) symbol
    [Tags]    Sanity testing
    Validate all the mandatory fields in the Register Account page are marked with red color * symbol

TC 011      #failed due to warning message is not displayed
    [Documentation]    Validate whether the Mandatory fields in Register Account page are accepting only spaces
    [Tags]    Sanity testing
    Validate whether the Mandatory fields in Register Account page are accepting only spaces

TC 012
    [Documentation]    Validate whether the leading and trailing space entered into the Register
     ...    Account fields are trimmed.
     [Tags]    Sanity testing
     Validate Leading and Trailing Space Trimming

TC 013
    [Documentation]    Validate the password text entered into the 'Password' and 'Confirm Password' field of
    ...    'Registering Account' functionality is Toggled to hide its visibility(* or . symboll)
    [Tags]    Sanity testing
    Validate Password Visibility Toggle

TC 014
    [Documentation]     Validate navigating to other page using options or links provided on
    ...     the 'Register account' page.
    [Tags]      Sanity testing
    Validate Navigation from Register Account Page

TC 015
    [Documentation]    Validate the Register Account, by filing 'Password' field and not filling
    ...     'Confirm Password' field.
    [Tags]    Sanity testing
    Validate Register Account with Missing Confirm Password

TC 016
    [Documentation]    Validate the Breadcrumb, Page Heading, Page URL, Page title of 'Register Account' Page
    [Tags]    Sanity testing
    Validate Heading, URL, Title of Register Account Page

TC 017
    [Documentation]    Valide 'Register Account' functionality from 'Login' page.
    [Tags]    Sanity testing
    Validte Register Account page from Login page

TC 018
    [Documentation]    Valide 'Register Account' functionality from My Account link at footer.
    [Tags]    Sanity testing
    Validate Register Account from My Account link on Footer


*** Keywords ***
Validate Registering an Account by providing only the mandatory fields
    resource_registration_functionality.Click on 'Register' link
    resource_registration_functionality.Enter Firstname           Elon
    resource_registration_functionality.Enter Lastname            Musk
    resource_registration_functionality.Enter Email               elonmusk20@gmail.com
    resource_registration_functionality.Enter Password            elon@123
    resource_registration_functionality.Enter Confirm Password    elon@123
    resource_registration_functionality.Click on Register button
    resource_registration_functionality.Click on 'Continue' button


Validate the Registering an account by providing all the fields
    resource_registration_functionality.Click on 'Register' link
    resource_registration_functionality.Select Gender Radio Button       M
    resource_registration_functionality.Enter Firstname                  Elon
    resource_registration_functionality.Enter Lastname                   Musk
    resource_registration_functionality.Select Date of birth from dropdown option
    ...     3    September   1993
    resource_registration_functionality.Enter Email                      elonmusk13@gmail.com
    resource_registration_functionality.Enter Company Name               Nvidia India
    resource_registration_functionality.Enter Password                   elon@123
    resource_registration_functionality.Enter Confirm Password           elon@123
    resource_registration_functionality.Click on Register button
    resource_registration_functionality.Click on 'Continue' button

Validate the Registration account by selected checkbox for 'Newsletter' fields
    resource_registration_functionality.Click on 'Register' link
    resource_registration_functionality.Select Gender Radio Button       M
    resource_registration_functionality.Enter Firstname                  Elon
    resource_registration_functionality.Enter Lastname                   Musk
    resource_registration_functionality.Select Date of birth from dropdown option
    ...    3    September   1993
    resource_registration_functionality.Enter Email                      elonmusk14@gmail.com
    resource_registration_functionality.Enter Company Name               Nvidia India
    resource_registration_functionality.Varify Newsletter checkbox is selected
    resource_registration_functionality.Enter Password                   elon@123
    resource_registration_functionality.Enter Confirm Password           elon@123
    resource_registration_functionality.Click on Register button
    resource_registration_functionality.Click on 'Continue' button


Navigating to Register page from login page
    resource_registration_functionality.Click on 'Register' link
    resource_registration_functionality.Navigating to Register page from login page


Validate warning message are displayed for the mandatory fields by not provide any fields
    resource_registration_functionality.Click on 'Register' link
    resource_registration_functionality.Enter Firstname           ${EMPTY}
    resource_registration_functionality.Enter Lastname            ${EMPTY}
    resource_registration_functionality.Enter Email               ${EMPTY}
    resource_registration_functionality.Enter Password            ${EMPTY}
    resource_registration_functionality.Enter Confirm Password    ${EMPTY}
    resource_registration_functionality.Click on Register button
    resource_registration_functionality.Display Warning Message for Firstname
    resource_registration_functionality.Display Warning Message for Lastname
    resource_registration_functionality.Display Warning Message for Email
    resource_registration_functionality.Display Warning Message for Password
    resource_registration_functionality.Display Warning Message for Confirm Password

Validate the Registration account by unselecting checkbox for 'Newsletter' fields
    resource_registration_functionality.Click on 'Register' link
    resource_registration_functionality.Select Gender Radio Button      M
    resource_registration_functionality.Enter Firstname                 John
    resource_registration_functionality.Enter Lastname                  Cena
    resource_registration_functionality.Select Date of birth from dropdown option
    ...     3    September   1993
    resource_registration_functionality.Enter Email                     johncena@gmail.com
    resource_registration_functionality.Enter Company Name              Accenture
    resource_registration_functionality.Varify Newsletter checkbox is Unselected
    resource_registration_functionality.Enter Password                  john@123
    resource_registration_functionality.Enter Confirm Password          john@123


Validate the Registering an Account by entering different password in 'Password' fields.
    resource_registration_functionality.Click on 'Register' link
    resource_registration_functionality.Enter Firstname                  john
    resource_registration_functionality.Enter Lastname                   cena
    resource_registration_functionality.Enter Email                      johnce11@gmail.com
    resource_registration_functionality.Enter Password                   john@123
    resource_registration_functionality.Enter Confirm Password           john@abcdefghij
    resource_registration_functionality.Display Warning Message for both Passwords not matched


Validate the Registering an Account by entering the existing Email
    resource_registration_functionality.Click on 'Register' link
    resource_registration_functionality.Enter Firstname           Elon
    resource_registration_functionality.Enter Lastname            Musk
    resource_registration_functionality.Enter Email               elonmusk12@gmail.com
    resource_registration_functionality.Enter Password            elon@123
    resource_registration_functionality.Enter Confirm Password    elon@123
    resource_registration_functionality.Click on Register button
    resource_registration_functionality.Display Warning Message Entering the Existing Email

Validate the Registering an Account by entering an Invalid Email Address
    resource_registration_functionality.Entering Invalide Email and Confirm Warning message

Validate all the mandatory fields in the Register Account page are marked with red color * symbol
    resource_registration_functionality.Varify Mandatory Fields Marked with Red Asterisk

Validate whether the Mandatory fields in Register Account page are accepting only spaces
    resource_registration_functionality.Click on 'Register' link
    resource_registration_functionality.Validate Mandatory Fields for Spaces
    resource_registration_functionality.Click on Register button

Validate Leading and Trailing Space Trimming
    resource_registration_functionality.Click on 'Register' link
    resource_registration_functionality.Validate Mandatory Fields for Spaces    john    cena    jc12@gmail.com
    ...     123456      123456
    resource_registration_functionality.Click on Register button

Validate Password Visibility Toggle
    resource_registration_functionality.Click on 'Register' link
    resource_registration_functionality.Enter Password                  123456
    resource_registration_functionality.Enter Confirm Password          123456
    resource_registration_functionality.Varify Password and Confirm password are hidden by . symball

Validate Navigation from Register Account Page
    resource_registration_functionality.Click on 'Register' link
    resource_registration_functionality.Navigating to Login page from Register page
    resource_registration_functionality.Navigating to Wishlist page from Register page
    resource_registration_functionality.Navigating to Shoping Cart page from Register page


Validate Register Account with Missing Confirm Password
    resource_registration_functionality.Click on 'Register' link
    resource_registration_functionality.Enter Firstname           Elon
    resource_registration_functionality.Enter Lastname            Musk
    resource_registration_functionality.Enter Email               elonmusk12@gmail.com
    resource_registration_functionality.Varify Entering only Password field    123456

Validate Heading, URL, Title of Register Account Page
    resource_registration_functionality.Click on 'Register' link
    resource_registration_functionality.Varify Heading Url Title    Register
    ...    https://demo.nopcommerce.com/register?returnUrl=%2F      nopCommerce demo store. Register

Validte Register Account page from Login page
    resource_registration_functionality.Click on 'Login' link
    resource_registration_functionality.Varify Registration from login page     Register


Validate Register Account from My Account link on Footer
    resource_registration_functionality.Click on My Account link    Register
