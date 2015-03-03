/*
	This script initializes the respawn positions and respawn inventory for the player.

	Created by Lux0r
*/


// Client-side: Define respawn positions and respawn inventory for specific roles.
if (!isDedicated) then {
	private ["_side","_role"];

	waitUntil {!IsNull Player};

	_side = side player;
	_role = player getVariable "SOS_role";
	if (!isNil "_role") then {
		switch (_role) do {
			// Platoon Lead
			case "PlatoonLeader": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_PL_SL", _side]] call bis_fnc_addRespawnInventory;
			};
			case "PlatoonMedic": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_PL_Medic", _side]] call bis_fnc_addRespawnInventory;
			};
			case "PlatoonAA": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_PL_AA", _side]] call bis_fnc_addRespawnInventory;
			};
			// Ghost Recon
			case "ReconTeamLeader": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_RCN_TL", _side]] call bis_fnc_addRespawnInventory;
			};
			case "ReconScout": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_RCN_Scout", _side]] call bis_fnc_addRespawnInventory;
			};
			case "ReconMarksman": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_RCN_Marksman", _side]] call bis_fnc_addRespawnInventory;
			};
			case "ReconParamedic": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_RCN_Paramedic", _side]] call bis_fnc_addRespawnInventory;
			};
			// Ghost 1 + 2 + 3 + 4
			case "TeamLeader": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_TL", _side]] call bis_fnc_addRespawnInventory;
			};
			case "MMG": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_MMG_Mk200", _side]] call bis_fnc_addRespawnInventory;
				[player, format["%1_MMG_MXSW", _side]] call bis_fnc_addRespawnInventory;
			};
			case "AntiTank": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_AT", _side]] call bis_fnc_addRespawnInventory;
			};
			case "CombatEngineer": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_CombatEngineer", _side]] call bis_fnc_addRespawnInventory;
			};
			case "AssistantMMG": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_AssistantMMG", _side]] call bis_fnc_addRespawnInventory;
			};
			case "Medic": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_Medic", _side]] call bis_fnc_addRespawnInventory;
			};
			case "Grenadier": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_Grenadier", _side]] call bis_fnc_addRespawnInventory;
			};
			// Heavy Weapons Team
			case "HWT_TL": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_HWT_TL", _side]] call bis_fnc_addRespawnInventory;
			};
			case "HWT_Crew": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_HWT_Crew", _side]] call bis_fnc_addRespawnInventory;
			};
			case "HWT_MissileSpec": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_HWT_MissileSpec", _side]] call bis_fnc_addRespawnInventory;
			};
			// Anvil 1
			case "TankCommander": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_TankCommander", _side]] call bis_fnc_addRespawnInventory;
			};
			case "TankDriver": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_TankDriver", _side]] call bis_fnc_addRespawnInventory;
			};
			case "TankGunner": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_TankGunner", _side]] call bis_fnc_addRespawnInventory;
			};
			// Pilots
			case "HelicopterPilot": {
				[player, "HeliSpawn_2"] call BIS_fnc_addRespawnPosition;
				[player, "HeliSpawn_1"] call BIS_fnc_addRespawnPosition;
				[player, "HeliSpawn_3"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_HelicopterPilot", _side]] call bis_fnc_addRespawnInventory;
			};
			case "JetPilot": {
				[player, "JetSpawn"] call BIS_fnc_addRespawnPosition;
				[player, "HeliSpawn_2"] call BIS_fnc_addRespawnPosition;
				[player, "HeliSpawn_1"] call BIS_fnc_addRespawnPosition;
				[player, "HeliSpawn_3"] call BIS_fnc_addRespawnPosition;
				[player, format["%1_JetPilot", _side]] call bis_fnc_addRespawnInventory;
			};
			default {
				diag_log format["respawn.sqf: Unknown role %1", _role];
			};
		};
	};
};