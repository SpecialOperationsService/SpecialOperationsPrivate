_unit = _this;

if((faction _unit) == "BLU_F") then {
	_factionGuerilla = CEN_RAND_GUER_BLU_F;  // aiGear<MOD><FACTION>.sqf - value 0 or 1 defines full gear randomisation.

	_heads = CEN_RAND_HEADS_BLU_F; // aiGear<MOD><FACTION>.sqf

	_voices = CEN_RAND_VOICES_BLU_F; // aiGear<MOD><FACTION>.sqf

	_uniforms = CEN_RAND_UNIFORMS_BLU_F; // aiGear<MOD><FACTION>.sqf

	_uniformsPilot = CEN_RAND_UNIFORMS_PILOT_BLU_F; // aiGear<MOD><FACTION>.sqf

	_uniformsHeliPilot = CEN_RAND_UNIFORMS_HELIPILOT_BLU_F; // aiGear<MOD><FACTION>.sqf

	_uniformsOfficer = CEN_RAND_UNIFORMS_OFFICER_BLU_F; // aiGear<MOD><FACTION>.sqf

	_helmsOfficer = CEN_RAND_HELMS_OFFICER_BLU_F; // aiGear<MOD><FACTION>.sqf

	_helmsCrew = CEN_RAND_HELMS_CREW_BLU_F; // aiGear<MOD><FACTION>.sqf

	_helmsHeliCrew = CEN_RAND_HELMS_HELICREW_BLU_F; // aiGear<MOD><FACTION>.sqf

	_helmsPilot = CEN_RAND_HELMS_PILOT_BLU_F; // aiGear<MOD><FACTION>.sqf

	_helmsHeliPilot = CEN_RAND_HELMS_HELIPILOT_BLU_F; // aiGear<MOD><FACTION>.sqf

	_vests = CEN_RAND_COM_VESTS; // aiGearCommon.sqf

	_shems = CEN_RAND_COM_SHEMS; // aiGearCommon.sqf

	_hBands = CEN_RAND_COM_HBANDS; // aiGearCommon.sqf

	_helms = CEN_RAND_COM_HELMS + _shems + _hBands; // aiGearCommon.sqf

	_eyesShem = CEN_RAND_COM_GOG_SHEM; // aiGearCommon.sqf

	_eyesHBand = CEN_RAND_COM_GOG_HBAND; // aiGearCommon.sqf

	_eyesAllElse = CEN_RAND_COM_GOG_ELSE; // aiGearCommon.sqf

	_packs = CEN_RAND_PACKS_BLU_F; // aiGear<MOD><FACTION>.sqf

	_packsSpec = CEN_RAND_PACKS_SPEC_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_packsAmmo = CEN_RAND_PACKS_AMMO_BLU_F; // aiGear<MOD><FACTION>.sqf

	_weaponsGL = CEN_RAND_WEAP_GL_BLU_F; // aiGear<MOD><FACTION>.sqf

	_weaponsReconGL = CEN_RAND_WEAP_RECGL_BLU_F; // aiGear<MOD><FACTION>.sqf

	_weaponsAR = CEN_RAND_WEAP_AR_BLU_F; // aiGear<MOD><FACTION>.sqf

	_weaponsRifle = CEN_RAND_WEAP_RIFLE_BLU_F; // aiGear<MOD><FACTION>.sqf

	_weaponsRecon = CEN_RAND_WEAP_RECON_BLU_F; // aiGear<MOD><FACTION>.sqf

	_weaponsAT = CEN_RAND_WEAP_AT_BLU_F; // aiGear<MOD><FACTION>.sqf

	_weaponsLAT = CEN_RAND_WEAP_LAT_BLU_F; // aiGear<MOD><FACTION>.sqf

	_weaponsAA = CEN_RAND_WEAP_AA_BLU_F; // aiGear<MOD><FACTION>.sqf

	_weaponsMM = CEN_RAND_WEAP_MM_BLU_F; // aiGear<MOD><FACTION>.sqf

	_weaponsSniper = CEN_RAND_WEAP_SNIP_BLU_F; // aiGear<MOD><FACTION>.sqf

	_weaponsPilot = CEN_RAND_WEAP_PILOT_BLU_F; // aiGear<MOD><FACTION>.sqf

	_weaponsAll = _weaponsRifle + _weaponsGL + _weaponsAR + _weaponsSniper + _weaponsMM + _weaponsPilot;

	_opticsLeader = CEN_RAND_OPTIC_LEAD_BLU_F; // aiGear<MOD><FACTION>.sqf

	_opticsCommon = CEN_RAND_OPTIC_COM_BLU_F; // aiGear<MOD><FACTION>.sqf

	_opticsAR = CEN_RAND_OPTIC_AR_BLU_F; // aiGear<MOD><FACTION>.sqf

	_opticsMM = CEN_RAND_OPTIC_MM_BLU_F; // aiGear<MOD><FACTION>.sqf

	_opticsSniper = CEN_RAND_OPTIC_SNIP_BLU_F; // aiGear<MOD><FACTION>.sqf

	_basicItems = CEN_RAND_BASICS_BLU_F; // aiGear<MOD><FACTION>.sqf

	_binocs = CEN_BINOCS_BLU_F; // aiGear<MOD><FACTION>.sqf

	_eyesOfficer = CEN_RAND_GOG_OFF_BLU_F; // aiGear<MOD><FACTION>.sqf

	_eyesCommon = CEN_RAND_GOG_BLU_F; // aiGear<MOD><FACTION>.sqf

	if (_factionGuerilla) then {
		[_unit,_helms] call CEN_fnc_addHeadgear;
		[_unit,_uniforms] call CEN_fnc_addUniform;
		[_unit,_vests] call CEN_fnc_addVest;

		removeAllAssignedItems _unit;

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";

		_head = _heads call BIS_fnc_selectRandom;
		_voice = _voices call BIS_fnc_selectRandom;

		_unit setFace _head;
		_unit setSpeaker _voice;
	};

	removeAllWeapons _unit;
	removeAllItems _unit;

	[_unit,_basicItems] call CEN_fnc_addBasics; // Add basic equipment to uniform, grenades, smoke, FAKs, etc.

	switch (typeOf _unit) do {
		case "B_Soldier_SL_F";
		case "B_Soldier_TL_F": {
			if !(_factionGuerilla) then {
				if (isNil "CEN_RAND_TEXTURE_BLU_F") then {
					[_unit,["tf_rt1523g"]] call CEN_fnc_addBackpack;
				} else {
					[_unit,["tf_rt1523g_bwmod"]] call CEN_fnc_addBackpack;
				};
			};
			[_unit,_weaponsGL] call CEN_fnc_addWeaponPrimaryUGL;
			[_unit,_opticsLeader] call CEN_fnc_addOptics;
			_unit addWeapon _binocs;
		};
		case "B_recon_TL_F": {
			if !(_factionGuerilla) then {
				if (isNil "CEN_RAND_TEXTURE_BLU_F") then {
					[_unit,["tf_rt1523g"]] call CEN_fnc_addBackpack;
				} else {
					[_unit,["tf_rt1523g_bwmod"]] call CEN_fnc_addBackpack;
				};
			};
			[_unit,_weaponsReconGL] call CEN_fnc_addWeaponPrimaryUGL;
			[_unit,_opticsLeader] call CEN_fnc_addOptics;
			_unit addWeapon _binocs;
			[_unit,_weaponsReconGL] call CEN_fnc_addMuzzle;
		};
		case "B_Soldier_GL_F" : {
			[_unit,_weaponsGL] call CEN_fnc_addWeaponPrimaryUGL;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
		};
		case "B_soldier_AR_F";
		case "B_G_Soldier_AR_F": {
			[_unit,_weaponsAR] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsAR] call CEN_fnc_addOptics;
		};
		case "B_soldier_AAR_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_packs] call CEN_fnc_addBackpack;
			[_unit,_weaponsAR] spawn CEN_fnc_addAssistAmmo;
		};
		case "B_soldier_LAT_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			[_unit,_weaponsLAT] call CEN_fnc_addWeaponSecondary;
		};
		case "B_recon_LAT_F": {
			[_unit,_weaponsRecon] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			[_unit,_weaponsLAT] call CEN_fnc_addWeaponSecondary;
			[_unit,_weaponsRecon] call CEN_fnc_addMuzzle;
		};
		case "B_Soldier_A_F": {
			_weaponsAllNoDup = _weaponsAll call CEN_fnc_RemoveDuplicates;
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packsAmmo] call CEN_fnc_addBackpack;
			[_unit,_weaponsLAT,_weaponsAllNoDup] spawn CEN_fnc_addAmmo;
		};
		case "B_soldier_AT_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			[_unit,_weaponsAT] call CEN_fnc_addWeaponSecondary;
		};
		case "B_soldier_AAT_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packsAmmo] call CEN_fnc_addBackpack;
			[_unit,_weaponsAT] spawn CEN_fnc_addAssistAmmo;
		};
		case "B_soldier_AA_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			[_unit,_weaponsAA] call CEN_fnc_addWeaponSecondary;
		};
		case "B_soldier_AAA_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packsAmmo] call CEN_fnc_addBackpack;
			[_unit,_weaponsAA] spawn CEN_fnc_addAssistAmmo;
		};
		case "B_soldier_M_F": {
			[_unit,_weaponsMM] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsMM] call CEN_fnc_addOptics;
		};
		case "B_recon_M_F": {
			[_unit,_weaponsMM] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsMM] call CEN_fnc_addOptics;
			[_unit,_weaponsMM] call CEN_fnc_addMuzzle;
		};
		case "B_medic_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			_unit addItemToBackpack "Medikit";
			for "_i" from 1 to 10 do {_unit addItemToBackpack  "FirstAidKit";};
		};
		case "B_recon_medic_F": {
			[_unit,_weaponsRecon] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			_unit addItemToBackpack "Medikit";
			for "_i" from 1 to 10 do {_unit addItemToBackpack  "FirstAidKit";};
			[_unit,_weaponsRecon] call CEN_fnc_addMuzzle;
		};
		case "B_soldier_repair_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			_unit addItemToBackpack "Toolkit";
		};
		case "B_engineer_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			_unit addItemToBackpack "Toolkit";
			_unit addItemToBackpack "MineDetector";
			for "_i" from 1 to 3 do {_unit addItemToBackpack  "ATMine_Range_Mag";};
		};
		case "B_recon_exp_F": {
			[_unit,_weaponsRecon] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			_unit addItemToBackpack "Toolkit";
			_unit addItemToBackpack "MineDetector";
			for "_i" from 1 to 3 do {_unit addItemToBackpack  "APERSMine_Range_Mag";};
			for "_i" from 1 to 3 do {_unit addItemToBackpack  "DemoCharge_Remote_Mag";};
			[_unit,_weaponsRecon] call CEN_fnc_addMuzzle;
		};
		case "B_soldier_exp_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			_unit addItemToBackpack "Toolkit";
			_unit addItemToBackpack "MineDetector";
			for "_i" from 1 to 3 do {_unit addItemToBackpack  "APERSMine_Range_Mag";};
			for "_i" from 1 to 3 do {_unit addItemToBackpack  "DemoCharge_Remote_Mag";};
		};
		case "B_crew_F": {
			[_unit,_weaponsPilot] call CEN_fnc_addWeaponPrimary;
			[_unit,_helmsCrew] call CEN_fnc_addHeadgear;
		};
		case "B_helicrew_F": {
			[_unit,_weaponsPilot] call CEN_fnc_addWeaponPrimary;
			[_unit,_helmsHeliCrew] call CEN_fnc_addHeadgear;
		};
		case "B_Helipilot_F": {
			[_unit,_helmsHeliPilot] call CEN_fnc_addHeadgear;
			[_unit,_uniformsHeliPilot] call CEN_fnc_addUniform;
			[_unit,_basicItems] call CEN_fnc_addBasics;
			[_unit,_weaponsPilot] call CEN_fnc_addWeaponPrimary;
		};
		case "B_Pilot_F": {
			[_unit,_helmsPilot] call CEN_fnc_addHeadgear;
			[_unit,_uniformsPilot] call CEN_fnc_addUniform;
			[_unit,_weaponsPilot] call CEN_fnc_addWeaponPrimary;
			[_unit,_basicItems] call CEN_fnc_addBasics;
		};
		case "B_officer_F": {
			[_unit,_uniformsOfficer] call CEN_fnc_addUniform;
			[_unit,_basicItems] call CEN_fnc_addBasics;
			[_unit,_helmsOfficer] call CEN_fnc_addHeadgear;
			[_unit,_weaponsRecon] call CEN_fnc_addWeaponPrimary;
			if (!isNil "CEN_RAND_TEXOFFICER_BLU_F" && {uniform _unit in _uniformsOfficer}) then {
				_unit setObjectTextureGlobal [0, CEN_RAND_TEXOFFICER_BLU_F];
			};
		};
		case "B_sniper_F": {
			[_unit,_weaponsSniper] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsSniper] call CEN_fnc_addOptics;
		};
		case "B_spotter_F": {
			[_unit,_weaponsMM] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsMM] call CEN_fnc_addOptics;
			_unit addWeapon _binocs;
		};
		case "B_diver_TL_F": {
			//[_unit,["U_B_survival_uniform"]] call CEN_fnc_addUniform;
			//[_unit,_basicItems] call CEN_fnc_addBasics;
			[_unit,_weaponsGL] call CEN_fnc_addWeaponPrimaryUGL;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
		};
		case "B_diver_F";
		case "B_diver_exp_F": {
			//[_unit,["U_B_survival_uniform"]] call CEN_fnc_addUniform;
			//[_unit,_basicItems] call CEN_fnc_addBasics;
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			_unit addWeapon _binocs;
		};
		case "B_recon_JTAC_F": {
			if !(_factionGuerilla) Then {
				if (isNil "CEN_RAND_TEXTURE_BLU_F") then {
					[_unit,["tf_rt1523g_big"]] call CEN_fnc_addBackpack;
				} else {
					[_unit,["tf_rt1523g_big_bwmod"]] call CEN_fnc_addBackpack;
				};
			};
			[_unit,_weaponsRecon] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			_unit addWeapon _binocs;
			[_unit,_weaponsRecon] call CEN_fnc_addMuzzle;
		};
		case "B_recon_F": {
			[_unit,_weaponsRecon] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			_unit addWeapon _binocs;
			[_unit,_weaponsRecon] call CEN_fnc_addMuzzle;
		};
		case "b_survivor_F": {
		};
		case "b_soldier_unarmed_f": {
			removeAllItems _unit;
		};
		case "B_Soldier_lite_F": {
			[_unit,["V_Rangemaster_belt"]] call CEN_fnc_addVest;
			[_unit,_weaponsPilot] call CEN_fnc_addWeaponPrimary;
		};
		default {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
		};
	};

	_textureUniforms = nil; // Uniforms to apply the custom texture to
	if (!isNil "CEN_RAND_TEXUNI_BLU_F") then {
		_textureUniforms = CEN_RAND_TEXUNI_BLU_F;
	};

	if (!isNil "CEN_RAND_TEXTURE_BLU_F" && {uniform _unit in _textureUniforms}) then {
		_unit setObjectTextureGlobal [0, CEN_RAND_TEXTURE_BLU_F];
	};

	if (_factionGuerilla) then {
		sleep 0.1;
		// Checks headgear to make sure the unit does not equip goggles that will clip through headgear
		if ((headgear _unit) in _shems) then {
			_goggles = _eyesShem;
			[_unit,_goggles] call CEN_fnc_addGoggles;
		} else {
			if ((headgear _unit) in _hBands) then {
				_goggles = _eyesHBand;
				[_unit,_goggles] call CEN_fnc_addGoggles;
			} else {
				_goggles = _eyesHBand + _eyesAllElse;
				[_unit,_goggles] call CEN_fnc_addGoggles;
			};
		};
	};
	// ANY SPECIAL FACTION SPECIFIC LINES GO HERE
	// Replaces mcamo hats worn by recon amd officers with generic grey hats that don't clash so much with different uniform camo textures.
	if (!isNil "CEN_RAND_TEXTURE_BLU_F" && {headgear _unit == "H_MilCap_mcamo"}) then {
		[_unit,["H_MilCap_gry"]] call CEN_fnc_addHeadgear;
	};
	// workaround for when officers have the same uniform as regulars.
	if (!isNil "CEN_RAND_TEXOFFICER_BLU_F" && {typeOf _unit == "B_officer_F" && {uniform _unit in _uniformsOfficer}}) then {
		_unit setObjectTextureGlobal [0, CEN_RAND_TEXOFFICER_BLU_F];
	};
};

