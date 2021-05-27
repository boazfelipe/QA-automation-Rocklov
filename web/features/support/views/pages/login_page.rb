

class LoginPage
    include Capybara::DSL

    def open
        visit "/"
    end

    #Criando metodo que possui uma "ação/responsabilidade" de executar funcionalidades
    def with(email)
        return find("#user_email").set email
        #return find("#user_password").set password
        #click_button "Entrar"
    end

    #jogando o metodo campo_email para o metodo with
    #def campo_email
     #   return find("#user_email")
    #end

    #jogando o metodo campo_senha para o metodo with
    def campo_senha (password)
        return find("#user_password").set password
    end

    #jogando o metodo botao_entrar para o metodo with
    def botao_entrar
        click_button "Entrar"
    end


end