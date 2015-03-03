/*
	This script will allow pilots in the driver seat of a KA60 to spawn an ammo crate, to simulate an ammo drop.

	Run this file on all machines.

	This script requires the following script to exist: SOS\MiscScripts\aircraftResupplyZone.sqf
	The above script can give a vehicle an ammo box when it resupplies, then the ammo box can later be deployed in the field.

	Edited by Lux0r
*/


AD_condition 		= "(((typeOf (vehicle player) == 'B_Heli_Transport_01_F') || (typeOf (vehicle player) == 'B_Heli_Transport_01_camo_F')) && (speed (vehicle player) > -2) && (speed (vehicle player) < 2) && (getPos (vehicle player) select 2 < 2) && (driver (vehicle player) == player) && (!AD_running))";
AD_conditionChute	= "(((typeOf (vehicle player) == 'B_Heli_Transport_01_F') || (typeOf (vehicle player) == 'B_Heli_Transport_01_camo_F')) && (speed (vehicle player) >= 50) && (getPos (vehicle player) select 2 >= 75) && (driver (vehicle player) == player) && (!AD_running))";

waitUntil {scriptDone initGlobalVariables;};

_pilots = SOS_helicopterPilots + SOS_jetPilots;
if ((typeOf player) in (SOS_helicopterPilots + SOS_jetPilots)) then {
	AD_running = false;
	
	player addAction ["Unload Ammo Box", "SOS\AmmoDrop\unloadAmmoCrate.sqf", "", 1, false, true, "", AD_condition];
	player addAction ["Unload Ammo Box Parachute", "SOS\AmmoDrop\unloadAmmoCrateParachute.sqf", "", 1, false, true, "", AD_conditionChute];
	
	player addEventhandler ["Respawn", {
		player addAction ["Unload Ammo Box", "SOS\AmmoDrop\unloadAmmoCrate.sqf", "", 1, false, true, "", AD_condition];
		player addAction ["Unload Ammo Box Parachute", "SOS\AmmoDrop\unloadAmmoCrateParachute.sqf", "", 1, false, true, "", AD_conditionChute];
	}];
};

//Functions
AD_paradrop = {
	_veh          = _this select 0;
	_dropped      = _this select 1;
	_chute_type   = _this select 2;
	private ["_chute"];
	
	_dropped attachTo [_veh,[0,2,-5]];
	sleep 0.1;
	detach _dropped;
	
	waitUntil {_dropped distance _veh > 30};
	
	// create smoke and attach to dropped ammoBox
	_smoke        = "SmokeshellGreen" createVehicle position _dropped;
	_smoke attachTo [_dropped,[0,0,0]];
	// create chem light and attach to dropped ammoBox
	_chem         = "Chemlight_green" createVehicle position _dropped;
	_chem attachTo [_dropped,[0,0,0]]; 
	// create parachute and attach the dropped ammoBox to it
	_chute = createVehicle [_chute_type, [0,0,0], [], 0, "NONE"];
	_chute setDir getDir _dropped;
    _chute setPos getPos _dropped;
	_dropped attachTo [_chute, [0,0,0]];
	
	// give the parachute 5s to unfold
	sleep 5;
	
	_height = (getPos _chute) select 2;
	_oldHeight = 0;
	
	// check if  the parachute is still flying (height over 0.3m and rate of fall over 0.005m/s)
	while {(_height > 0.3) and (abs (_height - _oldHeight) > 0.005)} do {
		sleep 1;
		_oldHeight = _height;
		_height = (getPos _chute) select 2;
		hintSilent format["_height: %1 \n speed: %2", _height, abs (_height - _oldHeight)];
	};
	
	// play sound and show a smoke animation to simulate a charge going off
	playSound3D ["a3\sounds_f\weapons\Flare_Gun\flaregun_1_shoot.wss", _dropped];
	[_dropped, "AD_smokeAnimation", true] call BIS_fnc_MP;
	
	// detach dropped ammoBox from parachute
	//detach _dropped;
	_chute disableCollisionWith _veh;
	
	// reset position and orientation of the ammoBox to prevent glitches
	_dropped setPos getPos _dropped;
	_dropped setVectorUp surfaceNormal position _dropped;
	
	// wait 5 seconds. Then delete the parachute, if it didn't fold properly.
	sleep 5;
	if (!isNull _chute) then {
		deleteVehicle _chute;
		//hintSilent "parachute deleted";
	};
};

AD_smokeAnimation = {
	_dropped = _this;
	_vel = velocity _dropped select 2;

	for "_i" from 1 to 100 do {
		drop [
			["\A3\data_f\ParticleEffects\Universal\Universal", 16, 7, 48],
			"",
			"Billboard",
			0, 
			1 + random 0.5,
			[0, -2, 1.5],
			[-20 + random 40, -20 + random 40, -15 + _vel],
			1,
			0.05,
			0.04,
			0, 
			[0.5, 10 + random 20],
			[
				[0,0,0,1],
				[0,0,0,0.3],
				[1,1,1,0.1],
				[1,1,1,0.03],
				[1,1,1,0.01],
				[1,1,1,0.003],
				[1,1,1,0.001],
				[1,1,1,0]
			],
			[1],
			0.1,
			0.1,
			"",
			"",
			_dropped,
			random 360,
			true,
			0.1
		];
	};
};