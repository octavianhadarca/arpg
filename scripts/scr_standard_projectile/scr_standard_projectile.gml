function standard_projectile(_this, _speed, _direction, _pierce) : deliverer_behaviour(_this) constructor {
    with (owner) {
        sprite_index = spr_projectile;
        spd = _speed;
        dir = _direction;
        pierce = _pierce;
        target_log = [];
    }
    
    static update = function() {
        with (owner) {
            x += lengthdir_x(spd, dir);
            y += lengthdir_y(spd, dir);
        }
    }
    
    static on_collide = function(_collided) {
        with (owner) {
            if (array_get_index(target_log, _collided) != -1) {
                return;
            }
            
            self.ability.execute(_collided);
            array_push(target_log, _collided);
            
            if (pierce-- == 0) {
                instance_destroy();
            }
        }
    }
}