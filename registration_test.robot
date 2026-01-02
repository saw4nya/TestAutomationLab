*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${SERVER}         http://localhost:7272
${URL}            ${SERVER}/Lab4/Registration.html

${FIRST_NAME}     Somyod
${LAST_NAME}      Sodsai
${ORG}            CS KKU
${EMAIL}          somyod@kkumail.com
${PHONE}          091-001-1234

*** Test Cases ***
Open Workshop Registration Page
    Open Registration Page
    Close Browser

Register Success
    Open Registration Page
    Input Text    id=firstname      ${FIRST_NAME}     
    Input Text    id=lastname       ${LAST_NAME}      
    Input Text    id=organization   ${ORG}        
    Input Text    id=email          ${EMAIL}      
    Input Text    id=phone          ${PHONE}      
    Click Button  id=registerButton     
    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.
    Capture Page Screenshot     Success.png
    Close Browser

Register Success No Organization Info
    Open Registration Page
    Input Text    id=firstname      ${FIRST_NAME}     
    Input Text    id=lastname       ${LAST_NAME}      
    Input Text    id=email          ${EMAIL}      
    Input Text    id=phone          ${PHONE}      
    Click Button  id=registerButton
    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.
    Capture Page Screenshot     No_Organization.png
    Close Browser

Empty First Name
    Open Registration Page
    Input Text    id=lastname     Sodyod        
    Input Text    id=organization   ${ORG}        
    Input Text    id=email          ${EMAIL}      
    Input Text    id=phone          ${PHONE}      
    Click Button  id=registerButton
    Page Should Contain    Please enter your first name!!
    Capture Page Screenshot     Empty_First.png
    Close Browser

Empty Last Name
    Open Registration Page
    Input Text    id=firstname      ${FIRST_NAME}     
    Input Text    id=organization   ${ORG}        
    Input Text    id=email          ${EMAIL}      
    Input Text    id=phone          ${PHONE}      
    Click Button  id=registerButton     
    Page Should Contain    Please enter your last name!!
    Capture Page Screenshot     Empty_Last.png
    Close Browser

Empty First And Last Name
    Open Registration Page
    Input Text    id=organization   ${ORG}        
    Input Text    id=email          ${EMAIL}      
    Input Text    id=phone          ${PHONE}      
    Click Button  id=registerButton
    Page Should Contain    Please enter your name!!
    Capture Page Screenshot     Empty_First_Last.png
    Close Browser 

Empty Email
    Open Registration Page
    Input Text    id=firstname      ${FIRST_NAME}     
    Input Text    id=lastname       ${LAST_NAME}      
    Input Text    id=organization   ${ORG}        
    Input Text    id=phone          ${PHONE}      
    Click Button  id=registerButton
    Page Should Contain    Please enter your email!!
    Capture Page Screenshot     Empty_Email.png
    Close Browser

Empty Phone Number
    Open Registration Page
    Input Text    id=firstname      ${FIRST_NAME}     
    Input Text    id=lastname       ${LAST_NAME}      
    Input Text    id=organization   ${ORG}        
    Input Text    id=email          ${EMAIL}      
    Click Button  id=registerButton
    Page Should Contain    Please enter your phone number!!
    Capture Page Screenshot     Empty_Phone.png
    Close Browser

Invalid Phone Number
    Open Registration Page
    Input Text    id=firstname      ${FIRST_NAME}     
    Input Text    id=lastname       ${LAST_NAME}      
    Input Text    id=organization   ${ORG}        
    Input Text    id=email          ${EMAIL}      
    Input Text    id=phone          1234      
    Click Button  id=registerButton
    Page Should Contain    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)
    Capture Page Screenshot     Invalid_Phone.png
    Close Browser

*** Keywords ***
Open Registration Page
    Open Browser    ${URL}    ${BROWSER}        
    Title Should Be    Registration
    Set Selenium Speed    0

