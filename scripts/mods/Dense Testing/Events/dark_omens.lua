local mod = get_mod("Dense Testing")

	--Dark Omens

	-- Ons+

	local horde_sound_settings = {
		skaven = {
			stinger_sound_event = "enemy_horde_stinger",
			music_states = {
				horde = "horde"
			}
		},
		chaos = {
			stinger_sound_event = "enemy_horde_chaos_stinger",
			music_states = {
				pre_ambush = "pre_ambush_chaos",
				horde = "horde_chaos"
			}
		},
		beastmen = {
			stinger_sound_event = "enemy_horde_beastmen_stinger",
			music_states = {
				pre_ambush = "pre_ambush_beastmen",
				horde = "horde_beastmen"
			}
		}
	}
	
	local function count_event_breed(breed_name)
		return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
	end
	
	local function count_breed(breed_name)
		return Managers.state.conflict:count_units_by_breed(breed_name)
	end
	
	local function current_intensity()
		return Managers.state.conflict.pacing:get_intensity()
	end
	
	local function current_difficulty()
		return Managers.state.difficulty.difficulty
	end
	
	local function num_spawned_enemies()
		local spawned_enemies = Managers.state.conflict:spawned_enemies()
	
		return #spawned_enemies
	end
	
	local function num_spawned_enemies_during_event()
		local spawned_enemies = Managers.state.conflict:enemies_spawned_during_event()
	
		return spawned_enemies
	end
	
	local function num_alive_standards()
		local alive_standards = Managers.state.conflict:alive_standards()
	
		return #alive_standards
	end
	
	TerrorEventBlueprints.crater.crater_mid_event = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_master_event_running",
			name = "crater_mid_event"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = true
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "crater_mid_event_door_horde_01",
			composition_type = "onslaught_custom_boss_minotaur",
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "crater_mid_event_door_horde_01",
			composition_type = "ungor_archers",
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "crater_mid_event_door_horde_02",
			composition_type = "ungor_archers",
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "crater_mid_event_door_horde_01",
			composition_type = "event_medium_beastmen",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "crater_mid_event_door_horde_02",
			composition_type = "event_medium_beastmen",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "onslaught_crater_horde_behind",
			composition_type = "event_beastmen_mix_small",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 4
		},	
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("beastmen_gor") < 4 and count_breed("beastmen_ungor") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "crater_mid_event_enable_gate"
		},
		{
			"delay",
			duration = 1
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "crater_mid_event_door_elite_02",
			composition_type = "crater_bestigor_medium",
			sound_settings = horde_sound_settings.beastmen
		},
		{
			"delay",
			duration = 5
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("beastmen_bestigor") < 3
			end
		},
		{
			"delay",
			duration = 1
		},
		{
			"control_specials",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "crater_mid_event_done"
		}
	}
	
	TerrorEventBlueprints.crater.crater_detour_specials = {		
		{
			"control_specials",
			enable = false
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			limit_spawners = 6,
			spawner_id = "crater_detour_specials",
			composition_type = "crater_detour"
		},
		{
			"spawn_at_raw",
			spawner_id = "onslaught_crater_secret_boss",
			breed_name = "chaos_spawn",
			optional_data = {
				max_health_modifier = 0.5
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger"
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "onslaught_crater_secret_rock_top_left",
			composition_type = "beastmen_mix"
		},
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "onslaught_crater_secret_rock_outside",
			composition_type = "beastmen_mix"
		},
		{
			"delay",
			duration = 3
		},	
		{
			"event_horde",
			limit_spawners = 3,
			spawner_id = "onslaught_crater_secret_top_behind",
			composition_type = "beastmen_trash"
		},
		{
			"delay",
			duration = 10
		},	
		{
			"continue_when",
			duration = 70,
			condition = function (t)
				return count_breed("chaos_spawn") < 1 and count_breed("beastmen_bestigor") < 1 and count_breed("beastmen_gor") < 2
			end
		},
		{
			"control_specials",
			enable = true
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "onslaught_crater_secret_top_behind",
			composition_type = "onslaught_event_skaven_elite_adds"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "onslaught_crater_secret_rock_outside",
			composition_type = "onslaught_event_military_courtyard_plague_monks"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "onslaught_crater_secret_rock_top_left",
			composition_type = "event_extra_spice_large"
		},
		{
			"delay",
			duration = 5
		},	
		{
			"continue_when",
			duration = 45,
			condition = function (t)
				return num_spawned_enemies() < 8
			end
		},
		{
			"control_pacing",
			enable = true
		}	
	}
	
	TerrorEventBlueprints.crater.crater_end_event_manual_spawns = {
		{
			"spawn_at_raw",
			spawner_id = "crater_end_event_manual_spawn_01",
			breed_name = "beastmen_bestigor"
		},
		{
			"spawn_at_raw",
			spawner_id = "crater_end_event_manual_spawn_02",
			breed_name = "beastmen_bestigor"
		},
		{
			"spawn_at_raw",
			spawner_id = "crater_end_event_manual_spawn_03",
			breed_name = "beastmen_bestigor"
		},
		{
			"spawn_at_raw",
			spawner_id = "crater_end_event_manual_spawn_04",
			breed_name = "beastmen_bestigor"
		},
		{
			"spawn_at_raw",
			spawner_id = "crater_end_event_manual_spawn_05",
			breed_name = "beastmen_bestigor"
		},
		{
			"spawn_at_raw",
			spawner_id = "crater_end_event_manual_spawn_06",
			breed_name = "beastmen_bestigor"
		},
		{
			"spawn_at_raw",
			spawner_id = "crater_end_event_manual_spawn_07",
			breed_name = "beastmen_bestigor"
		},
		{
			"spawn_at_raw",
			spawner_id = "crater_end_event_manual_spawn_08",
			breed_name = "beastmen_bestigor"
		},
		{
			"spawn_at_raw",
			spawner_id = "crater_end_event_manual_spawn_10",
			breed_name = "beastmen_bestigor"
		},
		{
			"spawn_at_raw",
			spawner_id = "crater_end_event_manual_spawn_11",
			breed_name = "beastmen_bestigor"
		},
		{
			"spawn_at_raw",
			spawner_id = "crater_end_event_manual_spawn_12",
			breed_name = "beastmen_bestigor"
		},
		{
			"spawn_at_raw",
			spawner_id = "crater_end_event_manual_spawn_13",
			breed_name = "beastmen_bestigor"
		},
		{
			"spawn_at_raw",
			spawner_id = "crater_end_event_manual_spawn_14",
			breed_name = "beastmen_bestigor"
		},
		{
			"spawn_at_raw",
			spawner_id = "crater_end_event_manual_spawn_15",
			breed_name = "beastmen_bestigor"
		}
	}
	
	TerrorEventBlueprints.crater.crater_end_event_intro_wave = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 80
		},
		{
			"set_master_event_running",
			name = "crater_end_event_intro_wave"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "crater_end_event_intro_wave",
			composition_type = "event_large_beastmen"
		},
		{
			"delay",
			duration = 20
		},
		{
			"continue_when",
			duration = 55,
			condition = function (t)
				return count_event_breed("beastmen_gor") < 4 and count_breed("beastmen_ungor") < 4
			end
		},
		{
			"flow_event",
			flow_event_name = "crater_end_event_intro_wave_done"
		}
	}
	
	TerrorEventBlueprints.crater.crater_end_event_wave_01 = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 80
		},
		{
			"set_master_event_running",
			name = "crater_end_event_wave_01"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
			composition_type = "event_large_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies() < 8
			end
		},
		{
			"spawn_special",
			breed_name = "beastmen_bestigor",
			amount = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
			composition_type = "event_medium_beastmen"
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return num_alive_standards() < 1 and count_event_breed("beastmen_gor") < 8 and count_event_breed("beastmen_ungor") < 8
			end
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_minotaur",
			spawner_id = "event_minotaur"
		},
		{
			"flow_event",
			flow_event_name = "crater_end_event_wave_01_done"
		}
	}
	
	TerrorEventBlueprints.crater.crater_end_event_wave_02 = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 80
		},
		{
			"set_master_event_running",
			name = "crater_end_event_wave_02"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
			composition_type = "event_large_beastmen"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
			composition_type = "event_small_beastmen"
		},
		{
			"spawn_special",
			breed_name = "beastmen_bestigor",
			amount = 8
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies() < 6
			end
		},
		{
			"spawn_special",
			breed_name = "beastmen_bestigor",
			amount = 5
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
			composition_type = "event_large_beastmen"
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return num_alive_standards() < 1 and count_event_breed("beastmen_gor") < 8 and count_event_breed("beastmen_ungor") < 8
			end
		},
		{
			"flow_event",
			flow_event_name = "crater_end_event_wave_02_done"
		}
	}
	
	TerrorEventBlueprints.crater.crater_end_event_wave_03 = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 80
		},
		{
			"set_master_event_running",
			name = "crater_end_event_wave_03"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
			composition_type = "event_large_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 45,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"spawn_special",
			breed_name = "beastmen_bestigor",
			amount = 6
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
			composition_type = "event_small_beastmen"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
			composition_type = "ungor_archers"
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return num_alive_standards() < 1 and count_event_breed("beastmen_gor") < 8 and count_event_breed("beastmen_ungor") < 8
			end
		},
		{
			"flow_event",
			flow_event_name = "crater_end_event_wave_03_done"
		}
	}
	
	TerrorEventBlueprints.crater.crater_end_event_wave_04 = {
		{
			"enable_bots_in_carry_event"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 80
		},
		{
			"set_master_event_running",
			name = "crater_end_event_wave_04"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
			composition_type = "event_large_beastmen"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
			composition_type = "event_small_beastmen"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies() < 8
			end
		},
		{
			"spawn_special",
			breed_name = "beastmen_bestigor",
			amount = 6
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
			composition_type = "event_medium_beastmen"
		},
		{
			"event_horde",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
			composition_type = "ungor_archers"
		},
		{
			"flow_event",
			flow_event_name = "crater_end_event_wave_04_repeat"
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return num_alive_standards() < 1 and count_event_breed("beastmen_gor") < 5 and count_event_breed("beastmen_ungor") < 5
			end
		},
		{
			"flow_event",
			flow_event_name = "crater_end_event_wave_04_done"
		}
	}
	
	TerrorEventBlueprints.crater.crater_end_event_minotaur = {
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("beastmen_minotaur") == 1
			end
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("beastmen_minotaur") < 1
			end
		}
	}
	
	HordeCompositions.event_small_beastmen = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"beastmen_gor",
				{
					13,
					14
				}
			}
		},
		{
			name = "mixed",
			weight = 3,
			breeds = {
				"beastmen_ungor",
				{
					3,
					4
				},
				"beastmen_gor",
				{
					9,
					10
				}
			}
		}
	}
	
	HordeCompositions.event_medium_beastmen = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"beastmen_gor",
				{
					16,
					17
				},
				"beastmen_ungor",
				{
					8,
					9
				}
			}
		},
		{
			name = "mixed",
			weight = 3,
			breeds = {
				"beastmen_gor",
				{
					7,
					8
				},
				"beastmen_ungor",
				{
					15,
					16
				}
			}
		}
	}
	
	HordeCompositions.event_large_beastmen = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"beastmen_gor",
				{
					18,
					19
				},
				"beastmen_ungor",
				{
					16,
					17
				}
			}
		},
		{
			name = "mixed",
			weight = 3,
			breeds = {
				"beastmen_gor",
				{
					22,
					23
				},
				"beastmen_ungor",
				{
					14,
					15
				}
			}
		}
	}
	
	HordeCompositions.crater_bestigor_medium = {
		{
			name = "ambestigor",
			weight = 3,
			breeds = {
				"beastmen_bestigor",
				{
					9,
					10
				},
				"beastmen_standard_bearer",
				2
			}
		}
	}
