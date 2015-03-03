/*
	This Script adds an eventHandler to the given vehicle, so only jet pilots can get in driver seat.

	Created by Lux0r
*/


_veh = _this select 0;

_veh addEventHandler ["GetIn", {
	_veh		= _this select 0;
	_position	= _this select 1;
	_unit		= _this select 2;
	
	// If someone gets in the jet and is not whitelisted, then he's forced to get out again.
	if (!((typeOf _unit) in SOS_jetPilots)) then {
		_unit action ["engineOff", _veh];
		moveOut _unit;
	};
}];