declare_plugin("LowDigitMANPADS",
{
installed 	 	  = true,
displayName   = _("Low Digit MANPADS"),
shortName	  =   "LowDigitMANPADS",
state		 	  = "installed",
developerName	  = "modified by Des, credit goes to the High Digit SAMs Mod team",
version		 	  = "0.3",	
info		  =    _("Adds Strela-2/M 9M32/M"),	 
encyclopedia_path = current_mod_path .. '/Encyclopedia',
})


local function vehicle_file(f)
	if dofile(current_mod_path..f) then
		error("can't load file "..f)
		return
	end
	if(GT) then
		GT.shape_table_data = 
		{
			{
				file  	    = GT.visual.shape;
				username    = GT.Name;
				desrt       = GT.visual.shape_dstr;
			    classname 	= "lLandVehicle";
				positioning = "BYNORMAL";
				life		= GT.life or 5;
			},
			{
				name  = GT.visual.shape_dstr;
				file  = GT.visual.shape_dstr;
			},
		}
		add_surface_unit(GT)
		GT = nil;
	else
		error("GT empty in file "..f)
	end;
end

local function weapon_file(f)
	if dofile(current_mod_path..f) then
		error("can't load file "..f)
		return
	end
end

--Russia

weapon_file("/Database/Weapon/9M32.lua")
weapon_file("/Database/Weapon/9M32M.lua")

--MANPADS

vehicle_file("/Database/Vehicle/Strela-2.lua")
vehicle_file("/Database/Vehicle/Strela-2M.lua")


plugin_done()
