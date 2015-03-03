if (hasInterface) then {
	player addAction ["<t color='#DBA901'>Take Command</t>", {_this spawn GRP_fnc_takeCommand}, nil, 5, false, false, "", '(_this == _target && {!(leader (group _this) == _this) && {(rankID _this >= rankID (leader (group _this)) || !(alive (leader (group _this))))}})'];

	player addEventHandler ["Respawn", {
		[_this select 0,[]] spawn CEN_fnc_setRadioChannels;
		(_this select 0) addAction ["<t color='#DBA901'>Take Command</t>", {_this spawn GRP_fnc_takeCommand}, nil, 5, false, false, "", '(_this == _target && {!(leader (group _this) == _this) && {(rankID _this >= rankID (leader (group _this)) || !(alive (leader (group _this))))}})'];
	}];
};