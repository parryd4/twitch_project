class Twitchbase

  URL_START = "https://api.twitch.tv/kraken/"
  URL_ARGS = "?client_id=8c62koccz5yyd663djbo1lpydgcbnw&limit=100&offset="

  def self.clear_tables
      Game.delete_all
      Channel.delete_all
      Stream.delete_all
      Video.delete_all
  end

  def self.seed_tables
    self.populate_games
    self.populate_streams_and_channels
    self.populate_videos
  end

  def self.make_hash_from_url(choice, offset = 0)
    api_url = URL_START + choice + URL_ARGS + offset.to_s
    api = RestClient.get(api_url)
    JSON.parse(api)
  end

  def self.populate_games
    puts "Seeding Games"
    hash = {}
    choice = "games/top"
    offset = 0
    total_games = self.make_hash_from_url(choice)["_total"]

    while offset < total_games
        hash = self.make_hash_from_url(choice, offset)
        hash["top"].each do |game|
          Game.create(
            name: game["game"]["name"],
            viewers: game["viewers"],
            channels: game["channels"]
          )
        end
        offset += 100
    end
  end

  def self.populate_streams_and_channels
    puts "Seeding Streams and Channels"
    hash = {}
    choice = "streams"
    offset = 0
    total_streams = self.make_hash_from_url(choice)["_total"]

    while offset < 1000
      hash = make_hash_from_url(choice, offset)
      hash["streams"].each do |x|
        Stream.create(
          stream_id: x["_id"],
          channel_name: x["channel"]["display_name"],
          stream_started: x["created_at"],
          status: x["channel"]["status"],
          game_name: x["game"],
          viewers: x["viewers"]
          )
        Channel.create(
          name: x["channel"]["display_name"],
          channel_id: x["channel"]["_id"],
          channel_creation: x["channel"]["created_at"],
          url: x["channel"]["url"],
          mature: x["channel"]["mature"],
          partner: x["channel"]["partner"],
          videos_url: x["channel"]["videos"],
          teams: x["channel"]["teams"],
          language: x["channel"]["language"],
          views: x["channel"]["views"],
          followers: x["channel"]["followers"]
        )
      end
      offset += 100
    end
  end


    def self.populate_videos
      puts "Seeding Videos"
      hash = {}
      choice = "videos/top"
      offset = 0

      while offset < 1000
        make_hash_from_url(choice,offset)["videos"].each do |video|
          Video.create(
            title: video["title"],
            url: video["url"],
            broadcast_id: video["broadcast_id"],
            game_name: video["game"],
            channel_name: video["channel"]["display_name"],
            video_creation: video["created_at"],
            broadcast_type: video["broadcast_type"],
            language: video["language"],
            views: video["views"],
            length: video["length"]
          )
        end
        offset += 100
      end
    end


end
