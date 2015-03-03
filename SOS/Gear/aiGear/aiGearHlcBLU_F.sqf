CEN_RAND_GUER_BLU_F = false;

switch (worldName) do {
	case "Takistan";
	case "Zargabad";
	case "Desert";
	case "Shapur";
	case "Mountains_ACR": {
		/*CEN_RAND_TEXUNI_BLU_F = [
			"U_B_CombatUniform_mcam",
			"U_B_CombatUniform_mcam_tshirt",
			"U_B_CombatUniform_mcam_vest",
			"U_B_survival_uniform",
			"U_B_GhillieSuit"
		];*/
		//CEN_RAND_TEXTURE_BLU_F = "a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa";
		//CEN_RAND_TEXOFFICER_BLU_F = "a3\characters_f\BLUFOR\Data\clothing_sage_co.paa";
	};
	case "Chernarus";
	case "Chernarus_Summer";
	case "Thirsk";
	case "Woodland_ACR";
	case "Bornholm";
	case "VR": {
		CEN_RAND_TEXUNI_BLU_F = [
			"U_B_CombatUniform_mcam",
			"U_B_CombatUniform_mcam_tshirt",
			"U_B_CombatUniform_mcam_vest",
			"U_B_survival_uniform",
			"U_B_GhillieSuit"
		];
		CEN_RAND_TEXTURE_BLU_F = "\a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa";
		//CEN_RAND_TEXOFFICER_BLU_F = "\a3\characters_f\BLUFOR\Data\clothing_sage_co.paa";
	};
	default {
		/*CEN_RAND_TEXUNI_BLU_F = [
			"U_B_CombatUniform_mcam",
			"U_B_CombatUniform_mcam_tshirt",
			"U_B_CombatUniform_mcam_vest",
			"U_B_survival_uniform",
			"U_B_GhillieSuit"
		];*/
		//CEN_RAND_TEXTURE_BLU_F = "a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa";
		//CEN_RAND_TEXOFFICER_BLU_F = "a3\characters_f\BLUFOR\Data\clothing_sage_co.paa";
	};
};

CEN_RAND_HEADS_BLU_F = [
	"WhiteHead_01",
	"WhiteHead_02",
	"WhiteHead_03",
	"WhiteHead_04",
	"WhiteHead_05",
	"WhiteHead_06",
	"WhiteHead_07",
	"WhiteHead_08",
	"WhiteHead_09",
	"WhiteHead_10",
	"WhiteHead_11",
	"WhiteHead_12",
	"WhiteHead_13",
	"WhiteHead_14",
	"WhiteHead_15",
	"WhiteHead_16",
	"WhiteHead_17",
	"WhiteHead_18",
	"WhiteHead_19",
	"WhiteHead_20",
	"WhiteHead_21",
	"AfricanHead_01",
	"AfricanHead_02",
	"AfricanHead_03",
	"AsianHead_A3_01",
	"AsianHead_A3_02",
	"AsianHead_A3_03",
	"GreekHead_A3_01",
	"GreekHead_A3_02",
	"GreekHead_A3_03",
	"GreekHead_A3_04",
	"GreekHead_A3_05",
	"GreekHead_A3_06",
	"GreekHead_A3_07",
	"GreekHead_A3_08",
	"GreekHead_A3_09"
];

CEN_RAND_VOICES_BLU_F = [
	"Male01ENG",
	"Male02ENG",
	"Male03ENG",
	"Male04ENG",
	"Male05ENG",
	"Male06ENG",
	"Male07ENG",
	"Male08ENG",
	"Male09ENG",
	"Male10ENG",
	"Male11ENG",
	"Male12ENG"
];

CEN_RAND_UNIFORMS_BLU_F = [
	"U_BG_leader",
	"U_BG_Guerilla1_1",
	"U_BG_Guerilla2_1",
	"U_BG_Guerilla2_2",
	"U_BG_Guerilla2_3",
	"U_BG_Guerilla3_1",
	"U_BG_Guerrilla_6_1"
];

CEN_RAND_UNIFORMS_PILOT_BLU_F = [
	"U_B_PilotCoveralls"
];

CEN_RAND_UNIFORMS_HELIPILOT_BLU_F = [
	"U_B_HeliPilotCoveralls"
];

CEN_RAND_UNIFORMS_OFFICER_BLU_F = [
	"U_B_CombatUniform_mcam"
];

CEN_RAND_HELMS_CREW_BLU_F = [
	"H_HelmetCrew_B"
];

CEN_RAND_HELMS_HELICREW_BLU_F = [
	"H_CrewHelmetHeli_B"
];

CEN_RAND_HELMS_PILOT_BLU_F = [
	"H_PilotHelmetFighter_B"
];

