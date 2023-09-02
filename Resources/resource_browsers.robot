*** Settings ***
Documentation    This is resource file to open and close the different browsers while testing
                 ...  web applications
Library          SeleniumLibrary
Variables        ../Locators/webelements.py

*** Variables ***
@{browser}    chrome    firefox    edge
${url}        https://demo.nopcommerce.com/

*** Keywords ***
Open Chrome Browser
    open browser    ${url}      ${browser}[0]
    maximize browser window
    set selenium implicit wait    5s
    set selenium speed    1s

Open Firefox Browser
    open browser    ${url}      ${browser}[1]
    maximize browser window
    set selenium implicit wait    5

Open Edge Browser
    open browser    ${url}      ${browser}[2]
    maximize browser window
    set selenium implicit wait    5


Close My Browser
    close browser