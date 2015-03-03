private ["_veh","_vehCrewPos","_unit","_radioGrpCfg"];

_veh = _this select 0;
_vehCrewPos = _this select 1;
_unit = _this select 2;
if (_vehCrewPos in ["driver","gunner","commander"]) then {
	_radioGrpCfg = [_unit] call CEN_fnc_getGroupRadioCfg;
	_swFreqs = _radioGrpCfg select 0;
	_lrFreqs = _radioGrpCfg select 1;
	_channels = _radioGrpCfg select 2;
	_lrRadio = _unit call TFAR_fnc_vehicleLR;
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