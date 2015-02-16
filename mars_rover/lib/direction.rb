class Direction

  class NorthDirection

    def forward(position)
      position.up()
    end

    def backward(position)
      position.down()
    end

    def turn_left
      Direction.West
    end

    def turn_right
      Direction.East
    end

  end

  class SouthDirection

    def forward(position)
      position.down()
    end

    def backward(position)
      position.up()
    end

    def turn_left
      Direction.East
    end

    def turn_right
      Direction.West
    end

  end

  class EastDirection

    def forward(position)
      position.right()
    end

    def backward(position)
      position.left()
    end

    def turn_left
      Direction.North
    end

    def turn_right
      Direction.South
    end

  end

  class WestDirection

    def forward(position)
      position.left()
    end

    def backward(position)
      position.right()
    end

    def turn_left
      Direction.South
    end

    def turn_right
      Direction.North
    end

  end

  def self.North
    NorthDirection.new
  end

  def self.South
    SouthDirection.new
  end

  def self.East
    EastDirecton.new
  end

  def self.West
    WestDirection.new
  end

end