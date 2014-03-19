require 'spec_helper'

describe Line do
  describe '#initialize' do
    it 'creates an instance of Line' do
      test_line = Line.new({:color =>'red'})
      test_line.should be_an_instance_of Line
      test_line.color.should eq 'red'
    end
  end

  describe '.all' do
    it 'is an empty array at first' do
      Line.all.should eq []
    end
  end

  describe '.create' do
    it 'Creates a new Line object' do
      test_line = Line.create('red')
      test_line.should be_an_instance_of Line
    end
  end

  describe '#save' do
    it 'saves a line to the class' do
      test_line = Line.create('blue')
      Line.all.should eq [test_line]
    end
  end

  describe '==' do
    it 'compares to lines to see if they are the same' do
      test_line1 = Line.new({:color =>'red', :id => 1})
      test_line2 = Line.new({:color =>'red', :id => 1})
      test_line1.should eq test_line2
    end
  end

end
