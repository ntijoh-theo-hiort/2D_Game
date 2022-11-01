class Player
    def initialize(window)
        @window = window
        @player = Gosu::Image.new("./images/mushroom.png")
        
        @player_x_vel = 0 
        @player_y_vel = 0
        @player_x = 0 
        @player_y = @window.height - @player.width

        @player_speed = 10
        @max_speed = 30
        @friction = 2

        @jump_height = 30
        @gravity = 2
    end

    def jump
        if @player_y == @window.height - @player.width
            @player_y_vel -= @jump_height
        end
    end

    def move_left
        @player_x_vel -= @player_speed
    end

    def jump_sound
        if @player_y == @window.height - @player.width
            jump_sound = Gosu::Song::new("./audio/#{rand(1..4)}.mp3")
            jump_sound.play
        end
    end

    def move_right
        @player_x_vel += @player_speed
    end

    def update
        jump && jump_sound if Gosu.button_down? Gosu::KB_UP
        move_left if Gosu.button_down? Gosu::KB_LEFT
        move_right if Gosu.button_down? Gosu::KB_RIGHT
        crash_lol if Gosu.button_down? Gosu::KB_C
        
        if @player_x > @window.width - @player.width    
            @player_x = @window.width - @player.width
            @player_x_vel = 0
        elsif @player_x < 0      #keeps player within the x-axis boundaries
            @player_x = 0
            @player_x_vel = 0
        end

        if @player_x_vel > 0
            @player_x_vel -= @friction
        elsif @player_x_vel < 0         #checks if player is going left or right
            @player_x_vel += @friction  #and decelerates each frame, basically friction or gravity for the x-axis
        end 

        if @player_x_vel > @max_speed
            @player_x_vel = @max_speed     #sets a max speed in both directions
        elsif @player_x_vel < @max_speed * -1
            @player_x_vel = @max_speed * -1
        end
        
        if @player_y < @window.height-@player.width
            @player_y_vel += @gravity         #gravity, basically... if the player is in the air, pull them down
        end

        if (@player_y == @window.height-@player.width || @player_y > @window.height-@player.width) && @player_y_vel > 0 #checks if you're on the ground or under the ground, and you're speeding downwards,
            @player_y_vel = 0            #and sets your acceleration to 0 and puts you on the ground
            @player_y = @window.height-@player.width                                     
        end

        if @player_y > @window.height-@player.width
            @player_y = @window.height-@player.width     #checks if you're underground and puts you on the ground
        end

        @player_x += @player_x_vel
        @player_y += @player_y_vel
    end

    def draw
        @player.draw(@player_x, @player_y, 0)
    end
end