if((faction _unit) == "BLU_G_F") then {
	_factionGuerilla = CEN_RAND_GUER_BLU_G_F;  // aiGear<MOD><FACTION>.sqf - value 0 or 1 defines full gear randomisation.

	_heads = CEN_RAND_HEADS_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_voices = CEN_RAND_VOICES_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_uniforms = CEN_RAND_UNIFORMS_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_uniformsPilot = CEN_RAND_UNIFORMS_PILOT_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_uniformsHeliPilot = CEN_RAND_UNIFORMS_HELIPILOT_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_uniformsOfficer = CEN_RAND_UNIFORMS_OFFICER_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_helmsOfficer = CEN_RAND_HELMS_OFFICER_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_helmsCrew = CEN_RAND_HELMS_CREW_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_helmsHeliCrew = CEN_RAND_HELMS_HELICREW_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_helmsPilot = CEN_RAND_HELMS_PILOT_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_helmsHeliPilot = CEN_RAND_HELMS_HELIPILOT_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_vests = CEN_RAND_COM_VESTS; // aiGearCommon.sqf

	_shems = CEN_RAND_COM_SHEMS; // aiGearCommon.sqf

	_hBands = CEN_RAND_COM_HBANDS; // aiGearCommon.sqf

	_helms = CEN_RAND_COM_HELMS + _shems + _hBands; // aiGearCommon.sqf

	_eyesShem = CEN_RAND_COM_GOG_SHEM; // aiGearCommon.sqf

	_eyesHBand = CEN_RAND_COM_GOG_HBAND; // aiGearCommon.sqf

	_eyesAllElse = CEN_RAND_COM_GOG_ELSE; // aiGearCommon.sqf

	_packs = CEN_RAND_PACKS_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_packsSpec = CEN_RAND_PACKS_SPEC_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_packsAmmo = CEN_RAND_PACKS_AMMO_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_weaponsGL = CEN_RAND_WEAP_GL_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_weaponsReconGL = CEN_RAND_WEAP_RECGL_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_weaponsAR = CEN_RAND_WEAP_AR_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_weaponsRifle = CEN_RAND_WEAP_RIFLE_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_weaponsRecon = CEN_RAND_WEAP_RECON_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_weaponsAT = CEN_RAND_WEAP_AT_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_weaponsLAT = CEN_RAND_WEAP_LAT_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_weaponsAA = CEN_RAND_WEAP_AA_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_weaponsMM = CEN_RAND_WEAP_MM_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_weaponsSniper = CEN_RAND_WEAP_SNIP_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_weaponsPilot = CEN_RAND_WEAP_PILOT_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_weaponsAll = _weaponsRifle + _weaponsGL + _weaponsAR + _weaponsSniper + _weaponsMM + _weaponsPilot;

	_opticsLeader = CEN_RAND_OPTIC_LEAD_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_opticsCommon = CEN_RAND_OPTIC_COM_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_opticsAR = CEN_RAND_OPTIC_AR_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_opticsMM = CEN_RAND_OPTIC_MM_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_opticsSniper = CEN_RAND_OPTIC_SNIP_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_basicItems = CEN_RAND_BASICS_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_binocs = CEN_BINOCS_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_eyesOfficer = CEN_RAND_GOG_OFF_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	_eyesCommon = CEN_RAND_GOG_BLU_G_F; // aiGear<MOD><FACTION>.sqf

	if (_factionGuerilla) then {
		[_unit,_helms] call CEN_fnc_addHeadgear;
		[_unit,_uniforms] call CEN_fnc_addUniform;
		[_unit,_vests] call CEN_fnc_addVest;

		removeAllAssignedItems _unit;

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";

		_head = _heads call BIS_fnc_selectRandom;
		_voice = _voices call BIS_fnc_selectRandom;

		_unit setFace _head;
		_unit setSpeaker _voice;
	};

	removeAllWeapons _unit;
	removeAllItems _unit;

	[_unit,_basicItems] call CEN_fnc_addBasics; // Add basic equipment to uniform, grenades, smoke, FAKs, etc.

	switch (typeOf _unit) do {
		case "B_G_Soldier_SL_F";
		case "B_G_Soldier_TL_F": {
			if !(_factionGuerilla) Then {
				[_unit,["tf_rt1523g"]] call CEN_fnc_addBackpack;
			};
			[_unit,_weaponsGL] call CEN_fnc_addWeaponPrimaryUGL;
			[_unit,_opticsLeader] call CEN_fnc_addOptics;
			_unit addWeapon _binocs;
		};
		case "B_G_Soldier_GL_F": {
			[_unit,_weaponsGL] call CEN_fnc_addWeaponPrimaryUGL;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
		};
		case "B_G_Soldier_AR_F": {
			[_unit,_weaponsAR] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsAR] call CEN_fnc_addOptics;
		};
		case "B_G_Soldier_LAT_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			[_unit,_weaponsLAT] call CEN_fnc_addWeaponSecondary;
		};
		case "B_G_Soldier_A_F": {
			_weaponsAllNoDup = _weaponsAll call CEN_fnc_RemoveDuplicates;
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packsAmmo] call CEN_fnc_addBackpack;
			[_unit,_weaponsLAT,_weaponsAllNoDup] spawn CEN_fnc_addAmmo;
		};
		case "B_G_Soldier_M_F": {
			[_unit,_weaponsMM] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsMM] call CEN_fnc_addOptics;
		};
		case "B_G_medic_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			_unit addItemToBackpack "Medikit";
			for "_i" from 1 to 10 do {_unit addItemToBackpack  "FirstAidKit";};
		};
		case "B_G_engineer_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			_unit addItemToBackpack "Toolkit";
			_unit addItemToBackpack "MineDetector";
			for "_i" from 1 to 3 do {_unit addItemToBackpack  "ATMine_Range_Mag";};
		};
		case "B_G_Soldier_exp_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			_unit addItemToBackpack "Toolkit";
			_unit addItemToBackpack "MineDetector";
			for "_i" from 1 to 3 do {_unit addItemToBackpack  "APERSMine_Range_Mag";};
			for "_i" from 1 to 3 do {_unit addItemToBackpack  "DemoCharge_Remote_Mag";};
		};
		case "B_G_officer_F": {
			[_unit,_uniformsOfficer] call CEN_fnc_addUniform;
			[_unit,_basicItems] call CEN_fnc_addBasics;
			[_unit,_helmsOfficer] call CEN_fnc_addHeadgear;
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsLeader] call CEN_fnc_addOptics;
			if (!isNil "CEN_RAND_TEXOFFICER_BLU_G_F" && {uniform _unit in _uniformsOfficer}) then {
				_unit setObjectTextureGlobal [0, CEN_RAND_TEXOFFICER_BLU_G_F];
			};
		};
		case "b_g_survivor_F": {
		};
		case "b_g_soldier_unarmed_f": {
			removeAllItems _unit;
		};
		case "B_G_Soldier_lite_F": {
			[_unit,["V_Rangemaster_belt"]] call CEN_fnc_addVest;
			[_unit,_weaponsPilot] call CEN_fnc_addWeaponPrimary;
		};
		default {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
		};
	};

	_textureUniforms = nil; // Uniforms to apply the custom texture to
	if (!isNil "CEN_RAND_TEXUNI_BLU_G_F") then {
		_textureUniforms = CEN_RAND_TEXUNI_BLU_G_F;
	};

	if (!isNil "CEN_RAND_TEXTURE_BLU_G_F" && {uniform _unit in _textureUniforms}) then {
		_unit setObjectTextureGlobal [0, CEN_RAND_TEXTURE_BLU_G_F];
	};

	if (_factionGuerilla) then {
		sleep 0.1;
		// Checks headgear to make sure the unit does not equip goggles that will clip through headgear
		if ((headgear _unit) in _shems) then {
			_goggles = _eyesShem;
			[_unit,_goggles] call CEN_fnc_addGoggles;
		} else {
			if ((headgear _unit) in _hBands) then {
				_goggles = _eyesHBand;
				[_unit,_goggles] call CEN_fnc_addGoggles;
			} else {
				_goggles = _eyesHBand + _eyesAllElse;
				[_unit,_goggles] call CEN_fnc_addGoggles;
			};
		};
	};
	// ANY SPECIAL FACTION SPECIFIC LINES GO HERE
};

