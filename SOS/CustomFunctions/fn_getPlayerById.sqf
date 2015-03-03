/*
	Created by Lux0r
*/


private ["_name","_uid","_player"];
_name	= _this select 0;
_uid	= _this select 1;
_player	= objNull;


if (_name != "__SERVER__") then {
	while {isNull _player} do {
		{
			if (!isNull _x && getPlayerUID _x == _uid) exitWith {
				_player = _x;
			};
			
			sleep 1;
		} forEach playableUnits;
	};
};

_player