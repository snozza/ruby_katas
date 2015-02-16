class Position

  attr_accessor :x, :y

  def initialize(x=0, y=0)
    @x = x
    @y = y
  end

  def get_position
    [@x, @y]
  end

  def up
    @x+=1
  end

  def down
    @x-=1
  end

  def left
    @y-=1
  end

  def right
    @y+=1
  end

end