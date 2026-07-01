if (instance_exists(obj_player)) {
    x += (obj_player.x - x) * 0.2;
    y += (obj_player.y - y) * 0.2;
    
    camera_set_view_pos(view_camera[0], x - camera_get_view_width(view_camera[0]) * 0.5, y - camera_get_view_height(view_camera[0]) * 0.5);
}