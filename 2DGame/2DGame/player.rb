class Player
    def initialize(window)
        @window = window
        @player = Gosu::Image.new("./images/mushroom.png")
        
        @x_vel = 0 
        @y_vel = 0
        @player_square_size = @player.width
        @x = 0 
        @y = @window.height - @player_square_size

        @player_speed = 10
        @max_speed = 30
        @friction = 2

        @jump_height = 30
        @gravity = 2
    end

    def jump
        if @y == @window.height - @player_square_size
            @y_vel -= @jump_height
        end
    end

    def move_left
        @x_vel -= @player_speed
    end

    def jump_sound
        if @y == @window.height - @player_square_size
            jump_sound = Gosu::Song::new("./audio/#{rand(1..4)}.mp3")
            jump_sound.play
        end
    end

    def move_right
        @x_vel += @player_speed
    end

    def update
        jump && jump_sound if Gosu.button_down? Gosu::KB_UP
        move_left if Gosu.button_down? Gosu::KB_LEFT
        crouch if Gosu.button_down? Gosu::KB_DOWN
        move_right if Gosu.button_down? Gosu::KB_RIGHT
        
        if @x > @window.width - @player_square_size    
            @x = @window.width - @player_square_size
            @x_vel = 0
        elsif @x < 0      #keeps player within the x-axis boundaries
            @x = 0
            @x_vel = 0
        end

        if @x_vel > 0
            @x_vel -= @friction
        elsif @x_vel < 0         #checks if player is going left or right
            @x_vel += @friction  #and decelerates each frame, basically friction or gravity for the x-axis
        end 

        if @x_vel > @max_speed
            @x_vel = @max_speed     #sets a max speed in both directions
        elsif @x_vel < @max_speed * -1
            @x_vel = @max_speed * -1
        end
        
        if @y < @window.height-@player_square_size
            @y_vel += @gravity         #gravity, basically... if the player is in the air, pull them down
        end

        if (@y == @window.height-@player_square_size || @y > @window.height-@player_square_size) && @y_vel > 0 #checks if you're on the ground or under the ground, and you're speeding downwards,
            @y_vel = 0            #and sets your acceleration to 0 and puts you on the ground
            @y = @window.height-@player_square_size                                     
        end

        if @y > @window.height-@player_square_size
            @y = @window.height-@player_square_size     #checks if you're underground and puts you on the ground
        end

        @x += @x_vel
        @y += @y_vel
    end

    def draw
        @player.draw(@x, @y, 0)
    end
end
