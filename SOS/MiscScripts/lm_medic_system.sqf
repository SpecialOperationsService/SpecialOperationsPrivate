/*
	Author: Joe Redfearn (Legman)

	Description:.

	Parameter(s):
*/

waitUntil {!isNil "BIS_fnc_init"};
waitUntil {time > 0.0};
waitUntil {!isNull player};

lm_MS_const_version 			= "0.9.6.7";

lm_MS_const_bodyPartOverall		= "";
lm_MS_const_bodyPartHead		= "head";
lm_MS_const_bodyPartBody		= "body";
lm_MS_const_bodyPartHands		= "hands";
lm_MS_const_bodyPartLegs		= "legs";

lm_MS_const_bleedMultiplier					= 0.0015;
lm_MS_const_bleedReduce						= 0.00014;
lm_MS_const_bleedReduceMedic				= 0.0002;
lm_MS_const_bleedTickMax					= 0.02;
lm_MS_const_bleedRegenAmount				= 0.007;
lm_MS_const_bleedRateMax					= 1.0;
lm_MS_const_bleedRateMin					= 1.6666666666666666666666666666667;
lm_MS_const_internalDamageMultiplier		= 0.8;
lm_MS_const_internalDamageLimit				= 7.0;
lm_MS_const_internalDamageReduction			= 0.25;
lm_MS_const_incapacitationReportRange		= 100.0;
lm_MS_const_cardiacArrestDelay				= 60.0;
lm_MS_const_cardiacArrestChance				= 0.002;
lm_MS_const_cardiacArrestTick				= 2.0;
lm_MS_const_cprChance						= 0.3;
lm_MS_const_cprChanceMedic					= 0.5;
lm_MS_const_cprDamage						= 2.0;
lm_MS_const_damageThreshold					= 20.0;
lm_MS_const_wakeDelay						= 20.0;
lm_MS_const_wakeChance						= 0.04;	// 0.05
lm_MS_const_wakeTick						= 10.0;
lm_MS_const_fatalBleedChance				= 0.01;	// 0.02;
lm_MS_const_fatalBleedMinDamage				= 0.2;
lm_MS_const_dynamicBlurMultiplier			= 4.0;
lm_MS_const_isTFR							= true;

lm_MS_const_helmetList						= [
	"H_HelmetB",
	"H_HelmetB_camo",
	"H_HelmetB_paint",
	"H_HelmetB_light",
	"H_HelmetB_plain_mcamo",
	"H_HelmetB_plain_blk",
	"H_HelmetSpecB",
	"H_HelmetSpecB_paint1",
	"H_HelmetSpecB_paint2",
	"H_HelmetSpecB_blk",
	"H_HelmetIA",
	"H_HelmetIA_net",
	"H_HelmetIA_camo",
	"H_Helmet_Kerry",
	"H_HelmetB_grass",
	"H_HelmetB_snakeskin",
	"H_HelmetB_desert",
	"H_HelmetB_black",
	"H_HelmetB_sand",
	"H_HelmetO_ocamo",
	"H_HelmetLeaderO_ocamo",
	"H_HelmetB_light_grass",
	"H_HelmetB_light_snakeskin",
	"H_HelmetB_light_desert",
	"H_HelmetB_light_black",
	"H_HelmetB_light_sand",
	"H_HelmetO_oucamo",
	"H_HelmetLeaderO_oucamo",
	"H_HelmetSpecO_ocamo",
	"H_CrewHelmetHeli_B",
	"H_CrewHelmetHeli_O",
	"H_CrewHelmetHeli_I",
	"H_HelmetCrew_I",
	"H_HelmetCrew_B",
	"H_HelmetSpecO_blk"	
];

lm_MS_var_isInit			= "lm_MS_var_isInit";
lm_MS_var_isActionsInit		= "lm_MS_var_isActionsInit";
lm_MS_var_bleedAmount		= "lm_MS_var_bleedAmount";
lm_MS_var_bleedTick			= "lm_MS_var_bleedTick";
lm_MS_var_internalDamage	= "lm_MS_var_internalDamage";
lm_MS_var_isBleeding		= "lm_MS_var_isBleeding";
lm_MS_var_isFatallyBleeding	= "lm_MS_var_isFatallyBleeding";
lm_MS_var_isBreathing		= "lm_MS_var_isBreathing";
lm_MS_var_isIncapacitated	= "lm_MS_var_isIncapacitated";
lm_MS_var_isTreating		= "lm_MS_var_isTreating";
lm_MS_var_isBeingTreated	= "lm_MS_var_isBeingTreated";
lm_MS_var_isBeingDragged	= "lm_MS_var_isBeingDragged";
lm_MS_var_isMedic			= "lm_MS_var_isMedic";
lm_MS_var_incapacitatedBy	= "lm_MS_var_incapacitatedBy";
lm_MS_var_revivedBy			= "lm_MS_var_revivedBy";

lm_MS_damageMap				= nil;
lm_MS_lastDamage			= 0.0;
lm_MS_lastFrameDamage		= 0.0;
lm_MS_didDeflectHeadshot	= false;

lm_MS_blackOutHandle		= nil;
lm_MS_blackOutState			= -1;
lm_MS_cardiacArrestHandle	= nil;
lm_MS_isDebug				= false;
lm_MS_animName				= nil;
lm_MS_animHandle			= nil;
lm_MS_animActionID			= nil;
lm_MS_animChangedEHIndex	= nil;
lm_MS_animDoneEHIndex		= nil;
lm_MS_isAnimCancelled		= false;
lm_MS_dynamicBlurHandle		= nil;

lm_MS_fnc_getBodyPartDamage = {
	private ["_type", "_isAccumulative", "_damage"];
	_type 			= _this select 0;
	_isAccumulative	= [_this, 1, false] call BIS_fnc_param;
	_damage			= 0.0;	
	{
		if ((_x select 0) == _type) exitWith {
			if (_isAccumulative) then {
				_damage = _x select 1;
			} else {
				_damage = _x select 2;
			};			
		};
	} forEach lm_MS_damageMap;
	_damage
};

lm_MS_fnc_setBodyPartDamage = {
	private ["_type", "_damage", "_isAccumulative"];
	_type 			= _this select 0;
	_damage			= _this select 1;
	_isAccumulative	= [_this, 2, false] call BIS_fnc_param;
	{		
		if ((_x select 0) == _type) then {
			if (_isAccumulative) then {
				_x set [1, _damage];
			} else {
				_x set [2, _damage];
			};				
		};
	} forEach lm_MS_damageMap;
};

lm_MS_fnc_getBleedTick = {
	private ["_bleedTick"];
	
	if !(player getVariable lm_MS_var_isFatallyBleeding) then {
		_bleedTick = 0.0;
		_bleedTick = _bleedTick + ([lm_MS_const_bodyPartHead] 	call lm_MS_fnc_getBodyPartDamage) * 1.0;
		_bleedTick = _bleedTick + ([lm_MS_const_bodyPartBody] 	call lm_MS_fnc_getBodyPartDamage) * 4.0;
		_bleedTick = _bleedTick + ([lm_MS_const_bodyPartHands] 	call lm_MS_fnc_getBodyPartDamage) * 0.5;
		_bleedTick = _bleedTick + ([lm_MS_const_bodyPartLegs] 	call lm_MS_fnc_getBodyPartDamage) * 4.0;
		_bleedTick = lm_MS_const_bleedTickMax min (_bleedTick * lm_MS_const_bleedMultiplier);
	} else {
		_bleedTick = lm_MS_const_bleedTickMax;
	};
	_bleedTick
};

