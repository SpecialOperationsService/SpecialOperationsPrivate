/*
	This script contains the groupColors for the different sides, used by the Platoon List.

	IMPORTANT: The size and order must be the same as the groupIDs in "fn_getGroupIDs.sqf".

	Created by Lux0r
*/


private ["_side","_groupColors"];

_side = [_this, 0] call BIS_fnc_param;


_groupColors = switch (_side) do {
	case WEST:	{[
		"#ff8800",	// Brown	(Platoon Lead)
		"#2255ff",	// Blue		(Ghost Recon)
		"#2255ff",	// Blue		(Ghost 1)
		"#2255ff",	// Blue		(Ghost 2)
		"#2255ff",	// Blue		(Ghost 3)
		"#2255ff",	// Blue		(Ghost 4)		
		"#2255ff",	// Blue		(HWT)
		"#FFD700",	// Blue		(Anvil 1)
		"#00ff00",	// Green	(Reaper 1)
		"#00ff00",	// Green	(Reaper 2)
		"#00ff00",	// Green	(Reaper 3)		
		"#FF7F00"	// Orange	(Havoc 1)

	];};
	case EAST:			{[];};
	case RESISTANCE:	{[];};
	case CIVILIAN:		{[];};
	default				{[];};
};

_groupColors