class Position

  attr_accessor :x, :y

  def initialize(x=0, y=0)
    @x = x
    @y = y
  end

  def get_position
    [@x, @y]
  end

  def set_grid_size(grid_size)
    @grid_size = grid_size
  end

  def is_finite_grid?
    @grid_size != [-1, -1]
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

  def left
    return @y = @grid_size[1] if is_finite_grid? and @y-1 < @grid_size[1] * -1
    @y-=1
  end

  def right
    return @y = 0 - @grid_size[1] if is_finite_grid? and @y+1 > @grid_size[1]
    @y+=1
  end

end
