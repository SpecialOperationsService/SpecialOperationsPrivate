/*
	Define global variables, that are used by different scripts from the object spawn.

	Created by Lux0r
*/


OS_disableThermal = ["DisableThermal", 1] call BIS_fnc_getParamValue;

// Array with all unit types that are allowed to spawn vehicles.
OS_allowVehicleSpawnWest = [
	"B_Soldier_SL_F",	// Squad Leader
	"B_Soldier_TL_F",	// Team Leader
	"B_recon_TL_F",		// Recon Team Leader
	"B_Pilot_F",		// Pilot
	"B_Helipilot_F",	// Helicopter Pilot
	"B_helicrew_F"		// Helicopter Crew
];

// Array with all unit types that are allowed to spawn APCs.
OS_allowAPCSpawnWest = [
	"B_crew_F"			// Crewman
];

// Array with all unit types that are allowed to spawn tanks.
OS_allowTankSpawnWest = [
	"B_crew_F"			// Crewman
];

// Array with all unit types that are allowed to spawn helicopters.
OS_allowHeliSpawnWest = [
	"B_Pilot_F",		// Pilot
	"B_Helipilot_F",	// Helicopter Pilot
	"B_helicrew_F"		// Helicopter Crew
];

// Array with all unit types that are allowed to spawn jets.
OS_allowJetSpawnWest = [
	"B_Pilot_F"			// Pilot
];

// Array with all unit types that are allowed to spawn boats.
OS_allowBoatSpawnWest = [
	"B_Soldier_SL_F",	// Squad Leader
	"B_Soldier_TL_F",	// Team Leader
	"B_recon_TL_F",		// Recon Team Leader
	"B_Pilot_F",		// Pilot
	"B_Helipilot_F",	// Helicopter Pilot
	"B_helicrew_F"		// Helicopter Crew
];

// Spawn delay to prevent vehicle spam.
[] execVM "SOS\ObjectSpawn\spawnDelay.sqf";