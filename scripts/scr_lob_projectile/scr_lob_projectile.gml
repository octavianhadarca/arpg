function lob_projectile(_this, _flight_time, _flight_max_height, _target_x, _target_y, _radius) : deliverer_behaviour(_this) constructor {
    with (owner) {
        sprite_index = spr_projectile;
        flight_time = _flight_time;
        flight_max_height = _flight_max_height;
        target_x = _target_x;
        target_y = _target_y;
        radius = _radius;
        z = 0;
        timer = 0;
    }
    
    static update = function() {
        with (owner) {
            var _progress = ++timer / flight_time;
            
            x = lerp(xstart, target_x, _progress);
            y = lerp(ystart, target_y, _progress);
            z = sin(_progress * pi) * flight_max_height;
            
            if (_progress >= 1) {
                instance_destroy();
            }
        }
    }
    
    static on_destroy = function() {
        with (owner) {
            var _targets = ds_list_create();
            collision_circle_list(x, y, radius, obj_enemy, false, false, _targets, false);
            
            for (var _i = 0; _i < ds_list_size(_targets); _i++) {
                self.ability.execute(_targets[| _i]);
            }
            
            ds_list_destroy(_targets);
        }
    }
    
    static draw = function() {
        with (owner) {
            draw_set_alpha(0.5);
            draw_ellipse_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, c_black, c_black, false);
            draw_set_alpha(1);
            
            draw_sprite(sprite_index, 0, x, y - z);
        }
    }
}