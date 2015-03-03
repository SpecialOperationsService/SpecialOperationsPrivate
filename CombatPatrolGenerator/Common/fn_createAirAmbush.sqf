/*
	We want to make an "air ambush": the players will roam around the territory, and at a certain point
	they will get near an invisible helipad. This will spring the ambush, creating a helicopter with two
	enemy fireteams inside which will land in a suitable place, unload the infantrymen and attack the ambush position.
	
	Edited by Lux0r
*/


private ["_i","_patrolAreaIndex","_patrolAreaPos","_triggerPos","_dummypad","_dummypadPos","_mrkPatrol","_debug","_heliSupportMarker","_landingMarker","_text"];
_i = _this select 0;
_debug = false;

// First, we create the invisible helipad and use the waitUntil to detect when the players get near it.
_patrolAreaIndex	= _i mod CPG_patrolArea_number;
_patrolAreaPos		= CPG_patrolArea_positions select _patrolAreaIndex;
_triggerPos			= [_patrolAreaPos, 0, (2000*CPG_patrolArea_radiusMulti), 4, 0, 0, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;
_dummypad			= createVehicle ["Land_HelipadEmpty_F", _triggerPos, [], 0, "CAN_COLLIDE"];
_dummypadPos		= getPosATL _dummypad;

// Create marker at trigger position
if (_debug) then {	
	_heliSupportMarker = [format ["heliSupportMarker_%1", _i], _triggerPos, "mil_warning", "ColorGreen", 0.8, "Solid", format ["Heli Support %1", _i]] call CPG_fnc_createMarker;
};

waitUntil {sleep 10; ([_dummypadPos, 500, "count", false, false, [west]] call SOS_fnc_nearestPlayers) > 0};


// Now we find a suitable position where our helicopter will land. We need to find a place which is in plain
// and large enough to let the chopper land without too many problems.
// So we use the BIS_fnc_findSafePos to find the position itself, which then will be checked by
// isFlatEmpty. If it's not big enough for a chopper, the code will run again for another try.
_landPos = [0,0,0];
_check = [];
_counter = 0;
_equal = [[], _check] call BIS_fnc_areEqual;

while {_equal} do {
	_landPos	= [_triggerPos, 0, 600, 4, 0, 0, 0] call BIS_fnc_findSafePos;
	_check		= _landPos isFlatEmpty [ 10, 0, 0.3, 15, 0, false, _dummypad];
	_counter	= _counter + 1;
	_equal		= [[], _check] call BIS_fnc_areEqual;
};

// Safety measure to find a "not too bad" position if you really can't find a "good" one.
if (_counter > 498) then {
	_landPos = [_triggerPos, 0, 1200, 4, 0, 0, 0] call BIS_fnc_findSafePos;
};

// Create marker at landing position
if (_debug) then {
	_landingMarker = [format ["landingMarker_%1", _i], _landPos, "mil_end", "ColorGreen", 0.8, "Solid", format ["Land %1", _i]] call CPG_fnc_createMarker;
	_text = format ["landpos is %1, equal is %2, check is %3", _landPos, _equal, _check];
	systemChat _text;
	diag_log _text;
};

// The helipad where the chopper will land
_helipad = createVehicle ["Land_HelipadEmpty_F", _landPos, [], 0, "CAN_COLLIDE"];
_helipadPos = getPos _helipad;

// Find map corner that is closest to the helipad
_x = 0;
_y = 0;
_direction = "";

if ((_helipadPos select 1) < (CPG_mapSize/2)) then {
	_y = 0;
	_direction = "S";
} else {
	_y = CPG_mapSize;
	_direction = "N";
};

if ((_helipadPos select 0) < (CPG_mapSize/2)) then {
	_x = 0;
	_direction = _direction + "W";
} else {
	_x = CPG_mapSize;
	_direction = _direction + "E";
};

// Create helicopter
_chopper = createVehicle ["O_Heli_Light_02_unarmed_F", [_x, _y], [], 0, "FLY"];
_chopper setVehicleLock "LOCKED";

if (_debug) then {
	_text = format ["Chopper %1 starts from %2 (%3, %4)", _chopper, _direction, _x, _y];
	systemChat _text;
	diag_log _text;
};

// Enemies and their waypoints, all commands to make them get out at the right moment and
// let the chopper fly away	
_group_0 = createGroup east;

_pilot = _group_0 createUnit ["O_helipilot_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_group_0 selectLeader _pilot;
_pilot setBehaviour "CARELESS";
_pilot moveInDriver _chopper;
_pilot allowFleeing 0;


// Create group1 and move them into the chopper
_group_1 = createGroup east;

_ai1 = _group_1 createUnit ["O_Soldier_F", [10, 10, 0], [], 0, "CAN_COLLIDE"];
_ai1 moveInCargo _chopper;

_ai2 = _group_1 createUnit ["O_Soldier_AR_F", [10, 10, 0], [], 0, "CAN_COLLIDE"];
_ai2 moveInCargo _chopper;

_ai3 = _group_1 createUnit ["O_Soldier_F", [10, 10, 0], [], 0, "CAN_COLLIDE"];
_ai3 moveInCargo _chopper;

_ai4 = _group_1 createUnit ["O_Soldier_GL_F", [10, 10, 0], [], 0, "CAN_COLLIDE"];
_ai4 moveInCargo _chopper;


// Create group2 and move them into the chopper
_group_2 = createGroup east;

_ai5 = _group_2 createUnit ["O_Soldier_F", [10, 10, 0], [], 0, "CAN_COLLIDE"];
_ai5 moveInCargo _chopper;

_ai6 = _group_2 createUnit ["O_Soldier_AR_F", [10, 10, 0], [], 0, "CAN_COLLIDE"];
_ai6 moveInCargo _chopper;

_ai7 = _group_2 createUnit ["O_Soldier_GL_F", [10, 10, 0], [], 0, "CAN_COLLIDE"];
_ai7 moveInCargo _chopper;

_ai8 = _group_2 createUnit ["O_Soldier_F", [10, 10, 0], [], 0, "CAN_COLLIDE"];
_ai8 moveInCargo _chopper;


_wp1 = _group_0 addWaypoint [[_landPos select 0, _landPos select 1, 0], 0];
_wp1 setWaypointType "TR UNLOAD";
_wp1 setWaypointBehaviour "CARELESS";
_wp1 setWaypointCombatMode "BLUE";
_wp1 setWaypointStatements ["true", "_chopper flyInHeight 0; _chopper land 'LAND'"];

_wp2 = _group_1 addWaypoint [[_landPos select 0, _landPos select 1, 0], 0];
_wp2 setWaypointType "GETOUT";

_wp3 = _group_2 addWaypoint [[_landPos select 0, _landPos select 1, 0], 0];
_wp3 setWaypointType "GETOUT";

_chopper allowFleeing 0;
_chopper flyInHeight 100;
sleep 15;
_chopper doMove [_landPos select 0, _landPos select 1, 0];


// Wait until chopper is close to its landing position
waitUntil {sleep 1; (_chopper distance _helipad) < 500};

// Start landing manoeuver
_chopper flyInHeight 15;
_chopper land "LAND";
_chopper doMove [_landPos select 0, _landPos select 1, 0];
_chopper land "LAND";

if (_debug) then {
	_text = format["Chopper %1 starts landing manoeuver", _chopper];
	systemChat _text;
	diag_log _text;
};


// Wait until chopper is close to the ground
waitUntil {sleep 1; (getPos _chopper select 2) < 1};

// Let the troops disembark from the chopper
_ai1 action ["getOut", _chopper];
unassignVehicle _ai1;
_ai2 action ["getOut", _chopper];
unassignVehicle _ai2;
_ai3 action ["getOut", _chopper];
unassignVehicle _ai3;
_ai4 action ["getOut", _chopper];
unassignVehicle _ai4;
_ai5 action ["getOut", _chopper];
unassignVehicle _ai5;
_ai6 action ["getOut", _chopper];
unassignVehicle _ai6;
_ai7 action ["getOut", _chopper];
unassignVehicle _ai7;
_ai8 action ["getOut", _chopper];
unassignVehicle _ai8;

if (_debug) then {
	_text = format["Troops disembarked from chopper %1", _chopper];
	systemChat _text;
	diag_log _text;
};

sleep 1;


// As soon as the troops get down of the chopper, they get added to UPSMON and start their tasks
{
	_mrkSize	= if ((random 100) < 75) then {[300, 300];} else {[400, 400];};
	_mrkPatrol	= [_landPos, _mrkSize] call CPG_fnc_createPatrolMarker;

	switch (floor(random 4)) do {
		case 0:	{[leader _x, _mrkPatrol, "spawned"] execVM "scripts\UPSMON.sqf";};
		case 1:	{[leader _x, _mrkPatrol, "spawned", "reinforcement"] execVM "scripts\UPSMON.sqf";};
		case 2:	{[leader _x, _mrkPatrol, "spawned", "onroad"] execVM "scripts\UPSMON.sqf";};
		case 3:	{[leader _x, _mrkPatrol, "spawned", "reinforcement", "onroad"] execVM "scripts\UPSMON.sqf";};
	};
} forEach [_group_1, _group_2];


// Chopper will return to the map corner, where it started. Chopper and pilot will be removed at the waypoint.
_chopper flyInHeight 100;
_pilot = _group_0 addWaypoint [[_x, _y, 100], 0];
_pilot setWaypointType "MOVE";
_pilot setWaypointStatements ["true", "deleteVehicle vehicle this; deleteVehicle this"];

if (_debug) then {
	_text = format ["Chopper %1 return to %2 (%3, %4)", _chopper, _direction, _x, _y];
	systemChat _text;
	diag_log _text;
};