function beam(_this, _direction, _beam_width, _beam_height, _tick_interval) : deliverer_behaviour(_this) constructor {
    with (owner) {
        sprite_index = spr_beam;
        image_angle = _direction;
        image_xscale = _beam_width / sprite_width;
        image_yscale = _beam_height / sprite_height;
        tick_interval = _tick_interval;
        timer = 0;
    }
    
    static update = function() {
        with (owner) {
            if (--timer) {
                return;
            }
            
            timer = tick_interval;
            
            var _targets = ds_list_create();
            instance_place_list(x, y, obj_enemy, _targets, false);
            
            for (var _i = 0; _i < ds_list_size(_targets); _i++) {
                self.ability.execute(_targets[| _i]);
            }
            
            ds_list_destroy(_targets);
        }
    }
}