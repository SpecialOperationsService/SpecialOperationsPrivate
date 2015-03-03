// Add respawn positions.
[] execVM "SOS\Respawn\respawn.sqf";

//Cens Radion Freq Script
[] execVM "SOS\Radio\initRadio.sqf";

// Initialize some misc stuff:
// Creates a new AI HQ (makes them able to communicate).
_side = createCenter east;

// Init UPSMON script (must run on all clients)
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";

// Finish world initialization before mission is launched.
//finishMissionInit;

// Set 'false' if you want to disable "None" option for terrain
CHVD_allowNoGrass = false;

// This is a function used by side-missions to broadcast hints to everyone
// It's going to be called by bis_fnc_MP
hintThis = {hint _this;};

// Initialize global variables for different scripts.
initGlobalVariables = [] execVM "SOS\MiscScripts\initGlobalVariables.sqf";

// Run the briefing file.
[] execVM "Briefing.sqf";

// Server-side scripts:
if (isServer) then {
	// Initialize time of day (chosen in the mission parameters). Default: 14
	_startingTimeHour = ["TimeOfDay", 17] call BIS_fnc_getParamValue;
	setDate [2035, 7, 6, _startingTimeHour, 0];

	// Set overcast, fog and rain (chosen in the mission parameters).
	[] execVM "SOS\Weather\setWeather.sqf";

	// Remove enemies from base.
	[] execVM "SOS\MiscScripts\safeZone.sqf";
};

// Manage groups and groupIcons. Must run after "custom_functions_init" and before "platoonList.sqf" for client and server.
[] execVM "SOS\Groups\initGroups.sqf";

// AI gear script
[] execVM "SOS\Gear\aiGear\initAiGear.sqf";

// All AI related scripts executed through initHC.sqf after mission start if HC connected, if not: initHC.sqf executed on server
[] execVM "initHC.sqf";

// Create task to patrol the area.
["TaskAssigned",["","Patrol the Area"]] call bis_fnc_showNotification;

[[
	["Task1","Main Mission: Patrol Area","Enemies have been spotted in the area. Your job is to patrol the marked areas and neutralize any hostiles you meet along the way.<br/><br/>Note: The mission is randomized each time you start it. Markers will show up shortly after the mission has started."]
]] execVM "shk_taskmaster.sqf";

// Client-side scripts:
if (hasInterface) then {
	// Shows/hides group icons based on whether group leader has a GPS, also only players with a GPS are able to see group icons.
	[] execVM "SOS\Groups\GpsIcons\initGpsIcons.sqf";

	// Adds an action allowing player to take command of thier group if they are a higher rank than the current group leader.
	[] execVM "SOS\Groups\TakeCommand\initTakeCommand.sqf";

	// Initialize jump script.
	[] execVM "SOS\MiscScripts\jump.sqf";

	// Initialize Virtual Arsenal.
	[] execVM "SOS\VirtualArsenal\initVirtualArsenal.sqf";

	// Aircraft resupply zones.
	[] execVM "SOS\MiscScripts\aircraftResupplyZone.sqf";

	// Initialize the texture of the uniform.
	[] execVM "SOS\Textures\initUniformTexture.sqf";

	// Run vehicle crew hud and platoon list.
	[] execVM "SOS\VehicleHud\teamList.sqf";
	[] execVM "SOS\VehicleHud\platoonList.sqf";

	// Disable AI radio chatter.
	player disableConversation true;
	player setVariable ["BIS_noCoreConversations", true];

	// Enable ghost mode, teleport and free camera for server admin.
	[player] call compile preprocessFileLineNumbers "SOS\AdminActions\main.sqf";
};

// Scripts for all machines:

//Initialize LM Damage Modifier.
[] execVM "SOS\MiscScripts\lm_damage_modifier.sqf";

//Initialize LM Rating.
[] execVM "SOS\MiscScripts\lm_friend_rating.sqf";

// Initialize helicopter smoke support.
[] execVM "SOS\MiscScripts\lm_helo_support.sqf";

// Initialize LM Medic System.
[] execVM "SOS\MiscScripts\lm_medic_system.sqf";

// Initialize global variables for the object spawn.
[] execVM "SOS\ObjectSpawn\initObjectSpawn.sqf";

// Initialize Mag Repack.
[] execVM "outlw_magRepack\MagRepack_init_sv.sqf";

// Initialize ammo drop script.
//[] execVM "SOS\Ammodrop\initAmmoDrop.sqf";

// Start TPWCAS.
_suppression_enabled	= ["Suppression_Enabled", 1] call BIS_fnc_getParamValue;
tpwcas_mode				= ["Suppression_Mode", 2] call BIS_fnc_getParamValue;

if (_suppression_enabled == 1) then {
	diag_log format ["%1 - starting TPWCAS_A3 with tpwcas_mode [%2]", time, tpwcas_mode];
	[tpwcas_mode] execVM "tpwcas\tpwcas_script_init.sqf";

	// enable AI Suppression statistics logging (once every 60 seconds)
	if (tpwcas_mode == 2 || isServer) then {
		waitUntil {!(isNil "bdetect_init_done")};

		[] spawn tpwcas_fnc_log_benchmark;
	};
};