lm_MS_fnc_getInternalDamageDescription = {
	private ["_unit", "_description"];
	_unit = _this select 0;
	_internalDamage = _unit getVariable lm_MS_var_internalDamage;	
	_description = "<t color='#FF0000'>heavily</t>";
	if (_internalDamage <= 5.0) then {_description = "<t color='#FFAA00'>moderately</t>"};
	if (_internalDamage <= 2.0) then {_description = "<t color='#00FF00'>lightly</t>"};
	if (_internalDamage == 0.0) then {_description = "<t color='#00FF00'>not</t>"};
	_description
};

lm_MS_fnc_getBleedAmountDescription = {
	private ["_unit", "_description"];
	_unit = _this select 0;
	_bleedAmount = _unit getVariable lm_MS_var_bleedAmount;
	_description = "<t color='#FFAA00'>a weak</t>";
	if (_bleedAmount <= 0.4) then {_description = "<t color='#00FF00'>a strong</t>"};
	if (!(_unit getVariable lm_MS_var_isBreathing)) then {_description = "<t color='#FF0000'>no</t>"};
	_description	
};

lm_MS_fnc_getBleedTickDescription = {
	private ["_unit", "_description"];
	_unit = _this select 0;
	_bleedTick = _unit getVariable lm_MS_var_bleedTick;
	
	_description = "<t color='#FF0000'>heavily</t>";
	if !(_unit getVariable lm_MS_var_isFatallyBleeding) then {
		if (_bleedTick <= 0.01) then {_description = "<t color='#FFAA00'>moderately</t>"};
		if (_bleedTick <= 0.005) then {_description = "<t color='#00FF00'>lightly</t>"};
		if (_bleedTick <= 0.0) then {_description = "<t color='#00FF00'>not</t>"};
	} else {
		_description = "<t color='#FF0000'>fatally</t>";
	};	
	_description
};

lm_MS_fnc_resetDamageMap = {
	lm_MS_lastDamage = 0.0;
	lm_MS_damageMap = [];
	lm_MS_damageMap set [0, [lm_MS_const_bodyPartOverall,	0.0, 	0.0]];
	lm_MS_damageMap set [1, [lm_MS_const_bodyPartHead,		0.0, 	0.0]];
	lm_MS_damageMap set [2, [lm_MS_const_bodyPartBody, 		0.0, 	0.0]];
	lm_MS_damageMap set [3, [lm_MS_const_bodyPartHands, 	0.0,	0.0]];
	lm_MS_damageMap set [4, [lm_MS_const_bodyPartLegs, 		0.0,	0.0]];
	
	if (lm_MS_isDebug) then {
		systemChat format ["%1 damage map reset", profileName];
	};
};

lm_MS_fnc_reportIncapacitatedPlayer = {
	private ["_unit", "_friendlyName"];
	_unit = _this select 0;
	_friendlyName = _this select 1;
	
	if ((player distance _unit) > lm_MS_const_incapacitationReportRange) exitWith {};
	if (alive _unit) then {
		if (isNil "_friendlyName") then {
			systemChat format ["%1 was incapacitated", (name _unit)];
		} else {
			systemChat format ["%1 was incapacitated by %2 (Friendly fire)", (name _unit), _friendlyName];
		};		
	};	
};

lm_MS_fnc_reportRevivedPlayer = {
	private ["_unit", "_medicName"];
	_unit = _this select 0;
	_medicName = _this select 1;
	if (alive _unit) then {
		systemChat format ["%1 was revived by %2", (name _unit), _medicName];
	};	
};

lm_MS_fnc_reportRegainedConsciousness = {
	private ["_unit"];
	_unit = _this select 0;
	
	if ((player distance _unit) > lm_MS_const_incapacitationReportRange) exitWith {};
	if (alive _unit) then {
		systemChat format ["%1 has regained consciousness", (name _unit)];
	};	
};

lm_MS_fnc_stopTreatment = {
	player setVariable [lm_MS_var_isTreating, false, true];		
	player playMoveNow "AinvPknlMstpSnonWrflDnon_medicEnd";
	if (lm_MS_isDebug) then {
		systemChat "end animation";
	};
	hintSilent "";
};

lm_MS_fnc_doCheckAction = {
	private ["_injured", "_isSelf"];
	_injured 		= _this select 0;
	_isSelf 		= if (count _this > 1) then {_this select 1} else {false};
	_injuredName 	= if !(_isSelf) then {format ["%1 is", (name _injured)]} else {"I am"}; 
	hint parseText format [
		"%1 %2 bleeding",
		_injuredName,
		([_injured] call lm_MS_fnc_getBleedTickDescription)
	];
};

lm_MS_fnc_doExamineAction = {
	private ["_injured"];
	_injured = _this select 0;
	
	lm_MS_animName				= "AinvPknlMstpSnonWrflDr_medic4";
	lm_MS_animHandle			= nil;
	lm_MS_animActionID			= nil;
	lm_MS_animChangedEHIndex	= nil;
	lm_MS_animDoneEHIndex		= nil;
	
	player setVariable [lm_MS_var_isTreating, true, true];
	player playMove lm_MS_animName;
	
	// Check if the wrong animation starts playing.
	lm_MS_animChangedEHIndex = player addEventHandler ["AnimChanged", {
		_animName = _this select 1;
		if (_animName != lm_MS_animName) then {
			player removeEventHandler ["AnimChanged", lm_MS_animChangedEHIndex];
			player setVariable [lm_MS_var_isTreating, false, true];			
		};
	}];
	
	_isAnimCancelled = false;
	waitUntil {
		sleep 0.5;	
		_isAnimCancelled = !((alive player) && (alive _injured) && !(player getVariable lm_MS_var_isIncapacitated) && (_injured getVariable lm_MS_var_isIncapacitated) && (player getVariable lm_MS_var_isTreating) && !(_injured getVariable lm_MS_var_isBeingDragged));
		_isAnimCancelled || (animationState player == lm_MS_animName)		
	};
	
	if (!_isAnimCancelled) then {
		hint format ["Examining %1...", (name _injured)];
		if (lm_MS_isDebug) then {
			systemChat "start animation";
		};
		waitUntil {(animationState player) != "AinvPknlMstpSnonWrflDr_medic4"};
		hintSilent "";
		if (lm_MS_isDebug) then {
			systemChat "end animation";
		};
		player setVariable [lm_MS_var_isTreating, false, true];
		hint parseText format [
			"%1 is %2 wounded,<br/>%3 bleeding<br/>and has %4 pulse",
			(name _injured),
			([_injured] call lm_MS_fnc_getInternalDamageDescription),
			([_injured] call lm_MS_fnc_getBleedTickDescription),
			([_injured] call lm_MS_fnc_getBleedAmountDescription)
		];
	};
	
	if (lm_MS_isDebug && _isAnimCancelled) then {
		systemChat "animation cancelled";
	};	
	player removeEventHandler ["AnimChanged", lm_MS_animChangedEHIndex];
};

lm_MS_fnc_doDrag = {
	private ["_injured", "_animName"];
	_injured = _this select 0;
	
	lm_MS_animName				= "AcinPknlMstpSrasWrflDnon";
	lm_MS_animHandle			= nil;
	lm_MS_animActionID			= nil;
	lm_MS_animChangedEHIndex	= nil;
	lm_MS_animDoneEHIndex		= nil;	
	
	_injured setVariable [lm_MS_var_isBeingDragged, true, true];
	player setVariable [lm_MS_var_isTreating, true, true];
	player playMoveNow lm_MS_animName;
	
	lm_MS_animActionID = player addAction ["<t color='#FF0000'>Stop dragging</t>", {
		player setVariable [lm_MS_var_isTreating, false, true];	
	}, [], 8.0, false, true, "", ""];
	
	_injured attachTo [player, [0, 1.1, 0.092]];
	
	waitUntil {
		sleep 0.1;
		!((alive player) && (alive _injured) && !(player getVariable lm_MS_var_isIncapacitated) && (_injured getVariable lm_MS_var_isIncapacitated) && (player getVariable lm_MS_var_isTreating))
	};
	
	detach _injured;
	
	player removeAction lm_MS_animActionID;
	
	_injured setVariable [lm_MS_var_isBeingDragged, false, true];
	player setVariable [lm_MS_var_isTreating, false, true];		
	player playMoveNow "AmovPknlMstpSrasWrflDnon";
	if (lm_MS_isDebug) then {
		systemChat "end animation";
	};
	hintSilent "";
};

