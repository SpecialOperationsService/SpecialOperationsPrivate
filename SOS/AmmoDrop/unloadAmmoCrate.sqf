/*
	Edited by Lux0r
*/


AD_running = true;

_veh = vehicle player;
_varcheck = (_veh getVariable "AD_hasAmmoBox");

if (isNil "_varcheck") then {
	_veh setVariable ["AD_hasAmmoBox", true, false];
};

_abort = false;
_pilotAlive = true;

if (_veh getVariable "AD_hasAmmoBox") then {	
	hintSilent "Wait while the ammo crate is being unloaded.";
	playSound "confirm1";
	
	for [{_y = 1}, {(_y <= 30 + floor(random 30))}, {_y = _y + 1}] do {
		if (((speed _veh < -2) or (speed _veh > 2) or ((position _veh) select 2 > 2)) or (!alive _veh)) exitWith {
			_abort = true
		};
		
		if (!alive player) then {
			_pilotAlive = false;
		};
		
		sleep 1;	
	};
	
	if (!_abort) then {
		_cratepos = [(getPos _veh), 10 , 20 , 1 , 0 , 1 , 0, [], [getPos _veh, getPos _veh]] call BIS_fnc_findSafePos;				
		_crate = "B_supplyCrate_F" createVehicle _cratepos;
		_crate allowDamage false;
		
		[_crate] execVM "SOS\AmmoDrop\fillAmmoCrate.sqf";
		
		_veh setVariable ["AD_hasAmmoBox", false, true];
		
		if (_pilotAlive) then {
			hintSilent "The ammo crate has been unloaded!";
			playSound "confirm1";
		};	
	} else {
		if (_pilotAlive) then {
			sleep 2;
			hintSilent "You moved away before the ammo crate could be unloaded!";
			playSound "warning1";
		};
	};	
} else {	
	hintSilent format["No ammo crate inside this vehicle!\n\nYou can pick one up at the service point!"];
	playSound "warning1";	
};

AD_running = false;