class Game < ActiveRecord::Base
  has_many :streams
  has_many :videos
  # def self.populate
  #
  #   hash = {}
  #   url = "https://api.twitch.tv/kraken/games/top?client_id=8c62koccz5yyd663djbo1lpydgcbnw&limit=100"
  #   api = RestClient.get(url)
  #   hash = JSON.parse(api)
  #   binding.pry
  # end

end
