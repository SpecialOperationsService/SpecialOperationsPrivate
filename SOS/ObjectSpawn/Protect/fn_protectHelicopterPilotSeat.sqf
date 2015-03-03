/*
	This Script adds an eventHandler to the given vehicle, so only pilots can get in driver seat.

	Created by Lux0r
*/


_veh = _this select 0;

_veh addEventHandler ["GetIn", {
	_veh		= _this select 0;
	_position	= _this select 1;
	_unit		= _this select 2;
	
	// If someone gets in the helicopter as driver and is not using a allowed class, then he's forced to get out again.
	if ((_position == "driver") && !((typeOf _unit) in (SOS_helicopterPilots + SOS_jetPilots))) then {
		_unit action ["engineOff", _veh];
		moveOut _unit;
	};
}];