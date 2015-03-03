/*
	This script removes unauthorized gear from the player.

	IMPORTANT:
	It requires a marker for each playable team, to prevent gear sharing in the base between different roles.
	E.g.: m_baseWest, m_baseEast, m_baseGuer, m_baseCiv
	Outside the base is the player allowed to use more gear.

	There must be a variable in missionNamespace, that defines default weapons for the players side.
	E.g.: VA_WeaponsWest, VA_WeaponsEast, VA_WeaponsGuer, VA_WeaponsCiv
	These weapons can be used by all soldiers of this side, if they are outside the base (distance to marker greater than the defined minimum).

	Created by Lux0r
*/


private ["_authorizedBackpacks","_authorizedWeapons","_authorizedItems","_side","_mrkPos","_minDistance","_distance","_inBase","_accessoryName","_weaponName","_backpack","_backpackName"];
_authorizedBackpacks	= _this select 0;
_authorizedWeapons		= _this select 1;
_authorizedItems		= _this select 2;
_side					= side player;
_mrkPos					= getMarkerpos format ["m_base%1", _side];
_minDistance			= 500;

while {true} do {
	sleep 5;
	_distance	= player distance _mrkPos;
	_inBase		= _distance < _minDistance;
	
	// Check if player is using unauthorized primary weapon accessories.
	{
		if (_x != "" && !(_x in _authorizedItems)) then {
			// Exception: Outside the base it's allowed to use all weapon accessories.
			if (_inBase) then {
				_accessoryName = getText (configFile >> "CfgWeapons" >> format["%1", _x] >> "displayName");
				systemChat format["This role is not allowed to use weapon accessory: %1.", _accessoryName];
				player removePrimaryWeaponItem _x;
			};
		};
	} forEach (player weaponAccessories primaryWeapon player);
	
	// Check if player is using unauthorized weapons (including rangefinder).
	{
		if (_x != "" && !(_x in _authorizedWeapons)) then {
			// Exception: Outside the base it's allowed to use some default weapons.
			if (_inBase || !(_x in (missionNamespace getVariable format["VA_Weapons%1",_side]))) then {
				_weaponName = getText (configFile >> "CfgWeapons" >> format["%1", _x] >> "displayName");
				systemChat format["This role is not allowed to use weapon: %1.", _weaponName];
				player removeWeapon _x;
			};
		};
	} forEach weapons player;
	
	// Check if player is using an unauthorized backpack.
	_backpack = backpack player;
	if (_backpack != "" && !(_backpack in _authorizedBackpacks)) then {
		// Exception: Outside the base it's allowed to use all backpacks.
		if (_inBase) then {
			_backpackName = getText (configFile >> "CfgVehicles" >> format["%1", _backpack] >> "displayName");
			systemChat format["This role is not allowed to use backpack: %1.", _backpackName];
			removeBackpack player;
		};
	};
};