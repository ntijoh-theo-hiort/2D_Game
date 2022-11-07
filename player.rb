#TODO:

#change audio
#work on background music
#

class Player
	def initialize(window)
		@window = window
		@animation = [Gosu::Image.new("./images/frog1.png"), Gosu::Image.new("./images/frog2.png"), Gosu::Image.new("./images/frog3.png"), Gosu::Image.new("./images/frog4.png")]
		@player = @animation[0]
		@animation_index = 0
		@flipped = 1

		@player_x_vel = 0 
		@player_y_vel = 0
		@player_x = 0 
		@player_y = @window.height - @player.width

		@player_speed = 6
		@max_speed = 16
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
			#jump_sound = Gosu::Song::new("./audio/#{rand(1..4)}.mp3")
			#jump_sound.play
		end
	end

	def move_right
		@player_x_vel += @player_speed
	end

	def animate
		if @animation_index != 3 
			@animation_index += 1
		else
			@animation_index = 0 
		end

		@player = @animation[@animation_index]
	end

	def update
			#&& jump_sound
		jump if Gosu.button_down? Gosu::KB_UP
		move_left && animate && @flipped = -1.0 if Gosu.button_down? Gosu::KB_LEFT
		move_right && animate && @flipped = 1.0 if Gosu.button_down? Gosu::KB_RIGHT
		crash_lol if Gosu.button_down? Gosu::KB_C
		
		if @player_x_vel > 0
			@player_x_vel -= @friction
		elsif @player_x_vel < 0         #checks if player is going left or right
			@player_x_vel += @friction  #and decelerates each frame, basically friction for the x-axis
		end 

		if @player_x_vel > @max_speed
			@player_x_vel = @max_speed     #sets a max speed in both directions
		elsif @player_x_vel < @max_speed * -1
			@player_x_vel = @max_speed * -1
		end
		
		if @player_y < @window.height-@player.width
			@player_y_vel += @gravity         #gravity, basically... if the player is in the air, pull them down
		end

        if @player_x_vel == 0
            @player = @animation[0]
        end

		@player_x += @player_x_vel
		@player_y += @player_y_vel

		if @player_x >= @window.width - @player.width    
			@player_x = @window.width - @player.width
		elsif @player_x <= 0      #keeps player within the x-axis boundaries
			@player_x = 0
		end

		if @player_y >= @window.height-@player.width && @player_y_vel > 0 #checks if you're on the ground and speeding downwards
            @player_y_vel = 0
			@player_y = @window.height-@player.width
		end

	end

	# b ? x : y
	# if b then x else y
	
	def draw
		@player.draw(@flipped < 0 ? @player_x + @player.width : @player_x, @player_y, 0, @flipped, 1.0)
	end
end