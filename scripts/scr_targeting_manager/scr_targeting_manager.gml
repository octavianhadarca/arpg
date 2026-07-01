function targeting_manager(_owner) constructor {
    owner = _owner;
    current_strategy = pointer_null;
    
    static update = function() {
        if (!current_strategy) {
            return;
        }
        
        current_strategy.update();
    }
    
    static set_current_strategy = function(_targeting_strategy) {
        clear_current_strategy();
        current_strategy = _targeting_strategy;
    }
    
    static clear_current_strategy = function() {
        if (!current_strategy) {
            return;
        }
        current_strategy.cancel();
        current_strategy = pointer_null;
    }
}