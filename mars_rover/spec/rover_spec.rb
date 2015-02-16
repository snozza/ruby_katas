require 'rover'

describe Rover do

  context('upon initilization') do

    it('has a default position and a direction') do
      rover = Rover.new
      expect(rover.position).to eql [0, 0]
      expect(rover.direction).to eql 'N'
    end

    it('can accept initial values') do
      rover = Rover.new(10, 10, 'S')
      expect(rover.position).to eql [10, 10]
      expect(rover.direction).to eql 'S'
    end

  end

  context('Moving') do

    let(:rover) { Rover.new }

    it('can move one forward facing north') do
      rover.move(['f'])
      expect(rover.position).to eql [1, 0]
    end

    it('can move one forward one backward facing north') do
      rover.move(['f', 'b'])
      expect(rover.position).to eql [0, 0]
    end

    it('can move one forward one backward turn left facing north') do
      rover.move(['f', 'l', 'b'])
      expect(rover.position).to eql [1, 1]
    end

    it('can move two forward two backward facing south') do
      rover = Rover.new(0, 0, 'S')
      rover.move(['f', 'b', 'b'])
      expect(rover.position).to eql [1, 0]
    end

    it('can move one forward one backward turn right facing south') do
      rover = Rover.new(0, 0, 'S')
      rover.move(['f', 'r', 'b'])
      expect(rover.position).to eql [-1, 1]
    end
  end

end