class Provider::DigitalOceanV2::Droplet
  include HTTParty
  base_uri 'https://api.digitalocean.com/v2'

  def initialize(api_token)
    @api_token = api_token
    @header = {'Authorization' => "Bearer #{@api_token}"}
  end

  #List all droplets created
  def list
    response = self.class.get('/droplets', headers: @header)
    tratar_response(response)
  end

private
  
  def tratar_response(response)
    if response.code == 200
      JSON.parse(response.parsed_response)
    else
      raise ArgumentError, response.parsed_response['error']
    end
  end
end