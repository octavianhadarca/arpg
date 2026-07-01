function boomerang_projectile(_this, _speed, _direction, _range) : deliverer_behaviour(_this) constructor {
    with (owner) {
        spd = _speed;
        dir = _direction;
        dist_remaining = _range;
        target_log = [];
        sprite_index = spr_projectile;
    }
    
    static update = function() {
        with (owner) {
            if (dist_remaining > 0) {
                x += lengthdir_x(spd, dir);
                y += lengthdir_y(spd, dir);
                
                dist_remaining -= spd;
            } else {
                if (variable_instance_exists(id, "end_x")) {
                    x += lengthdir_x(spd, dir);
                    y += lengthdir_y(spd, dir);
                    
                    dist_remaining -= spd;
                    
                    if (dist_remaining <= 0) {
                        instance_destroy();
                    }
                } else {
                    end_x = x;
                    end_y = y;
                    dir = point_direction(end_x, end_y, xstart, ystart);
                    dist_remaining = point_distance(end_x, end_y, xstart, ystart);
                    target_log = [];
                }
            }
            
            var _targets = ds_list_create();
            instance_place_list(x, y, obj_enemy, _targets, false);
            
            for (var _i = 0; _i < ds_list_size(_targets); _i++) {
                var _target = _targets[| _i];
                
                if (array_get_index(target_log, _target) != -1) {
                    continue;
                }
                
                self.ability.execute(_target);
                array_push(target_log, _target);
            }
            
            ds_list_destroy(_targets);
        }
    }
}