    describe "POST /signup" do
        context "novo usuario" do
            before (:all) do
                payload = { name: "Pitty", email: "pitty@bol.com.br", password: "pwd123"}
                MongoDB.new.remove_user(payload[:email])

                @result = Signup.new.create(payload)

        end

        it "valida status code" do       
            expect(@result.code).to eql 200        
        end

        it "valida id do usuario" do
            expect(@result.parsed_response["_id"].length).to eql 24
        end
    end

        context "usuario duplicado" do
            before (:all) do
                #dado que eu tenho um novo usuario
                payload = { name: "joao", email: "joao@ig.com.br", password: "pwd123"}
                MongoDB.new.remove_user(payload[:email])

                #e o email desse usuario ja foi cadastrado no sistema
                Signup.new.create(payload)

                #quando faço uma requisição para a rota /signup
                @result = Signup.new.create(payload)
           end

           it "deve retornar status code 409" do
            #então deve retornar 409   
            expect(@result.code).to eql 409      
        end

            it "deve retornar mensagem" do
            expect(@result.parsed_response["error"]).to eql "Email already exists :("
        end
    end


    #Criando um array dentro de um hash para automatizar os cenarios de dados obrigatorios não preenchidos
    examples = [
        {
            #outro objeto hash dentro do payload
            title: "sem o nome",
            payload: {name: "", email: "maria@yahoo.com", password: "pwd123"},
            code: 412,
            error: "required name" ,
        },
   
       {        
            title: "sem email",
            payload: { name: "Maria", email: "", password: "pwd123"},
            code: 412,
            error: "required email" ,
        },
   
        {     
            title: "sem password",  
            payload: { name: "Maria", email: "maria@yahoo.com", password: ""},
            code: 412,
            error: "required password" ,
        },
   ]

    #Cenarios de tentativas de cadastro utilizando o hash criado acima
    examples.each do |e|

    context "#{e[:title]}" do
        before (:all) do
        @result = Signup.new.create(e[:payload])
       end

       #Mostrando o codigo de erro do hash criada dentro do array
        it "deve retornar status code #{e[:code]}" do   
        expect(@result.code).to eql e[:code]    
    end

        it "deve retornar mensagem #{e[:error]}" do
        expect(@result.parsed_response["error"]).to eql e[:error]
    end
  end
 end
end