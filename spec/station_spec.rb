require 'spec_helper'

describe Station do
  describe '#initialize' do
    it 'creates an instance of Station' do
      test_station = Station.new({:name =>'Columbia'})
      test_station.should be_an_instance_of Station
      test_station.name.should eq 'Columbia'
    end
  end

  describe '.all' do
    it 'is an empty array at first' do
      Station.all.should eq []
    end
  end

  describe '.create' do
    it 'Creates a new Station object' do
      test_station = Station.create('Brooklyn')
      test_station.should be_an_instance_of Station
    end
  end

  describe '#update' do
    it 'updates the name of a station instance' do
      test_station = Station.create('Tim Sq')
      test_station.update("Time Square")
      test_station.name.should eq "Time Square"
      Station.all.first.name.should eq "Time Square"
    end
  end

  describe '#delete' do
    it 'removes a station from the class.all and database' do
      test_station = Station.create('Dyckman')
      test_station.delete
      Station.all.first.should eq nil
    end
  end

  describe '#save' do
    it 'saves a station to the class' do
      test_station = Station.create('Time Square')
      Station.all.should eq [test_station]
    end
  end

  describe '==' do
    it 'compares to stations to see if they are the same' do
      test_station1 = Station.new({:name =>'Columbia', :id => 1})
      test_station2 = Station.new({:name =>'Columbia', :id => 1})
      test_station1.should eq test_station2
    end
  end

end
