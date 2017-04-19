require 'rest-client'
require 'json'
require 'pry'
#
# def get_top_games_from_api
#   #make the web request and parse the JSON into a hash
#   JSON.parse(RestClient.get('https://api.twitch.tv/kraken/games/top?client_id=8c62koccz5yyd663djbo1lpydgcbnw'))
# end
#
# def get_top_videos_from_api
#   JSON.parse(RestClient.get('https://api.twitch.tv/kraken/videos/top?client_id=8c62koccz5yyd663djbo1lpydgcbnw'))
# end
#
# def get_streams_from_api
#   JSON.parse(RestClient.get('https://api.twitch.tv/kraken/streams?client_id=8c62koccz5yyd663djbo1lpydgcbnw'))
# end

def ping
  puts "Getting all data from Twitch, please wait (there's a lot here)."
  types = {games: "games/top", videos:"videos/top", streams:"streams"}
  master_hash = {}
  types.each do |key, value|
    master_hash[key] = JSON.parse(RestClient.get('https://api.twitch.tv/kraken/' + value + '?client_id=8c62koccz5yyd663djbo1lpydgcbnw'))
  end
  master_hash
  binding.pry
end

def say_goodbye() puts "Thanks for stopping by!" end

  # master_hash[:games]["_total"]

get_info_from_api

binding.pry

# type == "streams" ? type : type + '/top'
#
#
# def attribute_converter (attribute, info)
#   puts "#{attribute.capitalize}:"
#   puts
#   info.each { |individual_subject|
#     puts JSON.parse(RestClient.get(individual_subject))["name"]
#   }
#   puts
# end
#
# def parse_character_movies(films_hash)
#   # some iteration magic and puts out the movies in a nice list
#   films_hash.each { |film|
#     puts "*" * 30
#     film.each { |attribute, info|
#       case attribute
#       when "opening_crawl"
#         puts "#{attribute.capitalize}:\n\n#{info.center(60)}"
#         puts
#       when "characters", "planets" ,"starships", "vehicles", "species"
#       attribute_converter(attribute, info)
#       else
#         puts "#{attribute.capitalize}: #{info}"
#         puts
#       end
#     }
#   }
# end
#
# def show_character_movies
#   films_hash = get_top_games_from_api
#   parse_character_movies(films_hash)
# end
