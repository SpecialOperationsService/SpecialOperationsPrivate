/*
	This script makes it so air and ground vehicles can resupply (repair, rearm, refuel) at two triggers called "trg_farp1" and "trg_farp2" and "trg_JetSupply".
	Run this script on the clients.

	Edited by Lux0r
*/


while {true} do {
	_veh = vehicle player;
	_vehicleType = typeOf _veh;

	if (!(_veh isKindOf "Man")) then {
		if ((_veh in list trg_farp1) || (_veh in list trg_farp2) || (_veh in list trg_JetSupply)) then {
			if (_veh != player and speed _veh > -2 and speed _veh < 2 and position _veh select 2 < 2.0 and (local _veh)) then {
				_aborted = false;
				_served = false;
				_reamRefuelDone = false;
				
				// Repair and refuel
				if(getDammage _veh > 0 || fuel _veh < 0.98) then {
					titleText ["SERVICING...", "PLAIN",0.3];
					playSound "confirm1";
					
					sleep 3;
					titleText ["PERFORMING REPAIR/REFUEL...", "PLAIN",0.3];
					hintSilent "PERFORMING REPAIR/REFUEL...";
					_served = true;
					
					while {!_reamRefuelDone && !_aborted} do {
						sleep 0.2;
						
						if (getDammage _veh > 0) then {
							_veh setDammage ((getDammage _veh) - 0.003);
						};
						
						if (Fuel _veh < 1) then {
							_veh setFuel ((Fuel _veh) + 0.006);
						};
						
						if (getDammage _veh == 0 && Fuel _veh == 1) then {
							_reamRefuelDone = true;
							titleText ["REPAIR/REFUEL DONE", "PLAIN",0.3];
							hintSilent "REPAIR/REFUEL DONE";
						};
						
						if (_veh != vehicle player || speed _veh < -2 || speed _veh > 2 || position _veh select 2 > 2.0) then {
							_aborted = true;
						};
						
						_damage = (getDammage _veh) * 100;
						_fuel = (Fuel _veh) * 100;
						hintSilent format["Damage: %1\nFuel: %2", Round _damage, Round _fuel];
					};
				};
				
				// Rearm
				if ((count (weapons _veh) > 0) && !_aborted) then {
					if (!_served) then {
						titleText ["SERVICING...", "PLAIN",0.3];
						playSound "confirm1";
					};
					
					sleep 3;
					titleText ["PERFORMING REARM...", "PLAIN",0.3];
					hintSilent "PERFORMING REARM...";
					_served = true;
					
					for [{_i=1}, {_i<=21}, {_i=_i + 1}] do {					
						sleep 1;
						
						if (_veh != vehicle player or speed _veh < -2 or speed _veh > 2 or position _veh select 2 > 2.0) then {
							_i=22;
							_aborted = true;
						};
						
						if (_i == 21) then {
							titleText ["REARM DONE", "PLAIN",0.3];
							hintSilent "REARM DONE";
							_veh setVehicleAmmo 1;
						};
					};					
				};
				
				// Reload ammo box
				if ((_vehicleType in ["B_Heli_Transport_01_F", "B_Heli_Transport_01_camo_F"]) && !_aborted) then {
					if (!_served) then {
						titleText ["SERVICING...", "PLAIN",0.3];
						playSound "confirm1";
					};
					
					_varcheck = (_veh getVariable "AD_hasAmmoBox");
					if (isNil "_varcheck") then {
						_veh setVariable ["AD_hasAmmoBox", true, false];
					};
					
					_hasammobox = _veh getVariable "AD_hasAmmoBox";					
					if (!_hasammobox) then {
						sleep 3;
						titleText ["LOADING AMMO CRATE...", "PLAIN",0.3];
						hintSilent "LOADING AMMO CRATE...";
						
						for [{_i=1}, {_i<=15}, {_i=_i + 1}] do {
							sleep 1;
							
							if (_veh != vehicle player || speed _veh < -2 || speed _veh > 2 || position _veh select 2 > 2.0) then {
								_i=16;
								_aborted = true;
							};
							
							if (_i == 15) then {
								titleText ["AMMO CRATE LOADED", "PLAIN",0.3];
								hintSilent "AMMO CRATE LOADED";
								_served = true;
								_veh setVariable ["AD_hasAmmoBox", true, true];
							};							
						};
					};
				};
				
				// Legman - Rearm smoke ("lm_helo_support.sqf" must me initialized first!)
				if ((_vehicleType in lm_HS_supportedHeloTypes) && !_aborted) then {
					if (!_served) then {
						titleText ["SERVICING...", "PLAIN",0.3];
						playSound "confirm1";
					};
					
					sleep 3;
					titleText ["LOADING SMOKE SHELLS...", "PLAIN",0.3];
					hintSilent "LOADING SMOKE SHELLS...";
										
					sleep 5;
					_veh setVariable [lm_HS_var_redSmokeCount, 		2, 	true];
					_veh setVariable [lm_HS_var_greenSmokeCount, 	2, 	true];
					_veh setVariable [lm_HS_var_blueSmokeCount, 	2, 	true];
					[_veh] call lm_HS_fnc_updateHelo;
					
					titleText ["SMOKE SHELLS LOADED", "PLAIN",0.3];
					hintSilent "SMOKE SHELLS LOADED";
					_served = true;
				};
				
				if (!_aborted) then {
					if (_served) then {
						sleep 3;
						titleText ["SERVICE COMPLETE", "PLAIN",0.3];
						hintSilent "SERVICE COMPLETE";
						playSound "confirm1";
					} else {
						titleText ["NO SERVICE REQUIRED", "PLAIN",0.3];
						hintSilent "NO SERVICE REQUIRED";
						playSound "warning1";
					};
				} else {
					titleText ["SERVICE ABORTED", "PLAIN",0.3];
					hintSilent "SERVICE ABORTED";
					playSound "warning1";
				};
				
				waitUntil{!((_veh in list trg_farp1) or (_veh in list trg_farp2) or (_veh in list trg_JetSupply))};
			};
		};
	};
	
	sleep 3;
};