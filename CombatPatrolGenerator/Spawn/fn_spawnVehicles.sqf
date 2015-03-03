/*
	This script spawns empty Opfor vehicles, depending on how big the group next to it is.
	The group size, position and chance to spawn is determined by the parameters.

	Parameters:
	_this select 0: Coordinates - Random position will be chosen nearby the coordinates given.
	_this select 1: Integer - From 0 to 100. Determines chance to spawn the vehicles. An integer higher than 99 will always result in vehicles getting spawned.
	_this select 2: Group - The script counts how large the group is and spawns enough vehicles for the entire group. The vehicles are assigned to the group.
	_this select 3: String - Vehicle type to spawn. Must be either "ATVs" or "Quadbikes".

	Returns: Nothing

	Edited by Lux0r
*/


private ["_pos","_chance","_grp","_type","_count","_range","_class","_needGunner","_vehPos","_veh","_driver","_gunner"];

_pos	= [_this, 0] call BIS_fnc_param;
_chance	= [_this, 1] call BIS_fnc_param;
_grp	= [_this, 2] call BIS_fnc_param;
_type	= [_this, 3] call BIS_fnc_param;
_armed	= [_this, 4, false] call BIS_fnc_param;


if ((floor(random 100)) < _chance) then {
	_count	= count units _grp;

	switch (_type) do {
		case "ATVs": {
			if (CPG_patrolArea_guerillas == 2) then {
				_range	= if (_armed) then {12} else {20};
				_class	= "";
				_needGunner = false;

				while {_count > 0} do {
					switch (floor(random _range)) do {
						case 0:	{	// 5% chance to spawn Ifrit GMG
							_class = "O_MRAP_02_gmg_F";
							_count = _count - 3;
							_needGunner = true;
						};
						case 1:	{	// 5% chance to spawn Ifrit HMG
							_class = "O_MRAP_02_hmg_F";
							_count = _count - 3;
							_needGunner = true;
						};
						case 2:	{	// 5% chance to spawn Strider GMG
							_class = "I_MRAP_03_gmg_F";
							_count = _count - 3;
							_needGunner = true;
						};
						case 3:	{	// 5% chance to spawn Strider HMG
							_class = "I_MRAP_03_hmg_F";
							_count = _count - 3;
							_needGunner = true;
						};
						case 4;
						case 5;
						case 6;
						case 7;
						case 8;
						case 9;
						case 10;
						case 11: {	// 40% chance to spawn armed offroad
							_class = "B_G_Offroad_01_armed_F";
							_count = _count - 3;
							_needGunner = true;
						};
						case 12: {	// 5% chance to spawn offroad camo
							_class = "B_G_Offroad_01_F";
							_count = _count - 6;
						};
						case 13: {	// 5% chance to spawn offroad civ
							_class = "C_Offroad_01_F";
							_count = _count - 6;
						};
						case 14: {	// 5% chance to spawn Ifrit
							_class = "O_MRAP_02_F";
							_count = _count - 4;
						};
						case 15: {	// 5% chance to spawn Strider
							_class = "I_MRAP_03_F";
							_count = _count - 4;
						};
						case 16: {	// 5% chance to spawn Zamak Transport
							_class = "O_Truck_02_transport_F";
							_count = _count - 15;
						};
						case 17: {	// 5% chance to spawn Zamak Transport (Covered)
							_class = "O_Truck_02_covered_F";
							_count = _count - 15;
						};
						case 18: {	// 5% chance to spawn Zamak Transport
							_class = "O_Truck_02_transport_F";
							_count = _count - 15;
						};
						case 19: {	// 5% chance to spawn Zamak Transport (Covered)
							_class = "I_Truck_02_covered_F";
							_count = _count - 15;
						};
					};
				};
			} else {
				_range	= if (_armed) then {5} else {10};
				_class	= "";
				_needGunner = false;

				while {_count > 0} do {
					switch (floor(random _range)) do {
						case 0;
						case 1:	{	// 20% chance to spawn Ifrit GMG
							_class = "O_MRAP_02_gmg_F";
							_count = _count - 3;
							_needGunner = true;
						};
						case 2;
						case 3;
						case 4:	{	// 30% chance to spawn Ifrit HMG
							_class = "O_MRAP_02_hmg_F";
							_count = _count - 3;
							_needGunner = true;
						};
						case 5;
						case 6;
						case 7:	{	// 30% chance to spawn Ifrit
							_class = "O_MRAP_02_F";
							_count = _count - 4;
						};
						case 8:	{	// 10% chance to spawn Zamak Transport
							_class = "O_Truck_02_transport_F";
							_count = _count - 15;
						};
						case 9:	{	// 10% chance to spawn Zamak Transport (Covered)
							_class = "O_Truck_02_covered_F";
							_count = _count - 15;
						};
					};
				};

				_vehPos = [_pos, 0, 100, 8, 0, 0.5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
				_veh = _class createVehicle _vehPos;
				_veh setDir (random 360);
				_veh setVehicleLock "LOCKED";
				_grp addVehicle _veh;

				_crewPos = [_vehPos, 4, 20, 4, 0, 0, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
				_driver = _grp createUnit ["O_Soldier_lite_F", _crewPos, [], 0, "NONE"];
				_driver moveInDriver _veh;
				_driver assignAsDriver _veh;

				if (_needGunner) then {
					_gunner = _grp createUnit ["O_Soldier_lite_F", _crewPos, [], 0, "NONE"];
					_gunner moveInGunner _veh;
					_gunner assignAsGunner _veh;
				};
			};
		};
		case "Quadbikes": {
			if (CPG_patrolArea_guerillas == 2) then {
				for [{_i = _count}, {_i > 0}, {_i = _i - 2}] do {
					_vehPos = [_pos, 0, 100, 8, 0, 0.5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
					_class = ["C_Quadbike_01_F","I_Quadbike_01_F","B_G_Quadbike_01_F","O_Quadbike_01_F"] call BIS_fnc_selectRandom;
					_veh = _class createVehicle _vehPos;
					_veh setDir (random 360);
					_grp addVehicle _veh;
				};
			} else {
				for [{_i = _count}, {_i > 0}, {_i = _i - 2}] do {
					_vehPos = [_pos, 0, 100, 8, 0, 0.5, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
					_veh = "O_Quadbike_01_F" createVehicle _vehPos;
					_veh setDir (random 360);
					_grp addVehicle _veh;
				};
			};
		};
	};
};