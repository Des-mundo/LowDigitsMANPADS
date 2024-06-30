-- Missile
local function calcPiercingMass(warhead)
	warhead.piercing_mass  = warhead.mass;
	if (warhead.expl_mass/warhead.mass > 0.1) then
		warhead.piercing_mass  = warhead.mass/5.0;
	end
end

local function simple_aa_warhead(power, caliber) -- By Saint
    local res = {};

	res.caliber = caliber
	res.mass = power; --old explosion damage effect
    res.expl_mass = power;
    res.other_factors = {1, 1, 1};
    res.obj_factors = {1, 1};
    res.concrete_factors = {1, 1, 1};
    res.cumulative_factor = 0;
    res.concrete_obj_factor = 0.0;
    res.cumulative_thickness = 0.0;
    
	calcPiercingMass(res)
    return res;
end

local BLOWPIPE_LDM = {
	category		= CAT_MISSILES,
	name			= "Blowpipe_LDM",
	user_name		= _("Blowpipe"),
	scheme			= "command_guided_missile_sfe",	--"self_homing_spin_missile2",
	class_name		= "wAmmunitionVikhr",
	model			= "mistral_missile",
	mass			= 11,
	
	wsTypeOfWeapon  = {wsType_Weapon,wsType_Missile,wsType_SA_Missile,WSTYPE_PLACEHOLDER};
	
	Escort = 3,
	Head_Type = 7,
	sigma = {10, 6, 10},
	M = 11,
	H_max = 2500.0,
	H_min = 0.01,
	Diam = 76.0,
	Cx_pil = 1,
	D_max = 3500.0,
	D_min = 700.0,
	Head_Form = 1,
	Life_Time = 17.0,
	Nr_max = 3,
	v_min = 70.0,
	v_mid = 510.0,	-- speed of mach 1.5 at sea level, m/s
	Mach_max = 1.5,
	t_b = 0.0,
	t_acc = 2.0,
	t_marsh = 5.8,
	Range_max = 3500.0,
	H_min_t = 10.0,
	Fi_start = math.rad(-15),
	Fi_rak = 3.14152,
	Fi_excort = 0.9,
	Fi_search = 99.9,
	OmViz_max = 99.9,
	warhead = {
		mass					= 2.2,
		expl_mass				= 0.75,
		caliber					= 76,
		other_factors			= { 1.0, 1.0, 1.0 },
		obj_factors				= { 1.0, 1.0 },
		concrete_factors		= { 1.0, 1.0, 1.0 },
		cumulative_factor		= 0.0,
		concrete_obj_factor		= 0.0,    
		cumulative_thickness	= 0.0,
		piercing_mass 			= 2.2,
		time_self_destruct		= 17,
	},
	warhead_air = {
		mass					= 2.2,
		expl_mass				= 0.75,
		caliber					= 76,
		other_factors			= { 1.0, 1.0, 1.0 },
		obj_factors				= { 1.0, 1.0 },
		concrete_factors		= { 1.0, 1.0, 1.0 },
		cumulative_factor		= 0.0,
		concrete_obj_factor		= 0.0,    
		cumulative_thickness	= 0.0,
		piercing_mass 			= 2.2,
		time_self_destruct		= 17,
	},
	X_back = -0.781,
	Y_back = 0.0,
	Z_back = 0.0,
	Reflection		= 0.0,
	KillDistance = 1.0,
	--seeker sensivity params
	ccm_k0 = 0.0,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	shape_table_data = 
	{
		{
			name	 = "Blowpipe";
			file  	 = "mistral_missile";
			life  	 = 1;
			fire  	 = { 0, 1};
			username = "Blowpipe";
			index = WSTYPE_PLACEHOLDER;
		},
	},
	
	controller = {
		boost_start = 0.0,
		march_start = 0.7,
		--march2_start = 5.8,
	},
	
	booster = {
		impulse								= 200,	--50?
		fuel_mass							= 0.12,
		work_time							= 0.2,
		boost_time							= 0,
		boost_factor						= 0,
		nozzle_position						= {{-0.9, 0, 0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		tail_width							= 0.3,
		smoke_color							= {1.0, 1.0, 1.0},
		smoke_transparency					= 0.9,
		custom_smoke_dissipation_factor		= 0.3,				
	},
		
	march = {
		impulse								= 145,
		fuel_mass							= 3.48,
		work_time							= 5.2,
		boost_time							= 0,
		boost_factor						= 0,
		nozzle_position						= {{-0.9, 0, 0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		tail_width							= 0.4,
		smoke_color							= {0.8, 0.8, 0.8},
		smoke_transparency					= 0.9,
		custom_smoke_dissipation_factor		= 0.3,	
	},
	
	march2 = {
		impulse								= 180,
		fuel_mass							= 1.6,
		work_time							= 4.6,
		boost_time							= 0,
		boost_factor						= 0,
		nozzle_position						= {{-0.8, 0.0, 0.0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		tail_width							= 0.2,
		smoke_color							= {1.0, 1.0, 1.0},
		smoke_transparency					= 0.7,
		custom_smoke_dissipation_factor		= 0.3,	
	},
	
	fm = {
		mass        = 11,  
		caliber     = 0.076,  
		cx_coeff    = {0.8,1.00,0.8,0.4,1.1},
		L           = 1.35,
		I           = 1 / 12 * 11 * 1.35 * 1.35,
		Ma          = 0.6,
		Mw          = 1.2,
		wind_sigma 	= 0,
		wind_time 	= 1000,
		Sw			= 0.2,
		dCydA		= {0.07, 0.036},
		A			= 0.6,
		maxAoa		= 0.12,	--started at 0.22
		finsTau		= 0.1,
		lockRoll 	= 1,
	},
	
	spiral_nav = {
										-- laser guidance simulation--	(use high values for wire/radio guidance)
		t_cone_near_rad			= 0,	-- simple simulation radius (for bots)
		def_cone_max_dist		= 10000,-- laser reach
		def_cone_near_rad		= 0,	-- stab. radius
		def_cone_near_rad_st	= 0,	-- start radius
		def_cone_time_stab_rad	= 0,	-- stab. time

										-- start/dust avoidance program--
		gb_angle				= math.rad(10),-- start angle above LOS (rad)
		gb_min_dist				= 30,	-- min distance to use this program
		gb_use_time				= 0.7,	-- time trigger: return aim to LOS
		gb_max_retW				= 0.7,	-- ret W max
		gb_ret_Kp				= 1.0,	-- ret power coeff.
	},

	autopilot = {
		Kp					= 0.004,	--P
		Ki					= 0.0000,	--I
		Kd					= 0.0035,	--D
		max_ctrl_angle		= 1.35,		--turn off autopilot after reaching max angle
		delay				= 2,		--autopilot delay, takes ~2 seconds before MCLOS control is provided
		op_time				= 20.0,		--autopilot operation time
		no_ctrl_center_ang	= 0.0,		--blind point at center (rad)
		fins_discreet		= 0.013,
	},
	
	err = {
		y_error				= 0.016,
		z_error				= 0.018,
		min_time_interval	= 0.1,
		max_time_interval	= 0.9,
	},
	
	fuze = {
		default_arm_delays = { 0.8 },
		default_self_destruct_delay	= 17,
		fuze_time_sigma				= 0.9
	},
	
};
declare_weapon(BLOWPIPE_LDM)

GT_t.LN_t.Blowpipe_LDM_missile = {}
GT_t.LN_t.Blowpipe_LDM_missile.type = 4
GT_t.LN_t.Blowpipe_LDM_missile.distanceMin = 700
GT_t.LN_t.Blowpipe_LDM_missile.distanceMax = 3500
GT_t.LN_t.Blowpipe_LDM_missile.reactionTime = 2;
GT_t.LN_t.Blowpipe_LDM_missile.launch_delay = 3;
GT_t.LN_t.Blowpipe_LDM_missile.maxShootingSpeed = 0
GT_t.LN_t.Blowpipe_LDM_missile.reflection_limit = 0.24
GT_t.LN_t.Blowpipe_LDM_missile.ECM_K = -1
GT_t.LN_t.Blowpipe_LDM_missile.min_launch_angle = math.rad(-20);
GT_t.LN_t.Blowpipe_LDM_missile.inclination_correction_upper_limit = math.rad(0);
GT_t.LN_t.Blowpipe_LDM_missile.inclination_correction_bias = (0);
GT_t.LN_t.Blowpipe_LDM_missile.sensor = {}
set_recursive_metatable(GT_t.LN_t.Blowpipe_LDM_missile.sensor, GT_t.WSN_t[0])
GT_t.LN_t.Blowpipe_LDM_missile.PL = {}
GT_t.LN_t.Blowpipe_LDM_missile.PL[1] = {}
GT_t.LN_t.Blowpipe_LDM_missile.PL[1].ammo_capacity = 3	-- return to 3 when done testing
GT_t.LN_t.Blowpipe_LDM_missile.PL[1].shot_delay = 0.01
GT_t.LN_t.Blowpipe_LDM_missile.PL[1].reload_time = 150
GT_t.LN_t.Blowpipe_LDM_missile.PL[1].type_ammunition = BLOWPIPE_LDM.wsTypeOfWeapon;
GT_t.LN_t.Blowpipe_LDM_missile.PL[1].automaticLoader = false
GT_t.LN_t.Blowpipe_LDM_missile.BR = { { pos = {1, 0, 0}, drawArgument = 4}, }

GT_t.WS_t.BLOWPIPE_LDM_MANPAD = {};
GT_t.WS_t.BLOWPIPE_LDM_MANPAD.pos = {-0.071, 1.623,0};
GT_t.WS_t.BLOWPIPE_LDM_MANPAD.angles = {
					{math.rad(180), math.rad(-180), math.rad(-45), math.rad(80)},
					};
GT_t.WS_t.BLOWPIPE_LDM_MANPAD.drawArgument1 = 0;
GT_t.WS_t.BLOWPIPE_LDM_MANPAD.drawArgument2 = 1;
GT_t.WS_t.BLOWPIPE_LDM_MANPAD.omegaY = 1.5;
GT_t.WS_t.BLOWPIPE_LDM_MANPAD.omegaZ = 1.5;
GT_t.WS_t.BLOWPIPE_LDM_MANPAD.pidY = {p=40,i=1.0,d=7, inn = 5};
GT_t.WS_t.BLOWPIPE_LDM_MANPAD.pidZ = {p=40,i=1.0,d=7, inn = 5};
GT_t.WS_t.BLOWPIPE_LDM_MANPAD.reloadAngleY = -100; -- not constrained
GT_t.WS_t.BLOWPIPE_LDM_MANPAD.LN = {};
GT_t.WS_t.BLOWPIPE_LDM_MANPAD.LN[1] = {};
set_recursive_metatable(GT_t.WS_t.BLOWPIPE_LDM_MANPAD.LN[1], GT_t.LN_t.Blowpipe_LDM_missile);
GT_t.WS_t.BLOWPIPE_LDM_MANPAD.LN[1].PL[1].shot_delay = 13;
