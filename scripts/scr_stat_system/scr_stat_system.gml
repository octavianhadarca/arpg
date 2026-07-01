enum e_modifier_types {
    base,
    increase,
    multiplier,
    last
}

function stat(_base) constructor {
    base = _base;
    current = base;
    modifiers = [];
    dirty = false;
    
    static add_modifier = function(_modifier) {
        array_push(modifiers, _modifier);
        dirty = true;
    }
    
    static remove_modifier = function(_modifier) {
        array_filter(modifiers, method({ modifier : _modifier }, function(_element) { return _element == modifier; }));
    }
    
    static get_value = function() {
        if (!dirty) {
            return current;
        }
        
        var _base = base, _increase = 0, _multiplier = 1;
        
        for (var _i = 0; _i < array_length(modifiers); _i++) {
            var _modifier = modifiers[_i];
            
            switch (_modifier.type) {
            	case e_modifier_types.base: _base += _modifier.value; break;
                case e_modifier_types.increase: _increase += _modifier.value; break;
                case e_modifier_types.multiplier: _multiplier *= _modifier.value; break;
            }
            
            current = _base * (1 + _increase) * _multiplier;
            dirty = false;
            
            return current;
        }
    }
}

function modifier(_type, _value) constructor {
    type = _type;
    value = _value;
}