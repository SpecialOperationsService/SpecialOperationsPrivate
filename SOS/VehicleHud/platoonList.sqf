// Written by Kochleffel
// Adapted by Code34
// Adapted by EightySix
// Adapted by WhiteRaven
// Adapted by Lervik
// Adapted by Lux0r


private ["_leaderTypes","_text","_side","_groups","_groupIDs","_groupColors","_groupId","_groupColor","_name","_ctrl"];
disableSerialization;
uiNamespace setVariable ["hud_platoonDisplay", objNull];

_leaderTypes = ["B_Soldier_SL_F", "B_Soldier_TL_F", "B_recon_TL_F"]; // Platoon Leader, Shadow/Ghost Leader, Recon Leader
hud_showPlatoonList = false;
[] execVM "SOS\VehicleHud\keyDownEH.sqf";

waitUntil {!isNull player};

while {true} do {
	if (isNull (uiNamespace getVariable "hud_platoonDisplay")) then {
		1 cutRsc ["infomessage2", "PLAIN", 0, true];
	};
	
	_text = "";
	
	if (hud_showPlatoonList) then {
		_side = side player;
		_groups	= [_side] call GRP_fnc_getGroups;
		_groupIDs = [_side] call VH_fnc_getGroupIDs;
		_groupColors = [_side] call VH_fnc_getGroupColors;
		
		// Iterate over all defined groupIDs of this side
		{
			_groupId	= _x;
			_groupColor	= _groupColors select _foreachIndex;
			
			// Iterate over all present groups of the players side
			{
				// Check if the defined group is present in the game
				if (_groupId == groupId _x) then {
					_text = _text + format ["<t size='1.4' shadow='2' color='%1'>%2</t><br/>", _groupColor, _groupId]; 
					
					// Iterate over all units in the group
					{
						// Highlight the name of the player that runs this script
						_name = name _x;
						if (_name == name player) then {
							_text = _text + format [" = <t size='1.2' shadow='2' color='#ffffff'>%1</t> =<br/>", _name];
						} else {
							// Highlight the leader, if present
							if ((typeOf _x) in _leaderTypes) then {
								_text = _text + format ["<t size='1.1' shadow='2' color='#ffffff'>%1</t><br/>", _name];
							} else {
								_text = _text + format ["<t size='1.1' shadow='2' color='#aae793'>%1</t><br/>", _name];
							};
						};
					} forEach units _x;
				};
			} forEach _groups;
		} forEach _groupIDs;
	};
	
	_ctrl = (uiNamespace getVariable "hud_platoonDisplay") displayCtrl 104;
	_ctrl ctrlSetStructuredText parseText _text;
	sleep 1;
};