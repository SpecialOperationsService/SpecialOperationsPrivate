if (hasInterface) then {
	["SetRadioFreqs","OnRadiosReceived",{
		_this spawn CEN_fnc_setRadioChannels;
	},player] call TFAR_fnc_AddEventHandler;

	player addAction ["<t color='#ffff00'>Reset Radio Settings</t>", {[_this select 0,[]] spawn CEN_fnc_setRadioChannels}, nil, 1, false, true, "", "(_target == _this && {((call TFAR_fnc_haveLRRadio) || (call TFAR_fnc_haveSWRadio))})"];

	player addEventHandler ["Respawn", {
		[_this select 0,[]] spawn CEN_fnc_setRadioChannels;
		(_this select 0) addAction ["<t color='#ffff00'>Reset Radio Settings</t>", {[_this select 0,[]] spawn CEN_fnc_setRadioChannels}, nil, 1, false, true, "", "(_target == _this && {((call TFAR_fnc_haveLRRadio) || (call TFAR_fnc_haveSWRadio))})"];
	}];

	// event handlers, sets lr frequencies for any vehicle position the player enters
	{
		if (!(_x isKindOf "Air") && {_x call TFAR_fnc_hasVehicleRadio}) then {
			_x addEventHandler ["GetIn", {
				_this call CEN_fnc_vehicleRadioFreqs; // note: This breaks airbourn radio for some reason.
			}];
		};
	} forEach vehicles;

	{
		_x addEventHandler ["CuratorObjectPlaced", {
			_veh = _this select 0;
			if (_veh call TFAR_fnc_hasVehicleRadio && {!(_veh isKindOf "Air") && {_veh call TFAR_fnc_hasVehicleRadio}}) then {
				_veh addEventHandler ["GetIn", {
					_this call CEN_fnc_vehicleRadioFreqs;
				}];
			};
		}];
	} forEach allCurators;
};