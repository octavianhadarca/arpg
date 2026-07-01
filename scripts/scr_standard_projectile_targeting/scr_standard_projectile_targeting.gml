function standard_projectile_targeting(_count, _spread, _speed, _pierce) constructor {
    count = _count;
    spread = _spread;
    speed = _speed;
    pierce = _pierce;
    
    static start = function(_ability, _targeting_manager) {
        self.ability = _ability;
        self.targeting_manager = _targeting_manager;
        
        self.targeting_manager.clear_current_strategy();
        
        var _owner = self.targeting_manager.owner;
        
        for (var _i = 0; _i < count; _i++) {
            var _projectile = instance_create_depth(_owner.x, _owner.y, 0, obj_deliverer);
            _projectile.behaviour = new standard_projectile(_projectile, speed, _owner.look_dir + (count > 1 ? _i * (spread / (count - 1)) - spread * 0.5 : 0), pierce);
            _projectile.ability = self.ability;
        }
    }
}