lm_MS_fnc_doApplyPressureAction = {
	private ["_injured", "_animName"];
	_injured = _this select 0;
	
	lm_MS_animName				= "AinvPknlMstpSnonWrflDnon_medic0";
	lm_MS_animHandle			= nil;
	lm_MS_animActionID			= nil;
	lm_MS_animChangedEHIndex	= nil;
	lm_MS_animDoneEHIndex		= nil;	
	
	player setVariable [lm_MS_var_isTreating, true, true];
	player playMoveNow lm_MS_animName;
	
	// Check if the wrong animation starts playing.
	lm_MS_animChangedEHIndex = player addEventHandler ["AnimChanged", {
		_animName = _this select 1;
		if (_animName != lm_MS_animName) then {
			player removeEventHandler ["AnimChanged", lm_MS_animChangedEHIndex];
			player setVariable [lm_MS_var_isTreating, false, true];			
		};
	}];
	
	_isAnimCancelled = false;
	waitUntil {
		sleep 0.5;
		_isAnimCancelled = !((alive player) && (alive _injured) && !(player getVariable lm_MS_var_isIncapacitated) && (_injured getVariable lm_MS_var_isIncapacitated) && (player getVariable lm_MS_var_isTreating) && !(_injured getVariable lm_MS_var_isBeingDragged));
		_isAnimCancelled || (animationState player == lm_MS_animName)
	};
	
	if (!_isAnimCancelled) then {
		hint format ["Applying pressure to %1's wounds...", (name _injured)];	
		if (lm_MS_isDebug) then {
			systemChat "start animation";
		};
		lm_MS_animHandle = [_injured] spawn {
			_injured = _this select 0;
			while {true} do {
				hintSilent format ["Applying pressure to %1's wounds...", (name _injured)];
				_reduceAmount = if (player getVariable lm_MS_var_isMedic) then {lm_MS_const_bleedReduceMedic} else {lm_MS_const_bleedReduce};
				_reduceAmount = (random 1.0) * _reduceAmount;
				if !(_injured getVariable lm_MS_var_isFatallyBleeding) then {
					_bleedTick = _injured getVariable lm_MS_var_bleedTick;
					_bleedTick = 0.0 max (_bleedTick - _reduceAmount);
					_injured setVariable [lm_MS_var_bleedTick, _bleedTick, true];
					if (lm_MS_isDebug) then {
						systemChat format ["%1 bleed reduce %2", profileName, _bleedTick];
					};
				};
				
				sleep 1.0;
			};
		};

		// Loop animation.
		lm_MS_animDoneEHIndex = player addEventHandler ["AnimDone", {
			_animName = _this select 1;
			if (_animName == lm_MS_animName) then {
				player playMoveNow lm_MS_animName;
			};
		}];
		lm_MS_animActionID = player addAction ["<t color='#FF0000'>Stop applying pressure</t>", {
			player setVariable [lm_MS_var_isTreating, false, true];	
		}, [], 8.0, false, true, "", ""];	
	};
	
	_wasBleeding = true;
	if (_injured getVariable lm_MS_var_bleedTick == 0.0) then {
		_wasBleeding = false;
	};
	
	waitUntil {
		sleep 0.5;
		!((alive player) && (alive _injured) && (_injured getVariable lm_MS_var_bleedTick > 0.0) && !(player getVariable lm_MS_var_isIncapacitated) && (_injured getVariable lm_MS_var_isIncapacitated) && (player getVariable lm_MS_var_isTreating) && !(_injured getVariable lm_MS_var_isBeingDragged))
	};
	player removeEventHandler ["AnimChanged", lm_MS_animChangedEHIndex];
	player removeEventHandler ["AnimDone", lm_MS_animDoneEHIndex];
	player removeAction lm_MS_animActionID;
	terminate lm_MS_animHandle;
	if (lm_MS_isDebug) then {
		systemChat "auto cancel";
	};
	call lm_MS_fnc_stopTreatment;
	
	if (!_isAnimCancelled && (alive player) && (alive _injured) && (_injured getVariable lm_MS_var_bleedTick == 0.0) && !(player getVariable lm_MS_var_isIncapacitated) && (_injured getVariable lm_MS_var_isIncapacitated) && !(_injured getVariable lm_MS_var_isBeingDragged)) then {
		if (_wasBleeding) then {
			hint parseText format ["%1 <t color='#00FF00'>stopped</t> bleeding", (name _injured)];
		} else {
			hint parseText format ["%1 is <t color='#00FF00'>not</t> bleeding", (name _injured)];
		};			
	};
};

lm_MS_fnc_doReviveAction = {
	private ["_injured"];
	_injured = _this select 0;
	
	lm_MS_animName				= "AinvPknlMstpSnonWrflDnon_medic0";
	lm_MS_animHandle			= nil;
	lm_MS_animActionID			= nil;
	lm_MS_animChangedEHIndex	= nil;
	lm_MS_animDoneEHIndex		= nil;
	
	if (_injured getVariable lm_MS_var_isBeingTreated) exitWith {
		hint format ["%1 is already being treated", (name _injured)];
	};
	
	_injured setVariable [lm_MS_var_isBeingTreated, true, true];
	player setVariable [lm_MS_var_isTreating, true, true];	
	player playMoveNow lm_MS_animName;
	
	// Check if the wrong animation starts playing.
	lm_MS_animChangedEHIndex = player addEventHandler ["AnimChanged", {
		_animName = _this select 1;
		if (_animName != lm_MS_animName) then {
			player removeEventHandler ["AnimChanged", lm_MS_animChangedEHIndex];
			player setVariable [lm_MS_var_isTreating, false, true];		
		};
	}];
	
	_isAnimCancelled = false;
	waitUntil {
		sleep 0.5;
		_isAnimCancelled = !((alive player) && (alive _injured) && !(player getVariable lm_MS_var_isIncapacitated) && (_injured getVariable lm_MS_var_isIncapacitated) && (player getVariable lm_MS_var_isTreating) && !(_injured getVariable lm_MS_var_isBeingDragged));
		_isAnimCancelled || (animationState player == lm_MS_animName)
	};
	
	if (!_isAnimCancelled) then {
		hint format ["Reviving %1...", (name _injured)];
		if (lm_MS_isDebug) then {
			systemChat "start animation";
		};
		lm_MS_animHandle = [_injured] spawn {
			_injured = _this select 0;
			while {true} do {			
				hintSilent format ["Reviving %1...", (name _injured)];
				_internalDamage = _injured getVariable lm_MS_var_internalDamage;
				if !(_injured getVariable lm_MS_var_isFatallyBleeding) then {
					_reduceAmount = 0.02 + (random 1.0) * 0.08;
					_internalDamage = 0.0 max (_internalDamage - _reduceAmount);
					_injured setVariable [lm_MS_var_internalDamage, _internalDamage, true];
				};
				if (_internalDamage <= 0.0) then {
					_bleedAmount = _injured getVariable lm_MS_var_bleedAmount;
					_bleedAmount = 0.5 min _bleedAmount;
					_injured setVariable [lm_MS_var_bleedAmount, _bleedAmount, true];
					_injured setVariable [lm_MS_var_isIncapacitated, false, true];
					_injured setVariable [lm_MS_var_revivedBy, profileName, true];
					_injured setVariable [lm_MS_var_isBeingTreated, false, true];					
					hint parseText format ["%1 was <t color='#00FF00'>revived</t>", (name _injured)];
				};
				if (lm_MS_isDebug) then {
					systemChat format ["%1 internal damage reduce %2", profileName, _internalDamage];
				};
				sleep 1.0;
			};
		};
		
		// Loop animation.
		lm_MS_animDoneEHIndex = player addEventHandler ["AnimDone", {
			_animName = _this select 1;
			if (_animName == lm_MS_animName) then {
				player playMoveNow lm_MS_animName;
			};
		}];
		lm_MS_animActionID = player addAction ["<t color='#FF0000'>Stop reviving</t>", {
			player setVariable [lm_MS_var_isTreating, false, true];	
		}, [_injured], 8.0, false, true, "", ""];
	};
	
	_wasBreathing = true;
	if !(_injured getVariable lm_MS_var_isBreathing) then {
		_wasBreathing = false;
	};
	
	waitUntil {
		sleep 0.5;
		!((alive player) && (alive _injured) && (_injured getVariable lm_MS_var_isBreathing) && !(player getVariable [lm_MS_var_isIncapacitated, false]) && (_injured getVariable lm_MS_var_isIncapacitated) && (player getVariable lm_MS_var_isTreating) && !(_injured getVariable lm_MS_var_isBeingDragged))
	};
	
	player removeEventHandler ["AnimChanged", lm_MS_animChangedEHIndex];
	player removeEventHandler ["AnimDone", lm_MS_animDoneEHIndex];
	player removeAction lm_MS_animActionID;
	terminate lm_MS_animHandle;
	_injured setVariable [lm_MS_var_isBeingTreated, false, true];	
	if (lm_MS_isDebug) then {
		systemChat "auto cancel";
	};
	call lm_MS_fnc_stopTreatment;
	
	if (!_isAnimCancelled && (alive player) && (alive _injured) && !(_injured getVariable lm_MS_var_isBreathing) && !(player getVariable lm_MS_var_isIncapacitated) && (_injured getVariable lm_MS_var_isIncapacitated) && !(_injured getVariable lm_MS_var_isBeingDragged)) then {
		if (_wasBreathing) then {
			hint parseText format ["%1 <t color='#FF0000'>stopped</t> breathing", (name _injured)];
		} else {
			hint parseText format ["%1 is <t color='#FF0000'>not</t> breathing", (name _injured)];
		};			
	};
};

