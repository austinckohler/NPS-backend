require 'rest-client'
require 'json'

def get_parks
    response = RestClient.get "https://developer.nps.gov/api/v1/parks?limit=100&api_key=OJcmf4YsPUqMl90s4imakbUhVLGB0dewlTFqOPOa"
    parsed_json = JSON.parse(response)

    if !parsed_json.nil?
        parsed_json["data"].map do |park|
            Park.create(
                state: park["states"],
                url: park["url"],
                weather: park["weatherInfo"],
                name: park["fullName"],
                lat_long: park["latLong"],
                description: park["description"],
                park_code: park["parkCode"]
        )
        end
    else
        puts "error seeding"
    end
end
get_parks