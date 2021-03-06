require 'rover'
require 'position'

describe Rover do

  context('upon initilization') do

    it('has a default position and a direction') do
      rover = Rover.new
      expect(rover.get_position).to eql [0, 0]
      expect(rover.direction.class).to eql Direction.North.class
    end

    it('can accept initial values') do
      rover = Rover.new(Position.new(10, 10), 'S')
      expect(rover.get_position).to eql [10, 10]
      expect(rover.direction).to eql 'S'
    end

  end

  context('Moving') do

    let(:rover) { Rover.new }

    it('can move one forward facing north') do
      rover.move(['f'])
      expect(rover.get_position).to eql [1, 0]
    end

    it('can move one forward one backward facing north') do
      rover.move(['f', 'b'])
      expect(rover.get_position).to eql [0, 0]
    end

    it('can move one forward one backward turn left facing north') do
      rover.move(['f', 'l', 'b'])
      expect(rover.get_position).to eql [1, 1]
    end

    it('can move two forward two backward facing south') do
      rover = Rover.new(Position.new, Direction.South)
      rover.move(['f', 'b', 'b'])
      expect(rover.get_position).to eql [1, 0]
    end

    it('can move one forward one backward turn right facing south') do
      rover = Rover.new(Position.new, Direction.South)
      rover.move(['f', 'r', 'b'])
      expect(rover.get_position).to eql [-1, 1]
    end

    it('can move one forward two backward turn left facing west') do
      rover = Rover.new(Position.new, Direction.West)
      rover.move(['f', 'r', 'b', 'b'])
      expect(rover.get_position).to eql [-2, -1]
    end

    it('can move one forward two backward turn right facing east') do
      rover = Rover.new(Position.new, Direction.East)
      rover.move(['f', 'l', 'b', 'b'])
      expect(rover.get_position).to eql [-2, 1]
    end

    it('moves as normal on a finite grid') do
      rover = Rover.new(Position.new(10, 10), Direction.West, [20, 20])
      rover.move(['f', 'f'])
      expect(rover.get_position).to eql [10, 8]
    end

    it('wraps around finite grid when moving east') do
      rover = Rover.new(Position.new(10, 10), Direction.East, [10, 10])
      rover.move(['f', 'f', 'f'])
      expect(rover.get_position).to eql [10, -8]
    end

    it 'wraps around finite grid when moving west' do
      rover = Rover.new(Position.new(20, -30), Direction.West, [30, 30])
      rover.move(['f', 'f'])
      expect(rover.get_position).to eql [20, 29]
    end
  end

end