lm_MS_fnc_doPerformCPRAction = {
	private ["_injured"];
	_injured = _this select 0;
	
	lm_MS_animName				= "AinvPknlMstpSnonWnonDr_medic0";
	lm_MS_animHandle			= nil;
	lm_MS_animActionID			= nil;
	lm_MS_animChangedEHIndex	= nil;
	lm_MS_animDoneEHIndex		= nil;
	
	if (_injured getVariable lm_MS_var_isBeingTreated) exitWith {
		hint format ["%1 is already being treated", (name _injured)];
	};
	_injured setVariable [lm_MS_var_isBeingTreated, true, true];
	player setVariable [lm_MS_var_isTreating, true, true];	
	player playMove lm_MS_animName;
	
	// Check if the wrong animation starts playing.
	lm_MS_animChangedEHIndex = player addEventHandler ["AnimChanged", {
		_animName = _this select 1;
		if (_animName != lm_MS_animName) then {
			player removeEventHandler ["AnimChanged", lm_MS_animChangedEHIndex];
			player setVariable [lm_MS_var_isTreating, false, true];		
		};
	}];
	
	_isAnimCancelled = false;
	waitUntil {
		sleep 0.5;
		_isAnimCancelled = !((alive player) && (alive _injured) && !(player getVariable lm_MS_var_isIncapacitated) && (_injured getVariable lm_MS_var_isIncapacitated) && (player getVariable lm_MS_var_isTreating) && !(_injured getVariable lm_MS_var_isBeingDragged));
		_isAnimCancelled || (animationState player == lm_MS_animName)
	};
	
	if (!_isAnimCancelled) then {
		hint format ["Performing CPR on %1...", (name _injured)];
		if (lm_MS_isDebug) then {
			systemChat "start animation";
		};
		waitUntil {(animationState player) != "AinvPknlMstpSnonWnonDr_medic0"};
		hintSilent "";
		if (lm_MS_isDebug) then {
			systemChat "end animation";
		};
		if ((alive player) && (alive _injured) && !(player getVariable lm_MS_var_isIncapacitated) && (_injured getVariable lm_MS_var_isIncapacitated) && !(_injured getVariable lm_MS_var_isBeingDragged)) then {
			if !(_injured getVariable lm_MS_var_isBreathing) then {
				_rand 	= random 1.0;
				_chance = if (player getVariable lm_MS_var_isMedic) then {lm_MS_const_cprChanceMedic} else {lm_MS_const_cprChance};
				if (_rand <= _chance) then {
					_injured setVariable [lm_MS_var_isBreathing, true, true];
					hint parseText format ["%1 <t color='#00FF00'>started</t> breathing again", (name _injured)];
				} else {
					hint parseText format ["CPR on %1 <t color='#FF0000'>failed</t>", (name _injured)];
				};
			} else {
				_internalDamage = _injured getVariable lm_MS_var_internalDamage;
				_internalDamage = _internalDamage + lm_MS_const_cprDamage;
				_injured setVariable [lm_MS_var_internalDamage, _internalDamage, true];
				if (_internalDamage > lm_MS_const_internalDamageLimit) then {
					_injured setDamage 1.0;
					_injured switchMove "";
				};
				hint parseText format ["%1 does <t color='#FF0000'>not</t> need CPR", (name _injured)];
			};
		};		
	};
	
	if (lm_MS_isDebug && _isAnimCancelled) then {
		systemChat "animation cancelled";
	};
	
	player removeEventHandler ["AnimChanged", lm_MS_animChangedEHIndex];
	player setVariable [lm_MS_var_isTreating, false, true];
	_injured setVariable [lm_MS_var_isBeingTreated, false, true];
};

lm_MS_fnc_addMedicActions = {
	private ["_unit"];
	_unit = _this select 0;	
	if (_unit == player) then {	
		_unit addAction ["<t color='#FFFF00'>Check yourself</t>", {
			[_this select 0, true] call lm_MS_fnc_doCheckAction;
		}, [], 8.6, false, true, "", "(alive _target) && !(_this getVariable lm_MS_var_isTreating)"];
	} else {		
		_unit addAction [format ["<t color='#FFFF00'>Check %1</t>", name _unit], {
			[_this select 0, false] call lm_MS_fnc_doCheckAction;
		}, [], 8.5, false, true, "", "(_this distance _target < 2.45) && (alive _target) && (vehicle _this == _this) && !(_this getVariable lm_MS_var_isTreating) && !(_target getVariable lm_MS_var_isIncapacitated) && !(_target getVariable lm_MS_var_isBeingDragged)"];
	
		_unit addAction [format ["<t color='#FFFF00'>Examine %1</t>", name _unit], {
			[_this select 0] call lm_MS_fnc_doExamineAction;
		}, [], 8.4, false, true, "", "(_this distance _target < 2.45) && (alive _target) && (vehicle _this == _this) && !(_this getVariable lm_MS_var_isTreating) && (_target getVariable lm_MS_var_isIncapacitated) && !(_target getVariable lm_MS_var_isBeingDragged)"];
		
		_unit addAction [format ["<t color='#FFAA00'>Drag %1</t>", name _unit], {
			[_this select 0] call lm_MS_fnc_doDrag;
		}, [], 8.3, false, true, "", "(_this distance _target < 2.45) && (alive _target) && (vehicle _this == _this) && !(_this getVariable lm_MS_var_isTreating) && (_target getVariable lm_MS_var_isIncapacitated) && !(_target getVariable lm_MS_var_isBeingDragged)"];
		
		_unit addAction [format ["<t color='#FF0000'>Apply pressure to %1</t>", name _unit], {
			[_this select 0] call lm_MS_fnc_doApplyPressureAction;					
		}, [], 8.2, false, true, "", "(_this distance _target < 2.45) && (alive _target) && (vehicle _this == _this) && !(_this getVariable lm_MS_var_isTreating) && (_target getVariable lm_MS_var_isIncapacitated) && !(_target getVariable lm_MS_var_isBeingDragged)"];
		
		_unit addAction [format ["<t color='#FF0000'>Revive %1</t>", name _unit], {
			[_this select 0] call lm_MS_fnc_doReviveAction;
		}, [], 8.1, false, true, "", "(_this distance _target < 2.45) && (alive _target) && (vehicle _this == _this) && !(_this getVariable lm_MS_var_isTreating) && (_target getVariable lm_MS_var_isIncapacitated) && (_this getVariable lm_MS_var_isMedic) && !(_target getVariable lm_MS_var_isBeingDragged)"];	
		
		_unit addAction [format ["<t color='#CC00BB'>Perform CPR on %1</t>", name _unit], {
			[_this select 0] call lm_MS_fnc_doPerformCPRAction;
		}, [], 8.0, false, true, "", "(_this distance _target < 2.45) && (alive _target) && (vehicle _this == _this) && !(_this getVariable lm_MS_var_isTreating) && (_target getVariable lm_MS_var_isIncapacitated) && !(_target getVariable lm_MS_var_isBeingDragged)"];
	};	
};

