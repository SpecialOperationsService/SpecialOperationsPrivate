if (!isDedicated) then {
	if (player call bis_fnc_isUnitVirtual) then {
		_mods = ["","Hlc"];
		_mod = _mods select ("aiGearMod" call BIS_fnc_getParamValue);
		_factions = ["BLU_F","BLU_G_F","OPF_F","IND_F"];
		{[] execVM format ["SOS\Gear\aiGear\aiGear%1%2.sqf", _mod, _x]} forEach _factions;
		[] execVM "SOS\Gear\aiGear\aiGearCommon.sqf";
		waitUntil { !isNull (getAssignedCuratorLogic player) };
		_curator = getAssignedCuratorLogic player;
		[[_curator], "CEN_fnc_addEditableUnits", false, false, true] call BIS_fnc_MP;
		_curator addEventHandler ["CuratorObjectPlaced", {
			[(_this select 1)] spawn CEN_fnc_aiGearUnit;
		}];
		if ((["CenDebug",0] call BIS_fnc_getParamValue) == 1) then {
			_curator addEventHandler [
			"CuratorObjectPlaced",
				{
					systemChat format ["vehicleVarName: %1",(_this select 1)];
					systemChat format ["typeOf: %1",typeOf (_this select 1)];
					systemChat format ["Faction: %1",faction (_this select 1)];
					systemChat format ["Side: %1",side (_this select 1)];
					systemChat format ["Uniform: %1",uniform (_this select 1)];
				}
			];
		};
	};
};