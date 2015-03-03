/*
	Created by Lux0r
*/


private ["_mkrName","_mkrPos","_mkrType","_mkrColor","_mkrAlpha","_mkrBrush","_mkrText","_mrk"];

_mkrName	= [_this, 0] call BIS_fnc_param;
_mkrPos		= [_this, 1] call BIS_fnc_param;
_mkrType	= [_this, 2] call BIS_fnc_param;
_mkrColor	= [_this, 3, "ColorRed"] call BIS_fnc_param;
_mkrAlpha	= [_this, 4, 0.8] call BIS_fnc_param;
_mkrBrush	= [_this, 5, "Solid"] call BIS_fnc_param;
_mkrText	= [_this, 6, ""] call BIS_fnc_param;


_mrk = createMarker [_mkrName, _mkrPos];
_mrk setMarkerType _mkrType;
_mrk setMarkerColor _mkrColor;
_mrk setMarkerAlpha _mkrAlpha;
_mrk setMarkerBrush _mkrBrush;
_mrk setMarkerText _mkrText;

_mrk