lm_MS_fnc_initMedicActions = {
	private ["_unit"];
	_unit = _this select 0;
	if !(_unit getVariable [lm_MS_var_isActionsInit, false]) then {
		_unit setVariable [lm_MS_var_isActionsInit, true];
		[_unit] call lm_MS_fnc_addMedicActions;
	};
};

lm_MS_fnc_applyInternalDamage = {
	private ["_selectionName", "_damage", "_internalDamage"];
	_selectionName 	= _this select 0;
	_damage			= _this select 1;
	
	if !(alive player) exitWith {};	
	
	_scalar = 1.0;
	switch (_selectionName) do {
		case lm_MS_const_bodyPartHead 	: {_scalar = 4.0};
		case lm_MS_const_bodyPartBody 	: {_scalar = 2.0};
		case lm_MS_const_bodyPartHands 	: {_scalar = 0.2};
		case lm_MS_const_bodyPartLegs 	: {_scalar = 0.5};
	};
	_internalDamage = (player getVariable lm_MS_var_internalDamage);	
	_internalDamage = _internalDamage + ((_damage * _scalar) * lm_MS_const_internalDamageMultiplier);
	_internalDamage = lm_MS_const_internalDamageLimit min _internalDamage;
	player setVariable [lm_MS_var_internalDamage, _internalDamage, true];
	
	if (lm_MS_isDebug) then {
		systemChat format ["%1 internal damage %2", profileName, _internalDamage];
	};
};

lm_MS_fnc_applyDamageModifier = {
	private ["_selectionName", "_damage", "_source"];
	_selectionName 	= _this select 0;
	_damage 		= _this select 1;
	_source			= _this select 2;
	
	if (_selectionName == lm_MS_const_bodyPartHead && _source != objNull) then {
		if ((headgear player in lm_MS_const_helmetList) && (random 1.0 <= 0.8) && !(player getVariable lm_MS_var_isIncapacitated)) then {
			if (_damage > 1.0) then {
				_damage = _damage * 0.01;
				lm_MS_didDeflectHeadshot = true;
				
				_hitSounds = [
					"a3\sounds_f\weapons\hits\metal_1.wss",
					"a3\sounds_f\weapons\hits\metal_2.wss",
					"a3\sounds_f\weapons\hits\metal_3.wss",
					"a3\sounds_f\weapons\hits\metal_4.wss",
					"a3\sounds_f\weapons\hits\metal_5.wss",
					"a3\sounds_f\weapons\hits\metal_6.wss"
				];
				_hitSound = _hitSounds call bis_fnc_selectRandom;
				playSound3D [_hitSound, player, false, getPosASL player, 30.0, 1.0, 16.0];
			};
		};
	};
	if ((_selectionName == lm_MS_const_bodyPartHands) || (_selectionName == lm_MS_const_bodyPartLegs)) then {
		_damage = _damage * 0.54;
	};	
	_damage
};

lm_MS_fnc_applyCardiacArrest = {
	if (player getVariable lm_MS_var_isBreathing) then {
		player setVariable [lm_MS_var_isBreathing, false, true];
		
		if (lm_MS_const_isTFR) then {
			0.0 call TFAR_fnc_setVoiceVolume;
		};
		
		lm_MS_cardiacArrestHandle = [] spawn {
			sleep 180.0;
			player setDamage 1.0;
			player switchMove "";
			if (lm_MS_isDebug) then {
				systemChat "brain death";
			};
		};
		waitUntil {!((alive player) && !(player getVariable lm_MS_var_isBreathing))};
		if (player getVariable lm_MS_var_isBreathing) then {
			if (lm_MS_isDebug) then {
				systemChat "breathing again";
			};
			terminate lm_MS_cardiacArrestHandle;
			lm_MS_cardiacArrestHandle = nil;
			
			if (lm_MS_const_isTFR) then {
				TF_max_voice_volume call TFAR_fnc_setVoiceVolume;
			};
		};		
	};	
};

