        #language: pt

        Funcionalidade: Cadastro de Anuncios
        Sendo  usuario cadastrado no Rocklov que possui equipamento musicais
        Quero cadastrar meus equipamentos
        Para que eu possa disponibiliza-los para locação

        Contexto: Login
        * Login com "jojo@yahoo.com.br" e "pwd123"

            Cenario: Novo equipo
            Dado que acesso o formulario de cadastro de anuncios
            E que eu tenho o seguinte equipamento:
            | thumb     | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |

            Quando submeto o cadastro desse item
            Então devo ver esse item no meu Dashboard

            @sem_foto
            Esquema do Cenario: Tentativa de Cadastro de anuncios

            Dado que acesso o formulario de cadastro de anuncios
            E que eu tenho o seguinte equipamento:
            | thumb     | <foto>      |
            | nome      | <nome>      |
            | categoria | <categoria> |
            | preco     | <preco>     |

            Quando submeto o cadastro desse item
            Então deve conter a mensagem de alerta: "<saida>"

            Exemplos:
            | foto          | nome             | categoria | preco | saida                                |
            |               | Violao de Nylon  | Cordas    | 150   | Adicione uma foto no seu anúncio!    |
            | clarinete.jpg |                  | Outros    | 250   | Informe a descrição do anúncio!      |
            | mic.jpg       | Microfone Shure  |           | 100   | Informe a categoria                  |
            | trompete.jpg  | Trompete Clásico | Outros    |       | Informe o valor da diária            |
            | conga.jpg     | Gonga            | Outros    | abc   | O valor da diária deve ser numérico! |
            | conga.jpg     | Gonga            | Outros    | 100a  | O valor da diária deve ser numérico! |  