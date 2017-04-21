

module Helper

  def commas(n)
    n.to_s.reverse.scan(/\d{3}|.+/).join(",").reverse
  end

  def fade(string, n=0)
    string.chars.each do |x|
      print x
      n == 1 ? (sleep 0.02) : (sleep 0.01)
    end
    puts
  end

  def lines(word: "=====", n: 0)
    if n == 1
      fade("================#{word}================", 1)
    elsif n == 2
      fade("------<|#{word} directory|>------", 1)
    elsif n == 3
      fade("------<|#{word}|>------", 1)
    else
      puts "--------------------------------" + "-"*(word.size)
    end
  end

  def spin(n)
  print "\b"
  pinwheel = %w{- \\ | /}
  n.times do
    print "\b" + pinwheel.rotate!.first
    sleep(0.1)
  end
  STDOUT.print "\b"
end

  def welcome

    puts
    lines(word: "Twitch", n: 1)
    puts
    puts "Welcome to the Twitch search API!"
    puts "Here you can view Twitch's current top"
    puts "games, videos, streams, and much more!"
    puts
    puts totals
    spin(24)
    lines(word: "Twitch")
    puts
    list
    seed
    print"Let's browse!"
    puts
    puts
    spin(12)
    top

  end

  def leave
    puts
    lines(word: "Goodbye!", n: 1)
    puts
    exit
  end

  def mf(message, character, limit)
    if message.size > limit
      "#{message.to_s.first(limit)} #{character} "
    else
      "#{message.to_s.first(limit)} #{character*(1+limit-message.to_s.size)} "
    end
  end

  def list

    puts "At any time, you can type in the following commands:"
    puts
    lines(word: "Universal Commands", n: 1)
    puts
    puts "list - Lists all universal commands."
    puts
    puts "Database commands: Fills the database"
    puts
    puts "-- seed - top 1,000 streams, very fast"
    puts "-- seed_all - EVERY stream, can take up to 6 minutes"
    puts
    puts "Directory commands:"
    puts
    puts "-- directories - See the top directories."
    puts "-- top - Go to the top (main) directory."
    puts "-- back - Go up one directory"
    puts
    puts "leave - Exit the API."
    puts
    lines(word: "list")
    puts
    spin(24)

  end

  def seed
    lines(word: "Seeding", n: 1)
    puts
    if $dir.empty?
      puts "Please hold while we seed the database."
      puts
      # rake db:drop
      # rake db:migrate
      puts "Thank you for waiting."
      puts "The database has been seeded at #{Time.now}."
    else
      puts "Sorry, you can only seed while in the main directory."
    end
    puts
  end

  def seed_all
    lines(word: "Seeding All", n: 1)
    puts
    if $dir.empty?
      puts "Warning, this will take up to 6 minutes to complete,"
      puts "Are you sure you would like to do this? Y/N"
      input = gets.strip.upcase
        until input == "Y" || input == "N"
          puts "Sorry that's not a valid input. Enter Y/N"
          input = gets.strip.upcase
        end
      if input == "Y"
        puts "Please hold while we seed the database."
        puts
        # rake db:drop
        # rake db:migrate (full)
        puts "Thank you for waiting."
        puts "The database has been seeded at #{Time.now}."
      else
        puts "We will continue using the current database."
      end
    else
      puts "Sorry, you can only seed while in the main directory."
    end
    puts
  end

  def directories

    lines(word: "Top Directories", n: 1)
    puts
    Directories.each do |x,y|
        puts "#{x}"
        puts ""
        y.keys.each { |z| puts "- #{z}" }
        puts ""
    end
    lines(word: "Top Directories")
    puts
    spin(24)
    puts
  end

  def top
    $dir.clear
    directory_changer
  end

  def back
    if $dir.empty?
      puts "You can't go back any farther!"
    else
      $dir.pop
      directory_changer
    end
  end

  def forward(input,name="")
    $dir << input
    directory_changer(name)
  end

  def directory_changer(name="")
    $string = "Directories"
    $dir.map { |x| $string += "['#{x}']" }
    query_handler(name)
  end

  def next_directories
    eval($string).map { |k,v| k }
  end

  def current_directory
    $dir.empty? ? "main" : $dir.last
  end

  def choices
    list = next_directories.unshift("back")
    puts
    lines(word: current_directory, n: 2)
    puts
    puts $message
    puts
    list.each_with_index { |x,i| puts "#{i}: #{x}" unless i == 0 }
    puts
  end

  def query_handler(name="")

    Queries.show_directories if $query_show_directories.include?(current_directory)
    Queries.games_top_viewers if current_directory == "Top games by viewer count"
    Queries.games_top_channels if current_directory == "Top games by channel count"
    Queries.top_streams_playing(name) if current_directory == "Top game streams"

  end

end


