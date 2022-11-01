require "gosu"
require_relative("./player.rb")
require_relative("./enemy.rb")

class TheosPlatformer < Gosu::Window
    def initialize
        difficulty = 3
        super(800,600)
        self.caption = "Theos Awesome Platformer"
        @player = Player.new(self)
        @enemy = Enemy.new(self, difficulty)
    end

    # def death
    #     if
    #     end
    # end

    def update
        @player.update
        @enemy.update
    end

    def draw
        Gosu.draw_rect(0, 0, self.width, self.height, Gosu::Color.argb(0xff_ffffff), z = 0, mode = :default)
        @player.draw            #above line is background ^^^
        @enemy.draw
    end
end

game = TheosPlatformer.new
game.show