require_relative 'position'
require_relative 'direction'

class Rover

  attr_accessor :direction

  def initialize(position=Position.new, direction=Direction.North)
    @position = position
    @direction = direction
  end

  def move(cmds)
    cmds.each do |cmd|
      @direction.forward(@position) if cmd == 'f'
      @direction.backward(@position) if cmd == 'b'
      @direction = @direction.turn_left if cmd == 'l'
      @direction = @direction.turn_right if cmd == 'r'
    end
  end

  def get_position
    @position.get_position
  end

end
