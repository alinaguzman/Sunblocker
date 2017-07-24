require 'httparty'

class EpaApi
  include HTTParty

  base_uri('https://iaspub.epa.gov')

  def initialize(zipcode)
    @response = self.class.get("/enviro/efservice/getEnvirofactsUVHOURLY/ZIP/#{zipcode}/json")
  end

  def hourly
    @response.parsed_response
  end

end