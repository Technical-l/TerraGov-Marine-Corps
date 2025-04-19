/datum/xeno_caste/ravager
	caste_name = "Ravager"
	display_name = "Ravager"
	upgrade_name = ""
	caste_desc = "A brutal, devastating front-line attacker."
	base_strain_type = /mob/living/carbon/xenomorph/ravager
	caste_type_path = /mob/living/carbon/xenomorph/ravager
	tier = XENO_TIER_THREE
	upgrade = XENO_UPGRADE_BASETYPE
	wound_type = "ravager" //used to match appropriate wound overlays

	// *** Melee Attacks *** //
	melee_damage = 25
	melee_ap = 15
	attack_delay = 7

	// *** Speed *** //
	speed = -1.0

	// *** Plasma *** //
	plasma_max = 800
	plasma_gain = 15
	plasma_regen_limit = 0.5
	plasma_icon_state = "fury"

	// *** Health *** //
	max_health = 400

	// *** Evolution *** //
	upgrade_threshold = TIER_THREE_THRESHOLD

	deevolves_to = /datum/xeno_caste/hunter

	// *** Flags *** //
	caste_flags = CASTE_INNATE_PLASMA_REGEN|CASTE_PLASMADRAIN_IMMUNE|CASTE_EVOLUTION_ALLOWED
	can_flags = CASTE_CAN_BE_QUEEN_HEALED|CASTE_CAN_BE_LEADER|CASTE_CAN_HOLD_JELLY
	caste_traits = null

	// *** Defense *** //
	soft_armor = list(MELEE = 50, BULLET = 55, LASER = 50, ENERGY = 50, BOMB = 10, BIO = 40, FIRE = 70, ACID = 40)

	// *** Minimap Icon *** //
	minimap_icon = "ravager"

	// *** Abilities *** //
	actions = list(
		/datum/action/ability/xeno_action/xeno_resting,
		/datum/action/ability/xeno_action/watch_xeno,
		/datum/action/ability/activable/xeno/psydrain,
		/datum/action/ability/activable/xeno/charge,
		/datum/action/ability/activable/xeno/ravage,
		/datum/action/ability/xeno_action/endure,
		/datum/action/ability/xeno_action/rage,
	)
	///multiplier on plasma amount vs damage that is recieved on attack
	var/plasma_damage_dealt_mult = 1.5
	///multiplier on plasma amount vs damage that is recieved on being attacked
	var/plasma_damage_recieved_mult = 0.5

/datum/xeno_caste/ravager/on_caste_applied(mob/xenomorph)
	. = ..()
	xenomorph.AddElement(/datum/element/plasma_on_attack, plasma_damage_dealt_mult)
	xenomorph.AddElement(/datum/element/plasma_on_attacked, plasma_damage_recieved_mult)

/datum/xeno_caste/ravager/on_caste_removed(mob/xenomorph)
	. = ..()
	xenomorph.RemoveElement(/datum/element/plasma_on_attack, plasma_damage_dealt_mult)
	xenomorph.RemoveElement(/datum/element/plasma_on_attacked, plasma_damage_recieved_mult)

/datum/xeno_caste/ravager/normal
	upgrade = XENO_UPGRADE_NORMAL

/datum/xeno_caste/ravager/primordial
	upgrade_name = "Primordial"
	caste_desc = "Red like the blood of those that try to stop its rampage."
	primordial_message = "Our frenzy is eternal. Rip and tear, until it is done."
	upgrade = XENO_UPGRADE_PRIMO

	// *** Abilities *** //
	actions = list(
		/datum/action/ability/xeno_action/xeno_resting,
		/datum/action/ability/xeno_action/watch_xeno,
		/datum/action/ability/activable/xeno/psydrain,
		/datum/action/ability/activable/xeno/charge,
		/datum/action/ability/activable/xeno/ravage,
		/datum/action/ability/xeno_action/endure,
		/datum/action/ability/xeno_action/rage,
		/datum/action/ability/xeno_action/vampirism,
	)



/datum/xeno_caste/ravager/bloodthirster
	caste_name = "Bloodthirster"
	display_name = "Bloodthirster"
	upgrade_name = ""
	caste_desc = "A brutal, unrelenting berserker that gets stronger as it fights."
	caste_type_path = /mob/living/carbon/xenomorph/ravager/bloodthirster
	upgrade = XENO_UPGRADE_BASETYPE
	wound_type = "ravager" //used to match appropriate wound overlays

	// *** Melee Attacks *** // - Loses 2 slash damage
	melee_damage = 23

	// *** Speed *** // Gains 0.2 movedelay
	speed = -0.8

	// *** Defense *** // Loses 10 of all softarmor
	soft_armor = list(MELEE = 40, BULLET = 45, LASER = 40, ENERGY = 40, BOMB = 0, BIO = 30, FIRE = 60, ACID = 30)

	// *** Plasma *** // Plasma used to track bloodlust level, not for abilities
	plasma_max = 700
	plasma_gain = 0
	plasma_icon_state = "fury"

	// *** Flags *** //
	caste_flags = CASTE_INNATE_PLASMA_REGEN|CASTE_PLASMADRAIN_IMMUNE|CASTE_EVOLUTION_ALLOWED
	can_flags = CASTE_CAN_BE_QUEEN_HEALED|CASTE_CAN_BE_LEADER
	caste_traits = null

	// *** Abilities *** //
	actions = list(
		/datum/action/ability/xeno_action/xeno_resting,
		/datum/action/ability/xeno_action/watch_xeno,
		/datum/action/ability/activable/xeno/psydrain,
		/datum/action/ability/activable/xeno/charge/nocost,
		/datum/action/ability/activable/xeno/ravage/bloodthirster,
		/datum/action/ability/xeno_action/endure/nocost,
		/datum/action/ability/xeno_action/rage,
		/datum/action/ability/xeno_action/bloodthirst,
	)
	plasma_damage_dealt_mult = 2
	plasma_damage_recieved_mult = 0

/datum/xeno_caste/ravager/bloodthirster/normal
	upgrade = XENO_UPGRADE_NORMAL

/datum/xeno_caste/ravager/bloodthirster/primordial
	upgrade_name = "Primordial"
	caste_desc = "A berserker that knows only death; for both its opponents and itself."
	primordial_message = "I see red when its time to go man. For real man dont fuck with me"
	upgrade = XENO_UPGRADE_PRIMO

	// *** Abilities *** //
	actions = list(
		/datum/action/ability/xeno_action/xeno_resting,
		/datum/action/ability/xeno_action/watch_xeno,
		/datum/action/ability/activable/xeno/psydrain,
		/datum/action/ability/activable/xeno/charge/nocost,
		/datum/action/ability/activable/xeno/ravage/bloodthirster,
		/datum/action/ability/xeno_action/endure/nocost,
		/datum/action/ability/xeno_action/rage,
		/datum/action/ability/xeno_action/bloodthirst,
		/datum/action/ability/xeno_action/deathmark,
	)
