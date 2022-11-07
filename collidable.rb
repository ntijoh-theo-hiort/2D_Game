class Collidable
    attr_accessor :x, :y, :width, :height

    def initialize(x, y, width, height)
        @x = x
        @y = y
        @width = width
        @height = height
    end

    def colliding_at_all?(obj)
        return @y + @height >= obj.y && @y <= obj.y + obj.height && # same y
               @x + @width >= obj.x && @x < obj.x + obj.width  # x collision on right
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