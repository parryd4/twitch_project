require_relative '../config/environment'

def welcome
  puts \
      "Welcome to the Twitch search API!
      Here you can view the top games,
      videos, and streams, and find out
      more information of each of them!"
  puts \
      "To start, let's get the current
      information from Twitch! Do this
      by typing in 'ping' to do this!"
  input = gets.strip
  unless input == "ping"
    puts "Sorry try again! Type 'ping'"
    input = gets.strip
  end
  ping
  puts "The database has been populated at #{Time.now}."
  puts "You can type 'ping' to get the most current data."
end
#

def search_type
  types = ["games","videos","streams","exit"]
  puts "What information would you like to see?"
  p types
  type = gets.strip.downcase
  until types.include?(type)
    puts "Sorry that's not an option, try again."
    type = gets.strip.downcase
  end
  type == "exit" ? say_goodbye : type
end
# returns the top of the gotten type



# case typex
