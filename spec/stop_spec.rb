require 'spec_helper'

describe Stop do
  #### TEST LINES / STATIONS ####
  Station.create('42nd St')
  Station.create('Houston')

  Line.create('red')
  Line.create('yellow')
  ###############################

  describe '#initialize' do
    it 'creates an instance of Stop' do
      test_stop = Stop.new({:station_id =>3, :line_id => 6})
      test_stop.should be_an_instance_of Stop
      test_stop.station_id.should eq 3
    end
  end

  describe '.all' do
    it 'is an empty array at first' do
      Stop.all.should eq []
    end
  end

  describe '.create' do
    it 'creates a Stop object' do
      #### TEST LINES / STATIONS ####
      Station.create('42nd St')
      Station.create('Houston')

      Line.create('red')
      Line.create('yellow')
      ###############################
      test_stop = Stop.create('42nd St','yellow')
      test_stop.should be_an_instance_of Stop
    end
  end

  describe '#delete' do
    it 'removes a stop from class.all and the database' do
      #### TEST LINES / STATIONS ####
      Station.create('42nd St')
      Station.create('Houston')

      Line.create('red')
      Line.create('yellow')
      ###############################
      test_stop1 = Stop.create('Houston','yellow')
      test_stop2 = Stop.create('42nd St','red')
      test_stop2.delete
      Stop.all.should eq [test_stop1]
    end
  end

  describe '#save' do
    it 'saves a stop to the class' do
      #### TEST LINES / STATIONS ####
      Station.create('42nd St')
      Station.create('Houston')

      Line.create('red')
      Line.create('yellow')
      ###############################
      test_stop = Stop.create('Houston','red')
      Stop.all.should eq [test_stop]
    end
  end

  describe '==' do
    it 'compares to stops to see if they are the same' do
      test_stop1 = Stop.new({:station_id =>3, :line_id => 1})
      test_stop2 = Stop.new({:station_id =>3, :line_id => 1})
      test_stop1.should eq test_stop2
    end
  end

end
