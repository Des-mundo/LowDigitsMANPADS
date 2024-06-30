-- FIM-43C American Manpad

GT = {};
GT.animation = {};

GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_human);
set_recursive_metatable(GT.chassis, GT_t.CH_t.HUMAN);
set_recursive_metatable(GT.animation, GT_t.CH_t.HUMAN_ANIMATION);

GT.visual.shape = "soldier_stinger";
GT.visual.shape_dstr = "soldier_stinger_d";

GT.mobile = true;
				
GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);

-- weapon systems

GT.WS = {};
GT.WS.maxTargetDetectionRange = 7500;
GT.WS.fire_on_march = false;

local ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.FIM43C_LDM_MANPAD);
GT.WS[ws].cockpit = { "StingerSight/StingerSight", { 0.1, 0, -0.23 }}
GT.WS[ws].pointer = "camera";
local __LN = GT.WS[ws].LN[1]
__LN.BR[1].connector_name = "POINT_LAUNCHER";
__LN.min_launch_angle = math.rad(15);
--__LN.max_launch_angle = math.rad(65);
__LN.reactionTime = 2;
__LN.sightMasterMode = 1;
__LN.sightIndicationMode = 1;

GT.Name = "Soldier_Redeye_LDM";
GT.DisplayName = _('MANPADS FIM-43C Redeye');
GT.DisplayNameShort = _('Redeye');
GT.Rate = 5;
GT.type = "Soldier_Redeye_LDM";

GT.DetectionRange  = GT.sensor.max_range_finding_target;
GT.ThreatRange = GT.WS[1].LN[1].distanceMax;
GT.mapclasskey = "P0091000216";

GT.attribute = {wsType_Ground,wsType_SAM,wsType_Miss,Stinger_manpad,
				"MANPADS",
				"IR Guided SAM",
				"New infantry",
				};
				
GT.category = "Air Defence";
GT.tags = { "Air Defence", "MANPADS" };
GT.Transportable = {
	size = 100
}

GT.Countries = { "USA","USAF Aggressors","CJTF Blue","Australia","CJTF Red","Croatia", "Saudi Arabia","Turkey","Pakistan","Israel","Sweden","Jordan","Greece","Denmark","Thailand","Germany","Sudan","Insurgents"}; 