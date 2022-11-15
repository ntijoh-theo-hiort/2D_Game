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
        @player = Player.new(0, 500, 20, 20, self)
        @collision_handler.entities << @player
        @enemy1 = Enemy.new(390, 550, 20, 20, self)
        @collision_handler.entities << @enemy1
        @enemy2 = Enemy.new(800, 550, 20, 20, self)
        @collision_handler.entities << @enemy2
        
        @platform1 = Platform.new(0, 0, 300, 75, self)
        @collision_handler.entities << @platform1
        @platform2 = Platform.new(500, 0, 300, 75, self)
        @collision_handler.entities << @platform2
        @platform3 = Platform.new(200, 150, 400, 50, self)
        @collision_handler.entities << @platform3
        @platform4 = Platform.new(0, 275, 250, 50, self)       #bättre sätt?
        @collision_handler.entities << @platform4
        @platform5 = Platform.new(550, 275, 250, 50, self)
        @collision_handler.entities << @platform5
        @platform6 = Platform.new(200, 400, 400, 50, self)
        @collision_handler.entities << @platform6
        @platform7 = Platform.new(0, 525, 300, 75, self)
        @collision_handler.entities << @platform7
        @platform8 = Platform.new(500, 525, 300, 75, self)
        @collision_handler.entities << @platform8


        #@platform = Platform.new
    end

    def update
        puts "framestart"
        # @collision_handler.check_collisions
        @player.update
        @enemy1.update
        @enemy2.update
        @collision_handler.check_collisions
        sleep(0)
    end

    def draw 
        if @player.dead
            Gosu::Font.new(20).draw_text("death", 0, 0, 0, scale_x = 1, scale_y = 1, color = 0xff_ffffff, mode = :default)
        else
            Gosu.draw_rect(0, 0, self.width, self.height, Gosu::Color.argb(0xff_ffffff), z = 0, mode = :default)
            @player.draw            #above line is background ^^^
            @enemy1.draw
            @enemy2.draw
            @platform1.draw
            @platform2.draw
            @platform3.draw
            @platform4.draw
            @platform5.draw
            @platform6.draw
            @platform7.draw
            @platform8.draw
        end
    end
end

game = TheosPlatformer.new
game.show