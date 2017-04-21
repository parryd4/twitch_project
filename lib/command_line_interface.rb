require_relative '../config/environment'
require_relative './modules.rb'
require_relative './directories.rb'
# require_relative '../bin/run.rb'

include Helper



$dir = []
$string = "Directories"
$universal = ["list","seed","seed_all","top","back","directories","leave"]
$message = "What would you like to view?"
$total_games = Twitchbase.make_hash_from_url("games/top?")["_total"]
$total_streams = Twitchbase.make_hash_from_url("streams?")["_total"]
$total_viewers = Game.sum(:viewers)
$query_show_directories = ["main","Top games","Top channels","Top streams","Top videos","Top streams playing a game","Top channels streaming","Newest/oldest channels","Top games being streamed","View top videos"]

def totals
  puts "For your information there are:"
  puts
  spin(8)
  fade("#{commas($total_viewers)} viewers watching", n: 1)
  spin(8)
  fade("#{commas($total_games)} games across", n: 1)
  spin(8)
  fade("#{commas($total_streams)} streams.", n: 1)
  print
end



#binding.pry
welcome

# Directories.each { |x,y| p y }
#
#         query($dir)
        #
        #
        # def self.games_top_channels
        #    choice_array = [""]
        #    puts "\n Here are the 10 most popular games by channel count:"
        #    var = Game.order(channels: :desc).first(10)
        #    var.each.with_index do |x, i|
        #      puts "#{i+1} #{x.name}: #{x.channels} channels with #{x.viewers} viewers"
        #      choice_array << x.name
        #    end
        #
        #    puts "\nTo see the top 10 streams playing that game, enter \#. Any other key will return."
        #    input = STDIN.gets.to_i
        #    if (1..10).include?(input)
        #      self.top_streams_playing(choice_array[input])
        #    else
        #      puts "guess not"
        #    end
        #  end
        #
        #  def self.top_streams_playing(game)
        #    puts "Top 10 Streams Current Playing #{game}"
        #    var = Stream.where(game_name: game).order(viewers: :desc).first(10)
        #    var.each.with_index do |x, i|
        #      puts "#{i+1}. #{x.channel_name}: #{x.viewers} currently viewing.\n Watch live at: #{x.url}"
        #    end
        #    puts ""
        #  end

