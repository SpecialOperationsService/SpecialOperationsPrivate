if ((["GPSGroupIcons",1] call bis_fnc_getParamValue) == 1) then {
	if (isServer) then {
		// Add onPlayerConnected event handler
		["GRP_onPlayerConnectedEH", "onPlayerConnected", {[[_name, _uid], "GRP_fnc_lastKnownPosInit", true, false, true] call BIS_fnc_MP}] call BIS_fnc_addStackedEventHandler;
	};
	if (hasInterface) then {

		player addEventHandler ["Killed", {[group (_this select 0)] call GRP_fnc_lastKnownPos}];

		setGroupIconsVisible [false, false];

		[] spawn {
			_groupPlayer = group player;
			while {true} do {
				waitUntil {
					sleep 1;
					if ("ItemGPS" in (assignedItems player) || "B_UavTerminal" in (assignedItems player) || "O_UavTerminal" in (assignedItems player) || "I_UavTerminal" in (assignedItems player)) exitWith {true};
					false
				};

				setGroupIconsVisible [true, false];
				if (leader _groupPlayer == player) then {
					_groupPlayer setVariable ["hasGPS",true,true];
				};

				waitUntil {
					sleep 1;
					if (!("ItemGPS" in (assignedItems player) || "B_UavTerminal" in (assignedItems player) || "O_UavTerminal" in (assignedItems player) || "I_UavTerminal" in (assignedItems player))) exitWith {true};
					[player] call GRP_fnc_iconsGPS; // add/removes group icons depending on whether group leader has a GPS
					false
				};

				setGroupIconsVisible [false, false];
				if (leader _groupPlayer == player) then {
					_groupPlayer setVariable ["hasGPS",false,true];
					[_groupPlayer] call GRP_fnc_lastKnownPos; // records last known location of groupIcon (group leader)
				};
			};
		};

		[] spawn {
			_groupPlayer = group player;
			while {true} do {
				waitUntil {
					sleep 1;
					if (leader (group player) == player) exitWith {true};
					false
				};
				if ("ItemGPS" in (assignedItems player) || "B_UavTerminal" in (assignedItems player) || "O_UavTerminal" in (assignedItems player) || "I_UavTerminal" in (assignedItems player)) then {
					_groupPlayer setVariable ["hasGPS",true,true];
				} else {
					_groupPlayer setVariable ["hasGPS",false,true];
				};

				waitUntil {
					sleep 10;
					if (leader (group player) != player) exitWith {true};
					false
				};
			};
		};
	};
};