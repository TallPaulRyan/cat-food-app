require 'httparty'
require 'cat_food_app/models/alligator'
require 'cat_food_app/models/seahawk'

module CatFoodApp
  class AnimalServiceClient

    include HTTParty
    base_uri 'animal-service.com'

    def self.find_alligator_by_name name
      response = get("/alligators/#{name}", :headers => {'Accept' => 'application/json'})
      when_successful(response) do
        CatFoodApp::Animals::Alligator.new(parse_body(response))
      end
    end

    def self.find_seahawk_by_name(name)
      response = get("/seahawks/#{name}", :headers => {'Accept' => 'application/json'})
      when_successful(response) do
        CatFoodApp::Animals::Seahawk.new(parse_body(response))
      end
    end



    def self.when_successful response
      if response.success?
        yield
      elsif response.code == 404
        nil
      else
        raise response.body
      end
    end

    def self.parse_body response
      JSON.parse(response.body, {:symbolize_names => true})
    end
  end
end