function ability(_effects, _targeting_strategy) constructor {
    effects = _effects;
    self.targeting_strategy = _targeting_strategy;
    
    static target = function(_targeting_manager) {
        self.targeting_strategy.start(self, _targeting_manager);
    }
    
    static execute = function(_target) {
        array_foreach(effects, method({t : _target}, function(effect) { effect.apply(t); }));
    }
}