lm_MS_fnc_applyIncapacitatedState = {
	private ["_internalDamage"];
	
	if (!(alive player) || (player getVariable lm_MS_var_isIncapacitated)) exitWith {};
	
	_internalDamage = 1.0 max (player getVariable lm_MS_var_internalDamage);
	player setVariable [lm_MS_var_internalDamage, _internalDamage, true];
	player setVariable [lm_MS_var_isIncapacitated, true, true];
	player setCaptive true;
	
	// Play and loop animation
	player playMoveNow "AinjPpneMstpSnonWrflDnon_injuredHealed";
	_animChangedEHIndex = player addEventHandler ["AnimChanged", {
		_animName = _this select 1;
		_animations = ["AinjPpneMstpSnonWrflDnon_injuredHealed"];
		if !(_animName in _animations) then {			
			player playMoveNow "AinjPpneMstpSnonWrflDnon_injuredHealed";
		};
	}];
	
	// Show dialog and start unconscious loop
	if (isNil "lm_MS_blackOutHandle") then {
		hintC "WAIT FOR A MEDIC OR PRESS CONTINUE TO RESPAWN!";
		titleText ["", "BLACK OUT", 0.2];
		2.0 fadeSound 0.02;
		2.0 fadeRadio 0.02;
		2.0 fadeSpeech 0.02;
		lm_MS_blackOutHandle = [] spawn {
			while {true} do {
				lm_MS_blackOutState = 0;
				sleep ([8.0, 20.0] call BIS_fnc_randomNum);
				waitUntil {player getVariable lm_MS_var_isBreathing};
				titleText ["", "BLACK IN", 4.0];
				4.0 fadeSound 1.0;
				4.0 fadeRadio 1.0;
				4.0 fadeSpeech 1.0;
				lm_MS_blackOutState = 1;
				sleep 4.0;
				titleText ["", "BLACK OUT", 4.0];
				4.0 fadeSound 0.02;
				4.0 fadeRadio 0.02;
				4.0 fadeSpeech 0.02;
				lm_MS_blackOutState = 2;
				sleep 4.0;
			};
		};
	};		
	
	// Report incapacitated to everyone
	_incapacitatedBy = player getVariable lm_MS_var_incapacitatedBy;
	[[player, _incapacitatedBy], "lm_MS_fnc_reportIncapacitatedPlayer", true, false] call BIS_fnc_MP;
	player setVariable [lm_MS_var_incapacitatedBy, nil, true];
	
	// Random chance per tick for cardiac arrest whilst incapacitated
	[] spawn {
		sleep lm_MS_const_cardiacArrestDelay;
		while {(alive player) && (player getVariable lm_MS_var_isIncapacitated)} do {			
			_rand = random 1.0;
			if ((player getVariable lm_MS_var_isIncapacitated) && (player getVariable lm_MS_var_isBreathing) && (_rand <= lm_MS_const_cardiacArrestChance)) then {
				call lm_MS_fnc_applyCardiacArrest;
			};
			sleep lm_MS_const_cardiacArrestTick;
		};
	};

	// Random chance per tick to wake up from lesser wounds
	[] spawn {
		sleep lm_MS_const_wakeDelay;
		while {(alive player) && (player getVariable lm_MS_var_isIncapacitated)} do {			
			_internalDamage = (player getVariable lm_MS_var_internalDamage);
			if (_internalDamage < (lm_MS_const_internalDamageLimit * 0.5)) then {
				_wakeUpChance = (1.0 - ((player getVariable lm_MS_var_internalDamage) / (lm_MS_const_internalDamageLimit * 0.5))) * lm_MS_const_wakeChance;
				_rand = random 1.0;
				if ((player getVariable lm_MS_var_isIncapacitated) && (player getVariable lm_MS_var_isBreathing) && (_rand <= _wakeUpChance)) then {
					_bleedAmount = player getVariable lm_MS_var_bleedAmount;
					_bleedAmount = 0.5 min _bleedAmount;
					player setVariable [lm_MS_var_bleedAmount, _bleedAmount, true];	
					player setVariable [lm_MS_var_isIncapacitated, false, true];
					[[player], "lm_MS_fnc_reportRegainedConsciousness", true, false] call BIS_fnc_MP;
				};	
			};
			sleep lm_MS_const_wakeTick;
		};
	};
	
	// Handle the revive state
	[_animChangedEHIndex] spawn {
		private ["_animChangedEHIndex"];
		_animChangedEHIndex = _this select 0;
		waitUntil {!((alive player) && (player getVariable lm_MS_var_isIncapacitated))};
		player removeEventHandler ["AnimChanged", _animChangedEHIndex];		
		if ((alive player) && !(player getVariable lm_MS_var_isIncapacitated)) then {
			if (lm_MS_isDebug) then {
				systemChat "i am revived";
			};
			if ((lm_MS_blackOutState == 0) || (lm_MS_blackOutState == 2)) then {				
				titleText ["", "BLACK IN", 1.0];				
			};			
			terminate lm_MS_blackOutHandle;			
			lm_MS_blackOutHandle = nil;
			lm_MS_blackOutState = -1;
			2.0 fadeSound 1.0;
			2.0 fadeRadio 1.0;
			2.0 fadeSpeech 1.0;
			sleep 4.0;
			findDisplay 57 closeDisplay 0;		
			player setCaptive false;
			
			player playMoveNow "AmovPpneMstpSrasWrflDnon";
			_revivedBy = player getVariable lm_MS_var_revivedBy;
			if !(isNil "_revivedBy") then {
				[[player, _revivedBy], "lm_MS_fnc_reportRevivedPlayer", true, false] call BIS_fnc_MP;
				player setVariable [lm_MS_var_revivedBy, nil, true];
			};			
		};		
	};	
	
	// Disable dialog functionality
	lm_MS_keyDownEHIndex = findDisplay 57 displayAddEventHandler ["KeyDown", {
		_keyCode = _this select 1;	// Prevent ESC
		if (_keyCode == 1 || _keyCode == 28 || _keyCode == 57 || _keyCode == 156) then {
			true
		};
	}];
	lm_MS_unloadEHIndex = findDisplay 57 displayAddEventHandler ["Unload", {
		_this spawn {
			_this select 0 displayRemoveEventHandler ["KeyDown", lm_MS_keyDownEHIndex];
			_this select 0 displayRemoveEventHandler ["Unload", lm_MS_unloadEHIndex];
			if (player getVariable lm_MS_var_isIncapacitated) then {
				player setDamage 1.0;
			};			
			hintSilent "";
		};
	}];
};

lm_MS_fnc_applyBleedEffect = {
	private ["_bleedTick"];
	
	_bleedTick = call lm_MS_fnc_getBleedTick;		

	// Override weaker bleed tick
	if (_bleedTick > (player getVariable lm_MS_var_bleedTick)) then {
		player setVariable [lm_MS_var_bleedTick, _bleedTick, true];
		if (lm_MS_isDebug) then {
			systemChat format ["%1 new bleed tick %2", profileName, _bleedTick];
		};
	};
	
	// Start bleeding per heart beat
	if !(player getVariable lm_MS_var_isBleeding) then {
		player setVariable [lm_MS_var_isBleeding, true, true];
		[] spawn {
			while {true} do {
				// Regulate bleed tick
				_heartRate = lm_MS_const_bleedRateMin + ((getFatigue player) * (lm_MS_const_bleedRateMax - lm_MS_const_bleedRateMin));
				sleep (_heartRate);
				
				// Pause bleeding if player is in cardiac arrest
				waitUntil {(player getVariable lm_MS_var_isBreathing) || !(alive player)};
				
				_isIncap = player getVariable lm_MS_var_isIncapacitated;
				_isFatallyBleeding = player getVariable lm_MS_var_isFatallyBleeding;
				
				if (!alive player || (!_isFatallyBleeding && ((!_isIncap && (damage player <= 0.25)) || (_isIncap && ((player getVariable lm_MS_var_bleedTick) <= 0.0))))) exitWith {
					player setVariable [lm_MS_var_bleedTick, 0.0, true];				
					player setVariable [lm_MS_var_isBleeding, false, true];					
					if (lm_MS_isDebug) then {
						systemChat format ["%1 bleeding stopped", profileName];
					};
				};
				
				_bleedTick = player getVariable lm_MS_var_bleedTick;
				_bleedTick = if (_bleedTick < 0.001) then {0.0} else {_bleedTick};
				player setVariable [lm_MS_var_bleedTick, _bleedTick, true];
				
				_bleedAmount = player getVariable lm_MS_var_bleedAmount;
				_bleedAmount = _bleedAmount + _bleedTick;
				player setVariable [lm_MS_var_bleedAmount, _bleedAmount, true];
				if (lm_MS_isDebug) then {
					systemChat format ["%1 bleed amount %2", profileName, _bleedAmount];
				};
				
				// Adjust blur post processing based on blood level
				lm_MS_dynamicBlurHandle ppEffectAdjust [_bleedAmount * lm_MS_const_dynamicBlurMultiplier];
				lm_MS_dynamicBlurHandle ppEffectCommit 1.0;	
				
				_fatigue = getFatigue player;
				_fatigue = if (!_isIncap) then {_bleedAmount max _fatigue} else {1.0};
				player setFatigue _fatigue;
				
				_camShake = if (!_isIncap) then {
					(_bleedAmount / 0.5) * 2.4;
				} else {
					1.0;
				};
				addCamShake [_camShake, 1.0, 10];
				
				if (_bleedAmount >= 1.0) then {
					player setDamage 1.0;
					player switchMove "";
				} else {
					if (!_isIncap && (_bleedAmount >= 0.8)) then {
						call lm_MS_fnc_applyIncapacitatedState;	
					};
				};									
			};		
		};
	};	
};

