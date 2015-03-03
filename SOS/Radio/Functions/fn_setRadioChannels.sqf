/*
	Created by Cenwulf
*/

private ["_unit","_radios","_radioGrpCfg","_swRadio"];

_unit = _this select 0;
_radios = _this select 1;
_swRadio = _unit call TFAR_fnc_activeSwRadio;
_radioGrpCfg = [_unit] call CEN_fnc_getGroupRadioCfg;
_swFreqs = _radioGrpCfg select 0;
_lrFreqs = _radioGrpCfg select 1;
_channels = _radioGrpCfg select 2;

{
	_swFreq = _x;
	_swChannel = _forEachIndex + 1;
	[_swRadio,_swChannel,_swFreq] call TFAR_fnc_setChannelFrequency;
} forEach _swFreqs;
[_swRadio,_channels select 0] call TFAR_fnc_setSwChannel;
if (_channels select 1 >= 0 && {_channels select 1 < 7}) then {
	[_swRadio,_channels select 1] call TFAR_fnc_setAdditionalSwChannel;
};

{
	if(_x != _swRadio) then {
		[_x,_swRadio] call TFAR_fnc_CopySettings;
	};
} forEach _radios;

_time = time + 10;

waitUntil {call TFAR_fnc_haveLRRadio || time > _time};

if (call TFAR_fnc_haveLRRadio || _unit call BIS_fnc_isUnitVirtual) then {
	_lrRadio = _unit call TFAR_fnc_activeLrRadio;
	{
		_lrFreq = _x;
		_lrChannel = _forEachIndex + 1;
		[_lrRadio,_lrChannel,_lrFreq] call TFAR_fnc_setChannelFrequency;
	} forEach _lrFreqs;
	[_lrRadio select 0,_lrRadio select 1,_channels select 2] call TFAR_fnc_setLrChannel;
	if (_channels select 3 >= 0 && {_channels select 3 < 8}) then {
		[_lrRadio select 0,_lrRadio select 1,_channels select 3] call TFAR_fnc_setAdditionalLrChannel;
	};
};