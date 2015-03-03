_unit = _this select 0;
_vehicles = vehicles;

if (_unit isKindOf "AllVehicles") then {
	switch (faction _unit) do {
	    case "BLU_F": {
			if ((["aiGearFactionNATO",1] call BIS_fnc_getParamValue) == 1) then {
				if (_unit in _vehicles) then {
					_crew = crew _unit;
					{
						_x spawn CEN_fnc_aiGear;
					} forEach _crew;
				} else {
					_unit spawn CEN_fnc_aiGear;
				};
			};
	    };
	    case "BLU_G_F": {
			if ((["aiGearFactionFIA",1] call BIS_fnc_getParamValue) == 1) then {
				if (_unit in _vehicles) then {
					_crew = crew _unit;
					{
						_x spawn CEN_fnc_aiGear;
					} forEach _crew;
				} else {
					_unit spawn CEN_fnc_aiGear;
				};
			};
	    };
	    case "OPF_F": {
			if ((["aiGearFactionCSAT",1] call BIS_fnc_getParamValue) == 1) then {
				if (_unit in _vehicles) then {
					_crew = crew _unit;
					{
						_x spawn CEN_fnc_aiGear;
					} forEach _crew;
				} else {
					_unit spawn CEN_fnc_aiGear;
				};
			};
	    };
	    case "IND_F": {
			if ((["aiGearFactionAAF",1] call BIS_fnc_getParamValue) == 1) then {
				if (_unit in _vehicles) then {
					_crew = crew _unit;
					{
						_x spawn CEN_fnc_aiGear;
					} forEach _crew;
				} else {
					_unit spawn CEN_fnc_aiGear;
				};
			};
	    };
	    case "CIV_F": {
			if ((["aiGearFactionCiv",1] call BIS_fnc_getParamValue) == 1) then {
				if (_unit in _vehicles) then {
					_crew = crew _unit;
					{
						_x spawn CEN_fnc_aiGear;
					} forEach _crew;
				} else {
					_unit spawn CEN_fnc_aiGear;
				};
			};
	    };
	};
};