lm_MS_fnc_handleDamage = {
	private ["_event", "_unit", "_selectionName", "_damage", "_source"];
	
	_event 			= _this select 0;
	_unit			= _event select 0;
	_selectionName 	= _event select 1;
	_damage			= _event select 2;
	_source			= _event select 3;
	
	if ((_unit == player) && (alive player)) then {
	
		// Get previous damage.
		_oldDamage = [_selectionName, false] call lm_MS_fnc_getBodyPartDamage;
		
		// Apply damage modifier.
		_damage = [_selectionName, _damage, _source] call lm_MS_fnc_applyDamageModifier;
		_damage = _oldDamage max _damage;		
		
		// Get the damage difference
		_newDamage = _damage - _oldDamage;
		_newDamage = 0.0 max _newDamage;
		
		// Damage has exceeded the threshold so the player is killed
		if (_newDamage > lm_MS_const_damageThreshold) exitWith {
			player setDamage 1.0;
		};
		
		// Store non accum damage sum
		[_selectionName, (0.9 min _damage), false] call lm_MS_fnc_setBodyPartDamage;
		
		// Store accum damage sum
		[_selectionName, (_oldDamage + _newDamage), true] call lm_MS_fnc_setBodyPartDamage;
		
		if (_selectionName != lm_MS_const_bodyPartOverall) then {
			[_selectionName, _newDamage] call lm_MS_fnc_applyInternalDamage;
			if (isPlayer _source && (player getVariable lm_MS_var_internalDamage) == lm_MS_const_internalDamageLimit) then {
				player setDamage 1.0;
			};
			lm_MS_lastFrameDamage = lm_MS_lastFrameDamage + _newDamage;
		};
		
		_names = [
			lm_MS_const_bodyPartHead,
			lm_MS_const_bodyPartBody,
			lm_MS_const_bodyPartHands,
			lm_MS_const_bodyPartLegs
		];		
		
		if ((_selectionName in _names) && (_damage > 0.9)) then {
			if !(player getVariable lm_MS_var_isIncapacitated) then {
				_incapacitatedBy = if ((_source != player) && (side _source == side player) && (isPlayer _source)) then {name _source} else {nil};
				player setVariable [lm_MS_var_incapacitatedBy, _incapacitatedBy, true];
				[] spawn lm_MS_fnc_applyIncapacitatedState;			
			};	
		};
		
		if !(isNull _source) then {			
			if ((_selectionName == lm_MS_const_bodyPartHands) && (random 1.0 <= 0.05)) then {
				player forceWeaponFire [currentWeapon player, currentWeaponMode player];
			};
		};
		
		if ((_selectionName == lm_MS_const_bodyPartLegs) && !(player getVariable lm_MS_var_isIncapacitated) && (animationState player != "AinjPpneMstpSnonWrflDnon_injuredHealed") && ((random 1.0 <= 0.2) && (_damage > 0.4))) then {
			player playMove "AmovPpneMstpSrasWrflDnon";				
		};
	};
	
	_damage = 0.9 min _damage;
	_damage;
};

lm_MS_fnc_receiveDamage = {
	private ["_event"];
	_event 		= _this select 0;
	_unit  		= _event select 0;
	_causedBy 	= _event select 1;
	
	if ((_unit == player) && (alive player)) then {
		lm_MS_lastDamage = lm_MS_lastDamage max (damage player);				
		
		// If we are fatally bleeding then we can't override the bleed tick
		_isFatallyBleeding = player getVariable lm_MS_var_isFatallyBleeding;
		if (damage player > 0.25 && !_isFatallyBleeding) then {			
			if ((random 1.0 <= lm_MS_const_fatalBleedChance) && (lm_MS_lastFrameDamage >= lm_MS_const_fatalBleedMinDamage) && !(isNull _causedBy) && !lm_MS_didDeflectHeadshot) then {		
				player setVariable [lm_MS_var_isFatallyBleeding, true, true];
			};
			call lm_MS_fnc_applyBleedEffect;
		};
		
		lm_MS_lastFrameDamage = 0.0;
		lm_MS_didDeflectHeadshot = false;
		
		_vehicle = vehicle player;
		if ((_vehicle != player) && !(alive _vehicle)) then {
			if (random 1.0 <= 0.1) then {
				if !(player getVariable lm_MS_var_isIncapacitated) then {
					player setVariable [lm_MS_var_incapacitatedBy, nil, true];
					[] spawn lm_MS_fnc_applyIncapacitatedState;
				};
				moveOut player;
			} else {
				player setDamage 1.0;
			};			
		};
	};
};

lm_MS_fnc_initPlayerRegenLoop = {
	_handle = [] spawn {
		while {true} do {
			waitUntil {
				sleep 0.1;
				if ((player getVariable lm_MS_var_bleedAmount > 0.0) && !(player getVariable lm_MS_var_isIncapacitated) && !(player getVariable lm_MS_var_isBleeding)) exitWith {
					true
				};
				false
			};	
			sleep 1.0;			
			_bleedAmount = player getVariable lm_MS_var_bleedAmount;
			_bleedAmount = _bleedAmount - lm_MS_const_bleedRegenAmount;
			_bleedAmount = 0.0 max _bleedAmount;
			player setVariable [lm_MS_var_bleedAmount, _bleedAmount, true];
			
			_fatigue = getFatigue player;
			_fatigue = _bleedAmount max _fatigue;
			player setFatigue _fatigue;
			
			// Adjust blur post processing based on blood level
			lm_MS_dynamicBlurHandle ppEffectAdjust [_bleedAmount * lm_MS_const_dynamicBlurMultiplier];
			lm_MS_dynamicBlurHandle ppEffectCommit 1.0;
			
			if (lm_MS_isDebug) then {
				systemChat format ["%1 bleed regen %2", profileName, _bleedAmount];
			};
		};
	};
	_handle
};

lm_MS_fnc_onEachFrame = {
	if (alive player) then {
		_currentDamage = damage player;
		if (_currentDamage < lm_MS_lastDamage) then {
			if (lm_MS_isDebug) then {
				systemChat format ["%1 healed %2", profileName, _currentDamage];
			};									
			[lm_MS_const_bodyPartOverall,	_currentDamage, true] call lm_MS_fnc_setBodyPartDamage;
			[lm_MS_const_bodyPartHead, 		_currentDamage, true] call lm_MS_fnc_setBodyPartDamage;
			[lm_MS_const_bodyPartBody, 		_currentDamage, true] call lm_MS_fnc_setBodyPartDamage;
			[lm_MS_const_bodyPartHands, 	_currentDamage, true] call lm_MS_fnc_setBodyPartDamage;
			[lm_MS_const_bodyPartLegs, 		_currentDamage, true] call lm_MS_fnc_setBodyPartDamage;
			[lm_MS_const_bodyPartOverall,	_currentDamage, false] call lm_MS_fnc_setBodyPartDamage;
			[lm_MS_const_bodyPartHead, 		_currentDamage, false] call lm_MS_fnc_setBodyPartDamage;
			[lm_MS_const_bodyPartBody, 		_currentDamage, false] call lm_MS_fnc_setBodyPartDamage;
			[lm_MS_const_bodyPartHands, 	_currentDamage, false] call lm_MS_fnc_setBodyPartDamage;
			[lm_MS_const_bodyPartLegs, 		_currentDamage, false] call lm_MS_fnc_setBodyPartDamage;
			
			if !(player getVariable lm_MS_var_isIncapacitated) then {
				lm_MS_lastDamage = _currentDamage;
				_internalDamage = player getVariable lm_MS_var_internalDamage;
				_internalDamage = _internalDamage * _currentDamage;
				player setVariable [lm_MS_var_internalDamage, _internalDamage, true];
				
				if (lm_MS_isDebug) then {
					systemChat format ["%1 reduce internal damage %2", profileName, _internalDamage];
				};
			};				
		};	
	};
};

