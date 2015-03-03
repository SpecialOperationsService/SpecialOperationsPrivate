/*
	Created by Cenwulf[S.O.S]
*/

_respawnArray = _this;
_playerTickets = [player,nil,true] call BIS_fnc_respawnTickets;
if (_playerTickets == -1 && (["MenuInvPosSpecTicParam",1] call bis_fnc_getParamValue) == 1) then {
	[player,1] call BIS_fnc_respawnTickets;
};
_respawnArray spawn BIS_fnc_respawnTickets;
sleep 0.2;
_playerTickets = [player,nil,true] call BIS_fnc_respawnTickets;
if (_playerTickets == 0) then {
	_respawnArray spawn BIS_fnc_respawnSpectator;
	["<t color='#FACC2E' size='0.75'>YOU ARE NOW SPECTATING</t>",0,0.5,3,1,0,1] spawn bis_fnc_dynamicText;
	2 fadeSound 1;
	2 fadeMusic 1;
	sleep 3;
	["<t color='#FACC2E' size='0.75'>PRESS SPACE TO UNLOCK CAMERA</t>",0,0.5,6,1,0,1] spawn bis_fnc_dynamicText;
} else {
	_respawnArray spawn BIS_fnc_respawnMenuInventory;
	_respawnArray spawn BIS_fnc_respawnMenuPosition;
};