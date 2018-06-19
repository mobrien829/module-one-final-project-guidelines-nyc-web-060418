require 'bundler/setup'
Bundler.require

# not sure if we need to save the establish_connection to a variable

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/development.sqlite"
)

require_all 'app'
