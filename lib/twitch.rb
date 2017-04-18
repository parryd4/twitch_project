require 'rest-client'
require 'json'
require 'pry'

CLIENTID = "8c62koccz5yyd663djbo1lpydgcbnw"

def get_top_games
  hash = {}
  url = "https://api.twitch.tv/kraken/games/top?client_id=8c62koccz5yyd663djbo1lpydgcbnw&limit=100"
  api = RestClient.get(url)
  hash = JSON.parse(api)
end

#starting point
data_url = "https://api.twitch.tv/kraken/channels/geekandsundry?client_id=14ti3recizod3yw0d2tj9syjdyj655"
film_api = RestClient.get(data_url)
starting_hash = JSON.parse(film_api)

#binding.pry

def make_hash(url, offset)
  data_url = url + "?limit=100&offset=" + offset.to_s + "&client_id=14ti3recizod3yw0d2tj9syjdyj655"
  api = RestClient.get(data_url)
  JSON.parse(api)
end

# to go from channel to videos
@videos_url = starting_hash["_links"]["videos"]
video_hash = make_hash(@videos_url, 0)

# videos
def get_all_videos(hash)
  videos_array = []
  limit = hash["_total"] # 1197
  limiter = hash["_links"]["next"].split("=").last.to_i
  offset = 0

  while limit > limiter
    limiter = hash["_links"]["next"].split("=").last.to_i
    videos_array << hash["videos"]
    videos_array.flatten
    offset += 100
    hash = make_hash(@videos_url,offset)
  end
  videos_array.flatten
end

# puts get_all_videos(video_hash).length

games = get_top_games

binding.pry
puts ""
