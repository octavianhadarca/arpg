function aoe_targeting(_radius) : targeting_strategy() constructor {
    radius = _radius;
    preview_instance = pointer_null;
    
    static start = function(_ability, _targeting_manager) {
        self.ability = _ability;
        self.targeting_manager = _targeting_manager;
        
        self.targeting_manager.set_current_strategy(self);
        
        preview_instance = instance_create_depth(mouse_x, mouse_y, 0, obj_preview, {radius : radius});
    }
    
    static update = function() {
        preview_instance.x = mouse_x;
        preview_instance.y = mouse_y;
        
        if (mouse_check_button_pressed(mb_left)) {
            var _targets = ds_list_create();
            
            collision_circle_list(preview_instance.x, preview_instance.y, preview_instance.radius, obj_enemy, false, false, _targets, false);
            
            for (var _i = 0; _i < ds_list_size(_targets); _i++) {
                self.ability.execute(_targets[| _i]);
            }
            
            ds_list_destroy(_targets);
            
            self.targeting_manager.clear_current_strategy();
        }
    }
    
    static cancel = function() {
        instance_destroy(preview_instance);
    }
}