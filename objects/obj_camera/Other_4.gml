view_enabled = true;
view_visible[0] = true;
camera_set_view_size(view_camera[0], base_width, base_height);
if (!instance_exists(obj_player)) {
    exit;
}
x = obj_player.x;
y = obj_player.y;