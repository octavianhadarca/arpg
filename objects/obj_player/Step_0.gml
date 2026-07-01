var _input_x = keyboard_check(ord("D")) - keyboard_check(ord("A")),
    _input_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if (_input_x != 0 || _input_y != 0) {
    var _length = sqrt(_input_x * _input_x + _input_y * _input_y);
    x += _input_x / _length * move_speed;
    y += _input_y / _length * move_speed;
}