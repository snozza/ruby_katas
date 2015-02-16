require_relative 'position'

class Rover

  attr_accessor :direction

  def initialize(position=Position.new, direction='N')
    @position = position
    @direction = direction
  end

  def move(cmds)
    cmds.each do |cmd|
      @position.x+=1 if cmd == 'f' && @direction == 'N'       
      @position.x-=1 if cmd == 'b' && @direction == 'N'       
      @position.x-=1 if cmd == 'f' && @direction == 'S'        
      @position.x+=1 if cmd == 'b' && @direction == 'S'
      @position.y+=1 if cmd == 'f' && @direction == 'E'
      @position.y-=1 if cmd == 'b' && @direction == 'E'
      @position.y-=1 if cmd == 'f' && @direction == 'W'
      @position.y+=1 if cmd == 'b' && @direction == 'W'
      change_direction('r') if cmd == 'r'
      change_direction('l') if cmd == 'l'
    end
  end

  def change_direction(cmd)
    @direction = 'W' if cmd == 'r' && direction == 'S'
    @direction = 'E' if cmd == 'l' && direction == 'S'
    @direction = 'E' if cmd == 'r' && direction == 'N'
    @direction = 'W' if cmd == 'l' && direction == 'N'
  end

  def get_position
    @position.get_position
  end

end
