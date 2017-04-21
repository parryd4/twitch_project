class Queries

  def self.show_directories

    choices
    input = gets.strip
    puts

    if $universal.include?(input)
      eval(input)
      query_handler
    end

    unless ("1".."#{next_directories.size}").include?(input)
        puts
        puts "Sorry that's not an option, try again."
        puts
        query_handler
    end

    forward(next_directories[input.to_i-1])

  end


  def self.games_top_viewers

    list = Game.order(viewers: :desc).first(10).unshift("back")
    puts
    lines(word: current_directory, n: 3)
    puts
    list.each.with_index do |x, i|
      unless i == 0
        puts "#{i}:#{' ' if i < 10} #{mf(x.name,"-",30)} #{commas(x.viewers)} viewers watching on #{commas(x.channels)} channels"
        puts
      end
    end

    puts $message
    puts
    input = gets.strip
    puts

    if $universal.include?(input)
      eval(input)
      self.games_top_viewers
    end

    unless ("1"..."#{list.size}").include?(input)
        puts
        puts "Sorry that's not an option, try again."
        puts
        self.games_top_viewers
    end

    forward(next_directories[0],list[input.to_i].name)

  end

  def self.games_top_channels
    list = Game.order(channels: :desc).first(10).unshift("back")
    puts
    lines(word: current_directory, n: 3)
    puts
    list.each.with_index do |x, i|
      unless i == 0
        puts "#{i}:#{' ' if i < 10} #{mf(x.name,"-",30)} #{commas(x.viewers)} viewers watching on #{commas(x.channels)} channels"
        puts
      end
    end

    puts $message
    puts
    input = gets.strip
    puts

    if $universal.include?(input)
      eval(input)
      self.games_top_channels
    end

    unless ("1"..."#{list.size}").include?(input)
        puts
        puts "Sorry that's not an option, try again."
        puts
        self.games_top_channels
    end

    forward(next_directories[0],list[input.to_i].name)

  end

  def self.top_streams_playing(game)

    list = Stream.where(game_name: game).order(viewers: :desc).first(10).unshift("back")
    puts
    lines(word: "Top #{game} streams", n: 3)
    puts
    list.each.with_index do |x, i|
      unless i == 0
        puts "#{i}:#{' ' if i < 10} #{mf(x.channel_name,"-",20)} #{commas(x.viewers)} viewers - #{x.status.first(40)}"
        puts
      end
    end

    puts "Type a number if you would like to load that stream."
    puts
    input = gets.strip
    puts

    if $universal.include?(input)
      eval(input)
      self.top_streams_playing(game)
    end

    unless ("1"..."#{list.size}").include?(input)
        puts
        puts "Sorry that's not an option, try again."
        puts
        self.top_streams_playing(game)
    end

    puts "Loading #{list[input.to_i].channel_name}'s stream']"
    puts
    spin(12)
    system("open","#{list[input.to_i].url}")
    self.top_streams_playing(game)

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
