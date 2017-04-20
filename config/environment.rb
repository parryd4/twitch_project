
require 'bundler/setup'
Bundler.require

require 'pry'
require 'rake'
require 'active_record'
#require 'yaml/store'
require 'ostruct'
require 'date'
require 'sqlite3'
require 'rest-client'


DBNAME = "twitch"
#
require_relative '../lib/twitchbase.rb'
require_relative '../lib/queries.rb'
#require_relative '../lib/command_line_interface.rb'
Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
#Dir[File.join(File.dirname(__FILE__), "../lib/support", "*.rb")].each {|f| require f}
#Dir[File.join(File.dirname(__FILE__), "../lib/samples", "*.rb")].each {|f| require f}

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/twitch.db"
)

#DBRegistry[ENV["ACTIVE_RECORD_ENV"]].connect!
DB = ActiveRecord::Base.connection
#
# if ENV["ACTIVE_RECORD_ENV"] == "test"
#   ActiveRecord::Migration.verbose = false
# end
