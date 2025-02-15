local mod = get_mod("Dense Onslaught")

-- Special Settings

	--[[
	My rationale for these settings are as follows:
	I want increased special pressure compared to Ons+.
	I am increasing the max special slots, and decreasing spawn timers.
	However settings identical to Dutch may be too challenging. So I've reduced
	slots by 1, and added more increased spawn timers.
	--]]

	mod:hook(Pacing, "disable", function (func, self)
		self._threat_population = 1
		self._specials_population = 1
		self._horde_population = 0
		self.pacing_state = "pacing_frozen"
	end)
	
	mod:hook(TerrorEventMixer.init_functions, "control_specials", function (func, event, element, t)
		local conflict_director = Managers.state.conflict
		local specials_pacing = conflict_director.specials_pacing
		local not_already_enabled = specials_pacing:is_disabled()
	
		if specials_pacing then
			specials_pacing:enable(element.enable)
	
			if element.enable and not_already_enabled then
				local delay = math.random(5, 12)
				local per_unit_delay = math.random(8, 16)
				local t = Managers.time:time("game")
	
				specials_pacing:delay_spawning(t, delay, per_unit_delay, true)
			end
		end
	end)

	local special_slots = 8
    local min_special_timer = 20
    local max_special_timer = 55
	-- n/120*(max+min) ~ specials per min

	if mod.difficulty_level == 0 then
		local special_slots = mod:get("special_slots")
		local min_special_timer = mod:get("min_special_timer")
		local max_special_timer = mod:get("max_special_timer")
	end

	SpecialsSettings.default.max_specials = special_slots
	SpecialsSettings.default.methods.specials_by_slots = {
		max_of_same = 4,                                      
		coordinated_attack_cooldown_multiplier = 0.5,
		chance_of_coordinated_attack = 0.5,
		select_next_breed = "get_random_breed",
		after_safe_zone_delay = {
			5,
			15
		},
		spawn_cooldown = {
			min_special_timer,													 -- 32
			max_special_timer													 -- 60
		}
	}

	SpecialsSettings.default_light = SpecialsSettings.default
	SpecialsSettings.skaven = SpecialsSettings.default
	SpecialsSettings.skaven_light = SpecialsSettings.default
	SpecialsSettings.chaos = SpecialsSettings.default
	SpecialsSettings.chaos_light = SpecialsSettings.default
	SpecialsSettings.beastmen = SpecialsSettings.default

	if mod.difficulty_level == 3 then
		SpecialsSettings.default.methods.specials_by_slots.max_of_same = 4
		SpecialsSettings.beastmen.methods.specials_by_slots.max_of_same = 4
		SpecialsSettings.chaos.methods.specials_by_slots.max_of_same = 4
	end

	SpecialsSettings.beastmen_light = SpecialsSettings.beastmen
	SpecialsSettings.skaven_beastmen = SpecialsSettings.beastmen
	SpecialsSettings.chaos_beastmen = SpecialsSettings.beastmen
