require "gosu"
require_relative("./collision_handler.rb")
require_relative("./player.rb")
require_relative("./enemy.rb")
require_relative("./platform.rb")

class TheosPlatformer < Gosu::Window
    def initialize
        super(800,600)
        self.caption = "Theos Awesome Platformer"
        @collision_handler = CollisionHandler.new
        @player = Player.new(50, 50, 20, 20, self)
        # @collision_handler.entities << @player
        @enemy = Enemy.new(390, 550, 20, 20, self)
        # @collision_handler.entities << @enemy
        #@platform = Platform.new
    end

    def update
        @player.update
        @enemy.update
    end

    def draw 
        if @player.dead == false
            # Gosu.draw_rect(0, 0, self.width, self.height, Gosu::Color.argb(0xff_ffffff), z = 0, mode = :default)
            @player.draw            #above line is background ^^^
            @enemy.draw
            # Gosu.draw_rect(0, 0, 300, 75, Gosu::Color.argb(0xff_000000), z = 0, mode = :default)
            # Gosu.draw_rect(500, 0, 300, 75, Gosu::Color.argb(0xff_000000), z = 0, mode = :default)
            # Gosu.draw_rect(200, 150, 400, 50, Gosu::Color.argb(0xff_000000), z = 0, mode = :default)
            # Gosu.draw_rect(0, 275, 250, 50, Gosu::Color.argb(0xff_000000), z = 0, mode = :default)
            # Gosu.draw_rect(550, 275, 250, 50, Gosu::Color.argb(0xff_000000), z = 0, mode = :default)
            # Gosu.draw_rect(200, 400, 400, 50, Gosu::Color.argb(0xff_000000), z = 0, mode = :default)
            # Gosu.draw_rect(0, 525, 300, 75, Gosu::Color.argb(0xff_000000), z = 0, mode = :default)
            # Gosu.draw_rect(500, 525, 300, 75, Gosu::Color.argb(0xff_000000), z = 0, mode = :default)
        else
            Gosu::Font.new(20).draw_text("death", 0, 0, 0, scale_x = 1, scale_y = 1, color = 0xff_ffffff, mode = :default)
        end
    end
end

game = TheosPlatformer.new
game.show