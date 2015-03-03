/*
	This script removes enemy units (opfor) in a defined radius around the "m_airfield" marker.

	Edited by Lux0r
*/


// Run this script only on server-side.
if (isServer) then {
	_radius	= 1500;
	_mrkPos	= getMarkerpos "m_airfield";

	while {true} do {
		_units = nearestObjects [_mrkPos, ["MAN", "CAR"], _radius];
		
		{
			if (side _x == east) then {
				deleteVehicle _x;
			};
		} forEach _units;
		
		sleep 30;
	};
};