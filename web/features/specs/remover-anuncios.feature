            #language: pt

            Funcionalidade: Remover Anuncios
            Sendo um anunciante que possui um equipamento indesejado
            Quero poder remover esse anuncios
            Para que eu possa manter o meu dashboard atualizado

            Contexto: Login
                * Login com "spider@hotmail.com.br" e "pwd123"


            @temp
            Cenario: Remover um anuncio
            Dado que eu tenho um anuncio indesejado:
                | thumb     | telecaster.jpg |
                | nome      | Telecaster     |
                | categoria | Cordas         |
                | preco     | 50             |
            Quando eu solicito a exclusao desse item
                E confirmo a exclusão
            Entao nao devo ver esse anuncio no meu dashboard

            Cenario: Desistir da Exclusao
            Dado que eu tenho um anuncio indesejado:
                | thumb     | conga.jpg |
                | nome      | Conga     |
                | categoria | Outros    |
                | preco     | 100       |
            Quando eu solicito a exclusao desse item
                Mas não confirmo a solicitaçao
            Entao devo ver esse anuncio no meu dashboard