class CollisionHandler

    attr_reader :entities

    def initialize
        @entities = []
    end

    def check_collisions
        @entities.each do |current_entity|
            collidable_entities = @entities.select {|other_entity| current_entity.collides_with.include?(other_entity.class) }
            collidable_entities.each do |other_entity|
                if current_entity.y + current_entity.height >= other_entity.y && 
                    current_entity.y <= other_entity.y + other_entity.height &&
                    current_entity.x + current_entity.width >= other_entity.x && 
                    current_entity.x < other_entity.x + other_entity.width
                    current_entity.collide_with(other_entity, "below")
                end
            end
        end
    end
end