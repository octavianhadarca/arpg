function deliverer_behaviour(_this) constructor {
    owner = _this;
    
    static update = function() { }
    static on_collide = function(_collided) {}
    static on_destroy = function() {}
    static draw = function() {
        with (owner) {
            draw_self();
        }
    }
}