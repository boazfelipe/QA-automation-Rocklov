describe "POST /sessions" do
    context "login com sucesso" do 
        
        before (:all) do
        #Massa de dados para validar cenario com sucesso
        payload = { email: "betao@hotmail.com", password: "pwd123"}
        @result = Sessions.new.login(payload)
        #criando um objeto hash do ruby para enviar e testar login no insominia
        #payload = {email: "joao@gmail.com", password: "abc123"}

        #Configurando o endereço do teste da API e convertendo o
        #hash do ruby em json, armazenando o resultado do post em
        #em uma varial result para fazer a validação do teste
        #@result = HTTParty.post("http://rocklov-api:3333/sessions",
        #body: payload.to_json,
        #headers:{
            #"Content-Type": "application/json",
            #},        
        #)
        end

        it "valida status code" do       
            expect(@result.code).to eql 200        
        end

        it "valida id do usuario" do
            expect(@result.parsed_response["_id"].length).to eql 24
        end
    end

    #Criando um array dentro de um hash para automatizar os cenarios de usuarios sem sucesso
        
#     examples = [
#     {
#         #outro objeto hash dentro do payload
#         title: "senha incorreta",
#         payload: { email: "joao@gmail.com", password: "123456"},
#         code: 401,
#         error: "Unauthorized" ,
#     },

#     {        
#         title: "usuario não existe",
#         payload: { email: "404@gmail.com", password: "123456"},
#         code: 401,
#         error: "Unauthorized" ,
#     },

#     {     
#         title: "email em branco",  
#         payload: { email: "", password: "123456"},
#         code: 412,
#         error: "required email" ,
#     },

#     {      
#         title: "sem o campo email",
#         payload: { password: "123456"},
#         code: 412,
#         error: "required email" ,
#     },

#     {        
#         title: "senha em branco",
#         payload: { email: "joao@gmail.com", password: ""},
#         code: 412,
#         error: "required password" ,
#     },

#     {       
#         title: "sem o campo senha", 
#         payload: { email: "joao@gmail.com"},
#         code: 412,
#         error: "required password",
#     },
# ]


    #Carregando massa de dados do teste de um arquivo externo
    examples = Helpers::get_fixtures("login")


    examples.each do |e|
    #Contexto de login, utilizando a massa de teste que vem do array que recebe um hash com os dados
    #para validar os outros cenarios contrario ao cenario de sucesso
    context "#{e[:title]}" do 
        
        before (:all) do
        #Pegando toda a massa de dados do hash criado dentro do array
        @result = Sessions.new.login(e[:payload])
        end

        #Mostrando o codigo de erro do hash criada dentro do array
        it "valida status code #{e[:code]}" do       
            expect(@result.code).to eql e[:code]       
        end

        #Mostrando a mensagem de erro do hash criada dentro do array
        it "valida id do usuario" do
            expect(@result.parsed_response["error"]).to eql e[:error]
        end
    end
  end
end
