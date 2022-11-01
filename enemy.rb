class Enemy
    def initialize(window, difficulty)
        @window = window
        @enemy = Gosu::Image.new("./images/enemy.png")
        @enemy_x_vel = difficulty
        @enemy_x = (window.width / 2) - (@enemy.width / 2)
        @enemy_y = 100
    end

    def update
        if @enemy_x > @window.width - @enemy.width    
            @enemy_x = @window.width - @enemy.width
            @enemy_x_vel *= -1
        elsif @enemy_x < 0      #bounces enemy back the other way when it hits the x-axis boundaries
            @enemy_x = 0
            @enemy_x_vel *= -1
        end
        
        @enemy_x += @enemy_x_vel
    end

    def draw
        @enemy.draw(@enemy_x, @enemy_y, 0)
    end
end

class BigEnemy < Enemy
    def initialize
        super
    end
end