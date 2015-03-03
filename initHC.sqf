// AI HC compatability, waits for mission to load, checks for connected HC, if HC is connected runs AI scripts on connected HC else runs on server as normal
waitUntil {time > 1}; // Note: Bad work around, mission needs to start before HC can be detected

if (!isNil "HC1") then {
	if !(hasInterface || isServer) then {
		// Tweak AI accuracy and skill.
		[] execVM "SOS\MiscScripts\setSkills.sqf";

		// Start Patrol Generator
		[] execVM "CombatPatrolGenerator\init.sqf";
	};
} else {
	if (isServer) then {
		// Tweak AI accuracy and skill.
		[] execVM "SOS\MiscScripts\setSkills.sqf";

		// Start Patrol Generator
		[] execVM "CombatPatrolGenerator\init.sqf";
	};
};