lm_MS_fnc_initPlayerVars = {
	call lm_MS_fnc_resetDamageMap;	
	player setVariable [lm_MS_var_bleedAmount, 0.0, true];
	player setVariable [lm_MS_var_bleedTick, 0.0, true];
	player setVariable [lm_MS_var_internalDamage, 0.0, true];
	player setVariable [lm_MS_var_isBleeding, false, true];
	player setVariable [lm_MS_var_isFatallyBleeding, false, true];
	player setVariable [lm_MS_var_isBreathing, true, true];
	player setVariable [lm_MS_var_isIncapacitated, false, true];
	player setVariable [lm_MS_var_isTreating, false, true];
	player setVariable [lm_MS_var_isBeingTreated, false, true];
	player setVariable [lm_MS_var_isBeingDragged, false, true];
	player setVariable [lm_MS_var_incapacitatedBy, nil, true];
	player setVariable [lm_MS_var_revivedBy, nil, true];
};

lm_MS_fnc_updatePlayerVars = {
	private [
		"_player",
		"_bleedAmount",
		"_bleedTick",
		"_internalDamage",
		"_isBleeding",
		"_isFatallyBleeding",
		"_isBreathing",
		"_isIncapacitated",
		"_isTreating",
		"_isBeingTreated",
		"_isBeingDragged"
	];
	
	_player				= _this select 0;
	_bleedAmount		= _this select 1;
	_bleedTick 			= _this select 2;
	_internalDamage 	= _this select 3;
	_isBleeding 		= _this select 4;
	_isFatallyBleeding	= _this select 5;
	_isBreathing 		= _this select 6;
	_isIncapacitated 	= _this select 7;
	_isTreating 		= _this select 8;
	_isBeingTreated 	= _this select 9;
	_isBeingDragged 	= _this select 10;
	
	_player setVariable [lm_MS_var_bleedAmount, 		_bleedAmount, 			false];
	_player setVariable [lm_MS_var_bleedTick, 			_bleedTick, 			false];
	_player setVariable [lm_MS_var_internalDamage, 		_internalDamage, 		false];
	_player setVariable [lm_MS_var_isBleeding, 			_isBleeding, 			false];
	_player setVariable [lm_MS_var_isFatallyBleeding,	_isFatallyBleeding,		false];
	_player setVariable [lm_MS_var_isBreathing, 		_isBreathing, 			false];
	_player setVariable [lm_MS_var_isIncapacitated, 	_isIncapacitated, 		false];
	_player setVariable [lm_MS_var_isTreating, 			_isTreating, 			false];
	_player setVariable [lm_MS_var_isBeingTreated, 		_isBeingTreated, 		false];
	_player setVariable [lm_MS_var_isBeingDragged, 		_isBeingDragged, 		false];
	_player setVariable [lm_MS_var_incapacitatedBy, 	nil, 					false];
	_player setVariable [lm_MS_var_revivedBy, 			nil, 					false];
	
	[_player] call lm_MS_fnc_initMedicActions;
};

lm_MS_fnc_requestPlayerVars = {	
	private ["_player"];
	_player = _this select 0;	
	if (_player == player) exitWith {};

	_bleedAmount 		= player getVariable lm_MS_var_bleedAmount;
	_bleedTick 			= player getVariable lm_MS_var_bleedTick;
	_internalDamage 	= player getVariable lm_MS_var_internalDamage;
	_isBleeding 		= player getVariable lm_MS_var_isBleeding;
	_isFatallyBleeding 	= player getVariable lm_MS_var_isFatallyBleeding;
	_isBreathing 		= player getVariable lm_MS_var_isBreathing;
	_isIncapacitated 	= player getVariable lm_MS_var_isIncapacitated;
	_isTreating 		= player getVariable lm_MS_var_isTreating;
	_isBeingTreated 	= player getVariable lm_MS_var_isBeingTreated;
	_isBeingDragged 	= player getVariable lm_MS_var_isBeingDragged;
			
	[[
		player,
		_bleedAmount,
		_bleedTick,
		_internalDamage,
		_isBleeding,
		_isFatallyBleeding,
		_isBreathing,
		_isIncapacitated,
		_isTreating,
		_isBeingTreated,
		_isBeingDragged
	], "lm_MS_fnc_updatePlayerVars", _player, false] call BIS_fnc_MP;	
};

lm_MS_fnc_initPlayer = {
	call lm_MS_fnc_initPlayerVars;
	call lm_MS_fnc_initPlayerRegenLoop;
	
	// Check if player is a medic.
	_isMedic = false;
	_canRevive = ["B_medic_F", "O_medic_F", "I_medic_F", "B_recon_medic_F"];
	{
		if (player isKindOf _x) then {
			_isMedic = true;
		};
	} forEach _canRevive;
	player setVariable [lm_MS_var_isMedic, _isMedic, true];
	
	// Add event handlers.
	player addEventHandler ["HandleDamage", {
		[_this] call lm_MS_fnc_handleDamage;
	}];
	player addMPEventHandler ["MPHit", {
		[_this] call lm_MS_fnc_receiveDamage;
	}];
	player addMPEventHandler ["MPKilled", {
		if ((_this select 0) == player) then {
			findDisplay 57 closeDisplay 0;
			
			if (!isNil "lm_MS_blackOutHandle") then {
				terminate lm_MS_blackOutHandle;
				lm_MS_blackOutHandle = nil;
				titleText ["", "PLAIN"];
				if (playerRespawnTime != -1.0) then {
					1.0 fadeSound 0.0;
					1.0 fadeRadio 0.0;
					1.0 fadeSpeech 0.0;
				};				
			};
			
			if (!isNil "lm_MS_cardiacArrestHandle") then {
				terminate lm_MS_cardiacArrestHandle;
				lm_MS_cardiacArrestHandle = nil;
			};
			
			lm_MS_dynamicBlurHandle ppEffectAdjust [0.0];
			lm_MS_dynamicBlurHandle ppEffectCommit 0.0;	

			if (lm_MS_const_isTFR) then {
				TF_max_voice_volume call TFAR_fnc_setVoiceVolume;
				
			};
		};		
	}];
	player addEventHandler ["Respawn", {
		_unit 	= _this select 0;
		_corpse = _this select 1;
		
		_corpse removeAllEventHandlers "HandleDamage";
		_corpse removeAllMPEventHandlers "MPHit";
		_corpse removeAllMPEventHandlers "MPKilled";
		_corpse removeAllMPEventHandlers "Respawn";
		
		call lm_MS_fnc_initPlayerVars;
		player setCaptive false;		
		player setDamage 0.0;
		[[player], "lm_MS_fnc_addMedicActions", true, false] call BIS_fnc_MP;

		0.0 fadeSound 1.0;
		0.0 fadeRadio 1.0;
		0.0 fadeSpeech 1.0;
		
		lm_MS_dynamicBlurHandle ppEffectAdjust [0.0];
		lm_MS_dynamicBlurHandle ppEffectCommit 0.0;
	}];
	
	["lm_MS_onEachFrame", "onEachFrame", {	
		[] call lm_MS_fnc_onEachFrame;
	}] call BIS_fnc_addStackedEventHandler;
	
	// Create blur post processing
	lm_MS_dynamicBlurHandle = ppEffectCreate ["DynamicBlur", 500];
	lm_MS_dynamicBlurHandle ppEffectEnable true;
	lm_MS_dynamicBlurHandle ppEffectAdjust [0.0];
	lm_MS_dynamicBlurHandle ppEffectCommit 0.0;
	
	player setVariable [lm_MS_var_isInit, true, true];
};

systemChat ("LM Medic System v" + lm_MS_const_version + " Initialized");

// Initialization
[] call lm_MS_fnc_initPlayer;
[[player], "lm_MS_fnc_initMedicActions", true, false] call BIS_fnc_MP;
[[player], "lm_MS_fnc_requestPlayerVars", true, false] call BIS_fnc_MP;