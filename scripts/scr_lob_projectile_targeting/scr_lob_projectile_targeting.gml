function lob_projectile_targeting(_count, _flight_time, _flight_height_max, _radius) constructor {
    count = _count;
    flight_time = _flight_time;
    flight_height_max = _flight_height_max;
    radius = _radius;
    
    static start = function(_ability, _targeting_manager) {
        self.ability = _ability;
        self.targeting_manager = _targeting_manager;
        
        self.targeting_manager.clear_current_strategy();
        
        var _owner = self.targeting_manager.owner;
        
        for (var _i = 0; _i < count; _i++) {
            var _projectile = instance_create_depth(_owner.x, _owner.y, 0, obj_deliverer);
            _projectile.behaviour = new lob_projectile(_projectile, flight_time, flight_height_max, mouse_x, mouse_y, radius);
            _projectile.ability = self.ability;
        }
    }
}