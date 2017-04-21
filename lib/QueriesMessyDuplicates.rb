class Queries
  def self.games_top_viewers
    choice_array = [""]
    puts "\nHere are the 10 most popular games by Viewers"
    var = Game.order(viewers: :desc).first(10)
    var.each.with_index do |x, i|
      puts "#{i+1} #{x.name}: #{x.viewers} viewers watching on #{x.channels} channels"
      choice_array << x.name
    end

    puts "\nTo see the top 10 streams playing that game, enter \#. Any other key will return."
    input = STDIN.gets.to_i
    if (1..10).include?(input)
      self.top_streams_playing(choice_array[input])
    else
      puts "guess not"
    end

  end
  def self.games_top_channels
    choice_array = [""]
    puts "\n Here are the 10 most popular games by channel count:"
    var = Game.order(channels: :desc).first(10)
    var.each.with_index do |x, i|
      puts "#{i+1}. #{x.name}: #{x.channels} channels with #{x.viewers} viewers"
      choice_array << x.name
    end

    puts "\nTo see the top 10 streams playing that game, enter \#. Any other key will return."
    input = STDIN.gets.to_i
    if (1..10).include?(input)
      self.top_streams_playing(choice_array[input])
    else
      puts "guess not"
    end
  end
#ithink channels are new
  def self.top_channels_followers
    puts "Top 10 Channels Streaming Now With Most Followers"
    var = Channel.order("followers desc").first(10)
    var.each.with_index do |x,i|
      puts "#{i+1}. #{x.name}'s channel has #{x.followers} followers.\nWatch at #{x.url}"
    end
    ""
  end
  def self.top_channels_views
    puts "Top 10 Channels By View Count Currently Streaming"
    var = Channel.order("views desc").first(10)
    var.each.with_index do |x,i|
      puts "#{i+1}. #{x.name}'s channel has been viewed #{x.views} times.\nWatch at #{x.url}"
    end
  end
  def self.newest_channel
    puts "10 Most Recently Created Channels"
    var = Channel.order("channel_creation desc").first(10)
    var.each.with_index do |x,i|
      puts "#{i+1}. #{x.name} was created on #{x.channel_creation.gsub(/[TZ]/,' ').rstrip} and has #{x.followers} followers.\nThey can be found at #{x.url}"
    end
    ""
  end
  def self.oldest_channel
    puts "10 Oldest Channels"
    var = Channel.order("channel_creation desc").first(10)
    var.each.with_index do |x,i|
      puts "#{i+1}. #{x.name} has been a streamer since #{x.channel_creation.gsub(/[TZ]/,' ').rstrip} and has #{x.followers} followers.\nThey can be found at #{x.url}"
    end
    ""
  end
#ithink below is old
  def self.top_streams_playing(game)
    puts "Top 10 Streams Current Playing #{game}"
    var = Stream.where(game_name: game).order(viewers: :desc).first(10)
    var.each.with_index do |x, i|
      puts "#{i+1}. #{x.channel_name}: #{x.viewers} currently viewing.\n Watch live at: #{x.url}"
    end
    puts ""
  end
  def self.streams_top
    choice_array = []
    puts "\n These are the 10 most popular streams right now"
    var = Stream.order(viewers: :desc).first(10).reverse
    var.each.with_index do |x,i|
      puts "#{i+1}. #{x.channel_name} streaming: #{x.game_name}. #{x.viewers} viewing.\nWatch live at #{x.url} \nStatus: #{x.status}"

    end
    ""
  end
  def self.stream_languages
    lang = {
      "en" => "English",
      "ru" => "Russain",
      "de" => "German",
      "ko" => "Korean",
      "fr" => "French",
      "zh-tw" => "Chinese",
      "pl" => "Polish",
      "pt-br" => "Portugese",
      "sv" => "Swedish",
      "tr" => "Turkish"
    }
    puts "10 Most Popular Languages Being Streamed"
      var = Stream.group(:language).order('SUM(viewers) DESC').sum(:viewers).first(10)
      var.each.with_index {|x,i| puts "#{i+1}. #{lang[x[0]]} is being watched by #{x[1]} viewers."}
      ""
  end
  def self.newest_streams
    puts "10 Most Recently Started Streams"
    var = Stream.order(stream_started: :desc).first(10)
    var.each.with_index {|x,i| puts "#{i+1} #{x.channel_name} #{x.viewers} #{x.stream_started}\nWatch live at: #{x.url}"}
    ""
  end
  def self.oldest_streams
    puts "10 Longest Currently Running Streams"
    var = Stream.order(:stream_started).first(10)
    var.each.with_index {|x,i| puts "#{i+1} #{x.channel_name} #{x.viewers} #{x.stream_started}\nWatch live at: #{x.url}"}
    ""
  end
  # videos: Title, ChannelName, GameName, views
  def self.videos_top
    puts "Top 10 Twitch Videos From This Week"
    var = Video.order(:views).last(10).reverse
    var.each.with_index do |x, i|
        if x.title.length > 30
          title = x.title[0..30] + "..."
        else
          title = x.title
        end
      puts "#{i+1}. \"#{title}\" from the game: #{x.game_name}\n#{x.channel_name}'s video has been viewed #{x.views} times"

    end
    ""
  end
  def self.games_by_videos
    puts "Top 10 Games by Videos"
    var = Video.group(:game_name).order('SUM(views) DESC').sum(:views).first(10)
    var.each.with_index do |x,i|
      puts "#{i+1}. #{x[0]} videos have a total of #{x[1]} views"
    end
  end
  def self.videos_by_length
    puts "The 10 longest videos of the week"
    var = Video.order('length desc').first(10)
    var.each.with_index do |x,i|
      if x.title.length > 30
        title = x.title[0..30] + "..."
      else
        title = x.title
      end
      puts "#{i+1}. \"#{title}\" #{Queries.convert_seconds(x.length)}.\n a #{x.game_name} video by #{x.channel_name}"
    end
    ""
  end
  def self.convert_seconds(time)
    return_time = ""
    min, sec = time.divmod(60)
    return_time += sec.to_s + " seconds"
    hr, min = min.divmod(60)
    return_time = min.to_s + " minutes " + return_time if min > 0
    return_time = hr.to_s + " hours " + return_time if hr > 0
    return_time
  end
end
