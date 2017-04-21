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
          "By viewer count" => { "game_name_streams" => { "stream_name" => "***Open URL" } } ,
          "By channel count" => { "game_name_streams" => { "stream_name" => "***Open URL" } } } ,
        "Top streams playing a game" => { "game_name_streams" => { "stream_name" => "***Open URL" } } } ,

    "Top channels" => {

        "Top channels streaming" => {
            "By viewer count" => { "channel_name" => "***OpenUrl"} ,
            "By channel count" => { "channel_name" => "***OpenUrl"} ,
            "By language" => { "channel_name" => "***OpenUrl"} ,
            "By partners/non-partners" => { "channel_name" => "***OpenUrl"} } ,
        "View a specific channel" => { "channel_name" => "***OpenUrl"} } ,

    "Top streams" => {

        "View top streams" => { "stream_name" => "***OpenUrl"} ,
        "Top games being streamed" => { "game_name_streams" => { "stream_name" => "***Open URL" } } ,
        "Newest/oldest streams" => {
            "newest_streams" => { "stream_name" => "***OpenUrl"} ,
            "oldest_streams" => { "stream_name" => "***OpenUrl"} } } ,

    "Top videos" => {

        "View Top Videos" => {
            "By view count" => { "channel_name" => "***OpenVideoUrl"} ,
            "By game name" => { "channel_name" => "***OpenVideoUrl"} ,
            "By video type" => { "channel_name" => "***OpenVideoUrl"} ,
            "By language" => { "channel_name" => "***OpenVideoUrl"} ,
            "By length of video" => { "channel_name" => "***OpenVideoUrl"} } ,
        "View a channel's videos" => { "channel_name" => "***OpenVideoUrl"} } }



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
