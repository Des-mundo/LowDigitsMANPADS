-- Missile
local SA9M32M_LDM = {
	category		= CAT_MISSILES,
	name			= "Strela-2M",
	user_name		= _("9M32M Strela-2M"),
	display_name	= _("9M32M Strela-2M"),
	display_name_short = _("Strela-2M"),		--display name that shows up in the F10 map
	scheme			= "self_homing_spin_missile2",
	class_name		= "wAmmunitionSelfHoming",
	model			= "OH58D_FIM_92",	--"fim-92", changed model to new Polychop Stinger model; it has a lighter texture and looks closer to the original Strela-2 missiles
	mass			= 9.85, --10.3
	
	wsTypeOfWeapon  = {wsType_Weapon,wsType_Missile,wsType_SA_Missile,WSTYPE_PLACEHOLDER};
	
	Escort = 0,
	Head_Type = 1,
	sigma = {6, 6, 6},
	M = 9.85, --10.3
	H_max = 2300.0, --3000.0
	H_min = 1.0,
	Diam = 72.0,
	Cx_pil = 1,
	D_max = 4200.0, --4500.0
	D_min = 800.0, --500.0
	Head_Form = 0, --1
	Life_Time = 17.0,
	Nr_max = 4,
	v_min = 70.0, --70.0
	v_mid = 500.0, --570.0
	Mach_max = 1.6, --1.6
	t_b = 0.0,
	t_acc = 2.0,
	t_marsh = 4.0,
	Range_max = 4200.0, --4500.0
	H_min_t = 10.0,
	Fi_start = math.rad(1),
	Fi_rak = 3.14152,
	Fi_excort = 0.7,
	Fi_search = 99.9,
	OmViz_max = 99.9,
	warhead = {
		mass					= 1.8, --1.25
		expl_mass				= 0.37, --1.25
		caliber					= 72,
		other_factors			= { 1.325, 1.325, 1.325 },
		obj_factors				= { 1.325, 1.325 },
		concrete_factors		= { 1.325, 1.325, 1.0 },
		cumulative_factor		= 0.0,
		concrete_obj_factor		= 0.0,    
		cumulative_thickness	= 0.0,
		piercing_mass 			= 0.36, --1.25
		time_self_destruct		= 17,
	},
	warhead_air = {
		mass					= 1.8, --1.25
		expl_mass				= 0.37, --1.25
		caliber					= 72,
		other_factors			= { 1.325, 1.325, 1.325 },
		obj_factors				= { 1.325, 1.325 },
		concrete_factors		= { 1.325, 1.325, 1.0 },
		cumulative_factor		= 0.0,
		concrete_obj_factor		= 0.0,    
		cumulative_thickness	= 0.0,
		piercing_mass 			= 0.36, --1.25
		time_self_destruct		= 17,
	},
	X_back = -0.62,
	Y_back = 0.0,
	Z_back = 0.0,
	Reflection = 0.01,
	KillDistance = 0.5,
	--seeker sensivity params
	SeekerSensivityDistance = 6000, -- original value 8000 The range of target with IR value = 1. In meters.
	ccm_k0 = 1.4,  -- original value 1.0 | Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	SeekerCooled			= false, -- original value true | True is cooled seeker and false is not cooled seeker.
	shape_table_data = 
	{
		{
			name	 = "Strela-2M";
			file  	 = "OH58D_FIM_92";	--new model
			life  	 = 1;
			fire  	 = { 0, 1};
			username = "SA9M32M";
			index = WSTYPE_PLACEHOLDER;
		},
	},
	
	controller = {
		boost_start = 0.001,
		march_start = 0.40,
		march2_start = 2.0,
	},
	
	booster = {
		impulse								= 170,
		fuel_mass							= 0.22,
		work_time							= 0.048,
		boost_time							= 0,
		boost_factor						= 0,
		nozzle_position						= {{-0.635, 0.0, 0.0005}},	--model has different dimensions, so the rocket motor position needed to change
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		tail_width							= 0.4,
		smoke_color							= {1.0, 1.0, 1.0},
		smoke_transparency					= 0.9,
		custom_smoke_dissipation_factor		= 0.3,				
	},
		
	march = {
		impulse								= 200,
		fuel_mass							= 2.1,
		work_time							= 1.9,
		boost_time							= 0,
		boost_factor						= 0,
		nozzle_position						= {{-0.635, 0.0, 0.0005}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		tail_width							= 0.2,
		smoke_color							= {1.0, 1.0, 1.0},
		smoke_transparency					= 0.9,
		custom_smoke_dissipation_factor		= 0.3,	
	},
	
	march2 = {
		impulse								= 180,
		fuel_mass							= 1.6,
		work_time							= 4.6,
		boost_time							= 0,
		boost_factor						= 0,
		nozzle_position						= {{-0.635, 0.0, 0.0005}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		tail_width							= 0.2,
		smoke_color							= {1.0, 1.0, 1.0},
		smoke_transparency					= 0.7,
		custom_smoke_dissipation_factor		= 0.3,	
	},

	fm = {
		mass        = 9.85, --10.3  
		caliber     = 0.072,  
		cx_coeff    = {1,1.15,0.8,0.4,1.5},
		L           = 1.44, --1.52 lenght_m
		I           = 1 / 12 * 9.85 * 1.44 * 1.44, -- 1 / 12 * 10.6 * 1.52 * 1.52 moment of inertia for a rod shaped object I = 1/12*Mass_kg*Lenght_m^2; 
		Ma          = 0.6,
		Mw          = 1.2,
		Sw			= 0.2,
		dCydA		= {0.07, 0.036},
		A			= 0.6,
		maxAoa		= 0.29, --0.3
		finsTau		= 0.1,
		freq		= 20,
	},
	
	simple_IR_seeker = {
		sensitivity		= 6000, --8000
		cooled			= false, --true
		delay			= 0.0,
		GimbLim			= math.rad(40),--30
		FOV				= math.rad(1.9);--2
		opTime			= 12.0, --14
		target_H_min	= 0.0,
		flag_dist		= 150.0,
		abs_err_val		= 3,
		ground_err_k	= 3,
		ccm_k0 			= 1.4, --1.0
	},
	
	simple_gyrostab_seeker = {
		gimbal_lim = math.rad(40),
		omega_max	= math.rad(8),
	},
	
	--Replaced proximity with impact fuze, borrowed from FIM-92
	
	fuze = {
		default_self_destruct_delay	= 17,
		fuze_time_sigma				= 0.9
	},
	
	--fuze_proximity = {
	--	ignore_inp_armed	= 1,
	--	radius				= 1,
	--},
	
	autopilot = {
		K				= 1.4,
		Kg				= 0.2,
		Ki				= 0.0,
		finsLimit		= 0.05,
		delay			= 0.5,
		fin2_coeff		= 0.5,
	},
};
declare_weapon(SA9M32M_LDM)

GT_t.LN_t.strela2m_LDM = {}
GT_t.LN_t.strela2m_LDM.type = 4
GT_t.LN_t.strela2m_LDM.distanceMin = 800 --500
GT_t.LN_t.strela2m_LDM.distanceMax = 4200 --4500
GT_t.LN_t.strela2m_LDM.reactionTime = 4;
GT_t.LN_t.strela2m_LDM.launch_delay = 2;
GT_t.LN_t.strela2m_LDM.maxShootingSpeed = 0
GT_t.LN_t.strela2m_LDM.reflection_limit = 0.22
GT_t.LN_t.strela2m_LDM.ECM_K = -1
GT_t.LN_t.strela2m_LDM.min_launch_angle = math.rad(-20);
GT_t.LN_t.strela2m_LDM.inclination_correction_upper_limit = math.rad(0);
GT_t.LN_t.strela2m_LDM.inclination_correction_bias = (0);
GT_t.LN_t.strela2m_LDM.sensor = {}
set_recursive_metatable(GT_t.LN_t.strela2m_LDM.sensor, GT_t.WSN_t[0])
GT_t.LN_t.strela2m_LDM.PL = {}
GT_t.LN_t.strela2m_LDM.PL[1] = {}
GT_t.LN_t.strela2m_LDM.PL[1].ammo_capacity = 3
GT_t.LN_t.strela2m_LDM.PL[1].shot_delay = 0.01
GT_t.LN_t.strela2m_LDM.PL[1].reload_time = 120
GT_t.LN_t.strela2m_LDM.PL[1].type_ammunition = SA9M32M_LDM.wsTypeOfWeapon;
GT_t.LN_t.strela2m_LDM.PL[1].automaticLoader = false
GT_t.LN_t.strela2m_LDM.BR = { { pos = {1, 0, 0}, drawArgument = 4}, }

GT_t.WS_t.strela2m_LDM_manpad = {};
GT_t.WS_t.strela2m_LDM_manpad.pos = {-0.071, 1.623,0};
GT_t.WS_t.strela2m_LDM_manpad.angles = {
					{math.rad(180), math.rad(-180), math.rad(-45), math.rad(75)},
					};
GT_t.WS_t.strela2m_LDM_manpad.drawArgument1 = 0;
GT_t.WS_t.strela2m_LDM_manpad.drawArgument2 = 1;
GT_t.WS_t.strela2m_LDM_manpad.omegaY = 1.5;
GT_t.WS_t.strela2m_LDM_manpad.omegaZ = 1.5;
GT_t.WS_t.strela2m_LDM_manpad.pidY = {p=40,i=1.0,d=7, inn = 5};
GT_t.WS_t.strela2m_LDM_manpad.pidZ = {p=40,i=1.0,d=7, inn = 5};
GT_t.WS_t.strela2m_LDM_manpad.reloadAngleY = -100; -- not constrained
GT_t.WS_t.strela2m_LDM_manpad.LN = {};
GT_t.WS_t.strela2m_LDM_manpad.LN[1] = {};
set_recursive_metatable(GT_t.WS_t.strela2m_LDM_manpad.LN[1], GT_t.LN_t.strela2m_LDM);
GT_t.WS_t.strela2m_LDM_manpad.LN[1].PL[1].shot_delay = 13;
