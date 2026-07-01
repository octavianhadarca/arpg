event_inherited();

move_x = 0;
move_y = 0;
move_dir = 0;

look_dir = 0;

frame = 0;

self.targeting_manager = new targeting_manager(self);
self.ability_caster = new ability_caster(self.targeting_manager);

self.ability_caster.add_to_hotbar(new ability([new damage_effect(10)], new self_targeting()));
self.ability_caster.add_to_hotbar(new ability([new damage_effect(10)], new aoe_targeting(50)));
self.ability_caster.add_to_hotbar(new ability([new damage_effect(10)], new standard_projectile_targeting(5, 90, 10, 1)));
self.ability_caster.add_to_hotbar(new ability([new damage_effect(5)], new lob_projectile_targeting(1, 60, 200, 50)));
self.ability_caster.add_to_hotbar(new ability([new damage_effect(5)], new beam_targeting(1, 90, 200, 20, 10)));
self.ability_caster.add_to_hotbar(new ability([new damage_effect(10)], new boomerang_projectile_targeting(1, 90, 10, 200)));

hp = stats[e_stats.hp].get_value();