if((faction _unit) == "OPF_F") then {
	_factionGuerilla = CEN_RAND_GUER_OPF_F;  // aiGear<MOD><FACTION>.sqf - value 0 or 1 defines full gear randomisation.

	_heads = CEN_RAND_HEADS_OPF_F; // aiGear<MOD><FACTION>.sqf

	_voices = CEN_RAND_VOICES_OPF_F; // aiGear<MOD><FACTION>.sqf

	_uniforms = CEN_RAND_UNIFORMS_OPF_F; // aiGear<MOD><FACTION>.sqf

	_uniformsPilot = CEN_RAND_UNIFORMS_PILOT_OPF_F; // aiGear<MOD><FACTION>.sqf

	_uniformsHeliPilot = CEN_RAND_UNIFORMS_HELIPILOT_OPF_F; // aiGear<MOD><FACTION>.sqf

	_uniformsOfficer = CEN_RAND_UNIFORMS_OFFICER_OPF_F; // aiGear<MOD><FACTION>.sqf

	_helmsOfficer = CEN_RAND_HELMS_OFFICER_OPF_F; // aiGear<MOD><FACTION>.sqf

	_helmsCrew = CEN_RAND_HELMS_CREW_OPF_F; // aiGear<MOD><FACTION>.sqf

	_helmsHeliCrew = CEN_RAND_HELMS_HELICREW_OPF_F; // aiGear<MOD><FACTION>.sqf

	_helmsPilot = CEN_RAND_HELMS_PILOT_OPF_F; // aiGear<MOD><FACTION>.sqf

	_helmsHeliPilot = CEN_RAND_HELMS_HELIPILOT_OPF_F; // aiGear<MOD><FACTION>.sqf

	_vests = CEN_RAND_COM_VESTS; // aiGearCommon.sqf

	_shems = CEN_RAND_COM_SHEMS; // aiGearCommon.sqf

	_hBands = CEN_RAND_COM_HBANDS; // aiGearCommon.sqf

	_helms = CEN_RAND_COM_HELMS + _shems + _hBands; // aiGearCommon.sqf

	_eyesShem = CEN_RAND_COM_GOG_SHEM; // aiGearCommon.sqf

	_eyesHBand = CEN_RAND_COM_GOG_HBAND; // aiGearCommon.sqf

	_eyesAllElse = CEN_RAND_COM_GOG_ELSE; // aiGearCommon.sqf

	_packs = CEN_RAND_PACKS_OPF_F; // aiGear<MOD><FACTION>.sqf

	_packsSpec = CEN_RAND_PACKS_SPEC_OPF_F; // aiGear<MOD><FACTION>.sqf

	_packsAmmo = CEN_RAND_PACKS_AMMO_OPF_F; // aiGear<MOD><FACTION>.sqf

	_weaponsGL = CEN_RAND_WEAP_GL_OPF_F; // aiGear<MOD><FACTION>.sqf

	_weaponsReconGL = CEN_RAND_WEAP_RECGL_OPF_F; // aiGear<MOD><FACTION>.sqf

	_weaponsAR = CEN_RAND_WEAP_AR_OPF_F; // aiGear<MOD><FACTION>.sqf

	_weaponsRifle = CEN_RAND_WEAP_RIFLE_OPF_F; // aiGear<MOD><FACTION>.sqf

	_weaponsRecon = CEN_RAND_WEAP_RECON_OPF_F; // aiGear<MOD><FACTION>.sqf

	_weaponsAT = CEN_RAND_WEAP_AT_OPF_F; // aiGear<MOD><FACTION>.sqf

	_weaponsLAT = CEN_RAND_WEAP_LAT_OPF_F; // aiGear<MOD><FACTION>.sqf

	_weaponsAA = CEN_RAND_WEAP_AA_OPF_F; // aiGear<MOD><FACTION>.sqf

	_weaponsMM = CEN_RAND_WEAP_MM_OPF_F; // aiGear<MOD><FACTION>.sqf

	_weaponsSniper = CEN_RAND_WEAP_SNIP_OPF_F; // aiGear<MOD><FACTION>.sqf

	_weaponsPilot = CEN_RAND_WEAP_PILOT_OPF_F; // aiGear<MOD><FACTION>.sqf

	_weaponsAll = _weaponsRifle + _weaponsGL + _weaponsAR + _weaponsSniper + _weaponsMM + _weaponsPilot;

	_opticsLeader = CEN_RAND_OPTIC_LEAD_OPF_F; // aiGear<MOD><FACTION>.sqf

	_opticsCommon = CEN_RAND_OPTIC_COM_OPF_F; // aiGear<MOD><FACTION>.sqf

	_opticsAR = CEN_RAND_OPTIC_AR_OPF_F; // aiGear<MOD><FACTION>.sqf

	_opticsMM = CEN_RAND_OPTIC_MM_OPF_F; // aiGear<MOD><FACTION>.sqf

	_opticsSniper = CEN_RAND_OPTIC_SNIP_OPF_F; // aiGear<MOD><FACTION>.sqf

	_basicItems = CEN_RAND_BASICS_OPF_F; // aiGear<MOD><FACTION>.sqf

	_binocs = CEN_BINOCS_OPF_F; // aiGear<MOD><FACTION>.sqf

	_eyesOfficer = CEN_RAND_GOG_OFF_OPF_F; // aiGear<MOD><FACTION>.sqf

	_eyesCommon = CEN_RAND_GOG_OPF_F; // aiGear<MOD><FACTION>.sqf

	if (_factionGuerilla) then {
		[_unit,_helms] call CEN_fnc_addHeadgear;
		[_unit,_uniforms] call CEN_fnc_addUniform;
		[_unit,_vests] call CEN_fnc_addVest;

		removeAllAssignedItems _unit;

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";

		_head = _heads call BIS_fnc_selectRandom;
		_voice = _voices call BIS_fnc_selectRandom;

		_unit setFace _head;
		_unit setSpeaker _voice;
	};
	removeAllWeapons _unit;
	removeAllItems _unit;

	[_unit,_basicItems] call CEN_fnc_addBasics; // Add basic equipment to uniform, grenades, smoke, FAKs, etc.


	switch (typeOf _unit) do {
		case "O_recon_TL_F": {
			if !(_factionGuerilla) Then {
				[_unit,["tf_mr3000"]] call CEN_fnc_addBackpack;
			};
			[_unit,_weaponsReconGL] call CEN_fnc_addWeaponPrimaryUGL;
			[_unit,_opticsLeader] call CEN_fnc_addOptics;
			_unit addWeapon _binocs;
			[_unit,_weaponsReconGL] call CEN_fnc_addMuzzle;
		};
		case "O_Soldier_SL_F";
		case "O_G_Soldier_SL_F";
		case "O_Soldier_TL_F";
		case "O_G_Soldier_TL_F": {
			if !(_factionGuerilla) Then {
				[_unit,["tf_mr3000"]] call CEN_fnc_addBackpack;
			};
			[_unit,_weaponsGL] call CEN_fnc_addWeaponPrimaryUGL;
			[_unit,_opticsLeader] call CEN_fnc_addOptics;
			_unit addWeapon _binocs;
		};
		case "O_SoldierU_SL_F";
		case "O_soldierU_TL_F": {
			if !(_factionGuerilla) Then {
				[_unit,["tf_mr3000_bwmod"]] call CEN_fnc_addBackpack;
			};
			[_unit,_weaponsGL] call CEN_fnc_addWeaponPrimaryUGL;
			[_unit,_opticsLeader] call CEN_fnc_addOptics;
			_unit addWeapon _binocs;
		};
		case "O_Soldier_GL_F";
		case "O_SoldierU_GL_F";
		case "O_G_Soldier_GL_F": {
			[_unit,_weaponsGL] call CEN_fnc_addWeaponPrimaryUGL;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
		};
		case "O_Soldier_AR_F";
		case "O_soldierU_AR_F";
		case "O_G_Soldier_AR_F": {
			[_unit,_weaponsAR] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
		};
		case "O_Soldier_AAR_F";
		case "O_soldierU_AAR_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_packs] call CEN_fnc_addBackpack;
			[_unit,_weaponsAR] spawn CEN_fnc_addAssistAmmo;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
		};
		case "O_recon_LAT_F": {
			[_unit,_weaponsRecon] call CEN_fnc_addWeaponPrimary;
			[_unit,_packs] call CEN_fnc_addBackpack;
			[_unit,_weaponsLAT] call CEN_fnc_addWeaponSecondary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_weaponsRecon] call CEN_fnc_addMuzzle;
		};
		case "O_Soldier_LAT_F";
		case "O_SoldierU_LAT_F";
		case "O_G_Soldier_LAT_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_packs] call CEN_fnc_addBackpack;
			[_unit,_weaponsLAT] call CEN_fnc_addWeaponSecondary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
		};
		case "O_Soldier_A_F";
		case "O_soldierU_A_F";
		case "O_G_Soldier_A_F": {
			_weaponsAllNoDup = _weaponsAll call CEN_fnc_RemoveDuplicates;
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_packsAmmo] call CEN_fnc_addBackpack;
			[_unit,_weaponsLAT,_weaponsAllNoDup] spawn CEN_fnc_addAmmo;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
		};
		case "O_Soldier_AT_F";
		case "O_soldierU_AT_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_packs] call CEN_fnc_addBackpack;
			[_unit,_weaponsAT] call CEN_fnc_addWeaponSecondary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
		};
		case "O_Soldier_AAT_F";
		case "O_soldierU_AAT_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_packsAmmo] call CEN_fnc_addBackpack;
			[_unit,_weaponsAT] spawn CEN_fnc_addAssistAmmo;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
		};
		case "O_Soldier_AA_F";
		case "O_soldierU_AA_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_packs] call CEN_fnc_addBackpack;
			[_unit,_weaponsAA] call CEN_fnc_addWeaponSecondary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
		};
		case "O_Soldier_AAA_F";
		case "O_soldierU_AAA_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_packsAmmo] call CEN_fnc_addBackpack;
			[_unit,_weaponsAA] spawn CEN_fnc_addAssistAmmo;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
		};
		case "O_recon_M_F": {
			[_unit,_weaponsMM] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsMM] call CEN_fnc_addOptics;
			[_unit,_weaponsMM] call CEN_fnc_addMuzzle;
		};
		case "O_soldier_M_F";
		case "O_soldierU_M_F";
		case "O_G_Soldier_M_F": {
			[_unit,_weaponsMM] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsMM] call CEN_fnc_addOptics;
		};
		case "O_recon_medic_F": {
			[_unit,_weaponsRecon] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			_unit addItemToBackpack "Medikit";
			for "_i" from 1 to 10 do {_unit addItemToBackpack  "FirstAidKit";};
			[_unit,_weaponsRecon] call CEN_fnc_addMuzzle;
		};
		case "O_medic_F";
		case "O_soldierU_medic_F";
		case "O_G_medic_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			_unit addItemToBackpack "Medikit";
			for "_i" from 1 to 10 do {_unit addItemToBackpack  "FirstAidKit";};
		};
		case "O_soldier_repair_F";
		case "O_soldierU_repair_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			_unit addItemToBackpack "Toolkit";
		};
		case "O_engineer_F";
		case "O_G_engineer_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			_unit addItemToBackpack "Toolkit";
			_unit addItemToBackpack "MineDetector";
			for "_i" from 1 to 3 do {_unit addItemToBackpack  "ATMine_Range_Mag";};
		};
		case "O_recon_exp_F": {
			[_unit,_weaponsRecon] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			_unit addItemToBackpack "Toolkit";
			_unit addItemToBackpack "MineDetector";
			for "_i" from 1 to 3 do {_unit addItemToBackpack  "APERSMine_Range_Mag";};
			for "_i" from 1 to 3 do {_unit addItemToBackpack  "DemoCharge_Remote_Mag";};
			[_unit,_weaponsRecon] call CEN_fnc_addMuzzle;
		};
		case "O_soldier_exp_F";
		case "O_soldierU_exp_F";
		case "O_G_Soldier_exp_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			_unit addItemToBackpack "Toolkit";
			_unit addItemToBackpack "MineDetector";
			for "_i" from 1 to 3 do {_unit addItemToBackpack  "APERSMine_Range_Mag";};
			for "_i" from 1 to 3 do {_unit addItemToBackpack  "DemoCharge_Remote_Mag";};
		};
		case "O_crew_F": {
			[_unit,_weaponsPilot] call CEN_fnc_addWeaponPrimary;
			[_unit,_helmsCrew] call CEN_fnc_addHeadgear;
		};
		case "O_helicrew_F": {
			[_unit,_weaponsPilot] call CEN_fnc_addWeaponPrimary;
			[_unit,_helmsHeliCrew] call CEN_fnc_addHeadgear;
		};
		case "O_helipilot_F": {
			[_unit,_helmsHeliPilot] call CEN_fnc_addHeadgear;
			[_unit,_uniformsHeliPilot] call CEN_fnc_addUniform;
			[_unit,_basicItems] call CEN_fnc_addBasics;
			[_unit,_weaponsPilot] call CEN_fnc_addWeaponPrimary;
		};
		case "O_Pilot_F": {
			[_unit,_helmsPilot] call CEN_fnc_addHeadgear;
			[_unit,_uniformsPilot] call CEN_fnc_addUniform;
			[_unit,_weaponsPilot] call CEN_fnc_addWeaponPrimary;
			[_unit,_basicItems] call CEN_fnc_addBasics;
		};
		case "O_officer_F";
		case "O_G_officer_F": {
			[_unit,_uniformsOfficer] call CEN_fnc_addUniform;
			[_unit,_basicItems] call CEN_fnc_addBasics;
			[_unit,_helmsOfficer] call CEN_fnc_addHeadgear;
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsLeader] call CEN_fnc_addOptics;
			if (!isNil "CEN_RAND_TEXOFFICER_OPF_F" && {uniform _unit in _uniformsOfficer}) then {
				_unit setObjectTextureGlobal [0, CEN_RAND_TEXOFFICER_OPF_F];
			};
		};
		case "O_sniper_F": {
			[_unit,_weaponsSniper] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsSniper] call CEN_fnc_addOptics;
		};
		case "O_spotter_F": {
			[_unit,_weaponsMM] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsMM] call CEN_fnc_addOptics;
			_unit addWeapon _binocs;
		};
		case "O_diver_TL_F": {
			[_unit,["U_B_survival_uniform"]] call CEN_fnc_addUniform;
			[_unit,_basicItems] call CEN_fnc_addBasics;
			[_unit,_weaponsGL] call CEN_fnc_addWeaponPrimaryUGL;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
		};
		case "O_diver_F";
		case "O_diver_exp_F": {
			[_unit,["U_B_survival_uniform"]] call CEN_fnc_addUniform;
			[_unit,_basicItems] call CEN_fnc_addBasics;
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
		};
		case "O_recon_JTAC_F": {
			if !(_factionGuerilla) Then {
				[_unit,["tf_mr3000"]] call CEN_fnc_addBackpack;
			};
			[_unit,_weaponsRecon] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_weaponsRecon] call CEN_fnc_addMuzzle;
		};
		case "O_recon_F": {
			[_unit,_weaponsRecon] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_weaponsRecon] call CEN_fnc_addMuzzle;
		};
		case "o_survivor_F";
		case "o_g_survivor_F": {
		};
		case "o_soldier_unarmed_f";
		case "o_g_soldier_unarmed_f": {
			removeAllItems _unit;
		};
		case "O_Soldier_lite_F";
		case "O_G_Soldier_lite_F": {
			[_unit,["V_Rangemaster_belt"]] call CEN_fnc_addVest;
			[_unit,_weaponsPilot] call CEN_fnc_addWeaponPrimary;
		};
		default {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
		};
	};

	_textureUniforms = nil; // Uniforms to apply the custom texture to
	if (!isNil "CEN_RAND_TEXUNI_OPF_F") then {
		_textureUniforms = CEN_RAND_TEXUNI_OPF_F;
	};

	if (!isNil "CEN_RAND_TEXTURE_OPF_F" && {uniform _unit in _textureUniforms}) then {
		_unit setObjectTextureGlobal [0, CEN_RAND_TEXTURE_OPF_F];
	};

	if (_factionGuerilla) then {
		sleep 0.1;
		// Checks headgear to make sure the unit does not equip goggles that will clip through headgear
		if ((headgear _unit) in _shems) then {
			_goggles = _eyesShem;
			[_unit,_goggles] call CEN_fnc_addGoggles;
		} else {
			if ((headgear _unit) in _hBands) then {
				_goggles = _eyesHBand;
				[_unit,_goggles] call CEN_fnc_addGoggles;
			} else {
				_goggles = _eyesHBand + _eyesAllElse;
				[_unit,_goggles] call CEN_fnc_addGoggles;
			};
		};
	};
	// ANY SPECIAL FACTION SPECIFIC LINES GO HERE
};

