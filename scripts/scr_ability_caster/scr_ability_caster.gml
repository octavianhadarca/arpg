function ability_caster(_targeting_manager) constructor {
    hotbar = [];
    self.targeting_manager = _targeting_manager;
    
    static add_to_hotbar = function(_ability) {
        array_push(hotbar, _ability);
    }
    
    static update = function() {
        for (var _i = 0; _i < array_length(hotbar); _i++) {
            if (InputPressed(_i)) {
                hotbar[_i].target(self.targeting_manager);
            }
        }
    }
}