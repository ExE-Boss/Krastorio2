local default_locomotive_color = {r = 0.50, g = 0.54, b = 0.53, a = 0.5}
local nuclear_smoke_color = {r = 0.2,  g = 0.51, b = 0.2, a = 0.4}
local hit_effects = require ("__base__.prototypes.entity.demo-hit-effects")
local sounds = require("__base__.prototypes.entity.demo-sounds")

data:extend(
{  
	-- Green smoke
	{
		type = "trivial-smoke",
		name = "nuclear-train-smoke",
		duration = 150,
		fade_in_duration = 0,
		fade_away_duration = 100,
		spread_duration = 100,
		start_scale = 0.4,
		end_scale = 1.5,
		color = nuclear_smoke_color,
		cyclic = true,
		affected_by_wind = true,
		animation =
		{
			width = 152,
			height = 120,
			line_length = 5,
			frame_count = 60,
			shift = {-0.53125, -0.4375},
			priority = "high",
			animation_speed = 0.25,
			filename = "__base__/graphics/entity/smoke/smoke.png", --kr_entities_path .. "nuclear-locomotive/smoke.png",
			flags = { "smoke" }
		}
	},
	-- Entity
	{
		type = "locomotive",
		name = "kr-nuclear-locomotive",
		icon = kr_vehicles_icons_path .. "nuclear-locomotive.png",
		icon_size = 64,
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
		minable = {mining_time = 1, result = "kr-nuclear-locomotive"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 2000,
		corpse = "locomotive-remnants",
		dying_explosion = "locomotive-explosion",
		collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
		selection_box = {{-1, -3}, {1, 3}},
		drawing_box = {{-1, -4}, {1, 3}},
		alert_icon_shift = util.by_pixel(0, -24),
		damaged_trigger_effect = hit_effects.entity(),
		weight = 12000,
		max_speed = 0.926,
		max_power = "3MW",
		reversing_power_modifier = 0.6,
		braking_force = 40,
		friction_force = 0.50,
		vertical_selection_shift = -0.5,
		air_resistance = 0.0075, -- this is a percentage of current speed that will be subtracted
		connection_distance = 3,
		joint_distance = 4,
		energy_per_hit_point = 5,
		resistances =
		{
			{
				type = "fire",
				decrease = 20,
				percent = 75
			},
			{
				type = "physical",
				decrease = 15,
				percent = 30
			},
			{
				type = "impact",
				decrease = 50,
				percent = 75
			},
			{
				type = "explosion",
				decrease = 15,
				percent = 30
			},
			{
				type = "acid",
				decrease = 5,
				percent = 25
			}
		},
		burner =
		{
			fuel_category = "nuclear-fuel",
			effectivity = 1,
			fuel_inventory_size = 3,
			smoke =
			{
				{
					name = "nuclear-train-smoke",
					deviation = {0.3, 0.3},
					frequency = 100,
					position = {0, 0},
					starting_frame = 0,
					starting_frame_deviation = 60,
					height = 2,
					height_deviation = 0.5,
					starting_vertical_speed = 0.2,
					starting_vertical_speed_deviation = 0.1
				}
			}
		},
		front_light =
		{
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "extra-high",
					flags = { "light" },
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {-0.6, -16},
				size = 2,
				intensity = 0.75,
				color = {r = 0.9, g = 1.0, b = 0.9}
			},
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "extra-high",
					flags = { "light" },
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {0.6, -16},
				size = 2,
				intensity = 0.6,
				color = {r = 1.0, g = 0.9, b = 0.9}
			}
		},
		back_light = rolling_stock_back_light(),
		stand_by_light = rolling_stock_stand_by_light(),
		color = default_locomotive_color,
		pictures =
		{
			layers =
			{
				{
					slice = 4,
					priority = "very-low",
					width = 238,
					height = 230,
					direction_count = 256,
					allow_low_quality_rotation = true,
					filenames =
					{
						kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-01.png",
						kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-02.png",
						kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-03.png",
						kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-04.png",
						kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-05.png",
						kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-06.png",
						kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-07.png",
						kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-08.png"
					},
					line_length = 4,
					lines_per_file = 8,
					shift = {0.0, -0.5},
					hr_version =
					{
						priority = "very-low",
						slice = 4,
						width = 474,
						height = 458,
						direction_count = 256,
						allow_low_quality_rotation = true,
						filenames =
						{
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-1.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-2.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-3.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-4.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-5.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-6.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-7.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-8.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-9.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-10.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-11.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-12.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-13.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-14.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-15.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-16.png"
						},
						line_length = 4,
						lines_per_file = 4,
						shift = {0.0, -0.5},
						scale = 0.5
					}
				},
				{
					priority = "very-low",
					flags = { "mask" },
					slice = 4,
					width = 236,
					height = 228,
					direction_count = 256,
					allow_low_quality_rotation = true,
					filenames =
					{
						kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-mask-01.png",
						kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-mask-02.png",
						kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-mask-03.png",
						kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-mask-04.png",
						kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-mask-05.png",
						kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-mask-06.png",
						kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-mask-07.png",
						kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-mask-08.png"
					},
					line_length = 4,
					lines_per_file = 8,
					shift = {0.0, -0.5},
					apply_runtime_tint = true,
					hr_version =
					{
						priority = "very-low",
						flags = { "mask" },
						slice = 4,
						width = 472,
						height = 456,
						direction_count = 256,
						allow_low_quality_rotation = true,
						filenames =
						{
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-mask-1.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-mask-2.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-mask-3.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-mask-4.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-mask-5.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-mask-6.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-mask-7.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-mask-8.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-mask-9.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-mask-10.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-mask-11.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-mask-12.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-mask-13.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-mask-14.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-mask-15.png",
							kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-mask-16.png"
						},
						line_length = 4,
						lines_per_file = 4,
						shift = {0.0, -0.5},
						apply_runtime_tint = true,
						scale = 0.5
					}
				},
				{
					priority = "very-low",
					slice = 4,
					flags = { "shadow" },
					width = 253,
					height = 212,
					direction_count = 256,
					draw_as_shadow = true,
					allow_low_quality_rotation = true,
					filenames =
					{
						"__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-01.png",
						"__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-02.png",
						"__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-03.png",
						"__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-04.png",
						"__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-05.png",
						"__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-06.png",
						"__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-07.png",
						"__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-08.png"
					},
					line_length = 4,
					lines_per_file = 8,
					shift = {1, 0.3}
				}
			}
		},
		minimap_representation =
		{
			filename = kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-minimap-representation.png",
			flags = {"icon"},
			size = {20, 40},
			scale = 0.5
		},
		selected_minimap_representation =
		{
			filename = kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-selected-minimap-representation.png",
			flags = {"icon"},
			size = {20, 40},
			scale = 0.5
		},
		wheels = standard_train_wheels,
		stop_trigger =
		{
			-- left side
			{
				type = "create-trivial-smoke",
				repeat_count = 125,
				smoke_name = "smoke-train-stop",
				initial_height = 0,
				-- smoke goes to the left
				speed = {-0.03, 0},
				speed_multiplier = 0.75,
				speed_multiplier_deviation = 1.1,
				offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
			},
			-- right side
			{
				type = "create-trivial-smoke",
				repeat_count = 125,
				smoke_name = "smoke-train-stop",
				initial_height = 0,
				-- smoke goes to the right
				speed = {0.03, 0},
				speed_multiplier = 0.75,
				speed_multiplier_deviation = 1.1,
				offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
			},
			{
			type = "play-sound",
			sound =
			{
				{
					filename = "__base__/sound/train-breaks.ogg",
					volume = 0.6
					}
				}
			}
		},
		drive_over_tie_trigger = drive_over_tie(),
		tie_distance = 50,
		vehicle_impact_sound = sounds.generic_impact,
		working_sound =
		{
			sound =
			{
				filename = "__base__/sound/train-engine.ogg",
				volume = 0.4
			},
			match_speed_to_activity = true,
			max_sounds_per_type = 2,
		},
		open_sound = { filename = "__base__/sound/train-door-open.ogg", volume=0.5 },
		close_sound = { filename = "__base__/sound/train-door-close.ogg", volume = 0.4 },
		sound_minimum_speed = 0.1,
		water_reflection = locomotive_reflection()
	}
})