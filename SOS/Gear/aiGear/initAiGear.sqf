if (isServer || !hasInterface) then {
	_mods = ["","Hlc"];
	_mod = _mods select ("aiGearMod" call BIS_fnc_getParamValue);
	_factions = ["BLU_F","BLU_G_F","OPF_F","IND_F"];
	{[] execVM format ["SOS\Gear\aiGear\aiGear%1%2.sqf", _mod, _x]} forEach _factions;
	[] execVM "SOS\Gear\aiGear\aiGearCommon.sqf";
	/*
	_allAI = [];
	{
		if (!isPlayer _x) then {
			_allAI pushBack _x;
		};
	} forEach allUnits;
	{
		[_x] spawn CEN_fnc_aiGearUnit;
	} forEach _allAI;
	*/
};