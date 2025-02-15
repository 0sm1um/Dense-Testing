local mod = get_mod("Dense Testing")
	
	local faction = "chaos"
	
	local trash_scale = 1
	local shield_trash_scale = 1
	local elite_scale = 1
	local shield_elite_scale = 1
	local berzerker_scale = 1
	local super_armor_scale = 1

	if mod.difficulty_level == 0 then
		mod.gain = mod:get("master_horde_scale")
		trash_scale = mod:get("trash_scale")
		shield_trash_scale = mod:get("shield_trash_scale")
		elite_scale = mod:get("armor_scale")
		shield_elite_scale = mod:get("shield_armor_scale")
		super_armor_scale = mod:get("super_armor_scale")
	end

	local trash_entities = {"chaos_fanatic","chaos_marauder"}
	local shield_trash_entities = {"chaos_marauder_with_shield"}
	local elite_entities = {"chaos_raider"}
	local shield_elite_entities = {}
	local berzerker_entities = {"chaos_berzerker"}
	local super_armor_entities = {"chaos_warrior"}
	
	local scaling_data = {
    {
        scale_factor = trash_scale,
        breeds = trash_entities,
    },
    {
        scale_factor = shield_trash_scale,
        breeds = shield_trash_entities,
    },
    {
        scale_factor = elite_scale * mod.gain,
        breeds = elite_entities,
    },
    {
        scale_factor = shield_elite_scale * mod.gain,
        breeds = shield_elite_entities,
    },
    {
        scale_factor = berzerker_scale * mod.gain,
        breeds = berzerker_entities,
    },
    {
        scale_factor = super_armor_scale * mod.gain,
        breeds = super_armor_entities,
    },
}

--[[
	Key to understanding:
		Plain: Always Unshielded trash
		Zerker: Always Shielded Trash
		Shielders: Always Shielded Trash
		Leader: Always unshielded trash and max of 2 CWs
		Frenzy: Always mix of maulers and berzerkers
]]

HordeCompositionsPacing.chaos_huge = {	-- Normal Pacing Horde
		{
			name = "plain",
			weight = 5,
			breeds = {
				"chaos_fanatic",
				{
					20,
					32
				},
				"chaos_marauder",
				{
					10,
					16
				},
				"chaos_warrior",
				{
					1,
					1
				},
				"chaos_raider",
				{
					2,
					5
				},
				"chaos_berzerker",
				{
					2,
					5
				}
			}
		},
		
		sound_settings = HordeCompositionsSoundSettings.chaos
	}
	HordeCompositionsPacing.chaos_huge_shields = {
		{
			name = "plain",
			weight = 5,
			breeds = {
				"chaos_fanatic",
				{
					16,
					22
				},
				"chaos_marauder",
				{
					10,
					16
				},
				"chaos_marauder_with_shield",
				{
					4,
					12
				},
				"chaos_berzerker",
				{
					1,
					5
				},
				"chaos_raider",
				{
					1,
					4
				},
			}
		},
		sound_settings = HordeCompositionsSoundSettings.chaos
	}
	HordeCompositionsPacing.chaos_huge_armor = {
		{
			name = "plain",
			weight = 5,
			breeds = {
				"chaos_fanatic",
				{
					20,
					32
				},
				"chaos_warrior",
				{
					1,
					1
				},
				"chaos_marauder",
				{
					10,
					16
				},
				"chaos_raider",
				{
					3,
					6
				},
				"chaos_warrior",
				{
					1,
					1
				}
			}
		},
		{
			name = "shielders",
			weight = 5,
			breeds = {
				"chaos_fanatic",
				{
					16,
					22
				},
				"chaos_marauder_with_shield",
				{
					4,
					12
				},
				"chaos_warrior",
				{
					1,
					2
				},
				"chaos_marauder",
				{
					10,
					16
				},
				"chaos_raider",
				{
					2,
					6
				},
			}
		},
		sound_settings = HordeCompositionsSoundSettings.chaos
	}
	HordeCompositionsPacing.chaos_huge_berzerker = {
		{
			name = "plain",
			weight = 5,
			breeds = {
				"chaos_fanatic",
				{
					20,
					32
				},
				"chaos_marauder_with_shield",
				{
					4,
					12
				},
				"chaos_berzerker",
				{
					4,
					8
				},
				"chaos_marauder",
				{
					10,
					16
				},
			}
		},
		{
			name = "shielders",
			weight = 5,
			breeds = {
				"chaos_fanatic",
				{
					16,
					22
				},
				"chaos_marauder_with_shield",
				{
					4,
					12
				},
				"chaos_berzerker",
				{
					3,
					6
				},
				"chaos_marauder",
				{
					10,
					16
				},
				"chaos_raider",
				{
					1,
					3
				},
			}
		},
		sound_settings = HordeCompositionsSoundSettings.chaos
	}

scale_horde_composition(HordeCompositionsPacing, faction, scaling_data)