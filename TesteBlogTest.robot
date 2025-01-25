*** Settings ***
Resource         ResourceBlogTest.robot
Test Setup       Acessar a página do blog
Test Teardown    Fechar Navegador

*** Test Cases ***
Caso de Teste 01: Pesquisar um post
    #Acessar a página do blog
    Pesquisar por um post com "Season Premiere: Introdução ao Robot Framework"
    Conferir mensagem de pesquisa por "Mostrando postagens que correspondem à pesquisa por Season Premiere: Introdução ao Robot Framework"
    #Fechar Navegador

Caso de Teste 02: Ler um post
    #Acessar a página do blog
    Acessar o post "Season Premiere: Introdução ao Robot Framework"
    Conferir se a imagem do robô aparece
    Conferir se o texto "nesse post vou apresentar-lhes o astro deste blog" aparece
    #Fechar Navegador

Caso de Teste 03: Pesquisar um post Playwright
    #Acessar a página do blog
    Localizar post "Novo Curso: Robot Framework com Playwright e GitHub Actions"
    Conferir o texto imagem do robot    
    #Fechar Navegador