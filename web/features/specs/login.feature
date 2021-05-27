#language: pt

Funcionalidade: Login
    Sendo um usuário cadastrado
    Quero acessar o sistema da Rocklov
    Para que eu possa anunciar meus equipamentos musicais
  
    @login
    Cenário: Login do usuário

        Dado   que acesso a página principal
        Quando submeto minhas credenciais com "joao@gmail.com" e "pwd123"
        Então sou redirecionado para o Dashboard
        

    Esquema do Cenario: Tentativa de Login
        Dado   que acesso a página principal
        Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"        
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
        |email_input   |senha_input|mensagem_output                |
        |joao@gmail.com|abc1234    |Usuário e/ou senha inválidos.  |
        |joao$gmail.com|abc123     |Oops. Informe um email válido! |
        |joao*gmail.com|abc123     |Oops. Informe um email válido! |
        |              |abc123     |Oops. Informe um email válido! |
        |joao@gmail.com|           |Oops. Informe sua senha secreta!|

