/*
	Use this script to allow specific classes to spawn helicopters.

	Created by Lux0r
*/


_caller 		= _this select 1;
_arguments 		= _this select 3;
_vehicleType 	= _arguments select 0;
_spawn 			= _arguments select 1;
_whitelisted	= _arguments select 2;
_texture		= _arguments select 3;
_spawnDelay		= 5;


// Check if players class is allowed to spawn a helicopter.
if ((typeOf _caller) in OS_allowHeliSpawnWest) then {
	if (OS_spawnDelay > 0) then {
		hintSilent format["Please try again in about %1 seconds.", OS_spawnDelay];
		playSound "warning1";
	} else {
		// Create the vehicle at a safe position
		_spawnPos = getPos _spawn;
		_safePos = [_spawnPos, 0, 30, 13, 0, 1000, 0, [], [_spawnPos,_spawnPos]] call BIS_fnc_findSafePos;
		_veh = _vehicleType createVehicle _safePos;
		_veh setDir (getDir _spawn);

		// set TFAR vehicle side to callers side if TFAR is running
		if ("task_force_radio_items" in activatedAddons) then {
			_side = side _caller;
			_veh setVariable ["tf_side", _side, true];
		};

		// add event handler to vehicle sets radio freqs for crew when they get in
		/*if (!isNil "CEN_fnc_vehicleRadioFreqs") then {
			_veh addEventHandler ["GetIn", {
				_this call CEN_fnc_vehicleRadioFreqs; // note: This breaks airbourn radio for some reason.
			}];
		};*/

		// Remove weapons and items, re-add some FAKs
		clearWeaponCargoGlobal _veh;
		clearItemCargoGlobal _veh;
		_veh addItemCargoGlobal ["FirstAidKit", 10];

		// Replace yellow tracers with red for the armed Hellcat
		if (_vehicleType == "I_Heli_light_03_F") then {
			_veh removeMagazineTurret ["5000Rnd_762x51_Yellow_Belt", [-1]];
			_veh addMagazineTurret ["5000Rnd_762x51_Belt", [-1]];
		};

		// Add smoke for helicopter ("lm_helo_support.sqf" must me initialized first!)
		if (_vehicleType in lm_HS_supportedHeloTypes) then {
			[[_veh], 'lm_HS_fnc_initHelo', true, true] call BIS_fnc_MP;
		};

		// Open door script
		switch (_vehicleType) do {
			case "B_Heli_Transport_01_F":		{ [[[_veh],"panda_doors\doors_ghosthawk\addaction.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP; };
			case "B_Heli_Transport_01_camo_F":	{ [[[_veh],"panda_doors\doors_ghosthawk\addaction.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP; };
			case "I_Heli_Transport_02_F":		{ [[[_veh],"panda_doors\doors_mohawk\addaction.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP; };
		};

		// Change texture
		if (_texture != "") then {
			switch (_vehicleType) do {
				case "I_Heli_light_03_unarmed_F";
				case "I_Heli_light_03_F": {
					_veh setObjectTextureGlobal [0, format["SOS\Textures\%1.paa", _texture]];
				};
				case "I_Heli_Transport_02_F": {
					_veh setObjectTextureGlobal [0, format["SOS\Textures\%1.paa", _texture]];
					_veh setObjectTextureGlobal [1, format["SOS\Textures\%1.paa", _texture]];
					_veh setObjectTextureGlobal [2, format["SOS\Textures\%1.paa", _texture]];
				};
			};
		};

		// Protect the pilot seat
		[[_veh],"OS_fnc_protectHelicopterPilotSeat", false, false] call BIS_fnc_MP;

		if (OS_disableThermal == 1) then {
			_veh disableTIEquipment true;
		};

		OS_spawnDelay = OS_spawnDelay + _spawnDelay;
		playSound "confirm1";
	};
} else {
	hintSilent "You can't spawn this helicopter, if you are not a helicopter pilot!";
	playSound "warning1";
};