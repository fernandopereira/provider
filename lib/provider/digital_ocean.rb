module Provider
  class DigitalOcean
    def initialize(api_token)
      @api_token = api_token
    end

    def machine
      Provider::DigitalOcean::Droplet.new(@api_token)
    end
  end
end