
#herdando as funcionalidades do httparty da classe BaseApi
class Equipos < BaseApi
 
    def create(payload, user_id)       
        # o self me permite ter acesso aos objetos da classe
        return self.class.post(
        "/equipos",
        #Por enviar a foto, o padrao nao pode ser json
        body: payload,
        headers:{           
            "user_id": user_id,
            },        
        )
    end

    def booking (equipo_id, user_locator_id)
        return self.class.post(
            "/equipos/#{equipo_id}/bookings",
            body: {date: Time.now.strftime("%d/%m/%Y")}.to_json,
            headers:{           
                "user_id": user_locator_id,
            }, 
        )

    end

    def find_by_id(equipo_id, user_id)
        return self.class.get(
            "/equipos/#{equipo_id}",
            headers: {
                "user_id":user_id,
            },
        )
    
    end

    def list(user_id)
        return self.class.get(
            "/equipos/",
            headers: {
                "user_id":user_id,
            },
        )
    
    end

    def remove_by_id(equipo_id, user_id)
        return self.class.delete(
            "/equipos/#{equipo_id}",
            headers: {
                "user_id":user_id,
            },
        )
    
    end
end
