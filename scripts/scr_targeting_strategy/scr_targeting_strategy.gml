function targeting_strategy() constructor {
    self.ability = pointer_null;
    self.targeting_manager = pointer_null;
    
    static start = function(_ability, _targeting_manager) { }
    static update = function() {}
    static cancel = function() {}
}