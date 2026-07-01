function effect() constructor {
    static apply = function(_target) { }
}

function damage_effect(_value) : effect() constructor {
    value = _value;
    
    static apply = function(_target) {
        if (!variable_instance_exists(_target.id, "hp")) {
            return;
        }
        
        _target.hp -= value;
        show_debug_message(_target.hp);
        if (_target.hp <= 0) {
            instance_destroy(_target);
        }
    }
}