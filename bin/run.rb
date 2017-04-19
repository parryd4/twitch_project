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
  time = Time.now
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
  puts Time.now-time
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
def populate_streams_and_channels
  time = Time.now
  hash = {}
  offset = 0

  streams_url = Url_start + "streams" + Url_args + offset.to_s

  hash = make_hash_from_url(streams_url)
  total_streams = hash["_total"]
  puts "total_streams: #{total_streams}"
  blank = []

  while offset < 1000 #Express Mode total_streams
    hash = make_hash_from_url(streams_url,offset)
    hash["streams"].each do |x|

      Stream.create(
        stream_id: x["_id"],
        channel_name: x["channel"]["display_name"],
        stream_started: x["created_at"],
        status: x["channel"]["status"],
        game_name: x["game"],
        viewers: x["viewers"],
        channel_id: x["channel"]["_id"]
      )

      Channel.create(
        name: x["channel"]["display_name"],
        channel_id: x["channel"]["_id"],
        channel_creation: x["channel"]["created_at"],
        url: x["channel"]["url"],
        mature: x["channel"]["mature"],
        partner: x["channel"]["partner"],
        language: x["channel"]["language"],
        views: x["channel"]["views"],
        followers: x["channel"]["followers"]
      )
    end
    offset += 100
  end

  puts Time.now - time
end
populate_games
populate_streams_and_channels

puts "hi"
