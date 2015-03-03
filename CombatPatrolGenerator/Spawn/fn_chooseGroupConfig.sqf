/*
	This script chooses a random enemy group that is to be spawned. It returns a group config, depending on the type parameter.

	Parameters:
	_this select 0: String - Must be either "Infantry" or "MotInf".

	Returns: Group Config

	Edited by Lux0r
*/


private ["_type","_grpCfg"];

_type	= [_this, 0] call BIS_fnc_param;
_grpCfg	= "";


switch (_type) do {
	case "Infantry": {
		_grpCfg = switch (floor(random 5)) do {
			case 0:	{configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry";};
			case 1:	{configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad";};
			case 2:	{configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad_Weapons";};
			case 3:	{configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam";};
			case 4:	{configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Support" >> "OI_support_EOD";};
		};
	};
	case "MotInf": {
		_grpCfg = switch (floor(random 2)) do {
			case 0:	{configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Motorized_MTP" >> "OIA_MotInf_AT";};
			case 1:	{configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Motorized_MTP" >> "OIA_MotInfTeam";};
		};
	};
};

_grpCfg