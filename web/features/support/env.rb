require "allure-cucumber"
require "capybara"
require "capybara/cucumber"
require "faker"

#Constante com o caminho relativo contendo o endereço e configuração do ambiente de acesso do sistema
CONFIG = YAML.load_file(File.join(Dir.pwd,"features/support/config/#{ENV["CONFIG"]}"))

#Criando uma condição para a execução do teste em multinavegadores
case ENV["BROWSER"]
when "chrome"
    @driver = :selenium_chrome
when "firefox"
    @driver = :selenium
else
    raise "Navegador Invalido"
end


Capybara.configure do |config|
    config.default_driver = @driver
    config.app_host = CONFIG["url"]
    config.default_max_wait_time = 10
end

AllureCucumber.configure do |config|
    config.results_directory = "/logs"
    config.clean_results_directory = true
end