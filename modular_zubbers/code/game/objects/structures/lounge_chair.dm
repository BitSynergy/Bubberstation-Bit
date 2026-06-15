/obj/structure/bed/lounge_chair
	name = "Lounge Chair"
	desc = "A chair used to lay in, sleep in or strap on."
	icon = 'modular_zubbers/icons/obj/structures/lounge_chair.dmi'
	icon_state = "loungechair"
	anchored = TRUE
	can_buckle = TRUE
	// The mutable appearance used for the overlay over buckled mobs.
	var/mutable_appearance/armrest
	// custom_materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 4)


//Chair armrest code
/obj/structure/bed/lounge_chair/Initialize(mapload)
	gen_armrest()
	return ..()

/obj/structure/bed/lounge_chair/on_changed_z_level(turf/old_turf, turf/new_turf, same_z_layer, notify_contents)
	if(same_z_layer)
		return ..()
	cut_overlay(armrest)
	QDEL_NULL(armrest)
	gen_armrest()
	return ..()

/obj/structure/bed/lounge_chair/proc/gen_armrest()
	armrest = GetArmrest()
	armrest.layer = ABOVE_MOB_LAYER
	update_armrest()

/obj/structure/bed/lounge_chair/proc/GetArmrest()
	return mutable_appearance(icon, "[icon_state]_armrest")

/obj/structure/bed/lounge_chair/Destroy()
	QDEL_NULL(armrest)
	return ..()

/obj/structure/bed/lounge_chair/post_buckle_mob(mob/living/M)
	. = ..()
	update_armrest()

/obj/structure/bed/lounge_chair/proc/update_armrest()
	if(has_buckled_mobs())
		add_overlay(armrest)
	else
		cut_overlay(armrest)

/obj/structure/bed/lounge_chair/post_unbuckle_mob()
	. = ..()
	update_armrest()
