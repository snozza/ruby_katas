require_relative 'position'
require_relative 'direction'

class Rover

  attr_accessor :direction

  def initialize(position=Position.new, direction=Direction.North, grid_size=[-1, -1])
    @position = position
    @direction = direction
    @position.set_grid_size(grid_size)
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