CEN_RAND_HELMS_HELIPILOT_BLU_F = [
	"H_PilotHelmetHeli_B"
];
// Different backpack depending on the map and if cat's texture is used. Backpack should match texture.
if (!isNil "CEN_RAND_TEXTURE_BLU_F") then {
	switch (worldName) do {
		case "Takistan";
		case "Zargabad";
		case "Desert";
		case "Shapur";
		case "VR": {
			// desert maps, desert style backpacks
			CEN_RAND_PACKS_BLU_F = [
				"B_AssaultPack_rgr"
			];

			CEN_RAND_PACKS_SPEC_BLU_F = [ // Special Packs
				"B_FieldPack_oli"
			];

			CEN_RAND_PACKS_AMMO_BLU_F = [ // Ammobearer packs
				"B_Carryall_cbr"
			];

			CEN_RAND_HELMS_OFFICER_BLU_F = [
				"H_MilCap_gry"
			];

		};
		default {
			// forest/mediterranean maps, green back packs to match tiger stripe and cherno texture
			CEN_RAND_PACKS_BLU_F = [
				"B_AssaultPack_rgr"
			];

			CEN_RAND_PACKS_SPEC_BLU_F = [ // Special Packs
				"B_FieldPack_oli"
			];

			CEN_RAND_PACKS_AMMO_BLU_F = [  // Ammobearer packs
				"B_Carryall_oli"
			];

			CEN_RAND_HELMS_OFFICER_BLU_F = [
				"H_MilCap_gry"
			];
	    };
	};
} else {
	// vanilla backpacks
	CEN_RAND_PACKS_BLU_F = [
		"B_AssaultPack_rgr"
	];

	CEN_RAND_PACKS_SPEC_BLU_F = [ // Special Packs
		"B_FieldPack_oli"
	];

	CEN_RAND_PACKS_AMMO_BLU_F = [
		"B_Carryall_mcamo"
	];

	CEN_RAND_HELMS_OFFICER_BLU_F = [
		"H_MilCap_mcamo"
	];
};

// For rifles arrays should be aranged as follows:
// [Weapon, default ammo, silencer (if available, "" if not), GL ammo (if GL)]
// if silencer is not available should still include empty string ""

CEN_RAND_WEAP_GL_BLU_F = [
	["rhs_m4a1_m320","rhs_mag_30Rnd_556x45_Mk262_Stanag","muzzle_snds_M","rhs_mag_M441_HE"]
];

CEN_RAND_WEAP_RECGL_BLU_F = [
	["rhs_m4a1_m320","rhs_mag_30Rnd_556x45_Mk262_Stanag","muzzle_snds_M","rhs_mag_M441_HE"]
];

CEN_RAND_WEAP_AR_BLU_F = [
	["rhs_weap_m249_pip","rhsusf_100Rnd_556x45_soft_pouch","muzzle_snds_M_MG"]
];

CEN_RAND_WEAP_RIFLE_BLU_F = [
	["rhs_weap_m16a4_carryhandle","rhs_mag_30Rnd_556x45_Mk262_Stanag","muzzle_snds_M"]
];

CEN_RAND_WEAP_RECON_BLU_F = [
	["rhs_weap_m4_carryhandle","rhs_mag_30Rnd_556x45_Mk262_Stanag","muzzle_snds_M"]
];

CEN_RAND_WEAP_AT_BLU_F = [
	["launch_B_Titan_short_F","Titan_AT","Titan_AP"]
];

CEN_RAND_WEAP_LAT_BLU_F = [
	["launch_NLAW_F","NLAW_F"]
];

CEN_RAND_WEAP_AA_BLU_F = [
	["launch_B_Titan_F","Titan_AA"]
];

CEN_RAND_WEAP_MM_BLU_F = [
	["hlc_rifle_m14sopmod","hlc_20Rnd_762x51_B_M14","hlc_rifle_m14sopmod"]
];

CEN_RAND_WEAP_SNIP_BLU_F = [
	["srifle_LRR_camo_F","7Rnd_408_Mag",""],
	["srifle_LRR_F","7Rnd_408_Mag",""]
];

CEN_RAND_WEAP_PILOT_BLU_F = [
	["hlc_rifle_hk53","hlc_30rnd_556x45_EPR_HK33","hlc_muzzle_snds_HK33"]
];

CEN_RAND_OPTIC_LEAD_BLU_F = [
	"optic_MRCO"
];

CEN_RAND_OPTIC_COM_BLU_F = [
	""
];

CEN_RAND_OPTIC_AR_BLU_F = [
	""
];

CEN_RAND_OPTIC_MM_BLU_F = [
	"optic_DMS"
];

CEN_RAND_OPTIC_SNIP_BLU_F = [
	"optic_LRPS"
];

CEN_RAND_BASICS_BLU_F = [
	"FirstAidKit", // FAKs
	"SmokeShellGreen", // Smoke type
	"HandGrenade", // Grenade type
	"Chemlight_blue" // Chemlight type
];

CEN_RAND_GOG_OFF_BLU_F = [ // officer goggles randomisation for non geurilla factions
	"G_Aviator",
	"G_Bandanna_aviator"
];

CEN_RAND_GOG_BLU_F = [ // common goggles randomisation for non geurilla factions
	"G_Bandanna_blk",
	"G_Bandanna_khk",
	"G_Bandanna_oli",
	"G_Bandanna_beast",
	"G_Bandanna_shades",
	"G_Balaclava_blk",
	"G_Balaclava_lowprofile",
	"G_Balaclava_oli"
];

// not randomised just change to whatever binocular type equipment you want SLs, TLs and Spotters to have
CEN_BINOCS_BLU_F = "Rangefinder";