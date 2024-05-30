/datum/map_generator/cave_generator/tropicstation/cave

	weighted_open_turf_types = list(
		/turf/open/misc/dirt/jungle = 1,
		/turf/open/misc/grass/jungle = 0.5,
	)

	weighted_closed_turf_types = list(
		/turf/closed/mineral/random/jungle = 1
	)

	weighted_flora_spawn_list = list(
		/obj/structure/flora/rock/style_random = 5,
		/obj/structure/flora/ash/cap_shroom = 10,
		/obj/structure/flora/ash/leaf_shroom = 5,
		/obj/structure/flora/ash/stem_shroom = 5,
		/obj/structure/flora/ash/tall_shroom = 5,
	)

	mob_spawn_chance = 0
	initial_closed_chance = 40
	smoothing_iterations = 60
	birth_limit = 4
	death_limit = 3
