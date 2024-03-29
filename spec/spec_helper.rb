require 'rspec'
require 'pg'
require 'line'
require 'station'
require 'stop'
require 'pry'

DB = PG.connect({:dbname => 'train_system_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lines *;")
    DB.exec("DELETE FROM stations *;")
    DB.exec("DELETE FROM lines_stations *;")
  end
end
