require "gosu"
require_relative("./player.rb")

class TheosPlatformer < Gosu::Window
    def initialize
        super(800,600)
        self.caption = "Theos Awesome Platformer"
        @mushroom = Player.new(self)
    end


    def update
        @mushroom.update
    end

    def draw
        @mushroom.draw
    end
end

game = TheosPlatformer.new
game.show