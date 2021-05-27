require_relative "base_api"

#herdando as funcionalidades do httparty da classe BaseApi
class Sessions < BaseApi
    #include HTTParty
    #A base_uri é uma propriedade do httparty, nele inserimos a URL da api
    #base_uri "http://rocklov-api:3333"

    def login(payload)      
       
        # o self me permite ter acesso aos objetos da classe
        return self.class.post(
        "/sessions",
        body: payload.to_json,
        headers:{
            "Content-Type": "application/json",
            },        
        )
    end
end
