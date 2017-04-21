module Helper

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
  print "\b\b"
end

  def welcome

    puts
    lines(word: "Twitch", n: 1)
    puts
    puts "Welcome to the Twitch search API!"
    puts "Here you can view information about Twitch's current top games, videos, streams, and much more!"
    puts
    lines(word: "Twitch")
    puts
    spin(12)
    list
    seed

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
      puts
    else
      puts "Sorry, you can only seed while in the main directory."
      puts
    end
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
        puts
      else
        puts "We will continue using the current database."
      end
    else
      puts "Sorry, you can only seed while in the main directory."
      puts
    end

  end

  def directories
    puts
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
  end

  def top
    $dir.clear
    goto_dir
  end

  def back
    if $dir.empty?
      puts "You can't go back any farther!"
    else
      $dir.pop
      goto_dir
    end
  end

  def choose(input)
    $dir << input
    goto_dir
  end

  def goto_dir
    $string = "Directories"
    $dir.map { |x| $string += "['#{x}']" }
    query(next_directories, "What would you like to view?")
  end

  def next_directories
    eval($string).map { |k,v| k }
  end

  def current_directory
    $dir.empty? ? "main" : $dir.last
  end

  def choices(array, message)
    list = next_directories.unshift("back")
    puts
    lines(word: current_directory, n: 2)
    puts
    puts message
    puts
    list.each_with_index { |x,i| puts "#{i}: #{x}" unless i == 0 }
    puts
  end

  def query(array, message)

    choices(array, message)
    input = gets.strip
    puts
    if $universal.include?(input)
      puts
      eval(input)
      query(array, message)
    end

    until ("1".."#{array.length}").include?(input)
        puts
        puts "Sorry that's not an option, try again."
        puts
        choices(array, message)
        input = gets.strip
        if $universal.include?(input)
          puts
          eval(input)
          query(array, message)
        end
    end

    choose(array[input.to_i-1])

  end

  def leave
    puts
    lines(word: "Goodbye!", n: 1)
    puts
    exit
  end

end
