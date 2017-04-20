class Queries


  #
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
      puts "#{i+1} #{x.name}: #{x.channels} channels with #{x.viewers} viewers"
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
      puts "#{i+1}. #{x[0]}: total of #{x[1]} views"
    end
  end

end
