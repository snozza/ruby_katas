class Rover

  attr_accessor :direction

  def initialize(x=0, y=0, direction='N')
    @x = x
    @y = y
    @direction = direction
  end

  def move(cmds)
    cmds.each do |cmd|
      @x+=1 if cmd == 'f' && @direction == 'N'       
      @x-=1 if cmd == 'b' && @direction == 'N'       
      @x-=1 if cmd == 'f' && @direction == 'S'        
      @x+=1 if cmd == 'b' && @direction == 'S'
      @y+=1 if cmd == 'f' && @direction == 'E'
      @y-=1 if cmd == 'b' && @direction == 'E'
      @y-=1 if cmd == 'f' && @direction == 'W'
      @y+=1 if cmd == 'b' && @direction == 'W'
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

  def position
    [@x, @y]
  end

end