base_width = 640;
base_height = 360;

var _max_w_scale = display_get_width() / base_width,
    _max_h_scale = display_get_height() / base_height;

if (frac(_max_h_scale) == 0) {
    _max_h_scale--;
}

window_scale = floor(min(_max_w_scale, _max_h_scale));
window_set_size(base_width * window_scale, base_height * window_scale);
window_center();

surface_resize(application_surface, base_width, base_height);
display_set_gui_size(base_width, base_height);