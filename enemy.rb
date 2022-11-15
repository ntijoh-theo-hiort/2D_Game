require_relative("./entity.rb")

class Enemy < Entity
    def initialize(x, y, width, height, window)
        super
        @enemy = Gosu::Image.new("./images/enemy.png")
        @x_vel = 3
        @y_vel = 0
        @flipped = 1
        @gravity = 2
    end

    attr_reader :y_vel
    attr_reader :x_vel

    def collide_with(entity, direction)
		# end
	end

    def update
        if @x1 >= @window.width - @enemy.width    
            @x1 = @window.width - @enemy.width
            @x_vel *= -1
            @flipped *= -1
        elsif @x1 <= 0      #bounces enemy back the other way when it hits the x-axis boundaries
            @x1 = 0
            @x_vel *= -1
            @flipped *= -1
        end

        if !@on_platform
			@y_vel += @gravity         #gravity, basically... if the player is in the air, pull them down
		end
        
        @x1 += @x_vel
		@x2 = @x1 + @enemy.width
		@y1 += @y_vel
		@y2 = @y1 + @enemy.height
    end

    def draw
        @enemy.draw(@flipped < 0 ? @x1 + @enemy.width : @x1, @y1, 0, @flipped, 1.0)
    end
end

class BigEnemy < Enemy
    def initialize
        super
    end

    def draw
    end
end