/*
	Author: Joe Redfearn (Legman) 10/05/2014

	Description:.
	Adds functionality to helicopters allowing pilots to deploy smoke grenades.

	Parameter(s):
*/
waitUntil {!(isNull player);};

lm_HS_version = "1.0";
lm_HS_helos = [];

lm_HS_smokeTypeRed 				= "SmokeShellRed";
lm_HS_smokeTypeGreen 			= "SmokeShellGreen";
lm_HS_smokeTypeBlue 			= "SmokeShellBlue";
lm_HS_smokeAmmoCount			= 2;
lm_HS_smokeCookDelay			= 2.0;
lm_HS_smokeDeployDelay			= 60;
lm_HS_smokeDeployRate			= 0.34;
lm_HS_smokeDropCount			= 4;
lm_HS_smokeMinDeployDistance	= 2.0;

lm_HS_var_redSmokeCount			= "lm_HS_redSmokeCount";
lm_HS_var_greenSmokeCount		= "lm_HS_greenSmokeCount";
lm_HS_var_blueSmokeCount		= "lm_HS_blueSmokeCount";
lm_HS_var_smokeDeployDelay		= "lm_HS_smokeDeployDelay";

lm_HS_var_redSmokeActionID		= "lm_HS_redSmokeActionID";
lm_HS_var_greenSmokeActionID	= "lm_HS_greenSmokeActionID";
lm_HS_var_blueSmokeActionID		= "lm_HS_blueSmokeActionID";

lm_HS_supportedHeloTypes		= ["B_Heli_Light_01_F"];

lm_HS_fnc_initHelo = {
	private ["_helo"];
	_helo = _this select 0;
	_type = typeOf _helo;
	_isSupportedHelo = (_type in lm_HS_supportedHeloTypes);

	if (_isSupportedHelo) then {
		[_helo] call lm_HS_fnc_setVariables;				
		_helo addEventHandler ["GetIn", {
			_helo 		= _this select 0;
			_position 	= _this select 1;
			_unit 		= _this select 2;
			if ((_unit == player) && (_position == "driver")) then {
				[_helo] call lm_HS_fnc_updateHelo;		
			};
		}];
	};
	
	_isSupportedHelo
};

lm_HS_fnc_setVariables = {
	private ["_helo"];
	_helo = _this select 0;
	if ((_helo getVariable [lm_HS_var_redSmokeCount, -1]) == -1) then {
		_helo setVariable [lm_HS_var_redSmokeCount, 	lm_HS_smokeAmmoCount, 	true];
		_helo setVariable [lm_HS_var_greenSmokeCount, 	lm_HS_smokeAmmoCount, 	true];
		_helo setVariable [lm_HS_var_blueSmokeCount, 	lm_HS_smokeAmmoCount, 	true];
	};
	_helo setVariable [lm_HS_var_smokeDeployDelay,	0, false];
	[_helo] call lm_HS_fnc_updateHelo;
};

lm_HS_fnc_updateHelo = {
	private ["_helo"];
	_helo = _this select 0;
	[_helo, lm_HS_smokeTypeRed, 	lm_HS_var_redSmokeCount, 	lm_HS_var_redSmokeActionID, 	"Red",  	"#FF707A",	2.6] 	call lm_HS_fnc_addAction;
	[_helo, lm_HS_smokeTypeGreen, 	lm_HS_var_greenSmokeCount, 	lm_HS_var_greenSmokeActionID, 	"Green",	"#78FFA0",	2.4] 	call lm_HS_fnc_addAction;
	[_helo, lm_HS_smokeTypeBlue, 	lm_HS_var_blueSmokeCount, 	lm_HS_var_blueSmokeActionID, 	"Blue", 	"#5E99FF",	2.2] 	call lm_HS_fnc_addAction;
};