--[[
	get_weighted_random_breed = function (slots, specials_settings, method_data, state_data)
		if state_data.override_breed_name then
			return state_data.override_breed_name
		end

		local breeds = specials_settings.breeds
		local num_breeds = #breeds

		if num_breeds <= 0 then
			return nil
		end

		local count = FrameTable.alloc_table()

		for i = 1, #slots do
			local slot = slots[i]

			count[slot.breed] = (count[slot.breed] or 0) + 1
		end

		local max_tries = 20
		local breed
		local i = 0

		repeat
			local pick_index = Math.random(1, num_breeds)

			breed = breeds[pick_index]
			i = i + 1
		until not count[breed] or count[breed] < method_data.max_of_same or max_tries <= i

		return breed
	end
--]]



	SpecialsSettings.default.difficulty_overrides.hard = nil
	SpecialsSettings.default.difficulty_overrides.harder = nil
	SpecialsSettings.default.difficulty_overrides.hardest = nil
	SpecialsSettings.default.difficulty_overrides.cataclysm = nil
	SpecialsSettings.default.difficulty_overrides.cataclysm_2 = nil
	SpecialsSettings.default.difficulty_overrides.cataclysm_3 = nil
	SpecialsSettings.default_light.difficulty_overrides.hard = nil
	SpecialsSettings.default_light.difficulty_overrides.harder = nil
	SpecialsSettings.default_light.difficulty_overrides.hardest = nil
	SpecialsSettings.default_light.difficulty_overrides.cataclysm = nil
	SpecialsSettings.default_light.difficulty_overrides.cataclysm_2 = nil
	SpecialsSettings.default_light.difficulty_overrides.cataclysm_3 = nil
	SpecialsSettings.skaven.difficulty_overrides.hard = nil
	SpecialsSettings.skaven.difficulty_overrides.harder = nil
	SpecialsSettings.skaven.difficulty_overrides.hardest = nil
	SpecialsSettings.skaven.difficulty_overrides.cataclysm = nil
	SpecialsSettings.skaven.difficulty_overrides.cataclysm_2 = nil
	SpecialsSettings.skaven.difficulty_overrides.cataclysm_3 = nil
	SpecialsSettings.skaven_light.difficulty_overrides.hard = nil
	SpecialsSettings.skaven_light.difficulty_overrides.harder = nil
	SpecialsSettings.skaven_light.difficulty_overrides.hardest = nil
	SpecialsSettings.skaven_light.difficulty_overrides.cataclysm = nil
	SpecialsSettings.skaven_light.difficulty_overrides.cataclysm_2 = nil
	SpecialsSettings.skaven_light.difficulty_overrides.cataclysm_3 = nil
	SpecialsSettings.chaos.difficulty_overrides.hard = nil
	SpecialsSettings.chaos.difficulty_overrides.harder = nil
	SpecialsSettings.chaos.difficulty_overrides.hardest = nil
	SpecialsSettings.chaos.difficulty_overrides.cataclysm = nil
	SpecialsSettings.chaos.difficulty_overrides.cataclysm_2 = nil
	SpecialsSettings.chaos.difficulty_overrides.cataclysm_3 = nil
	SpecialsSettings.chaos_light.difficulty_overrides.hard = nil
	SpecialsSettings.chaos_light.difficulty_overrides.harder = nil
	SpecialsSettings.chaos_light.difficulty_overrides.hardest = nil
	SpecialsSettings.chaos_light.difficulty_overrides.cataclysm = nil
	SpecialsSettings.chaos_light.difficulty_overrides.cataclysm_2 = nil
	SpecialsSettings.chaos_light.difficulty_overrides.cataclysm_3 = nil
	SpecialsSettings.beastmen.difficulty_overrides.hard = nil
	SpecialsSettings.beastmen.difficulty_overrides.harder = nil
	SpecialsSettings.beastmen.difficulty_overrides.hardest = nil
	SpecialsSettings.beastmen.difficulty_overrides.cataclysm = nil
	SpecialsSettings.beastmen.difficulty_overrides.cataclysm_2 = nil
	SpecialsSettings.beastmen.difficulty_overrides.cataclysm_3 = nil
	SpecialsSettings.skaven_beastmen.difficulty_overrides.hard = nil
	SpecialsSettings.skaven_beastmen.difficulty_overrides.harder = nil
	SpecialsSettings.skaven_beastmen.difficulty_overrides.hardest = nil
	SpecialsSettings.skaven_beastmen.difficulty_overrides.cataclysm = nil
	SpecialsSettings.skaven_beastmen.difficulty_overrides.cataclysm_2 = nil
	SpecialsSettings.skaven_beastmen.difficulty_overrides.cataclysm_3 = nil
	SpecialsSettings.chaos_beastmen.difficulty_overrides.hard = nil
	SpecialsSettings.chaos_beastmen.difficulty_overrides.harder = nil
	SpecialsSettings.chaos_beastmen.difficulty_overrides.hardest = nil
	SpecialsSettings.chaos_beastmen.difficulty_overrides.cataclysm = nil
	SpecialsSettings.chaos_beastmen.difficulty_overrides.cataclysm_2 = nil
	SpecialsSettings.chaos_beastmen.difficulty_overrides.cataclysm_3 = nil

	
