require 'spec_helper'

describe Stop do
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

  describe '#save' do
    it 'saves a stop to the class' do
      test_stop = Stop.new({:station_id =>5, :line_id => 4})
      test_stop.save
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
