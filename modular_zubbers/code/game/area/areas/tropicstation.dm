/area/tropicstation/
	name = "placeholder"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "station"
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE
	area_flags = UNIQUE_AREA | FLORA_ALLOWED
	ambience_index = AMBIENCE_GENERIC
	sound_environment = SOUND_AREA_STANDARD_STATION
	ambient_buzz = 'sound/ambience/shore.ogg'

/area/tropicstation/outdoors
	name = "Outdoors"
	icon_state = "station"
	outdoors = TRUE
	always_unpowered = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	area_flags = UNIQUE_AREA | FLORA_ALLOWED
	min_ambience_cooldown = 70 SECONDS
	max_ambience_cooldown = 220 SECONDS

/area/tropicstation/outdoors/debug
	name = "Testing Outdoors"
	icon_state = "station"
	always_unpowered = FALSE
	power_environ = TRUE
	power_equip = TRUE
	power_light = TRUE
	requires_power = FALSE

/area/tropicstation/outdoors/LateInitialize()

	//From Moonstation's surface/LateInitialize()
	var/sunlight_freq = 6
	for(var/turf/lighting_turf in contents)
		if(lighting_turf.light)
			continue
		if(lighting_turf.x % sunlight_freq)
			continue
		var/bonus = !(lighting_turf.x % (sunlight_freq*2)) && sunlight_freq > 1 ? sunlight_freq*0.5 : 0
		if((lighting_turf.y+bonus) % sunlight_freq)
			continue
		lighting_turf.set_light(
			1 + sunlight_freq,
			1,
			"#e0d67a"
		)
