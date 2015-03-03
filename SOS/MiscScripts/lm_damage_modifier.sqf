/*
	Author: Joe Redfearn (Legman)

	Description:.

	Parameter(s):
*/

waitUntil {!isNil "BIS_fnc_init"};
waitUntil {time > 0.0};
waitUntil {!isNull player};

lm_DM_const_version 			= "1.0.1";
lm_DM_const_damageMultiplier	= 2.0;

lm_DM_var_isModified			= "lm_DM_var_isModified";

lm_DM_fnc_handleDamage = {
	private ["_event", "_unit", "_selectionName", "_damage", "_source"];
	
	_event 			= _this select 0;
	_unit			= _event select 0;
	_selectionName 	= _event select 1;
	_damage			= _event select 2;
	_source			= _event select 3;
	
	_diff = _damage;
	_damage = _damage * lm_DM_const_damageMultiplier;
	_damage
};

lm_DM_fnc_addUnit = {
	private ["_unit"];
	
	_unit = _this select 0;
	
	// Add event handlers.
	_unit addEventHandler ["HandleDamage", {
		[_this] call lm_DM_fnc_handleDamage;
	}];	
	_unit addEventHandler ["Killed", {
		_unit = _this select 0;
		
		_unit removeAllEventHandlers "HandleDamage";
		_unit removeAllEventHandlers "Killed";
		
		_unit setVariable [lm_DM_var_isModified, nil, false];
	}];
};

lm_DM_fnc_queryUnits = {
	private ["_count"];
	
	_count = 0;	
	{	
		if (!(isPlayer _x) && !(_x getVariable [lm_DM_var_isModified, false])) then {
			_x setVariable [lm_DM_var_isModified, true, false];			
			[_x] call lm_DM_fnc_addUnit;
			_count = _count + 1;
		};		
	} forEach allUnits;
	
	_count
};

if (isServer) then {

	// Initialization
	[] spawn {
		_count = 0;
		_delay = 0.0;
		
		while {true} do {
			_count = [] call lm_DM_fnc_queryUnits;
		
			if (_count == 0) then {_delay = 4.0} else {_delay = 1.0};
			sleep _delay;
		};
	};
};

systemChat ("LM Damage Modifier v" + lm_DM_const_version + " Initialized");