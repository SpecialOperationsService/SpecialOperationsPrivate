////////////////////////////////////////////////////////////////////////////////////
////
////	Officer
////
////////////////////////////////////////////////////////////////////////////////////


private["_missionPos","_patrolAreaIndex","_patrolAreaPos","_buildingPos","_mrkPos","_targets","_target","_poscache","_posarray","_posofficer","_mrk","_mrkPatrol","_ammo0","_ammo1","_ammo2","_ammo3","_ammo4"];

_valid_buildings = ["Land_i_Barracks_V1_F", "Land_i_Barracks_V2_F", "Land_i_House_Big_01_V1_F", "Land_i_House_Big_02_V1_F", "Land_i_Stone_HouseBig_V1_F", "Land_MilOffices_V1_F","Land_Chapel_V1_F","Land_Chapel_V2_F"];

_patrolAreaIndex	= (CPG_sideMissions_counter + 1) mod CPG_patrolArea_number;
_patrolAreaPos		= CPG_patrolArea_positions select _patrolAreaIndex;

_targets = nearestObjects [_patrolAreaPos, _valid_buildings, (1500*CPG_sideMissions_radiusMulti)];

// This is a safety measure: if no possible targets have been found,
// don't execute the mission itself.
if ((count _targets) > 0) then {
	CPG_sideMissions_counter = CPG_sideMissions_counter + 1;
	_target = _targets select (random ((count _targets) - 1));
	_missionPos = position _target;
	[CPG_blacklistSideMissions, _missionPos, 400, 400] call CPG_fnc_addToBlacklist;

	_counter = 0;
	_posarray = [];

	// as long as building position _counter not equal to "[0,0,0]" keep looping
	while {format ["%1", _target buildingPos _counter] != "[0,0,0]" } do {
		_posarray = _posarray + [_counter];	// add the index of the position to the list
		_counter = _counter + 1;			// increment counter
	};

	// shuffle
	for [{_x = 0},{_x < count (_posarray)},{_x = _x + 1}] do {
		_tempValue = _posarray select _x;
		_tempIndex = floor(random(count _posarray));
		_posarray set [_x, _posarray select _tempIndex];
		_posarray set [_tempIndex, _tempValue];
	};

	_posofficer = _target buildingPos (_posarray select 0);
	_bodypos1 = _target buildingPos (_posarray select 1);
	_bodypos2 = _target buildingPos (_posarray select 2);
	_bodypos3 = _target buildingPos (_posarray select 3);


	_bodyguardHeads = [
		"PersianHead_A3_01",
		"AfricanHead_01",
		"PersianHead_A3_02",
		"AfricanHead_02",
		"PersianHead_A3_03",
		"AfricanHead_03"
	];
	_bodyguardVoices = [
		"Male01PER",
		"Male02PER",
		"Male03PER"
	];

	_static_bodyguards1 = createGroup east;
	_bodyguard = _static_bodyguards1 createUnit ["O_G_Soldier_AR_F", _bodypos1, [], 0, "CAN_COLLIDE"];
	_bodyguard setPos _bodypos1;
	_bodyguardHead = _bodyguardHeads call bis_fnc_selectRandom;
	_bodyguard setFace _bodyguardHead;
	_bodyguardVoice = _bodyguardVoices call bis_fnc_selectRandom;
	_bodyguard setSpeaker _bodyguardVoice;
	if (CPG_patrolArea_guerillas == 2) then {
		_bodyguard spawn CEN_fnc_aiGear;
	};

	_static_bodyguards2 = createGroup east;
	_bodyguard = _static_bodyguards2 createUnit ["O_G_medic_F", _bodypos2, [], 0, "CAN_COLLIDE"];
	_bodyguard setPos _bodypos2;
	_bodyguardHead = _bodyguardHeads call bis_fnc_selectRandom;
	_bodyguard setFace _bodyguardHead;
	_bodyguardVoice = _bodyguardVoices call bis_fnc_selectRandom;
	_bodyguard setSpeaker _bodyguardVoice;
	if (CPG_patrolArea_guerillas == 2) then {
		_bodyguard spawn CEN_fnc_aiGear;
	};

	_static_bodyguards3 = createGroup east;
	_bodyguard = _static_bodyguards3 createUnit ["O_G_Soldier_LAT_F", _bodypos3, [], 0, "CAN_COLLIDE"];
	_bodyguard setPos _bodypos3;
	_bodyguardHead = _bodyguardHeads call bis_fnc_selectRandom;
	_bodyguard setFace _bodyguardHead;
	_bodyguardVoice = _bodyguardVoices call bis_fnc_selectRandom;
	_bodyguard setSpeaker _bodyguardVoice;
	if (CPG_patrolArea_guerillas == 2) then {
		_bodyguard spawn CEN_fnc_aiGear;
	};


	_group_bodyguards = createGroup east;
	_officer = _group_bodyguards createUnit ["O_officer_F", _posofficer, [], 0, "CAN_COLLIDE"];
	_officer setPos _posofficer;
	_bodyguard = _group_bodyguards createUnit ["O_G_Soldier_AR_F", _bodypos1, [], 0, "CAN_COLLIDE"];
	_bodyguard setPos _bodypos1;
	_bodyguard = _group_bodyguards createUnit ["O_G_medic_F", _bodypos2, [], 0, "CAN_COLLIDE"];
	_bodyguard setPos _bodypos2;
	_bodyguard = _group_bodyguards createUnit ["O_G_Soldier_lite_F", _bodypos3, [], 0, "CAN_COLLIDE"];
	_bodyguard setPos _bodypos3;
	{
		_bodyguardHead = _bodyguardHeads call bis_fnc_selectRandom;
		_x setFace _bodyguardHead;
		_bodyguardVoice = _bodyguardVoices call bis_fnc_selectRandom;
		_x setSpeaker _bodyguardVoice;
	} forEach (units _group_bodyguards);
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _group_bodyguards);
	};

	// create group
	_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
	_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
	_mrkPatrol = [_missionPos, [100, 100]] call CPG_fnc_createPatrolMarker;
	[leader _grp, _mrkPatrol, "fortify", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _grp);
	};

	// create group
	_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
	_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
	_mrkPatrol = [_missionPos, [150, 150]] call CPG_fnc_createPatrolMarker;
	[leader _grp, _mrkPatrol, "fortify", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _grp);
	};

	// create group
	_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
	_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
	_mrkPatrol = [_missionPos, [150, 150]] call CPG_fnc_createPatrolMarker;
	[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _grp);
	};

	// create group
	_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
	_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
	_mrkPatrol = [_missionPos, [200, 200]] call CPG_fnc_createPatrolMarker;
	[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _grp);
	};

	// create group
	_grpCfg = ["Infantry"] call CPG_fnc_chooseGroupConfig;
	_grp = [_missionPos, east, _grpCfg, [], [], [0.45,0.9], [], [], (random 360)] call BIS_fnc_spawnGroup;
	_mrkPatrol = [_missionPos, [250, 250]] call CPG_fnc_createPatrolMarker;
	[leader _grp, _mrkPatrol, "random", "nofollow", "spawned"] execVM "scripts\UPSMON.sqf";
	if (CPG_patrolArea_guerillas == 2) then {
		{
			_x spawn CEN_fnc_aiGear;
		} forEach (units _grp);
	};

	// ----------------------------------------------------------------------------------------------------

	_taskName = format ["TaskDSM_%1", CPG_sideMissions_counter];
	CPG_taskNames pushBack _taskName;
	_taskTitle = "Eliminate Officer";
	_taskDesc = "An enemy officer has arrived in the area and is now taking command of enemy forces.<br/><br/>Find and eliminate the officer.";
	_taskImage = "<img image='CombatPatrolGenerator\DSM\pix\Officer.jpg'/><br/><br/>";

	if (CPG_sideMissions_showMarker == 1) then {
		_mrkPos = [_missionPos, 10, 150, 0, 0, 1000, 0, CPG_blacklist, CPG_backupPos] call BIS_fnc_findSafePos;

		// create a task with destination
		[_taskName, _taskTitle, _taskImage + _taskDesc, true, [], "created", _mrkPos] call SHK_Taskmaster_add;

		// create marker
		_mrk = [format ["m_cpg_sideMission%1",CPG_sideMissions_counter], _mrkPos, "mil_unknown", "ColorRed", 0.8, "Solid", _taskTitle] call CPG_fnc_createMarker;
	} else {
		// create a task without destination
		[_taskName, _taskTitle, _taskImage + _taskDesc] call SHK_Taskmaster_add;
	};

	message = parseText format ["<br/><img image='CombatPatrolGenerator\DSM\pix\Officer.jpg' size='7' align='center'/><br/><br/>
	<t align='center' size='2'>Objective</t><br/>
	<t align='center' size='1.5'>%1</t><br/><br/>
	<t align='center' size='1.5' color='#08b000'>Assigned</t><br/><br/>
	%2", _taskTitle, _taskDesc];

	[message,"hintThis"] call BIS_fnc_MP;

	waitUntil { sleep 5; !alive _officer };

	[_taskName, "succeeded"] call SHK_Taskmaster_upd;

	if (CPG_sideMissions_showMarker == 1) then {
		_mrk setMarkerColor "ColorGreen";
		_mrk setMarkerText "Officer Eliminated";
	};

	message = parseText format ["<img image='SOS\Pictures\SOS.jpg' size='7' align='center'/><br/><br/>
	<t align='center' size='2'>Objective</t><br/>
	<t align='center' size='1.5'>%1</t><br/><br/>
	<t align='center' size='1.5' color='#01df01'>Completed</t><br/><br/>
	The enemy officer has been eliminated, dealing a decisive blow to the enemy's chain of command.<br/>
	Good job everyone.", _taskTitle];

	[message,"hintThis"] call BIS_fnc_MP;
};