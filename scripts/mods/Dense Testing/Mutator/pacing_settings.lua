local mod = get_mod("Dense Onslaught")

	-- Settings controlling basic pacing.
	
	--[[
	My rationale for these settings are as follows:
	I want the exact same wave composition as Dutch.
	I just want to increase the time players have to clear the wave.
	--]]
	local skaven_min_timer = 60
	local skaven_max_timer = 72

	local chaos_min_timer = 75
	local chaos_max_timer = 95

	if mod.difficulty_level == 0 then
		local skaven_min_timer = mod:get("skaven_min_timer")
		local skaven_max_timer = mod:get("skaven_max_timer")

		local chaos_min_timer = mod:get("chaos_min_timer")
		local chaos_max_timer = mod:get("chaos_max_timer")
	end

	PacingSettings.default.peak_fade_threshold = 110                      -- Shared between all versions of Onslaught
	PacingSettings.default.peak_intensity_threshold = 120				  -- Shared between all versions of Onslaught
	PacingSettings.default.sustain_peak_duration = { 5, 10 }			  -- Shared between all versions of Onslaught
	PacingSettings.default.relax_duration = { 7, 10 }                     -- Shared between all versions of Onslaught
	PacingSettings.default.horde_frequency = { 30, 45 }                   -- Shared between all versions of Onslaught
	PacingSettings.default.multiple_horde_frequency = { 6, 9 }            -- Shared between all versions of Onslaught
	PacingSettings.default.max_delay_until_next_horde = { skaven_min_timer, skaven_max_timer }        -- Shared between all versions of Onslaught
	PacingSettings.default.horde_startup_time = { 10, 20 }                -- Shared between all versions of Onslaught
	PacingSettings.default.multiple_hordes = 3							  -- Introduced in Dense

	PacingSettings.default.mini_patrol.only_spawn_above_intensity = 0
	PacingSettings.default.mini_patrol.only_spawn_below_intensity = 900  -- Same as Dutch
	PacingSettings.default.mini_patrol.frequency = { 6, 10 }             -- Same as Dutch

	PacingSettings.default.difficulty_overrides = nil

	PacingSettings.chaos.peak_fade_threshold = 110                        -- Shared between all versions of Onslaught
	PacingSettings.chaos.peak_intensity_threshold = 120                   -- Shared between all versions of Onslaught
	PacingSettings.chaos.sustain_peak_duration = { 5, 10 }                -- Shared between all versions of Onslaught
	PacingSettings.chaos.relax_duration = { 10, 13 }					  -- Shared between all versions of Onslaught
	PacingSettings.chaos.horde_frequency = { 30, 45 } 					  -- Shared between all versions of Onslaught
	PacingSettings.chaos.multiple_horde_frequency = { 6, 9 } 			  -- Shared between all versions of Onslaught
	PacingSettings.chaos.max_delay_until_next_horde = { chaos_min_timer, chaos_max_timer }		  -- Increased from Dutch, to base Onslaught numbers
	PacingSettings.chaos.horde_startup_time = { 10, 20 }				  -- Shared between all versions of Onslaught
	PacingSettings.chaos.multiple_hordes = 3							  -- Shared between all versions of Onslaught

	PacingSettings.chaos.mini_patrol.only_spawn_above_intensity = 0       -- Same as Dutch
	PacingSettings.chaos.mini_patrol.only_spawn_below_intensity = 900     -- Same as Dutch
	PacingSettings.chaos.mini_patrol.frequency = { 6, 10 }                -- Same as Dutch

	PacingSettings.chaos.difficulty_overrides = nil

	PacingSettings.beastmen.peak_fade_threshold = 110					  -- Shared between all versions of Onslaught
	PacingSettings.beastmen.peak_intensity_threshold = 120				  -- Shared between all versions of Onslaught
	PacingSettings.beastmen.sustain_peak_duration = { 5, 10 }			  -- Shared between all versions of Onslaught
	PacingSettings.beastmen.relax_duration = { 10, 13 } 				  -- Shared between all versions of Onslaught
	PacingSettings.beastmen.horde_frequency = { 35, 50 } 				  -- Shared between all versions of Onslaught
	PacingSettings.beastmen.multiple_horde_frequency = { 6, 9 } 		  -- Shared between all versions of Onslaught
	PacingSettings.beastmen.max_delay_until_next_horde = { chaos_min_timer, chaos_max_timer }       -- Increased from Dutch, to base Onslaught numbers
	PacingSettings.beastmen.horde_startup_time = { 10, 20 }               -- Shared between all versions of Onslaught

	PacingSettings.beastmen.mini_patrol.only_spawn_above_intensity = 0
	PacingSettings.beastmen.mini_patrol.only_spawn_below_intensity = 900
	PacingSettings.beastmen.mini_patrol.frequency = { 6, 10 }

	PacingSettings.beastmen.difficulty_overrides = nil

	--[[
	PacingSettings = {
		default = {
			disabled = false,
			horde_in_relax_if_rushing = false,
			leave_relax_if_rushing = true,
			leave_relax_if_zero_intensity = true,
			multiple_hordes = 3,
			peak_fade_threshold = 110,
			peak_intensity_threshold = 120,
			relax_rushing_distance = 70,
			sustain_peak_duration = {
				3,
				5,
			},
			relax_duration = {
				5,
				10,
			},
			horde_frequency = {
				30,
				45,
			},
			multiple_horde_frequency = {
				6,
				9,
			},
			max_delay_until_next_horde = {
				chaos_min_timer, 
				chaos_max_timer
			},
			horde_startup_time = {
				10,
				15,
			},
			horde = HordeSettings.default,
			horde_delay = {
				1,
				2,
			},
			delay_horde_threat_value = {
				cataclysm = 800,  -- 80
				cataclysm_2 = 1000, -- 100
				cataclysm_3 = 100, -- 100
				easy = 40,
				hard = 50,
				harder = 60,
				hardest = 60,
				normal = 40,
				versus_base = 60,
			},
			delay_mini_patrol_threat_value = {
				cataclysm = 800, -- 80
				cataclysm_2 = 1000, -- 100
				cataclysm_3 = 1000, -- 100
				easy = 35,
				hard = 40,
				harder = 50,
				normal = 35,
				versus_base = 50,
			},
			delay_specials_threat_value = {
				cataclysm = 1000,
				cataclysm_2 = 1000,
				cataclysm_3 = 1000,
				easy = 40,
				hard = 50,
				harder = 60,
				hardest = 60,
				normal = 40,
				versus_base = 60,
			},
			mini_patrol = {
				only_spawn_above_intensity = 1,
				only_spawn_below_intensity = 150,
				override_timer = 20,
				frequency = {
					15,
					20,
				},
			},
			difficulty_overrides = {
				hard = nil,
				harder = nil,
				hardest = nil,
				cataclysm = nil,
				cataclysm_2 = nil,
				cataclysm_3 = nil,
				versus_base = nil
			}
		}
	}

	PacingSettings.chaos = PacingSettings.default
	PacingSettings.beastmen = PacingSettings.default
	PacingSettings.default.max_delay_until_next_horde = { skaven_min_timer, skaven_max_timer }        -- Shared between all versions of Onslaught

	--IntensitySettings.default.disabled = true
	--]]