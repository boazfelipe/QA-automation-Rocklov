Dado('Login com {string} e {string}') do |email, password|

    @email = email
   
    @login_page.open
    @login_page.with(email)
    @login_page.campo_senha(password)
    @login_page.botao_entrar

    #checkpoint para garantir que estou no dashboard
    expect(@dash_page.on_dash?).to be true
end
  
Dado('que acesso o formulario de cadastro de anuncios') do
    @dash_page.goto_equipo_form
    #Essa validação está sendo feita em equipo_page
    #expect(page).to have_css "#equipoForm"

end

Dado('que eu tenho o seguinte equipamento:') do |table|
    @anuncio = table.rows_hash 

    MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end
  
Quando('submeto o cadastro desse item') do

    @equipos_page.create(@anuncio)
    #Acessar a pasta do diretorio do projeto, concatenando com o nome do arquivo que 
    #é recebido na variavel @anuncio para buscar a imagem do cenario

    #Essa codigo para cadastro está sendo feita em equipos_page e sendo chamada aqui através da classe e seus metodos
    #thumb = Dir.pwd + "/features/support/fixtures/images/" + @anuncio[:thumb]

    #find("#thumbnail input[type=file]", visible: false).set thumb
    #find("input[placeholder$=equipamento]").set @anuncio[:nome]
    #find("#category").find('option', text: @anuncio[:categoria]).select_option
    #find("#price").set @anuncio[:preco]
    #click_button "Cadastrar"
   
end
  
Então('devo ver esse item no meu Dashboard') do
    #busca do campo sendo feita o arquivo dash_page
    #anuncios = find(".equipo-list")
    expect(@dash_page.equipo_list).to have_content @anuncio[:nome]
    expect(@dash_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia"
end

Então ('deve conter a mensagem de alerta: {string}') do |expect_alert|
    expect(@alert.dark).to have_text expect_alert
end

#Remover Anuncios
Dado('que eu tenho um anuncio indesejado:') do |table|
  user_id = page.execute_script("return localStorage.getItem('user')")
end
  
Quando('eu solicito a exclusao desse item') do
    pending # Write code here that turns the phrase above into concrete actions
end
  
Quando('confirmo a exclusão') do
    pending # Write code here that turns the phrase above into concrete actions
end
  
Entao('nao devo ver esse anuncio no meu dashboard') do
    pending # Write code here that turns the phrase above into concrete actions
end