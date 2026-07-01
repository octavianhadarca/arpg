function beam_targeting(_count, _spread, _beam_width, _beam_height, _tick_interval) constructor {
    count = _count;
    spread = _spread;
    beam_width = _beam_width;
    beam_height = _beam_height;
    tick_interval = _tick_interval;
    beams = [];
    
    static start = function(_ability, _targeting_manager) {
        self.ability = _ability;
        self.targeting_manager = _targeting_manager;
        
        self.targeting_manager.set_current_strategy(self);
        
        var _owner = self.targeting_manager.owner;
        
        for (var _i = 0; _i < count; _i++) {
            var _beam = instance_create_depth(_owner.x, _owner.y, 0, obj_deliverer);
            _beam.behaviour = new beam(_beam, _owner.look_dir + (count > 1 ? _i * (spread / (count - 1)) - spread * 0.5 : 0), beam_width, beam_height, tick_interval);
            _beam.ability = self.ability;
            array_push(beams, _beam);
        }
    }
    
    static update = function() {
        var _owner_x = self.targeting_manager.owner.x,
            _owner_y = self.targeting_manager.owner.y;
        
        for (var _i = 0; _i < count; _i++) {
            var _beam = beams[_i];
            _beam.x = _owner_x;
            _beam.y = _owner_y;
            _beam.image_angle = point_direction(_owner_x, _owner_y, mouse_x, mouse_y) + (count > 1 ? _i * (spread / (count - 1)) - spread * 0.5 : 0);
        }
        
        if (keyboard_check_pressed(vk_escape)) {
            self.targeting_manager.clear_current_strategy();
        }
    }
    
    static cancel = function() {
        for (var _i = 0; _i < count; _i++) {
            instance_destroy(beams[_i]);
        }
        beams = [];
    }
}