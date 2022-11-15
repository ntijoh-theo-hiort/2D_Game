class CollisionHandler

    def initialize
        @entities = []
    end

    def entities
        @entities
    end

    def check_collisions
        @entities.select{|entity| entity.class != Platform}.each do |current_entity|
            @midpoint_x = current_entity.x1 + (current_entity.width / 2)
            @midpoint_y = current_entity.y1 + (current_entity.height / 2)
            @midpoint_x_nextframe = current_entity.x1 + current_entity.x_vel + (current_entity.width / 2)
            @midpoint_y_nextframe = current_entity.y1 + current_entity.y_vel + (current_entity.height / 2)
            @vector_width = @midpoint_x_nextframe - @midpoint_x
            @vector_height = @midpoint_y_nextframe - @midpoint_y

    

            @entities.select{|entity| entity.class != current_entity.class}.each do |other_entity|
                @near_x = 
                @far_x =
                @near_y =
                @far_y = 
                
            end
        end
    end
end





# class CollisionHandler

#     def initialize
#         @entities = []
#     end

#     def entities
#         @entities
#     end

#     def check_collisions
#         @entities.select{|entity| entity.class != Platform}.each do |current_entity|

#             current_entity_nextframe_y1 = current_entity.y1 + current_entity.y_vel
#             current_entity_nextframe_y2 = current_entity.y2 + current_entity.y_vel
#             current_entity_nextframe_x1 = current_entity.x1 + current_entity.x_vel
#             current_entity_nextframe_x2 = current_entity.x2 + current_entity.x_vel

#             @entities.select{|entity| entity.class != current_entity.class}.each do |other_entity|
#                 if  (current_entity_nextframe_y2 > other_entity.y1 && 
#                     current_entity_nextframe_y1 < other_entity.y2 &&
#                     current_entity_nextframe_x2 > other_entity.x1 && 
#                     current_entity_nextframe_x1 < other_entity.x2) ||
#                     (current_entity.y2 == other_entity.y1 && 
#                     current_entity.y1 == other_entity.y2 &&
#                     current_entity.x2 == other_entity.x1 && 
#                     current_entity.x1 == other_entity.x2)

#                     if other_entity.class != Platform
#                         current_entity.collide_with(other_entity, "") 
#                     elsif 
#                         current_entity.collide_with(other_entity, "below")                          
#                         # puts "#{current_entity} collided below #{other_entity}"
#                     elsif
#                         current_entity.collide_with(other_entity, "above")
#                         # puts "#{current_entity} collided above #{other_entity}"
#                     elsif
#                         current_entity.collide_with(other_entity, "left")
#                         # puts "#{current_entity} collided left of #{other_entity}"
#                     elsif
#                         current_entity.collide_with(other_entity, "right")
#                         # puts "#{current_entity} collided right of #{other_entity}"
#                     end
#                 end
#             end
#         end
#     end
# end