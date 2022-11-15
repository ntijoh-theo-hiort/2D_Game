require_relative ("./entity.rb")
require_relative ("./collision_handler.rb")

class Player < Entity
	def initialize(x,y,width,height,window)
		super	
		@animation = [Gosu::Image.new("./images/frog1.png"), Gosu::Image.new("./images/frog2.png"), Gosu::Image.new("./images/frog3.png"), Gosu::Image.new("./images/frog4.png")]
		@player = @animation[0]
		@animation_index = 0
		@flipped = 1

		@x_vel = 0 
		@y_vel = 0

		@player_speed = 6
		@max_speed = 18
		@friction = 2

		@jump_height = 22
		@gravity = 2

		@dead = false
		@on_platform = false
	end

	attr_reader :dead
	attr_reader :x_vel
	attr_reader :y_vel

	def collide_with(entity, direction)
		if entity.class == Enemy
			@dead = true
		end

		if entity.class == Platform
			if direction == "below"
				@on_platform = false
				@y1 = entity.y2
				@y_vel = 0 
			elsif direction == "above"
				@on_platform = true
				@y1 = entity.y1 - @width
				if @y_vel > 0 
					@y_vel = 0
				end
			elsif direction == "left"
				@on_platform = false
				@x2 = entity.x1
				x_vel = 0
			elsif direction == "right"
				@on_platform = false
				@x1 = entity.x2
				@x_vel = 0 
			end
		end

		if entity.class == Platform && direction == ""
			puts "something went wrong with platform direction"
		end

		if entity.class == Enemy && direction != ""
			puts "something went wrong with enemy direction"
		end
	end

	def jump
		if @on_platform
			@y_vel -= @jump_height
		end
	end

	def move_left
		@x_vel -= @player_speed
	end

	def jump_sound
		if @y1 == @window.height - @player.width
			#jump_sound = Gosu::Song::new("./audio/#{rand(1..4)}.mp3")
			#jump_sound.play
		end
	end

	def move_right
		@x_vel += @player_speed
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
		
		if @x_vel > 0
			@x_vel -= @friction
		elsif @x_vel < 0         #checks if player is going left or right
			@x_vel += @friction  #and decelerates each frame, basically friction for the x-axis
		end 

		if @x_vel > @max_speed
			@x_vel = @max_speed     #sets a max speed in both directions
		elsif @x_vel < @max_speed * -1
			@x_vel = @max_speed * -1
		end
		
		if !@on_platform
			@y_vel += @gravity         #gravity, basically... if the player is in the air, pull them down
		end

		@on_platform = false

        if @x_vel == 0
            @player = @animation[0]
        end

		@x1 += @x_vel
		@y1 += @y_vel

		if @x1 >= @window.width - @player.width    
			@x1 = @window.width - @player.width
		elsif @x1 <= 0      #keeps player within the x-axis boundaries
			@x1 = 0
		end

		@x2 = @x1 + @width
		@y2 = @y1 + @height

		# puts @y_vel
		# puts @on_platform
	end

	# b ? x : y
	# if b then x else y
	
	def draw
		@player.draw(@flipped < 0 ? @x2 : @x1, @y1, 0, @flipped, 1.0)
	end
end