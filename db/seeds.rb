# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def get_routes
  response = RestClient.get("https://www.mountainproject.com/data/get-routes-for-lat-lon?lat=47&lon=-121&maxResults=100&maxDistance=200&key=200088267-568c28967d867abfc9c1833fa97a8c05")
  data = JSON.parse(response)   

  data["routes"].each do |route_details|
      name = route_details["name"]
      style = route_details["type"]
      grade = route_details["rating"]
      stars = route_details["stars"]
      pitches = route_details["pitches"]
      location = route_details["location"]

      Route.new(
          name: name, 
          style: style, 
          grade: grade,  
          stars: stars, 
          pitches: pitches, 
          location: location,
          user_id: [1..2].sample)
    end
  end
  # binding.pry
  
  get_routes
