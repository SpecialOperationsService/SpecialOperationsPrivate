/*
	Created by Lux0r
*/


private ["_grp","_iconCfg"];

_grp = [_this, 0] call BIS_fnc_param;


_iconCfg = switch (groupID _grp) do {
	case "Platoon Lead":	{"ColorBrown";};
	case "Ghost Recon":		{"ColorBlue";};
	case "Ghost 1":			{"ColorBlue";};
	case "Ghost 2":			{"ColorBlue";};
	case "Ghost 3":			{"ColorBlue";};
	case "Ghost 4":			{"ColorBlue";};
	case "HWT":				{"ColorBlue";};
	case "Anvil 1":			{"ColorYellow";};
	case "Reaper 1":		{"ColorGreen";};
	case "Reaper 2":		{"ColorGreen";};
	case "Reaper 3":		{"ColorGreen";};
	case "Havoc 1":			{"ColorOrange";};
	default					{"ColorBlue";};
};

_iconCfg