module Provider
  class DigitalOcean

    def initialize(api_token)
      @api_token = api_token
    end

    def machine
      Provider::DigitalOcean::Droplet.new(@api_token)
    end

    # def listar_regioes
    #   response = self.class.get('/regions', headers: @header)
    #   tratar_response(response)
    # end

    # def listar_dominios
    #   response = self.class.get('/domains', headers: @header)
    #   tratar_response(response)
    # end

    # def listar_imagens
    #   response = self.class.get('/images', headers: @header)
    #   tratar_response(response)
    # end
  end
end