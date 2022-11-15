class Platform < Entity
    def initialize(x,y,width,height,window)
        super
    end    

    def draw
        Gosu.draw_rect(self.x1, self.y1, self.width, self.height, Gosu::Color.argb(0xff_000000), z = 0, mode = :default)
    end
end