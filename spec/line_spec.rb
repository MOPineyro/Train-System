require 'spec_helper'

describe Line do
  describe '#initialize' do
    it 'creates an instance of Line' do
      test_line = Line.new('red')
      test_line.should be_an_instance_of Line
      test_line.color.should eq 'red'
    end
  end
end
