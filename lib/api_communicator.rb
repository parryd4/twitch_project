require 'rest-client'
require 'json'
require 'pry'

data_url = "https://api.twitch.tv/kraken/channels/geekandsundry"+ "?client_id=14ti3recizod3yw0d2tj9syjdyj655"
film_api = RestClient.get(data_url)
starting_hash = JSON.parse(film_api)

def make_hash(url)
  data_url = url + "?client_id=14ti3recizod3yw0d2tj9syjdyj655"
  api = RestClient.get(data_url)
  JSON.parse(api)
end
binding.pry
puts ""


# def get_character_movies_from_api(character)
#   attribute = get_character_attribute(character,"films")
#   url_to_hash(attribute)
# end
#
# def parse_character_movies(films_hash)
#   films_hash.each.with_index(1) do |key, index|
#     puts "#{index}. #{key["title"]}"
#   end
# end
#
# def show_character_movies(character)
#   films_hash = get_character_movies_from_api(character)
#   parse_character_movies(films_hash)
# end
#
# ## BONUS
#
# # that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# # can you split it up into helper methods?
#
# def get_character_attribute(character, attribute)
#   array = []
#   next_page = "http://www.swapi.co/api/people/?page=1"
#
#   while next_page != nil && array == [] do
#     all_characters = RestClient.get(next_page)
#     character_hash = JSON.parse(all_characters)
#
#     character_hash["results"].each do |item|
#       if item["name"].downcase == character
#         array = item[attribute]
#       end
#     end
#     next_page = character_hash["next"]
#   end
#   array
# end
#
# def url_to_hash(data_url)
#   film_api_array = []
#   if data_url.class == String
#     film_api = RestClient.get(data_url)
#     return JSON.parse(film_api)
#     #film_api_array << film_api_hash
#   elsif data_url.class == Array
#     data_url.each do |url|
#       film_api = RestClient.get(url)
#       film_api_hash = JSON.parse(film_api)
#       film_api_array << film_api_hash
#     end
#   end
#   film_api_array
# end
