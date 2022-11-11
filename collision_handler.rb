class CollisionHandler
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
                    current_entity.collide_with(other_entity, "")
                end
            end
        end
    end



# @entities.each do |current_entity|
#     collidable_entities = @entities.select {|other_entity| current_entity.collides_with.include?(other_entity.class) }
#     collidable_entities.each do |other_entity|
#         if current_entity.y2 >= other_entity.y1 && 
#             current_entity.y1 <= other_entity.y2 &&
#             current_entity.x2 >= other_entity.x1 && 
#             current_entity.x1 <= other_entity.x2
#             current_entity.collide_with(other_entity, "below")
#         end
#     end
# end