if((faction _unit) == "IND_F") then {
	_factionGuerilla = CEN_RAND_GUER_IND_F;  // aiGear<MOD><FACTION>.sqf - value 0 or 1 defines full gear randomisation.

	_heads = CEN_RAND_HEADS_IND_F; // aiGear<MOD><FACTION>.sqf

	_voices = CEN_RAND_VOICES_IND_F; // aiGear<MOD><FACTION>.sqf

	_uniforms = CEN_RAND_UNIFORMS_IND_F; // aiGear<MOD><FACTION>.sqf

	_uniformsPilot = CEN_RAND_UNIFORMS_PILOT_IND_F; // aiGear<MOD><FACTION>.sqf

	_uniformsHeliPilot = CEN_RAND_UNIFORMS_HELIPILOT_IND_F; // aiGear<MOD><FACTION>.sqf

	_uniformsOfficer = CEN_RAND_UNIFORMS_OFFICER_IND_F; // aiGear<MOD><FACTION>.sqf

	_helmsOfficer = CEN_RAND_HELMS_OFFICER_IND_F; // aiGear<MOD><FACTION>.sqf

	_helmsCrew = CEN_RAND_HELMS_CREW_IND_F; // aiGear<MOD><FACTION>.sqf

	_helmsHeliCrew = CEN_RAND_HELMS_HELICREW_IND_F; // aiGear<MOD><FACTION>.sqf

	_helmsPilot = CEN_RAND_HELMS_PILOT_IND_F; // aiGear<MOD><FACTION>.sqf

	_helmsHeliPilot = CEN_RAND_HELMS_HELIPILOT_IND_F; // aiGear<MOD><FACTION>.sqf

	_vests = CEN_RAND_COM_VESTS; // aiGearCommon.sqf

	_shems = CEN_RAND_COM_SHEMS; // aiGearCommon.sqf

	_hBands = CEN_RAND_COM_HBANDS; // aiGearCommon.sqf

	_helms = CEN_RAND_COM_HELMS + _shems + _hBands; // aiGearCommon.sqf

	_eyesShem = CEN_RAND_COM_GOG_SHEM; // aiGearCommon.sqf

	_eyesHBand = CEN_RAND_COM_GOG_HBAND; // aiGearCommon.sqf

	_eyesAllElse = CEN_RAND_COM_GOG_ELSE; // aiGearCommon.sqf

	_packs = CEN_RAND_PACKS_IND_F; // aiGear<MOD><FACTION>.sqf

	_packsAmmo = CEN_RAND_PACKS_AMMO_IND_F; // aiGear<MOD><FACTION>.sqf

	_packsSpec = CEN_RAND_PACKS_SPEC_IND_F; // aiGear<MOD><FACTION>.sqf

	_weaponsGL = CEN_RAND_WEAP_GL_IND_F; // aiGear<MOD><FACTION>.sqf

	_weaponsReconGL = CEN_RAND_WEAP_RECGL_IND_F; // aiGear<MOD><FACTION>.sqf

	_weaponsAR = CEN_RAND_WEAP_AR_IND_F; // aiGear<MOD><FACTION>.sqf

	_weaponsRifle = CEN_RAND_WEAP_RIFLE_IND_F; // aiGear<MOD><FACTION>.sqf

	_weaponsRecon = CEN_RAND_WEAP_RECON_IND_F; // aiGear<MOD><FACTION>.sqf

	_weaponsAT = CEN_RAND_WEAP_AT_IND_F; // aiGear<MOD><FACTION>.sqf

	_weaponsLAT = CEN_RAND_WEAP_LAT_IND_F; // aiGear<MOD><FACTION>.sqf

	_weaponsAA = CEN_RAND_WEAP_AA_IND_F; // aiGear<MOD><FACTION>.sqf

	_weaponsMM = CEN_RAND_WEAP_MM_IND_F; // aiGear<MOD><FACTION>.sqf

	_weaponsSniper = CEN_RAND_WEAP_SNIP_IND_F; // aiGear<MOD><FACTION>.sqf

	_weaponsPilot = CEN_RAND_WEAP_PILOT_IND_F; // aiGear<MOD><FACTION>.sqf

	_weaponsAll = _weaponsRifle + _weaponsGL + _weaponsAR + _weaponsSniper + _weaponsMM + _weaponsPilot;

	_opticsLeader = CEN_RAND_OPTIC_LEAD_IND_F; // aiGear<MOD><FACTION>.sqf

	_opticsCommon = CEN_RAND_OPTIC_COM_IND_F; // aiGear<MOD><FACTION>.sqf

	_opticsAR = CEN_RAND_OPTIC_AR_IND_F; // aiGear<MOD><FACTION>.sqf

	_opticsMM = CEN_RAND_OPTIC_MM_IND_F; // aiGear<MOD><FACTION>.sqf

	_opticsSniper = CEN_RAND_OPTIC_SNIP_IND_F; // aiGear<MOD><FACTION>.sqf

	_basicItems = CEN_RAND_BASICS_IND_F; // aiGear<MOD><FACTION>.sqf

	_binocs = CEN_BINOCS_IND_F; // aiGear<MOD><FACTION>.sqf

	_eyesOfficer = CEN_RAND_GOG_OFF_IND_F; // aiGear<MOD><FACTION>.sqf

	_eyesCommon = CEN_RAND_GOG_IND_F; // aiGear<MOD><FACTION>.sqf

	if (_factionGuerilla) then {
		[_unit,_helms] call CEN_fnc_addHeadgear;
		[_unit,_uniforms] call CEN_fnc_addUniform;
		[_unit,_vests] call CEN_fnc_addVest;

		removeAllAssignedItems _unit;

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";

		_head = _heads call BIS_fnc_selectRandom;
		_voice = _voices call BIS_fnc_selectRandom;

		_unit setFace _head;
		_unit setSpeaker _voice;
	};

	removeAllWeapons _unit;
	removeAllItems _unit;

	[_unit,_basicItems] call CEN_fnc_addBasics; // Add basic equipment to uniform, grenades, smoke, FAKs, etc.


	switch (typeOf _unit) do {
		case "I_Soldier_SL_F";
		case "I_Soldier_TL_F": {
			if !(_factionGuerilla) Then {
				[_unit,["tf_anprc155"]] call CEN_fnc_addBackpack;
			};
			[_unit,_weaponsGL] call CEN_fnc_addWeaponPrimaryUGL;
			[_unit,_opticsLeader] call CEN_fnc_addOptics;
			_unit addWeapon _binocs;
		};
		case "I_Soldier_GL_F": {
			[_unit,_weaponsGL] call CEN_fnc_addWeaponPrimaryUGL;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
		};
		case "I_Soldier_AR_F": {
			[_unit,_weaponsAR] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsAR] call CEN_fnc_addOptics;
		};
		case "I_Soldier_AAR_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			[_unit,_weaponsAR] spawn CEN_fnc_addAssistAmmo;
		};
		case "I_Soldier_LAT_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			[_unit,_weaponsLAT] call CEN_fnc_addWeaponSecondary;
		};
		case "I_Soldier_A_F": {
			_weaponsAllNoDup = _weaponsAll call CEN_fnc_RemoveDuplicates;
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packsAmmo] call CEN_fnc_addBackpack;
			[_unit,_weaponsLAT,_weaponsAllNoDup] spawn CEN_fnc_addAmmo;
		};
		case "I_Soldier_AT_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			[_unit,_weaponsAT] call CEN_fnc_addWeaponSecondary;
		};
		case "I_Soldier_AAT_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packsAmmo] call CEN_fnc_addBackpack;
			[_unit,_weaponsAT] spawn CEN_fnc_addAssistAmmo;
		};
		case "I_Soldier_AA_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			[_unit,_weaponsAA] call CEN_fnc_addWeaponSecondary;
		};
		case "I_Soldier_AAA_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packsAmmo] call CEN_fnc_addBackpack;
			[_unit,_weaponsAA] spawn CEN_fnc_addAssistAmmo;
		};
		case "I_Soldier_M_F": {
			[_unit,_weaponsMM] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsMM] call CEN_fnc_addOptics;
		};
		case "I_medic_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			_unit addItemToBackpack "Medikit";
			for "_i" from 1 to 10 do {_unit addItemToBackpack  "FirstAidKit";};
		};
		case "I_Soldier_repair_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			_unit addItemToBackpack "Toolkit";
		};
		case "I_engineer_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			_unit addItemToBackpack "Toolkit";
			_unit addItemToBackpack "MineDetector";
			for "_i" from 1 to 3 do {_unit addItemToBackpack  "ATMine_Range_Mag";};
		};
		case "I_Soldier_exp_F": {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packs] call CEN_fnc_addBackpack;
			_unit addItemToBackpack "Toolkit";
			_unit addItemToBackpack "MineDetector";
			for "_i" from 1 to 3 do {_unit addItemToBackpack  "APERSMine_Range_Mag";};
			for "_i" from 1 to 3 do {_unit addItemToBackpack  "DemoCharge_Remote_Mag";};
		};
		case "I_crew_F": {
			[_unit,_weaponsPilot] call CEN_fnc_addWeaponPrimary;
			[_unit,_helmsCrew] call CEN_fnc_addHeadgear;
		};
		case "I_helicrew_F": {
			[_unit,_weaponsPilot] call CEN_fnc_addWeaponPrimary;
			[_unit,_helmsHeliCrew] call CEN_fnc_addHeadgear;
		};
		case "I_helipilot_F": {
			[_unit,_helmsHeliPilot] call CEN_fnc_addHeadgear;
			[_unit,_uniformsHeliPilot] call CEN_fnc_addUniform;
			[_unit,_basicItems] call CEN_fnc_addBasics;
			[_unit,_weaponsPilot] call CEN_fnc_addWeaponPrimary;
		};
		case "I_pilot_F": {
			[_unit,_helmsPilot] call CEN_fnc_addHeadgear;
			[_unit,_uniformsPilot] call CEN_fnc_addUniform;
			[_unit,_weaponsPilot] call CEN_fnc_addWeaponPrimary;
			[_unit,_basicItems] call CEN_fnc_addBasics;
		};
		case "I_officer_F": {
			[_unit,_uniformsOfficer] call CEN_fnc_addUniform;
			[_unit,_basicItems] call CEN_fnc_addBasics;
			[_unit,_helmsOfficer] call CEN_fnc_addHeadgear;
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsLeader] call CEN_fnc_addOptics;
			if (!isNil "CEN_RAND_TEXOFFICER_IND_F" && {uniform _unit in _uniformsOfficer}) then {
				_unit setObjectTextureGlobal [0, CEN_RAND_TEXOFFICER_IND_F];
			};
		};
		case "I_Sniper_F": {
			[_unit,_weaponsSniper] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsSniper] call CEN_fnc_addOptics;
		};
		case "I_Spotter_F": {
			[_unit,_weaponsMM] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsMM] call CEN_fnc_addOptics;
			_unit addWeapon _binocs;
		};
		case "I_diver_TL_F": {
			//[_unit,["U_B_survival_uniform"]] call CEN_fnc_addUniform;
			[_unit,_basicItems] call CEN_fnc_addBasics;
			[_unit,_weaponsGL] call CEN_fnc_addWeaponPrimaryUGL;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			_unit addWeapon _binocs;
		};
		case "I_diver_F";
		case "I_diver_exp_F": {
			//[_unit,["U_B_survival_uniform"]] call CEN_fnc_addUniform;
			[_unit,_basicItems] call CEN_fnc_addBasics;
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
		};
		case "i_survivor_F": {
		};
		case "i_soldier_unarmed_f": {
			removeAllItems _unit;
		};
		case "i_soldier_universal_f": { // Listed name Soldier
			removeHeadgear _unit;
			[_unit,_uniformsOfficer] call CEN_fnc_addUniform;
			[_unit,["V_PlateCarrier1_blk"]] call CEN_fnc_addVest;
			[_unit,_basicItems] call CEN_fnc_addBasics;
			[_unit,_eyesOfficer] call CEN_fnc_addGoggles;
			[_unit,_weaponsRecon] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			_unit addWeapon _binocs;
			[_unit,_weaponsRecon] call CEN_fnc_addMuzzle;
			if (!isNil "CEN_RAND_TEXOFFICER_IND_F" && {uniform _unit in _uniformsOfficer}) then {
				_unit setObjectTextureGlobal [0, CEN_RAND_TEXOFFICER_IND_F];
			};
		};
		case "I_Soldier_02_F": { // Listed name Rifleman 2
			[_unit,_uniforms] call CEN_fnc_addUniform;
			[_unit,["V_PlateCarrier1_blk"]] call CEN_fnc_addVest;
			[_unit,_basicItems] call CEN_fnc_addBasics;
			[_unit,["H_Beret_blk"]] call CEN_fnc_addHeadgear;
			[_unit,_eyesCommon] call CEN_fnc_addGoggles;
			[_unit,_weaponsRecon] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_weaponsRecon] call CEN_fnc_addMuzzle;
		};
		case "I_Soldier_03_F": { // Listed name Rifleman (Top)
			[_unit,_uniforms] call CEN_fnc_addUniform;
			[_unit,["V_PlateCarrier1_blk"]] call CEN_fnc_addVest;
			[_unit,_basicItems] call CEN_fnc_addBasics;
			[_unit,["H_Beret_blk"]] call CEN_fnc_addHeadgear;
			[_unit,_eyesCommon] call CEN_fnc_addGoggles;
			[_unit,_weaponsRecon] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packsSpec] call CEN_fnc_addBackpack;
			[_unit,_weaponsLAT] call CEN_fnc_addWeaponSecondary;
			[_unit,_weaponsRecon] call CEN_fnc_addMuzzle;
		};
		case "I_Soldier_04_F": { // Listed name Pilot (Top)
			[_unit,_uniforms] call CEN_fnc_addUniform;
			[_unit,["V_PlateCarrier1_blk"]] call CEN_fnc_addVest;
			[_unit,_basicItems] call CEN_fnc_addBasics;
			[_unit,["H_Beret_blk"]] call CEN_fnc_addHeadgear;
			[_unit,_eyesCommon] call CEN_fnc_addGoggles;
			[_unit,_weaponsRecon] call CEN_fnc_addWeaponPrimary;
			[_unit,_opticsCommon] call CEN_fnc_addOptics;
			[_unit,_packsSpec] call CEN_fnc_addBackpack;
			for "_i" from 1 to 3 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
			for "_i" from 1 to 2 do {_unit addItemToBackpack "APERSMine_Range_Mag";};
			_unit addItemToBackpack "APERSBoundingMine_Range_Mag";
			_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";
			_unit addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
			[_unit,_weaponsRecon] call CEN_fnc_addMuzzle;
		};
		case "I_Soldier_lite_F";
		case "I_G_Soldier_lite_F": {
			[_unit,["V_Rangemaster_belt"]] call CEN_fnc_addVest;
			[_unit,_weaponsPilot] call CEN_fnc_addWeaponPrimary;
		};
		default {
			[_unit,_weaponsRifle] call CEN_fnc_addWeaponPrimary;
		};
	};

	_textureUniforms = nil; // Uniforms to apply the custom texture to
	if (!isNil "CEN_RAND_TEXUNI_IND_F") then {
		_textureUniforms = CEN_RAND_TEXUNI_IND_F;
	};

	if (!isNil "CEN_RAND_TEXTURE_IND_F" && {uniform _unit in _textureUniforms}) then {
		_unit setObjectTextureGlobal [0, CEN_RAND_TEXTURE_IND_F];
	};

	if (_factionGuerilla) then {
		sleep 0.1;
		// Checks headgear to make sure the unit does not equip goggles that will clip through headgear
		if ((headgear _unit) in _shems) then {
			_goggles = _eyesShem;
			[_unit,_goggles] call CEN_fnc_addGoggles;
		} else {
			if ((headgear _unit) in _hBands) then {
				_goggles = _eyesHBand;
				[_unit,_goggles] call CEN_fnc_addGoggles;
			} else {
				_goggles = _eyesHBand + _eyesAllElse;
				[_unit,_goggles] call CEN_fnc_addGoggles;
			};
		};
	};
	// ANY SPECIAL FACTION SPECIFIC LINES GO HERE
	_unit addPrimaryWeaponItem "acc_flashlight";
	_unit unlinkItem "NVGoggles_INDEP";
};

