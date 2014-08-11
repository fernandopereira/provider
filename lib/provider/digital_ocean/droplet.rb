module Provider
  class DigitalOcean::Droplet
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

    def create
      @header.merge!({'Content-Type' => "application/json"})
      query = {name: "Default", region: "sfo1", size: "512mb", image: '5141286'}
      response = self.class.post('/droplets', {query: query, headers: @header})
      tratar_response(response)
    end

    def delete(id)
      @header.merge!({'Content-Type' => "application/x-www-form-urlencoded"})
      response = self.class.delete("/droplets/#{id}", headers: @header)
      tratar_response(response)
    end

  private
    
    def tratar_response(response)
      if response.code == 200
        puts response
        response.parsed_response
      else
        raise ArgumentError, response.parsed_response['error']
      end
    end
  end
end