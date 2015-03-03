/*
	Edited by Lux0r
*/


_board = (_this select 0);

_action = _board addAction ["<t color='#2255ff'>General Instructions</t>", "SOS\Instructions\text\general.sqf", [], 10, true, true];
_action = _board addAction ["<t color='#08CC00'>How to Teamplay</t>", "SOS\Instructions\text\teamplay.sqf", [], 10, false, true];
_action = _board addAction ["<t color='#2255ff'>Custom Channels</t>", "SOS\Instructions\text\customChannels.sqf", [], 10, false, true];
_action = _board addAction ["<t color='#08CC00'>Side Missions</t>", "SOS\Instructions\text\sideMissions.sqf", [], 10, false, true];
_action = _board addAction ["<t color='#2255ff'>Markers</t>", "SOS\Instructions\text\markers.sqf", [], 10, false, true];
_action = _board addAction ["<t color='#08CC00'>Helicopters</t>", "SOS\Instructions\text\helicopters.sqf", [], 10, false, true];
_action = _board addAction ["<t color='#2255ff'>Join [S.O.S]</t>", "SOS\Instructions\text\joinSOS.sqf", [], 10, false, true];