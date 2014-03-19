require 'rspec'
require 'pg'
require 'line'

DB = PG.connect({:dbname => 'train_system_test'})

