/*
	Author: Joe Redfearn (Legman)

	Description:.

	Parameter(s):
*/

waitUntil {!isNil "BIS_fnc_init"};
waitUntil {time > 0.0};
waitUntil {!isNull player};

lm_FR_const_version 			= "1.0.0";

lm_FR_fnc_handleRating = {
	private ["_unit", "_rating"];
	
	_event 		= _this select 0;
	_unit		= _event select 0;
	_rating 	= _event select 1;
	
	0
};

lm_FR_fnc_initPlayer = {
	
	// Add event handlers.
	player addEventHandler ["HandleRating", {
		[_this] call lm_FR_fnc_handleRating;
	}];	
	player addEventHandler ["Respawn", {
		_unit 	= _this select 0;
		_corpse = _this select 1;
		
		_corpse removeAllEventHandlers "HandleRating";
	}];
};

systemChat ("LM Friend Rating v" + lm_FR_const_version + " Initialized");

// Initialization
[] call lm_FR_fnc_initPlayer;