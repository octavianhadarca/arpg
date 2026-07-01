var _input_x = keyboard_check(ord("D")) - keyboard_check(ord("A")),
    _input_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if (_input_x != 0 || _input_y != 0) {
    var _length = sqrt(_input_x * _input_x + _input_y * _input_y);
    
    move_x = _input_x / _length * stats[e_stats.spd].get_value();
    move_y = _input_y / _length * stats[e_stats.spd].get_value();
    
    x += move_x;
    y += move_y;
    
    move_dir = point_direction(0, 0, move_x, move_y);
}

look_dir = point_direction(x, y, mouse_x, mouse_y);

self.ability_caster.update();
self.targeting_manager.update();

var _old_sprite = sprite_index;

if (_input_x != 0 || _input_y != 0) {
    var _relative_angle = angle_difference(move_dir, look_dir);

    if (abs(_relative_angle) < 45) {
        sprite_index = spr_player_walk;
    } else if (abs(_relative_angle) > 135) {
        sprite_index = spr_player_run_backwards;
    } else if (_relative_angle > 0) {
        sprite_index = spr_player_strafe_left;
    } else {
        sprite_index = spr_player_strafe_right;
    }
} else {
    sprite_index = spr_player_idle;
}

if (sprite_index != _old_sprite) {
    frame = 0;
}

var _total_frames = image_number / 8;

image_index = frame + round(look_dir / 45) * _total_frames;

frame += sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps);
if (frame >= _total_frames) {
    frame = 0;
}