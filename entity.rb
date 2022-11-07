class Entity
    attr_accessor :x, :y, :width, :height, :collides_with

    def initialize(x, y, width, height, window, collides_with)
        @window = window
        @collides_with = collides_with
        @x = x
        @y = y
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