if((faction _unit) == "CIV_F") then {
	_factionGuerilla = CEN_RAND_GUER_OPF_F;  // aiGear<MOD><FACTION>.sqf - value 0 or 1 defines full gear randomisation.

	_heads = CEN_RAND_HEADS_OPF_F; // aiGear<MOD><FACTION>.sqf

	_voices = CEN_RAND_VOICES_OPF_F; // aiGear<MOD><FACTION>.sqf

	_uniforms = CEN_RAND_UNIFORMS_OPF_F + ["U_I_G_Story_Protagonist_F","U_C_Poor_1","U_Marshal"]; // aiGear<MOD><FACTION>.sqf

	_uniformsPilot = CEN_RAND_UNIFORMS_PILOT_OPF_F; // aiGear<MOD><FACTION>.sqf

	_uniformsHeliPilot = CEN_RAND_UNIFORMS_HELIPILOT_OPF_F; // aiGear<MOD><FACTION>.sqf

	_uniformsOfficer = CEN_RAND_UNIFORMS_OFFICER_OPF_F; // aiGear<MOD><FACTION>.sqf

	_helmsOfficer = CEN_RAND_HELMS_OFFICER_OPF_F; // aiGear<MOD><FACTION>.sqf

	_helmsCrew = CEN_RAND_HELMS_CREW_OPF_F; // aiGear<MOD><FACTION>.sqf

	_helmsHeliCrew = CEN_RAND_HELMS_HELICREW_OPF_F; // aiGear<MOD><FACTION>.sqf

	_helmsPilot = CEN_RAND_HELMS_PILOT_OPF_F; // aiGear<MOD><FACTION>.sqf

	_helmsHeliPilot = CEN_RAND_HELMS_HELIPILOT_OPF_F; // aiGear<MOD><FACTION>.sqf

	_vests = CEN_RAND_COM_VESTS; // aiGearCommon.sqf

	_shems = CEN_RAND_COM_SHEMS; // aiGearCommon.sqf

	_hBands = CEN_RAND_COM_HBANDS; // aiGearCommon.sqf

	_helms = CEN_RAND_COM_HELMS + _shems + _hBands; // aiGearCommon.sqf

	_eyesShem = CEN_RAND_COM_GOG_SHEM; // aiGearCommon.sqf

	_eyesHBand = CEN_RAND_COM_GOG_HBAND; // aiGearCommon.sqf

	_eyesAllElse = CEN_RAND_COM_GOG_ELSE; // aiGearCommon.sqf

	_basicItems = CEN_RAND_BASICS_OPF_F; // aiGear<MOD><FACTION>.sqf

	_binocs = CEN_BINOCS_OPF_F; // aiGear<MOD><FACTION>.sqf

	_eyesOfficer = CEN_RAND_GOG_OFF_OPF_F; // aiGear<MOD><FACTION>.sqf

	_eyesCommon = CEN_RAND_GOG_OPF_F; // aiGear<MOD><FACTION>.sqf

	[_unit,_basicItems] call CEN_fnc_addBasics; // Add basic equipment to uniform, grenades, smoke, FAKs, etc.

	_shorts = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_burgundy","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour"];

	sleep 1; // work around to let default CIV_F gear randomisation to finish
	if (_factionGuerilla) then {
		switch (typeOf _unit) do {
			case "C_man_p_fugitive_F";
			case "C_man_p_beggar_F": {
				[_unit,_helms] call CEN_fnc_addHeadgear;
				[_unit,_uniforms] call CEN_fnc_addUniform;
				[_unit,_vests] call CEN_fnc_addVest;
				[_unit,_basicItems] call CEN_fnc_addBasics; // Add basic equipment to uniform, grenades, smoke, FAKs, etc.
				_head = _heads call BIS_fnc_selectRandom;
				_voice = _voices call BIS_fnc_selectRandom;
				_unit setFace _head;
				_unit setSpeaker _voice;
				sleep 0.1;
				// Checks headgear to make sure the unit does not equip goggles that will clip through headgear
				if ((headgear _unit) in _shems) then {
					_goggles = _eyesShem;
					[_unit,_goggles] call CEN_fnc_addGoggles;
				} else {
					if ((headgear _unit) in _hBands) then {
						_goggles = _eyesHBand;
						[_unit,_goggles] call CEN_fnc_addGoggles;
					} else {
						_goggles = _eyesHBand + _eyesAllElse;
						[_unit,_goggles] call CEN_fnc_addGoggles;
					};
				};
			};
			case "C_man_1";
			case "C_man_polo_1_F";
			case "C_man_polo_2_F";
			case "C_man_polo_3_F";
			case "C_man_polo_4_F";
			case "C_man_polo_5_F";
			case "C_man_polo_6_F";
			case "C_man_1_1_F";
			case "C_man_1_2_F";
			case "C_man_1_3_F": {
				[_unit,_uniforms] call CEN_fnc_addUniform;
				_head = _heads call BIS_fnc_selectRandom;
				_voice = _voices call BIS_fnc_selectRandom;
				_unit setFace _head;
				_unit setSpeaker _voice;
			};
			case "C_man_shorts_1_F";
			case "C_man_shorts_2_F";
			case "C_man_shorts_3_F";
			case "C_man_shorts_4_F": {
				[_unit,_shorts] call CEN_fnc_addUniform;
				_head = _heads call BIS_fnc_selectRandom;
				_voice = _voices call BIS_fnc_selectRandom;
				_unit setFace _head;
				_unit setSpeaker _voice;
			};
			case "C_man_p_shorts_1_F": {
				[_unit,_helms] call CEN_fnc_addHeadgear;
				[_unit,_shorts] call CEN_fnc_addUniform;
				[_unit,_vests] call CEN_fnc_addVest;
				[_unit,_basicItems] call CEN_fnc_addBasics; // Add basic equipment to uniform, grenades, smoke, FAKs, etc.
				_head = _heads call BIS_fnc_selectRandom;
				_voice = _voices call BIS_fnc_selectRandom;
				_unit setFace _head;
				_unit setSpeaker _voice;
				sleep 0.1;
				// Checks headgear to make sure the unit does not equip goggles that will clip through headgear
				if ((headgear _unit) in _shems) then {
					_goggles = _eyesShem;
					[_unit,_goggles] call CEN_fnc_addGoggles;
				} else {
					if ((headgear _unit) in _hBands) then {
						_goggles = _eyesHBand;
						[_unit,_goggles] call CEN_fnc_addGoggles;
					} else {
						_goggles = _eyesHBand + _eyesAllElse;
						[_unit,_goggles] call CEN_fnc_addGoggles;
					};
				};
			};
			case "C_journalist_F": {};
			case "C_Marshal_F": {};
			case "C_man_pilot_F": {};
			case "C_scientist_F": {};

			case "C_man_p_fugitive_F_afro";
			case "C_man_p_beggar_F_afro": {
				[_unit,_helms] call CEN_fnc_addHeadgear;
				[_unit,_uniforms] call CEN_fnc_addUniform;
				[_unit,_vests] call CEN_fnc_addVest;
				[_unit,_basicItems] call CEN_fnc_addBasics; // Add basic equipment to uniform, grenades, smoke, FAKs, etc.
				sleep 0.1;
				// Checks headgear to make sure the unit does not equip goggles that will clip through headgear
				if ((headgear _unit) in _shems) then {
					_goggles = _eyesShem;
					[_unit,_goggles] call CEN_fnc_addGoggles;
				} else {
					if ((headgear _unit) in _hBands) then {
						_goggles = _eyesHBand;
						[_unit,_goggles] call CEN_fnc_addGoggles;
					} else {
						_goggles = _eyesHBand + _eyesAllElse;
						[_unit,_goggles] call CEN_fnc_addGoggles;
					};
				};
			};
			case "C_man_polo_1_F_afro";
			case "C_man_polo_2_F_afro";
			case "C_man_polo_3_F_afro";
			case "C_man_polo_4_F_afro";
			case "C_man_polo_5_F_afro";
			case "C_man_polo_6_F_afro": {
				[_unit,_uniforms] call CEN_fnc_addUniform;
			};
			case "C_man_p_shorts_1_F_afro": {
				[_unit,_helms] call CEN_fnc_addHeadgear;
				[_unit,_shorts] call CEN_fnc_addUniform;
				[_unit,_vests] call CEN_fnc_addVest;
				[_unit,_basicItems] call CEN_fnc_addBasics; // Add basic equipment to uniform, grenades, smoke, FAKs, etc.
				sleep 0.1;
				// Checks headgear to make sure the unit does not equip goggles that will clip through headgear
				if ((headgear _unit) in _shems) then {
					_goggles = _eyesShem;
					[_unit,_goggles] call CEN_fnc_addGoggles;
				} else {
					if ((headgear _unit) in _hBands) then {
						_goggles = _eyesHBand;
						[_unit,_goggles] call CEN_fnc_addGoggles;
					} else {
						_goggles = _eyesHBand + _eyesAllElse;
						[_unit,_goggles] call CEN_fnc_addGoggles;
					};
				};
			};
			case "C_man_shorts_1_F_afro";
			case "C_man_shorts_2_F_afro";
			case "C_man_shorts_3_F_afro";
			case "C_man_shorts_4_F_afro": {
				[_unit,_shorts] call CEN_fnc_addUniform;
			};

			case "C_man_p_beggar_F_asia";
			case "C_man_p_fugitive_F_asia": {
				[_unit,_helms] call CEN_fnc_addHeadgear;
				[_unit,_uniforms] call CEN_fnc_addUniform;
				[_unit,_vests] call CEN_fnc_addVest;
				[_unit,_basicItems] call CEN_fnc_addBasics; // Add basic equipment to uniform, grenades, smoke, FAKs, etc.
				sleep 0.1;
				// Checks headgear to make sure the unit does not equip goggles that will clip through headgear
				if ((headgear _unit) in _shems) then {
					_goggles = _eyesShem;
					[_unit,_goggles] call CEN_fnc_addGoggles;
				} else {
					if ((headgear _unit) in _hBands) then {
						_goggles = _eyesHBand;
						[_unit,_goggles] call CEN_fnc_addGoggles;
					} else {
						_goggles = _eyesHBand + _eyesAllElse;
						[_unit,_goggles] call CEN_fnc_addGoggles;
					};
				};
			};
			case "C_man_polo_1_F_asia";
			case "C_man_polo_2_F_asia";
			case "C_man_polo_3_F_asia";
			case "C_man_polo_4_F_asia";
			case "C_man_polo_5_F_asia";
			case "C_man_polo_6_F_asia": {
				[_unit,_uniforms] call CEN_fnc_addUniform;
			};
			case "C_man_p_shorts_1_F_asia": {
				[_unit,_helms] call CEN_fnc_addHeadgear;
				[_unit,_shorts] call CEN_fnc_addUniform;
				[_unit,_vests] call CEN_fnc_addVest;
				[_unit,_basicItems] call CEN_fnc_addBasics; // Add basic equipment to uniform, grenades, smoke, FAKs, etc.
				sleep 0.1;
				// Checks headgear to make sure the unit does not equip goggles that will clip through headgear
				if ((headgear _unit) in _shems) then {
					_goggles = _eyesShem;
					[_unit,_goggles] call CEN_fnc_addGoggles;
				} else {
					if ((headgear _unit) in _hBands) then {
						_goggles = _eyesHBand;
						[_unit,_goggles] call CEN_fnc_addGoggles;
					} else {
						_goggles = _eyesHBand + _eyesAllElse;
						[_unit,_goggles] call CEN_fnc_addGoggles;
					};
				};
			};
			case "C_man_shorts_1_F_asia";
			case "C_man_shorts_2_F_asia";
			case "C_man_shorts_3_F_asia";
			case "C_man_shorts_4_F_asia": {
				[_unit,_shorts] call CEN_fnc_addUniform;
			};

			case "C_man_p_beggar_F_euro";
			case "C_man_p_fugitive_F_euro": {
				[_unit,_helms] call CEN_fnc_addHeadgear;
				[_unit,_uniforms] call CEN_fnc_addUniform;
				[_unit,_vests] call CEN_fnc_addVest;
				[_unit,_basicItems] call CEN_fnc_addBasics; // Add basic equipment to uniform, grenades, smoke, FAKs, etc.
				sleep 0.1;
				// Checks headgear to make sure the unit does not equip goggles that will clip through headgear
				if ((headgear _unit) in _shems) then {
					_goggles = _eyesShem;
					[_unit,_goggles] call CEN_fnc_addGoggles;
				} else {
					if ((headgear _unit) in _hBands) then {
						_goggles = _eyesHBand;
						[_unit,_goggles] call CEN_fnc_addGoggles;
					} else {
						_goggles = _eyesHBand + _eyesAllElse;
						[_unit,_goggles] call CEN_fnc_addGoggles;
					};
				};
			};
			case "C_man_polo_1_F_euro";
			case "C_man_polo_2_F_euro";
			case "C_man_polo_3_F_euro";
			case "C_man_polo_4_F_euro";
			case "C_man_polo_5_F_euro";
			case "C_man_polo_6_F_euro": {
				[_unit,_uniforms] call CEN_fnc_addUniform;
			};
			case "C_man_p_shorts_1_F_euro": {
				[_unit,_helms] call CEN_fnc_addHeadgear;
				[_unit,_shorts] call CEN_fnc_addUniform;
				[_unit,_vests] call CEN_fnc_addVest;
				[_unit,_basicItems] call CEN_fnc_addBasics; // Add basic equipment to uniform, grenades, smoke, FAKs, etc.
				sleep 0.1;
				// Checks headgear to make sure the unit does not equip goggles that will clip through headgear
				if ((headgear _unit) in _shems) then {
					_goggles = _eyesShem;
					[_unit,_goggles] call CEN_fnc_addGoggles;
				} else {
					if ((headgear _unit) in _hBands) then {
						_goggles = _eyesHBand;
						[_unit,_goggles] call CEN_fnc_addGoggles;
					} else {
						_goggles = _eyesHBand + _eyesAllElse;
						[_unit,_goggles] call CEN_fnc_addGoggles;
					};
				};
			};
			case "C_man_shorts_2_F_euro";
			case "C_man_shorts_3_F_euro";
			case "C_man_shorts_4_F_euro": {
				[_unit,_shorts] call CEN_fnc_addUniform;
			};
			default {};
		};
	};
	// ANY SPECIAL FACTION SPECIFIC LINES GO HERE
};