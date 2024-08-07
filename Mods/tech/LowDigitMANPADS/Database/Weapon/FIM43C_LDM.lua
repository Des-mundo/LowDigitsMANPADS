-- Missile
local FIM43C_LDM = {
	category		= CAT_MISSILES,
	name			= "FIM43C_LDM",
	user_name		= _("FIM-43C Redeye"),
	display_name	= _("FIM-43C Redeye"),
	display_name_short = _("FIM-43C"),	--this is the short name that shows up in the F10 map
	scheme			= "self_homing_spin_missile",	--"self_homing_spin_missile2",
	class_name		= "wAmmunitionSelfHoming",
	model			= "fim-92",
	mass			= 8.3,
	
	wsTypeOfWeapon  = {wsType_Weapon,wsType_Missile,wsType_SA_Missile,WSTYPE_PLACEHOLDER};
	
	Escort = 0,
	Head_Type = 1,
	sigma = {6, 6, 6},
	M = 8.3,
	H_max = 2740.0,
	H_min = 1.0,
	Diam = 70.0,
	Cx_pil = 1,
	D_max = 4500.0,
	D_min = 500.0,
	Head_Form = 1,
	Life_Time = 17.0,
	Nr_max = 3,
	v_min = 70.0,
	v_mid = 580.0,	-- for 1127 kt top speed, or 2088 km/h
	Mach_max = 1.7,
	t_b = 0.0,
	t_acc = 0.06,
	t_marsh = 5.8,
	Range_max = 4500.0,
	H_min_t = 10.0,
	Fi_rak = math.rad(60),	--restricted the initial missile's viewing angle at launch. Was having issues with the missile being fired at really off angles.
	Fi_start = math.rad(1),
	Fi_excort = 0.7,
	Fi_search = 99.9,
	OmViz_max = 99.9,
	warhead = {
		mass					= 1.06,
		expl_mass				= 0.36,
		caliber					= 70,
		other_factors			= { 1.0, 1.0, 1.0 },
		obj_factors				= { 1.0, 1.0 },
		concrete_factors		= { 1.0, 1.0, 1.0 },
		cumulative_factor		= 0.0,
		concrete_obj_factor		= 0.0,    
		cumulative_thickness	= 0.0,
		piercing_mass 			= 1.06,
		time_self_destruct		= 17,
	},
	warhead_air = {
		mass					= 1.06,
		expl_mass				= 0.36,
		caliber					= 70,
		other_factors			= { 1.0, 1.0, 1.0 },
		obj_factors				= { 1.0, 1.0 },
		concrete_factors		= { 1.0, 1.0, 1.0 },
		cumulative_factor		= 0.0,
		concrete_obj_factor		= 0.0,    
		cumulative_thickness	= 0.0,
		piercing_mass 			= 1.06,
		time_self_destruct		= 17,
	},
	X_back = -0.781,
	Y_back = 0.0,
	Z_back = 0.0,
	Reflection = 0.05,
	KillDistance = 0.5,
	--seeker sensivity params
	SeekerSensivityDistance = 5000, -- The range of target with IR value = 1. In meters. Was reduced from 6000, as the other missile parameters were otherwise making it too effective.
	ccm_k0 = 1.4,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	SeekerCooled			= true, -- True is cooled seeker and false is not cooled seeker.
	shape_table_data = 
	{
		{
			name	 = "FIM43C_LDM";
			file  	 = "fim-92";
			life  	 = 1;
			fire  	 = { 0, 1};
			username = "FIM43C";
			index = WSTYPE_PLACEHOLDER;
		},
	},
	
	controller = {
		boost_start = 0.0,
		march_start = 0.25,
		--march2_start = 5.8,
	},
	
	booster = {
		impulse								= 220,	--should get the missile to 109 km/h
		fuel_mass							= 0.104,
		work_time							= 0.06,
		boost_time							= 0,
		boost_factor						= 0,
		nozzle_position						= {{-0.8, 0.0, 0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		tail_width							= 0.4,
		smoke_color							= {1.0, 1.0, 1.0},
		smoke_transparency					= 0.9,
		custom_smoke_dissipation_factor		= 0.3,				
	},
		
	march = {
		impulse								= 195,
		fuel_mass							= 2.76,	--2.76kg total mass of fuel
		work_time							= 5.8,	--5.8s total burn, burns fuel at rate of 0.47586 kg/s
		boost_time							= 0,
		boost_factor						= 0,
		nozzle_position						= {{-0.8, 0.0, 0.0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		tail_width							= 0.2,
		smoke_color							= {1.0, 1.0, 1.0},
		smoke_transparency					= 0.9,
		custom_smoke_dissipation_factor		= 0.3,	
	},

	march2 = {
		impulse								= 180,	--march2 not currently used
		fuel_mass							= 1.85,
		work_time							= 3.9,
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
		mass        = 8.3,  
		caliber     = 0.07,  
		cx_coeff    = {1, 1.2, 0.8, 0.6, 1.8},	--made the missile slightly draggier, especially at Mach 1+, to help reduce range while still allowing the missile to attain its stated max speed.
		L           = 1.4,
		I           = 1 / 12 * 8.3 * 1.4 * 1.4,
		Ma          = 0.6,
		Mw          = 1.2,
		Sw			= 0.2,
		dCydA		= {0.07, 0.036},
		A			= 0.6,
		maxAoa		= 0.29,
		finsTau		= 0.1,
		freq		= 16,
	},
	
	simple_IR_seeker = {
		sensitivity		= 5000,
		cooled			= true,
		delay			= 0.0,
		GimbLim			= math.rad(40),
		FOV				= math.rad(1.25);
		opTime			= 14.0,
		target_H_min	= 0.0,
		flag_dist		= 150.0,	--originally 150
		abs_err_val		= 11.5,		--drastically increased from 3.5, makes the missile more likely to miss even if there are no flares
		ground_err_k	= 3.1,
		ccm_k0 			= 1.4,
	},
	
	simple_gyrostab_seeker = {
		gimbal_lim = math.rad(40),
		omega_max	= math.rad(6),
	},
	
--	fuze = {
--		default_self_destruct_delay	= 17,
--		fuze_time_sigma				= 0.9
--	},
	
	fuze_proximity = {
		ignore_inp_armed	= 1,
		radius				= 0.5,
	},
	
	autopilot = {
		K				= 1.4,	--1.4
		Kg				= 0.2,
		Ki				= 0.0,
		finsLimit		= 0.05,
		delay			= 0.5,	--0.5
		fin2_coeff		= 0.5,
	},
};
declare_weapon(FIM43C_LDM)

GT_t.LN_t.FIM43C_LDM_missile = {}
GT_t.LN_t.FIM43C_LDM_missile.type = 4
GT_t.LN_t.FIM43C_LDM_missile.distanceMin = 500
GT_t.LN_t.FIM43C_LDM_missile.distanceMax = 4500
GT_t.LN_t.FIM43C_LDM_missile.reactionTime = 6;	--was 9;
GT_t.LN_t.FIM43C_LDM_missile.launch_delay = 4;	--was 4;
GT_t.LN_t.FIM43C_LDM_missile.maxShootingSpeed = 0
GT_t.LN_t.FIM43C_LDM_missile.reflection_limit = 0.24
GT_t.LN_t.FIM43C_LDM_missile.ECM_K = -1
GT_t.LN_t.FIM43C_LDM_missile.min_launch_angle = math.rad(-20);
GT_t.LN_t.FIM43C_LDM_missile.inclination_correction_upper_limit = math.rad(0);
GT_t.LN_t.FIM43C_LDM_missile.inclination_correction_bias = (0);
GT_t.LN_t.FIM43C_LDM_missile.sensor = {}
set_recursive_metatable(GT_t.LN_t.FIM43C_LDM_missile.sensor, GT_t.WSN_t[0])
GT_t.LN_t.FIM43C_LDM_missile.PL = {}
GT_t.LN_t.FIM43C_LDM_missile.PL[1] = {}
GT_t.LN_t.FIM43C_LDM_missile.PL[1].ammo_capacity = 3
GT_t.LN_t.FIM43C_LDM_missile.PL[1].shot_delay = 0.01
GT_t.LN_t.FIM43C_LDM_missile.PL[1].reload_time = 120
GT_t.LN_t.FIM43C_LDM_missile.PL[1].type_ammunition = FIM43C_LDM.wsTypeOfWeapon;
GT_t.LN_t.FIM43C_LDM_missile.PL[1].automaticLoader = false
GT_t.LN_t.FIM43C_LDM_missile.BR = { { pos = {1, 0, 0}, drawArgument = 4}, }

GT_t.WS_t.FIM43C_LDM_MANPAD = {};
GT_t.WS_t.FIM43C_LDM_MANPAD.pos = {-0.071, 1.623,0};
GT_t.WS_t.FIM43C_LDM_MANPAD.angles = {
					{math.rad(180), math.rad(-180), math.rad(-45), math.rad(80)},
					};
GT_t.WS_t.FIM43C_LDM_MANPAD.drawArgument1 = 0;
GT_t.WS_t.FIM43C_LDM_MANPAD.drawArgument2 = 1;
GT_t.WS_t.FIM43C_LDM_MANPAD.omegaY = 1.5;
GT_t.WS_t.FIM43C_LDM_MANPAD.omegaZ = 1.5;
GT_t.WS_t.FIM43C_LDM_MANPAD.pidY = {p=40,i=1.0,d=7, inn = 5};
GT_t.WS_t.FIM43C_LDM_MANPAD.pidZ = {p=40,i=1.0,d=7, inn = 5};
GT_t.WS_t.FIM43C_LDM_MANPAD.reloadAngleY = -100; -- not constrained
GT_t.WS_t.FIM43C_LDM_MANPAD.LN = {};
GT_t.WS_t.FIM43C_LDM_MANPAD.LN[1] = {};
set_recursive_metatable(GT_t.WS_t.FIM43C_LDM_MANPAD.LN[1], GT_t.LN_t.FIM43C_LDM_missile);
GT_t.WS_t.FIM43C_LDM_MANPAD.LN[1].PL[1].shot_delay = 13;
