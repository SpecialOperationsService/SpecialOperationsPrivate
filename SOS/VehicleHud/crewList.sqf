// Written by Kochleffel
// Adapted by Code34
// Adapted by EightySix
// Adapted by WhiteRaven
// Adapted by Lux0r


private ["_text","_veh","_vehName","_name","_role","_ctrl"];
disableSerialization;
uiNamespace setVariable ["hud_crewDisplay", objNull];

while {true} do {
	if (isNull (uiNamespace getVariable "hud_crewDisplay")) then {
		2 cutRsc ["infomessage", "PLAIN", 0, false];
	};
	
	_text	= "";
	_veh	= vehicle player;
	
	// Check if player is in a vehicle.
	if (_veh != player) then {
		_vehName	= getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_text		= format ["<t size='1.35' shadow='2' color='#77c753'>%1</t><br/>", _vehName];
		
		// Iterate over the crew of the vehicle.
		{
			_name = name _x;
			if ((_name != "") && (_name != "Error: No unit")) then {
				switch (_x) do {
					case commander _veh: {
						_text = _text + format ["<t size='1.35' shadow='2' color='#77c753'>%1</t> <t size='1.5'><img image='SOS\VehicleHud\media\icon_commander.paa'></t><br/>", _name]; 
					};
					case gunner _veh: {
						_text = _text + format ["<t size='1.35' shadow='2' color='#77c753'>%1</t> <t size='1.5'><img image='SOS\VehicleHud\media\icon_gunner.paa'></t><br/>", _name]; 
					};
					case driver _veh: {
						_text = _text + format ["<t size='1.35' shadow='2' color='#77c753'>%1</t> <t size='1.5'><img image='SOS\VehicleHud\media\icon_driver.paa'></t><br/>", _name]; 
					};
					default	{
						_role = assignedVehicleRole _x;
						if ((_role select 0) != "Turret") then {
							_text = _text + format ["<t size='1.35' shadow='1' color='#567656'>%1</t> <t size='1.5'><img image='SOS\VehicleHud\media\icon_cargo.paa'></t><br/>", _name];
						} else {
							_text = _text + format ["<t size='1.35' shadow='2' color='#77c753'>%1</t> <t size='1.5'><img image='SOS\VehicleHud\media\icon_gunner.paa'></t><br/>", _name];
						};
					};
				};
			};
		} forEach crew _veh;
	};
	
	_ctrl = (uiNamespace getVariable "hud_crewDisplay") displayCtrl 102;
	_ctrl ctrlSetStructuredText parseText _text;
	sleep 1;
};