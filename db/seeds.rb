require 'rest-client'
require 'json'

def get_parks
    response = RestClient.get "https://developer.nps.gov/api/v1/parks?limit=100&api_key=OJcmf4YsPUqMl90s4imakbUhVLGB0dewlTFqOPOa"
    parsed_json = JSON.parse(response)

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

        if !Park.all.nil?
        Park.all.map do |park|
        alerts_response = RestClient.get "https://developer.nps.gov/api/v1/alerts?parkCode=#{park.park_code}&limit=100&api_key=OJcmf4YsPUqMl90s4imakbUhVLGB0dewlTFqOPOa"
        parsed_alerts = JSON.parse(alerts_response)

            parsed_alerts["data"].map do |alert|
                Alert.create(
                    title: alert["title"],
                    description: alert["description"],
                    category: alert["category"],
                    park_code: alert["parkCode"],
                    park_id: park.id
            )
            end
        end
    end
end
get_parks