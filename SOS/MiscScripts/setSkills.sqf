/*
	Set skill for ai.

	Edited by Lux0r
*/


// Array with all ai units, that already have adjusted skills.
_units = [];
_debug = false;

diag_log format ["%1 - starting set skills", time];
diag_log "-------------------------------------------------------------------------";

while {true} do {
	_newUnits = allUnits - _units;
	diag_log format ["setSkill - _newUnits: %1", count _newUnits];
	
	{
		if (!isPlayer _x) then {
			if (_debug) then {
				_aA = _x skill "aimingAccuracy";
				_aS = _x skill "aimingShake";
				_aSp = _x skill "aimingSpeed";
				_e = _x skill "Endurance";
				_sD = _x skill "spotDistance";
				_sT = _x skill "spotTime";
				_c = _x skill "courage";
				_rS =_x skill "reloadSpeed";
				_cm =_x skill "commanding";
				
				diag_log format ["unit: %1 - ORGSKILL: aimingAccuracy: %2 aimingShake: %3 aimingSpeed: %4 Endurance: %5 spotDistance: %6 spotTime: %7 courage: %8 reloadSpeed: %9 commanding: %10"
								,_x,_aA,_aS,_aSp,_e,_sD,_sT,_c,_rS, _cm];
			};
			
			_x setUnitAbility 0.7;
			_x setSkill ["general",0.70 + random 0.30];
			_x setSkill ["aimingAccuracy",0.20 + random 0.10];
			_x setSkill ["aimingShake",0.40 + random 0.20];
			_x setSkill ["aimingSpeed",0.30 + random 0.20];
			_x setSkill ["courage",0.70 + random 0.25];
			_x setSkill ["reloadSpeed",0.35 + random 0.20];
			_x setSkill ["spotDistance",0.60 + random 0.30];
			_x setSkill ["spotTime",0.50 + random 0.20];
			
			if ( isFormationLeader _x ) then {
				_x setSkill ["commanding",0.8 + random 0.20];
			} else {
				_x setSkill ["commanding",0.5 + random 0.20];
			};
			
			// Add unit to array, after skills are adjusted
			_units pushBack _x;
			
			if (_debug) then {
				_g = _x skill "general";
				_aA = _x skill "aimingAccuracy";
				_aS = _x skill "aimingShake";
				_aSp = _x skill "aimingSpeed";
				_c = _x skill "courage";
				_rS =_x skill "reloadSpeed";
				_sD = _x skill "spotDistance";
				_sT = _x skill "spotTime";
				_cm =_x skill "commanding";
				
				diag_log format ["unit: %1 - NEWSKILL: general = %2, aimingAccuracy = %3, aimingShake = %4, aimingSpeed = %5, courage = %6, reloadSpeed = %7, spotDistance = %8, spotTime = %9, commanding = %10"
								,_x,_g,_aA,_aS,_aSp,_c,_rS,_sD,_sT,_cm];
				diag_log "-------------------------------------------------------------------------";
			};
		};
		
		sleep 0.1;
		
	} forEach _newUnits;
	
	sleep 60;
};