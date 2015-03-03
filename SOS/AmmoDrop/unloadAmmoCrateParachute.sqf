/*
	Created by Lux0r
*/


AD_running = true;

_veh = vehicle player;
_varcheck = (_veh getVariable "AD_hasAmmoBox");

if (isNil "_varcheck") then {
	_veh setVariable ["AD_hasAmmoBox", true, false];
};

if (_veh getVariable "AD_hasAmmoBox") then {
	// set create position outside the map
	_cratepos = [-5000,-5000,0];
	_crate = "B_supplyCrate_F" createVehicle _cratepos;
	_crate allowDamage false;
	
	[_crate] execVM "SOS\AmmoDrop\fillAmmoCrate.sqf";
	
	// start the parachute function
	[_veh,_crate,"B_Parachute_02_F"] spawn AD_paradrop;
	
	_veh setVariable ["AD_hasAmmoBox", false, true];
	
	hintSilent "The ammo crate has been unloaded with a parachute!";
	playSound "confirm1";
} else {
	hintSilent format["No ammo crate inside this vehicle!\n\nYou can pick one up at the service point!"];
	playSound "warning1";	
};

AD_running = false;