/*
	Created by Lux0r
*/


_unit = _this select 0;

while {alive _unit} do {
	_backpack = unitBackpack _unit;
	clearMagazineCargoGlobal _backpack;
	_backpack addMagazineCargoGlobal ["Titan_AA",2];
	
	sleep 60;
};