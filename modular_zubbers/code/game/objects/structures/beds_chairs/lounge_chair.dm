/obj/structure/bed/lounge_chair
	name = "lounge chair"
	desc = "A chair used to lay in, sleep in or strap on."
	icon = 'modular_zubbers/icons/obj/structures/lounge_chair.dmi'
	icon_state = "loungechair"
	anchored = TRUE
	can_buckle = TRUE
	var/mutable_appearance/armrest // For the overlay over buckled mobs.

/obj/structure/bed/lounge_chair/plastic
	name = "plastic lounge chair"
	desc = "A plastic chair used to lay in, sleep in or strap on."
	icon = 'modular_zubbers/icons/obj/structures/lounge_chair.dmi'
	icon_state = "loungechair_plastic"
	anchored = TRUE
	can_buckle = TRUE
	build_stack_type = /obj/item/stack/sheet/plastic

/obj/structure/bed/lounge_chair/wood
	name = "wooden lounge chair"
	desc = "A wooden chair used to lay in, sleep in or strap on."
	icon = 'modular_zubbers/icons/obj/structures/lounge_chair.dmi'
	icon_state = "loungechair_wood"
	anchored = TRUE
	can_buckle = TRUE
	build_stack_type = /obj/item/stack/sheet/mineral/wood

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
