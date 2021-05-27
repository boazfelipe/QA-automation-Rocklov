

Dado('que acesso a página de cadastro') do
    #Instanciado a variavel global com a classe SignupPage e seu metodo open
    @signup_page.open
end
  
Quando('submeto o seguinte formulario de cadastro:') do |table|


    log table.hashes

    user = table.hashes.first

    log user

    #chamando classe mondoDB com o metodo remover e-mail do usuario
    MongoDB.new.remove_user(user[:email])

    #Instanciado a variavel global com a classe SignupPage e sua varial (user) que é um objeto do ruby criado na feature
    @signup_page.create(user)

    #Essas buscas foram enviadas para o arquivo signupPage, para usar o modelo Page Object
    #find("#fullName").set user[:nome]
    #find("#email").set user[:email]
    #find("#password").set user[:senha]

    #click_button "Cadastrar"

 end


#Essas validação está sendo realizada no arquivo shared steps, pois varios cenarios compartilham ela
#Então('sou redirecionado para o Dashboard') do
    #expect(page).to have_css ".dashboard"    
#end

#Essas buscas foram enviadas para o arquivo shared steps, pois varios cenarios compartilham ela
#Então('vejo a mensagem de alerta: {string}') do |expect_alert|
    #alert = find(".alert-dark") #pegando a classe que contem o texto de validacao e colocando em uma variavel
    #expect(alert.text).to eql expect_alert #comparando se o valor da classe é igual ao da aplicação
#end


