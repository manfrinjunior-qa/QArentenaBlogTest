*** Settings *** 
Library         SeleniumLibrary

*** Variables ***
${URL}                  https://robotizandotestes.blogspot.com/
${BROWSER}              chrome
${BTN_PESQUISAR}        css=button.search-expand.touch-icon-button
${INPUT_PESQUISAR}      name=q
${SUBMIT_PESQUISAR}     css=input.search-action.flat-button
${LINK_POST}            //*[@id="Blog1"]/div[1]/article/div/div/h3/a
${IMG_ROBO}             //*[@id="post-body-1862651152969907712"]/div/a/img
${IMG_ROBO2}            //*[@id="post-body-6142730729069392517"]/div[1]/span/img
${POST_PLAYWRIGHT}      //*[@id="FeaturedPost1"]/div/div/article/h3/a

*** Keywords ***
        #Casos de Teste 01#
Acessar a página do blog
    Open Browser        url=${URL}     browser=${BROWSER}
    Title Should Be     Robotizando Testes

Pesquisar por um post com "${TEXTO_PESQUISA}"
    Wait Until Element Is Visible   locator=${BTN_PESQUISAR}
    Click Button                    ${BTN_PESQUISAR}
    Input Text                      ${INPUT_PESQUISAR}  ${TEXTO_PESQUISA}
    Click Element                   ${SUBMIT_PESQUISAR}

Conferir mensagem de pesquisa por "${MSG_DESEJADA}"
    Page Should Contain     text=${MSG_DESEJADA}

Fechar Navegador
    Close Browser

        #Caso de Teste 02#
Acessar o post "${TEXTO_PESQUISAR}"
    Pesquisar por um post com "${TEXTO_PESQUISAR}"
    Click Element               ${LINK_POST}
    Wait Until Page Contains    O que é Robot Framework?

Conferir se a imagem do robô aparece
    Page Should Contain Image   ${IMG_ROBO}

Conferir se o texto "${TEXTO_DESEJADO}" aparece
    Page Should Contain     text=${TEXTO_DESEJADO}

        #Casos de Teste 03#
Localizar post "${TEXTO_PLAYWRIGHT}"
    Wait Until Element Is Visible   locator=${BTN_PESQUISAR}
    Click Element                   ${POST_PLAYWRIGHT} 

Conferir o texto imagem do robot
    Page Should Contain Image   ${IMG_ROBO2}
