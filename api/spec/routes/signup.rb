require_relative "base_api"

#herdando as funcionalidades do httparty da classe BaseApi
class Signup < BaseApi
 
    def create(payload)       
        # o self me permite ter acesso aos objetos da classe
        return self.class.post(
        "/signup",
        body: payload.to_json,
        headers:{
            "Content-Type": "application/json",
            },        
        )
    end
end
