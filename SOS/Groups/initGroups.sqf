/*
	Created by Lux0r
*/


// Server-side:
if (isServer) then {
	// Add onPlayerConnected event handler
	["GRP_onPlayerConnectedEH", "onPlayerConnected", {[_name, _uid] spawn GRP_fnc_onPlayerConnected;}] call BIS_fnc_addStackedEventHandler;
};

// Client-side:
if (!isDedicated) then {
	waitUntil {!IsNull Player && alive player};
	
	setGroupIconsSelectable false;
	setGroupIconsVisible [true, false]; //[show markers on map, show markers on player hud]
	
	_groups = [side player] call GRP_fnc_getGroups;
	{
		[_x] call GRP_fnc_addGroupIcon;
	} forEach _groups;
};