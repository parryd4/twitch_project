#require_relative '../lib/api_communicator.rb'
#require_relative '../lib/command_line_interface.rb'
require_relative '../config/environment.rb'

$total_games = Twitchbase.make_hash_from_url("games/top")["_total"]
$total_streams = Twitchbase.make_hash_from_url("streams")["_total"]
$total_viewers = Game.sum(:viewers)
puts  "There are #{$total_viewers} viewers watching #{$total_games} different games across #{$total_streams} streams."
