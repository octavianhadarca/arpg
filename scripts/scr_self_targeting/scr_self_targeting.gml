function self_targeting() : targeting_strategy() constructor {
    static start = function(_ability, _targeting_manager) {
        self.ability = _ability;
        self.targeting_manager = _targeting_manager;
        
        self.targeting_manager.clear_current_strategy();
        
        self.ability.execute(self.targeting_manager.owner);
    }
}