#
#
#
# module Helper
#
#   def commas(n)
#     n.to_s.reverse.scan(/\d{3}|.+/).join(",").reverse
#   end
#
#   def fade(string, n=0)
#     string.chars.each do |x|
#       print x
#       n == 1 ? (sleep 0.02) : (sleep 0.01)
#     end
#     puts
#   end
#
#   def lines(word: "=====", n: 0)
#     if n == 1
#       fade("================#{word}================", 1)
#     elsif n == 2
#       fade("------<|#{word} directory|>------", 1)
#     elsif n == 3
#       fade("------<|#{word}|>------", 1)
#     else
#       puts "--------------------------------" + "-"*(word.size)
#     end
#   end
#
#   def spin(n)
#   print "\b"
#   pinwheel = %w{- \\ | /}
#   n.times do
#     print "\b" + pinwheel.rotate!.first
#     sleep(0.1)
#   end
#   STDOUT.print "\b"
# end
#
#   def welcome
#
#     puts
#     lines(word: "Twitch", n: 1)
#     puts
#     puts "Welcome to the Twitch search API!"
#     puts "Here you can view Twitch's current top"
#     puts "games, videos, streams, and much more!"
#     puts
#     puts totals
#     spin(24)
#     lines(word: "Twitch")
#     puts
#     list
#     seed
#     print"Let's browse!"
#     puts
#     puts
#     spin(12)
#     top
#
#   end
#
#   def leave
#     puts
#     lines(word: "Goodbye!", n: 1)
#     puts
#     exit
#   end
#
#   def mf(message, character, limit)
#     if message.size > limit
#       "#{message.to_s.first(limit)} #{character} "
#     else
#       "#{message.to_s.first(limit)} #{character*(1+limit-message.to_s.size)} "
#     end
#   end
#
#   def list
#
#     puts "At any time, you can type in the following commands:"
#     puts
#     lines(word: "Universal Commands", n: 1)
#     puts
#     puts "list - Lists all universal commands."
#     puts
#     puts "Database commands: Fills the database"
#     puts
#     puts "-- seed - top 1,000 streams, very fast"
#     puts "-- seed_all - EVERY stream, can take up to 6 minutes"
#     puts
#     puts "Directory commands:"
#     puts
#     puts "-- directories - See the top directories."
#     puts "-- top - Go to the top (main) directory."
#     puts "-- back - Go up one directory"
#     puts
#     puts "leave - Exit the API."
#     puts
#     lines(word: "list")
#     puts
#     spin(24)
#
#   end
#
#   def seed
#     lines(word: "Seeding", n: 1)
#     puts
#     if $dir.empty?
#       puts "Please hold while we seed the database."
#       puts
#       # rake db:drop
#       # rake db:migrate
#       puts "Thank you for waiting."
#       puts "The database has been seeded at #{Time.now}."
#     else
#       puts "Sorry, you can only seed while in the main directory."
#     end
#     puts
#   end
#
#   def seed_all
#     lines(word: "Seeding All", n: 1)
#     puts
#     if $dir.empty?
#       puts "Warning, this will take up to 6 minutes to complete,"
#       puts "Are you sure you would like to do this? Y/N"
#       input = gets.strip.upcase
#         until input == "Y" || input == "N"
#           puts "Sorry that's not a valid input. Enter Y/N"
#           input = gets.strip.upcase
#         end
#       if input == "Y"
#         puts "Please hold while we seed the database."
#         puts
#         # rake db:drop
#         # rake db:migrate (full)
#         puts "Thank you for waiting."
#         puts "The database has been seeded at #{Time.now}."
#       else
#         puts "We will continue using the current database."
#       end
#     else
#       puts "Sorry, you can only seed while in the main directory."
#     end
#     puts
#   end
#
#   def directories
#
#     lines(word: "Top Directories", n: 1)
#     puts
#     Directories.each do |x,y|
#         puts "#{x}"
#         puts ""
#         y.keys.each { |z| puts "- #{z}" }
#         puts ""
#     end
#     lines(word: "Top Directories")
#     puts
#     spin(24)
#     puts
#   end
#
#   def top
#     $dir.clear
#     directory_changer
#   end
#
#   def back
#     if $dir.empty?
#       puts "You can't go back any farther!"
#     else
#       $dir.pop
#       directory_changer
#     end
#   end
#
#   def forward(input)
#     $dir << input
#     directory_changer
#   end
#
#   def directory_changer
#     $string = "Directories"
#     $dir.map { |x| $string += "['#{x}']" }
#     queries
#   end
#
#   def next_directories
#     eval($string).map { |k,v| k }
#   end
#
#   def current_directory
#     $dir.empty? ? "main" : $dir.last
#   end
#
#   def choices
#     list = next_directories.unshift("back")
#     puts
#     lines(word: current_directory, n: 2)
#     puts
#     puts $message
#     puts
#     list.each_with_index { |x,i| puts "#{i}: #{x}" unless i == 0 }
#     puts
#   end
#
#   def query_handler
#
#
#
#   end
#
#   def queries
#
#     choices
#     input = gets.strip
#     puts
#
#     if $universal.include?(input)
#       eval(input)
#       queries
#     end
#
#     until ("1".."#{next_directories.size}").include?(input)
#         puts
#         puts "Sorry that's not an option, try again."
#         puts
#         choices
#         input = gets.strip
#         puts
#
#         if $universal.include?(input)
#           eval(input)
#           queries
#         end
#
#     end
#
#     forward(next_directories[input.to_i-1])
#
#   end
#
# end