#   Information = {
#
#       "Top games" =>
#
#         # "There are #{total_viewers} viewers watching #{total_games} different games across #{total_channels} channels.""
#
#         { "Top games being streamed" =>
#
#           # "How would you like to sort the top games?""
#
#           { "By viewer count" =>
#
#             #################### top games query (by view count) ####################
#             # "These are the top games sorted by view_count:"
#             #
#             # List: game_name, view_count, channel_count
#             # top X games sorted by view_count
#             #########################################################
#             #
#             # "Type in a number to see that game's streams."
#             #
#             ### input = number
#
#             { "Game_name Streams" =>
#
#                 #################### top streams query (limited by game name) ####################
#                 # "There are #{game_viewers} viewers watching #{game_name} streams."
#                 #
#                 # List: channel_name, view_count, channel_status (char_limited)
#                 # top X streams sorted by view_count limited to the game_name
#                 ###########################################################
#                 #
#                 # Type in a number to see that stream's information.
#                 #
#                 ### input = number
#
#                 { "Stream_name" =>
#
#                 # What would you like to do?
#                 #
#                 ################### stream/channel query ##################
#                 # "Here is the information about the stream:"
#                 #
#                 # List - stream info
#                 #       channel_name
#                 #       stream_started
#                 #       channel_status (char_limited)
#                 #       game_name
#                 #       view_count
#                 # List - channel info
#                 #       partner
#                 #       mature
#                 #       teams
#                 #       views
#                 #       followers
#                 ###########################################################
#                 #
#                 ### 1) Open channel's stream (sends ["channel"]["url"])
#                 # BONUS ### 2) Show channel's videos (TBD)
#                 #
#                 # BONUS { "Videos"}
#                 # ### 3) Show streamers team info (TBD)
#                 } } } } ,
#
#             { "By channel count" =>
#
#             #################### top games query ####################
#             # "These are the top games sorted by channel_count:"
#             #
#             # List: game_name, channel_count, view_count
#             # top X games sorted by channel_count
#             #########################################################
#             #
#             # "Type in a number to see that game's streams."
#             #
#             ### input = number
#
#               "COPY FROM 'BY VIEWER COUNT'" } ,
#
#
#
#
#
#
#           { "Top channels playing a game" => games_channels
#
#           # Which game would you like to see?
#
#           ### input = game_name
#
#           ####################### games query #######################
#           # "Choose the game that matches your search."
#           #
#           # List: game_name, view_count
#           # top X games sorted by view_count that match the search
#           ###########################################################
#           #
#           ### input = number
#
#           #################### top streams query ####################
#           # "There are #{game_viewers} viewers watching #{game_name} streams."
#           #
#           # List: channel_name, view_count, channel_status (char_limited)
#           # top X streams sorted by view_count limited to the game_name
#           ###########################################################
#           #
#           # < above query
#
#           } }
#
#       "Top channels" =>
#
#         # if $seed_all == true
#         #   "There are currently #{stream_total} channels streaming."
#         # else
#         #   "There are currently #{stream_total} channels streaming, however any queries will only be done on the top 1,000 channel's streams that are currently seeded. Type 'seed_all' if you would like to seed every current stream's channels (remember, this process may take up to 6 minutes to complete.)"
#
#         { "Top channels" => channels_top,
#
#           # "How would you like to sort the top games?""
#
#           ### 1) By view count
#           ### 2) By follower count
#           ### 3) By language (can be a sub query from 1/2)
#           ### 4) By partners/non-partners (can be a sub query from 1/2)
#
#           "View a channel" => channels_search
#
#           # Which channel would you like to view?
#
#           ### input = channel_name (return 10 channels nearest that name)
#
#           ################### stream/channel query ##################
#
#         } ,
#
#       "Top streams" =>
#
#         # if $seed_all == true
#         #   "There are currently #{stream_total} streams."
#         # else
#         #   "There are currently #{stream_total} streams, however any queries will only be done on the top 1,000 streams that are currently seeded. Type 'seed_all' if you would like to seed every current stream (remember, this process may take up to 6 minutes to complete.)"
#
#         { "Top streams" => streams_top,
#
#           #################### top streams query ####################
#           # "These are the top streams:"
#           #
#           # List: channel_name, view_count, channel_status (char_limited)
#           # top X streams sorted by view_count
#           ###########################################################
#           #
#           # < above query
#
#           "Top games being streamed" => games_top,
#
#           # < above query
#
#           "Newest/oldest streams" => streams_created
#
#           # "How would you like to sort the top streams?"
#
#           ### 1) Newest streams (most recently started)
#           ### 2) Oldest streams (longest running)
#
#           ################### newest streams query ##################
#           # "These are the most recently started streams:"
#           #
#           # List: channel_name, view_count, created_at
#           # bottom X streams sorted by created_at
#           ###########################################################
#           # or
#           ################### oldest streams query ##################
#           # "These are the longest running streams:"
#           #
#           # List: channel_name, view_count, created_at
#           # top X streams sorted by created_at
#           ###########################################################
#           #
#           # Type in a number to see that stream's information.
#           #
#           ### input = number
#           #
#           # What would you like to do?
#           #
#           ################### stream/channel query ##################
#
#           } ,
#
#       "Top videos" =>
#
#         # "The top 1,000 videos from the past week have been viewed #{SUM(video_views)} times."
#
#           { "Top Videos" => videos_games,
#
#           # "How would you like to sort the top videos?""
#
#           ### 1) By view count
#           ### 2) By game name
#           ### 3) By language
#           ### 4) By longest/shortest videos
#
#
#             "View a channel's videos" => videos_channel
#
#             # "What channel's videos would you like to view?"
#
#             ### input = channel_name
#
#             ###################### channels query #####################
#             # "Choose the channel that matches your search."
#             #
#             # List: channel_name, view_count
#             # top X channels sorted by view_count that match the search
#             ###########################################################
#             #
#             ### input = number
#
#           }
#
# }

# directory = information
#
# search(["games","videos","streams","exit"])

# returns the top of the gotten type



# case typex
