class Entity
    attr_reader :x1, :x2, :y1, :y2, :width, :height

    def initialize(x, y, width, height, window)
        @window = window
        @x1 = x
        @x2 = x + width
        @y1 = y
        @y2 = y + height
        @width = width
        @height = height
    end
end

# myCollid = Collidable.new(0, 0, 10, 10)
# otherCollid = Collidable.new(5, 10, 20, 15)

# myCollid.colliding_left?(otherCollid) # => true or false

# if player.colliding_at_all?(collidables[i])
#   @x = collidables[i].x - @width if @vel_x > 0
#   ... so on
# end

# die if player.colliding_at_all?(monster[i])