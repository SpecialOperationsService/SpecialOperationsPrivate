/*
	Script spawns a lamp at the given position and direction.

	Created by Lux0r
*/


// Run this script only on server-side.
if (isServer) then {
	_pos = _this select 0;
	_dir = _this select 1;
	
	_lamp = createVehicle ["Land_LampHalogen_F", _pos, [], 0, "CAN_COLLIDE"];
	_lamp setPos [(getPos _lamp) select 0, (getPos _lamp) select 1, -4];
	_lamp setDir _dir;
	_lamp allowDamage false;
};