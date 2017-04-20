require_relative '../config/environment'
require_relative './modules.rb'

include Helper

def welcome

  puts "Welcome to the Twitch search API!"
  puts "Here you can view information about"
  puts "Twitch's current top games, videos,"
  puts "streams, and much more!"
  puts
  puts "Please hold while we seed the database."
  puts
  seed
  help

end

  Information = {

      "Top games" =>

          # "There are #{total_viewers} viewers watching #{total_games} different games across #{total_channels} channels.""

        { "Top games being streamed" => games_top,

          # "How would you like to sort the top games?""

          ### 1) By viewer count
          ### 2) By channel count

          #################### top games query ####################
          # "These are the top games sorted by view/channel_count:"
          #
          # List: game_name, view/channel_count, channel/view_count
          # top X games sorted by view_count or channel_count
          #########################################################

          # "Type in a number to see that game's streams."

          ### input = number

          #################### top streams query ####################
          # "There are #{game_viewers} viewers watching #{game_name} streams."
          #
          # List: channel_name, view_count, channel_status (char_limited)
          # top X streams sorted by view_count limited to the game_name
          ###########################################################
          #
          # Type in a number to see that stream's information.
          #
          ### input = number
          #
          # What would you like to do?
          #
          ################### stream/channel query ##################
          # "Here is the information about the stream:"
          #
          # List - stream info
          #       channel_name
          #       stream_started
          #       channel_status (char_limited)
          #       game_name
          #       view_count
          # List - channel info
          #       partner
          #       mature
          #       teams
          #       views
          #       followers
          ###########################################################
          #
          ### 1) Open channel's stream (sends ["channel"]["url"])
          ### 2) Show channel's videos (TBD)
          ### 3) Show streamers team info (TBD)

          "Top channels playing a game" => games_channels

          # Which game would you like to see?

          ### input = game_name

          #################### top streams query ####################
          # "There are #{game_viewers} viewers watching #{game_name} streams."
          #
          # List: channel_name, view_count, channel_status (char_limited)
          # top X streams sorted by view_count limited to the game_name
          ###########################################################
          #
          # < above query

          } ,

      "Top channels" =>

          # if $seed_all == true
          #   "There are currently #{stream_total} channels streaming."
          # else
          #   "There are currently #{stream_total} channels streaming, however any queries will only be done on the top 1,000 channel's streams that are currently seeded. Type 'seed_all' if you would like to seed every current stream's channels (remember, this process may take up to 6 minutes to complete.)"

        { "Top channels" => channels_top,

          # "How would you like to sort the top games?""

          ### 1) By view count
          ### 2) By follower count
          ### 3) By language (can be a sub query from 1/2)
          ### 4) By partners/non-partners (can be a sub query from 1/2)

          "View a channel" => channels_search

          # Which channel would you like to view?

          ### input = channel_name (return 10 channels nearest that name)

          ################### stream/channel query ##################

      "Top streams" =>

        # if $seed_all == true
        #   "There are currently #{stream_total} streams."
        # else
        #   "There are currently #{stream_total} streams, however any queries will only be done on the top 1,000 streams that are currently seeded. Type 'seed_all' if you would like to seed every current stream (remember, this process may take up to 6 minutes to complete.)"

        { "Top streams" => streams_top,

          #################### top streams query ####################
          # "These are the top streams:"
          #
          # List: channel_name, view_count, channel_status (char_limited)
          # top X streams sorted by view_count
          ###########################################################
          #
          # < above query

          "Top games being streamed" => games_top,

          # < above query

          "Newest/oldest streams" => streams_created

          # "How would you like to sort the top streams?"

          ### 1) Newest streams (most recently started)
          ### 2) Oldest streams (longest running)

          ################### newest streams query ##################
          # "These are the most recently started streams:"
          #
          # List: channel_name, view_count, created_at
          # bottom X streams sorted by created_at
          ###########################################################
          # or
          ################### oldest streams query ##################
          # "These are the longest running streams:"
          #
          # List: channel_name, view_count, created_at
          # top X streams sorted by created_at
          ###########################################################
          #
          # Type in a number to see that stream's information.
          #
          ### input = number
          #
          # What would you like to do?
          #
          ################### stream/channel query ##################

          } ,

      "Top videos" => ["Top games",
                       "Top channels",
                       "Top languages",
                       "Top views",
                       "Longest/Shortest Videos" ]
              }



directory = information

search(["games","videos","streams","exit"])

# returns the top of the gotten type



# case typex