lm_HS_fnc_heloLaunchSmoke = {	
	private ["_helo", "_smokeType"];	
	_helo = _this select 0;
	_smokeType = if (count _this > 1) then {_this select 1;} else {LM_shellTypeRed;};
	_smokeCount = lm_HS_smokeDropCount;
	for "_i" from 0 to (_smokeCount - 1) do {		
		_null = [_helo, _smokeType, _i] spawn {
			private ["_helo", "_type", "_index"];
			_helo 	= _this select 0;			
			_type 	= _this select 1;
			_index 	= _this select 2;
			
			_smoke 	= _type createVehicle ([0.0, 0.0, 0.0]);
			sleep lm_HS_smokeCookDelay;
			_smoke setPos (_helo modelToWorld [0.0, 0.0, -1.0]);			
			_heading = [sin direction _helo, cos direction _helo];
			_heading = [_heading, 1.4] call BIS_fnc_vectorMultiply;
			_launchVector = [0.0, 0.0, 0.0]; 
			if ((_index mod 2) == 0) then {
				_launchVector set [0, -(_heading select 1)];
				_launchVector set [1, (_heading select 0)];
			} else {
				_launchVector set [0, (_heading select 1)];
				_launchVector set [1, -(_heading select 0)];
			};
			_launchVector = ([_launchVector, velocity _helo] call BIS_fnc_vectorAdd);
			_launchVector set [2, 0.0];
			_smoke setVelocity _launchVector;
		};
		sleep lm_HS_smokeDeployRate;
	};
};

lm_HS_fnc_addAction = {
	private ["_helo", "_smokeType", "_smokeVar", "_actionVar", "_actionName", "_actionColor", "_actionPriority"];	
	_helo 				= _this select 0;
	_smokeType 			= _this select 1;
	_smokeVar 			= _this select 2;
	_actionVar			= _this select 3;
	_actionName 		= _this select 4;
	_actionColor 		= _this select 5;
	_actionPriority 	= _this select 6;	
	
	_prevActionID = _helo getVariable _actionVar;
	if (_prevActionID >= 0) then {
		_helo removeAction _prevActionID;
	};
	
	_actionID = _helo addAction [format ["<t color='%1'>%2</t>", _actionColor, ("Deploy " + _actionName + " Smoke (" + format ["%1", (_helo getVariable _smokeVar)] + ")")], {
		private ["_helo", "_smokeType", "_smokeVar", "_actionVar", "_actionName", "_actionColor", "_actionPriority"];
		_helo 				= _this select 3 select 0;
		_smokeType 			= _this select 3 select 1;
		_smokeVar 			= _this select 3 select 2;
		_actionVar			= _this select 3 select 3;
		_actionName 		= _this select 3 select 4;
		_actionColor 		= _this select 3 select 5;
		_actionPriority 	= _this select 3 select 6;
		
		if ((getPosATL _helo select 2) < lm_HS_smokeMinDeployDistance) exitWith {
			hint format ["You must be flying higher than %1m to deploy smoke!", lm_HS_smokeMinDeployDistance];
			playSound ["warning1", true];
		};
		
		_delay = _helo getVariable lm_HS_var_smokeDeployDelay;
		if (_delay > 0) exitWith {
			hint format ["You cannot deploy smoke for \n%1 seconds!", _delay];
			playSound ["warning1", true];
		};
		
		_count = _helo getVariable _smokeVar;		
		if (_count > 0) then {
			_helo setVariable [_smokeVar, _count - 1, true];
			_helo removeAction (_this select 2);
			[_helo, _smokeType, _smokeVar, _actionVar, _actionName, _actionColor, _actionPriority] call lm_HS_fnc_addAction;
			[_helo, _smokeType] call lm_HS_fnc_heloLaunchSmoke;
			_helo setVariable [lm_HS_var_smokeDeployDelay, lm_HS_smokeDeployDelay, false];
			_null = [_helo] spawn {
				private ["_helo"];
				_helo = _this select 0;
				while {true} do {
					_delay = _helo getVariable lm_HS_var_smokeDeployDelay;
					_delay = _delay - 1;
					_helo setVariable [lm_HS_var_smokeDeployDelay, _delay, false];
					if (_delay <= 0) exitWith {
						if (driver _helo == player) then {
							hint format ["Smoke ready!", _delay];
							playSound ["confirm1", true];						
						};						
					};
					sleep 1.0;
				};
			};
		};
	}, [_helo, _smokeType, _smokeVar, _actionVar, _actionName, _actionColor, _actionPriority], _actionPriority, false, true, "", "(driver _target == _this)"];
	_helo setVariable [_actionVar, _actionID, false];
	_actionID
};

// Initial check for existing vehicles
{
	[_x] call lm_HS_fnc_initHelo;
} forEach vehicles;

systemChat ("LM Helicopter Support v" + lm_HS_version + " Initialized");