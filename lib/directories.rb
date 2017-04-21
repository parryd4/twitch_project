
# { "first_directory" => { message: "Text",
#                  query: method,
#                  next_directory: => { "name" => etc. } }
#
#
#
#
# { "first_directory" => { "next direcory" => { "next directory" => "URL" } } }
#
# if Directories["first_directory"]["next directory"] do {this} end


Directories = {

    "Top games" => {

        "Top games being streamed" => {
          "Top games by viewer count" => { "Top game streams" => { "Stream info" => "Open stream" } } ,
          "Top games by channel count" => { "Top game streams" => { "Stream info" => "Open stream" } } } ,
        "Top streams playing a game" => { "Top game streams" => { "Stream info" => "Open stream" } } } ,

    "Top channels" => {

        "Top channels streaming" => {
            "Top channels by viewer count" => { "Channel info" => "Open channel"} ,
            "Top channels by follower count" => { "Channel info" => "Open channel"} ,
            "Top channels by language" => { "Channel info" => "Open channel"} ,
            "Top channels by partners/non-partners" => { "Channel info" => "Open channel"} } ,
        "Newest/oldest channels" => {
            "Newest channels" => { "Channel info" => "Open channel"} ,
            "Oldest channels" => { "Channel info" => "Open channel"} } ,
        "View a specific channel" => { "Channel info" => "Open channel"} } ,

    "Top streams" => {

        "View top streams" => { "Stream info" => "Open stream"} ,
        "Top games being streamed" => { "Top game streams" => { "Stream info" => "Open stream" } } ,
        "Newest/oldest streams" => {
            "Newest streams" => { "Stream info" => "Open stream"} ,
            "Oldest streams" => { "Stream info" => "Open stream"} } } ,

    "Top videos" => {

        "View top videos" => {
            "Top videos by view count" => { "Video's channel info" => "Open channel's videos"} ,
            "Top videos by game name" => { "Video's channel info" => "Open channel's videos"} ,
            "Top videos by video type" => { "Video's channel info" => "Open channel's videos"} ,
            "Top videos by language" => { "Video's channel info" => "Open channel's videos"} ,
            "Longest videos" => { "Video's channel info" => "Open channel's videos"} } ,
        "View a channel's videos" => { "Video's channel info" => "Open channel's videos"} } }



# Directories = {
#
#     [name: "Top games", query: "Queries.games_top_viewers"] => {
#       [name: "Top games being streamed", query: "g_query"] => {
#         [name: "By viewer count", query: "query"] => {
#           [name: "game_name_streams", query: "query"] => {
#             [name: "stream_name", query: "query"] => "***Open URL" } } ,
#         [name: "By channel count", query: "query"] => {
#           [name: "game_name_streams", query: "query"] => {
#             [name: "stream_name", query: "query"] => "***Open URL" } } } ,
#       [name: "Top streams playing a game", query: "query"] => {
#         [name: "game_name_streams", query: "query"] => {
#           [name: "stream_name", query: "query"] => "***Open URL" } } } ,
#
#     [name: "Top channels", query: "d_query"] => {
#         [name: "Top channels streaming", query: "query"] => {
#           [name: "By viewer count", query: "query"] => {
#             [name: "channel_name", query: "query"] => "***OpenUrl"} ,
#           [name: "By channel count", query: "query"] => {
#             [name: "channel_name", query: "query"] => "***OpenUrl"} ,
#           [name: "By language", query: "query"] => {
#             [name: "channel_name", query: "query"] => "***OpenUrl"} ,
#           [name: "By partners/non-partners", query: "query"] => {
#             [name: "channel_name", query: "query"] => "***OpenUrl"} } ,
#         [name: "View a specific channel", query: "query"] => {
#           [name: "channel_name", query: "query"] => "***OpenUrl"} } ,
#
#     [name: "Top streams", query: "d_query"] => {
#       [name: "View top streams", query: "query"] => {
#         [name: "stream_name", query: "query"] => "***OpenUrl"} ,
#       [name: "Top games being streamed", query: "query"] => {
#         [name: "game_name_streams", query: "query"] => {
#           [name: "stream_name", query: "query"] => "***Open URL" } } ,
#       [name: "Newest/oldest streams", query: "query"] => {
#         [name: "newest_streams", query: "query"] => {
#           [name: "stream_name", query: "query"] => "***OpenUrl"} ,
#         [name: "oldest_streams", query: "query"] => {
#           [name: "stream_name", query: "query"] => "***OpenUrl"} } } ,
#
#     [name: "Top videos", query: "d_query"] => {
#       [name: "View Top Videos", query: "query"] => {
#         [name: "By view count", query: "query"] => {
#           [name: "channel_name", query: "query"] => "***OpenVideoUrl"} ,
#         [name: "By game name", query: "query"] => {
#           [name: "channel_name", query: "query"] => "***OpenVideoUrl"} ,
#         [name: "By video type", query: "query"] => {
#           [name: "channel_name", query: "query"] => "***OpenVideoUrl"} ,
#         [name: "By language", query: "query"] => {
#           [name: "channel_name", query: "query"] => "***OpenVideoUrl"} ,
#         [name: "By length of video", query: "query"] => {
#           [name: "channel_name", query: "query"] => "***OpenVideoUrl"} } ,
#       [name: "View a channel's videos", query: "query"] => {
#         [name: "channel_name", query: "query"] => "***OpenVideoUrl"} } }
