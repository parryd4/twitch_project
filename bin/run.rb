#require_relative '../lib/api_communicator.rb'
#require_relative '../lib/command_line_interface.rb'
require_relative '../config/environment.rb'

require 'rest-client'
require 'json'
require 'pry'

CLIENTID = "8c62koccz5yyd663djbo1lpydgcbnw"

def make_hash(offset=0)
  data_url = "https://api.twitch.tv/kraken/games/top?client_id=8c62koccz5yyd663djbo1lpydgcbnw&limit=100&offset=" +offset.to_s
  api = RestClient.get(data_url)
  JSON.parse(api)
end

def populate_games
  hash = {}
  games_url = "https://api.twitch.tv/kraken/games/top?client_id=8c62koccz5yyd663djbo1lpydgcbnw&limit=100&offset=0"
  api = RestClient.get(games_url)
  hash = JSON.parse(api)

  total_games =  hash["_total"] #1419 ish?
  offset = 0

  while offset < 1000 #express mode, 
    hash = make_hash(offset)
    hash["top"].each do |game|
      Game.create(name: game["game"]["name"], viewers: game["viewers"], channels: game["channels"])
    end
    offset += 100
  end
end
######
#begin abstracting
Url_start = "https://api.twitch.tv/kraken/"
Url_args = "?client_id=8c62koccz5yyd663djbo1lpydgcbnw&limit=100&offset="
def make_hash_from_url(url, offset = 0)
  data_url = url + offset.to_s
  api = RestClient.get(data_url)
  JSON.parse(api)
end
#
def populate_streams
  time = Time.now
  hash = {}
  offset = 0

  streams_url = Url_start + "streams" + Url_args + offset.to_s

  hash = make_hash_from_url(streams_url)
  total_streams = hash["_total"]
  puts "total_streams"
  blank = []

  while offset < 1000 #Express Mode total_streams
    hash = make_hash_from_url(streams_url,offset)
    hash["streams"].each do |x|

      #  x.["_id"]   #:stream_id
      #  x.["created_at"]   #:stream_started
      #  x.["channel"]["status"]   #:status
      #  x.["game"]   #:game_name
      blank << x["channel"]["display_name"]   #:channel_name
      #  x.["channel"]["_id"]   #:channel_id
      #  x.["viewers"]   #:viewers
      #  x.["channel"]["self"] # channel api url
    end
    offset += 100
  end
  puts blank.size
  puts Time.now - time
end
#populate_games
populate_streams

puts "hi"
