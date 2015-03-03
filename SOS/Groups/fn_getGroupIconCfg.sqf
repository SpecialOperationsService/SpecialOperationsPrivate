/*
	Created by Lux0r
*/


private ["_grp","_iconCfg"];

_grp = [_this, 0] call BIS_fnc_param;


_iconCfg = switch (groupID _grp) do {
	case "Platoon Lead":	{["B_HQ", [1, 0.533, 0, 1], "PL"];};
	case "Ghost Recon":		{["B_RECON", [0.133, 0.33, 1, 1], "GR"];};
	case "Ghost 1":			{["B_INF", [0.133, 0.33, 1, 1], "G1"];};
	case "Ghost 2":			{["B_INF", [0.133, 0.33, 1, 1], "G2"];};
	case "Ghost 3":			{["B_INF", [0.133, 0.33, 1, 1], "G3"];};
	case "Ghost 4":			{["B_INF", [0.133, 0.33, 1, 1], "G4"];};
	case "HWT":				{["b_support", [0.133, 0.33, 1, 1], "HWT"];};
	case "Anvil 1":			{["b_armor", [1, 0.843, 0, 1], "A1"];};
	case "Reaper 1":		{["B_AIR", [0, 1, 0, 1], "R1"];};
	case "Reaper 2":		{["B_AIR", [0, 1, 0, 1], "R2"];};
	case "Reaper 3":		{["B_AIR", [0, 1, 0, 1], "R3"];};
	case "Havoc 1":			{["B_AIR", [1, 0.498, 0, 1], "H1"];};
	default					{["B_INF", [0, 0, 0, 0], ""];};
};

_iconCfg