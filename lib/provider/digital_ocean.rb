class Provider::DigitalOcean

  def initialize(api_token = 'f27ef5cdeb1679a72b52720ef5d45640c3ef98a33f74ff3cc5d7d01aee9c6eb1')
    @api_token = api_token
  end

  def droplets
    Provider::DigitalOceanV2::Droplet.new(@api_token)
  end

  def listar_regioes
    response = self.class.get('/regions', headers: @header)
    tratar_response(response)
  end

  def listar_dominios
    response = self.class.get('/domains', headers: @header)
    tratar_response(response)
  end

  def listar_imagens
    response = self.class.get('/images', headers: @header)
    tratar_response(response)
  end

private
  
  def tratar_response(response)
    if response.code == 200
      response.parsed_response
    else
      raise ArgumentError, response.parsed_response['error']
    end
  end
end