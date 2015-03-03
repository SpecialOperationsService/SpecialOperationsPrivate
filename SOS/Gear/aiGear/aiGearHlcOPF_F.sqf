CEN_RAND_GUER_OPF_F = true;

switch (worldName) do {
	case "Takistan";
	case "Zargabad";
	case "Desert";
	case "Shapur";
	case "Mountains_ACR";
	case "VR";
	case "Altis";
	case "Stratis": {
		CEN_RAND_HEADS_OPF_F = [
			"PersianHead_A3_01",
			"AfricanHead_01",
			"PersianHead_A3_02",
			"AfricanHead_02",
			"PersianHead_A3_03",
			"AfricanHead_03"
		];
		CEN_RAND_VOICES_OPF_F = [
			"Male01PER",
			"Male02PER",
			"Male03PER"
		];
	};
	case "Chernarus";
	case "Chernarus_Summer";
	case "Thirsk";
	case "Thirsk_Winter";
	case "Woodland_ACR": {
		CEN_RAND_HEADS_OPF_F = [
			"GreekHead_A3_01",
			"GreekHead_A3_02",
			"GreekHead_A3_03",
			"GreekHead_A3_04",
			"GreekHead_A3_05",
			"GreekHead_A3_06",
			"GreekHead_A3_07",
			"GreekHead_A3_08",
			"GreekHead_A3_09",
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
			"AsianHead_A3_01",
			"AsianHead_A3_02",
			"AsianHead_A3_03"
		];
		CEN_RAND_HEADS_OPF_F = [
			"rhs_Male01RUS",
			"rhs_Male02RUS",
			"rhs_Male03RUS",
			"rhs_Male04RUS",
			"rhs_Male05RUS"
		];
	};
	default {
		CEN_RAND_HEADS_OPF_F = [
			"GreekHead_A3_01",
			"GreekHead_A3_02",
			"GreekHead_A3_03",
			"GreekHead_A3_04",
			"GreekHead_A3_05",
			"GreekHead_A3_06",
			"GreekHead_A3_07",
			"GreekHead_A3_08",
			"GreekHead_A3_09",
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
			"WhiteHead_21"
		];
		CEN_RAND_VOICES_OPF_F = [
			"Male01GRE",
			"Male02GRE",
			"Male03GRE",
			"Male04GRE",
			"Male05GRE",
			"Male06GRE"
		];
    };
};

switch (worldName) do {
	case "Takistan";
	case "Zargabad";
	case "Desert";
	case "Shapur";
	case "Mountains_ACR";
	case "VR": {
		/*CEN_RAND_TEXUNI_BLU_G_F = [
			"U_O_SpecopsUniform_ocamo",
			"U_O_CombatUniform_ocamo",
			"U_O_GhillieSuit"
		];*/
		//CEN_RAND_TEXTURE_OPF_F = "a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa";
		//CEN_RAND_TEXOFFICER_OPF_F = "a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa";
	};
	case "Chernarus";
	case "Chernarus_Summer";
	case "Thirsk";
	case "Woodland_ACR": {
		/*CEN_RAND_TEXUNI_BLU_G_F = [
			"U_O_SpecopsUniform_ocamo",
			"U_O_CombatUniform_ocamo",
			"U_O_GhillieSuit"
		];*/
		//CEN_RAND_TEXTURE_OPF_F = "a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa";
		//CEN_RAND_TEXOFFICER_OPF_F = "a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa";
	};
	default {
		/*CEN_RAND_TEXUNI_BLU_G_F = [
			"U_O_SpecopsUniform_ocamo",
			"U_O_CombatUniform_ocamo",
			"U_O_GhillieSuit"
		];*/
		//CEN_RAND_TEXTURE_OPF_F = "a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa";
		//CEN_RAND_TEXOFFICER_OPF_F = "a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa";
	};
};

CEN_RAND_UNIFORMS_OPF_F = [
	"U_OG_leader",
	"U_OG_Guerilla1_1",
	"U_OG_Guerilla2_1",
	"U_OG_Guerilla2_2",
	"U_OG_Guerilla2_3",
	"U_OG_Guerilla3_1",
	"U_OG_Guerrilla_6_1",
	"U_C_HunterBody_grn"
];

CEN_RAND_UNIFORMS_PILOT_OPF_F = [
	"U_C_WorkerCoveralls"
];

CEN_RAND_UNIFORMS_HELIPILOT_OPF_F = [
	"U_C_WorkerCoveralls"
];

CEN_RAND_UNIFORMS_OFFICER_OPF_F = [
	"U_O_OfficerUniform_ocamo"
];

CEN_RAND_HELMS_OFFICER_OPF_F = [
	"H_Beret_blk"
];

CEN_RAND_HELMS_CREW_OPF_F = [
	"H_HelmetB_snakeskin",
	"H_HelmetIA",
	"H_HelmetCrew_I"
];

CEN_RAND_HELMS_HELICREW_OPF_F = [
	"H_HelmetB_snakeskin",
	"H_HelmetIA",
	"H_HelmetCrew_I",
	"H_CrewHelmetHeli_B",
	"H_CrewHelmetHeli_O",
	"H_CrewHelmetHeli_I",
	"H_PilotHelmetHeli_B",
	"H_PilotHelmetHeli_O",
	"H_PilotHelmetHeli_I",
	"H_HelmetCrew_I"
];

CEN_RAND_HELMS_PILOT_OPF_F = [
	"H_PilotHelmetFighter_B",
	"H_PilotHelmetFighter_O",
	"H_PilotHelmetFighter_I"
];

CEN_RAND_HELMS_HELIPILOT_OPF_F = [
	"H_PilotHelmetHeli_B",
	"H_PilotHelmetHeli_O",
	"H_PilotHelmetHeli_I",
	"H_HelmetCrew_I"
];

// For rifles arrays should be aranged as follows:
// [Weapon, default ammo, silencer (if available), GL ammo (if GL)]
// if silencer is not available should still include empty string ""

CEN_RAND_WEAP_GL_OPF_F = [
	["hlc_rifle_aks74_GL","hlc_30Rnd_545x39_B_AK","hlc_muzzle_545SUP_AK","hlc_VOG25_AK"],
	["hlc_rifle_akmgl","hlc_30Rnd_762x39_b_ak","hlc_muzzle_762SUP_AK","hlc_VOG25_AK"]
];

CEN_RAND_WEAP_RECGL_OPF_F = [
	["hlc_rifle_aks74_GL","hlc_30Rnd_545x39_B_AK","hlc_muzzle_545SUP_AK","hlc_VOG25_AK"],
	["hlc_rifle_akmgl","hlc_30Rnd_762x39_b_ak","hlc_muzzle_762SUP_AK","hlc_VOG25_AK"]
];

CEN_RAND_WEAP_AR_OPF_F = [
	["hlc_rifle_rpk","hlc_45Rnd_762x39_m_rpk",""]
];

CEN_RAND_WEAP_RIFLE_OPF_F = [
	["hlc_rifle_ak74","hlc_30Rnd_545x39_B_AK","hlc_muzzle_545SUP_AK"],
	["hlc_rifle_ak47","hlc_30Rnd_762x39_b_ak","hlc_muzzle_762SUP_AK"],
	["hlc_rifle_akm","hlc_30Rnd_762x39_b_ak","hlc_muzzle_762SUP_AK"],
	["hlc_rifle_aks74","hlc_30Rnd_545x39_B_AK","hlc_muzzle_545SUP_AK"],
	["hlc_rifle_aks74u","hlc_30Rnd_545x39_B_AK","hlc_muzzle_545SUP_AK"],
	["hlc_rifle_aek971","hlc_30Rnd_545x39_B_AK","hlc_muzzle_545SUP_AK"]
];

CEN_RAND_WEAP_RECON_OPF_F = [
	["hlc_rifle_ak74","hlc_30Rnd_545x39_B_AK","hlc_muzzle_545SUP_AK"],
	["hlc_rifle_ak47","hlc_30Rnd_762x39_b_ak","hlc_muzzle_762SUP_AK"],
	["hlc_rifle_akm","hlc_30Rnd_762x39_b_ak","hlc_muzzle_762SUP_AK"],
	["hlc_rifle_aks74","hlc_30Rnd_545x39_B_AK","hlc_muzzle_545SUP_AK"],
	["hlc_rifle_aks74u","hlc_30Rnd_545x39_B_AK","hlc_muzzle_545SUP_AK"],
	["hlc_rifle_aek971","hlc_30Rnd_545x39_B_AK","hlc_muzzle_545SUP_AK"]
];

CEN_RAND_WEAP_AT_OPF_F = [
	["launch_B_Titan_short_F","Titan_AT","Titan_AP"],
	["launch_O_Titan_short_F","Titan_AT","Titan_AP"],
	["launch_I_Titan_short_F","Titan_AT","Titan_AP"]
];

CEN_RAND_WEAP_LAT_OPF_F = [
	["launch_RPG32_F","RPG32_F"]
];

CEN_RAND_WEAP_AA_OPF_F = [
	["launch_B_Titan_F","Titan_AA"],
	["launch_O_Titan_F","Titan_AA"],
	["launch_I_Titan_F","Titan_AA"]
];

CEN_RAND_WEAP_MM_OPF_F = [
	["hlc_rifle_ak74","hlc_30Rnd_545x39_B_AK","hlc_muzzle_545SUP_AK"],
	["hlc_rifle_ak47","hlc_30Rnd_762x39_b_ak","hlc_muzzle_762SUP_AK"],
	["hlc_rifle_akm","hlc_30Rnd_762x39_b_ak","hlc_muzzle_762SUP_AK"],
	["hlc_rifle_aks74","hlc_30Rnd_545x39_B_AK","hlc_muzzle_545SUP_AK"],
	["hlc_rifle_aek971","hlc_30Rnd_545x39_B_AK","hlc_muzzle_545SUP_AK"]
];

CEN_RAND_WEAP_SNIP_OPF_F = [
	["srifle_GM6_camo_F","5Rnd_127x108_Mag",""],
	["srifle_GM6_F","5Rnd_127x108_Mag",""],
	["srifle_LRR_camo_F","7Rnd_408_Mag",""],
	["srifle_LRR_F","7Rnd_408_Mag",""]
];

CEN_RAND_WEAP_PILOT_OPF_F = [
	["hlc_rifle_aks74u","hlc_30Rnd_545x39_B_AK","hlc_muzzle_545SUP_AK"]
];

CEN_RAND_OPTIC_LEAD_OPF_F = [
	""
];

CEN_RAND_OPTIC_COM_OPF_F = [
	""
];

CEN_RAND_OPTIC_AR_OPF_F = [
	""
];

/*CEN_RAND_OPTIC_MM_OPF_F = [
	"HLC_Optic_1p29",
	"HLC_Optic_PSO1"
];*/

CEN_RAND_OPTIC_MM_OPF_F = [
	"rhs_acc_1p29",
	"rhs_acc_pso1m2"
];

CEN_RAND_OPTIC_SNIP_OPF_F = [
	"optic_LRPS",
	"optic_SOS"
];

CEN_RAND_BASICS_OPF_F = [
	"FirstAidKit", // FAKs
	"SmokeShell", // Smoke type
	"HandGrenade", // Grenade type
	"Chemlight_red" // Chemlight type
];

CEN_RAND_PACKS_OPF_F = [ // Ammobearer packs
	"B_FieldPack_cbr",
	"B_FieldPack_oli",
	"B_FieldPack_khk",
	"B_FieldPack_ocamo"
];

CEN_RAND_PACKS_SPEC_OPF_F = [ // Special Packs
	"B_FieldPack_oli"
];

CEN_RAND_PACKS_AMMO_OPF_F = [
	"B_Carryall_cbr",
	"B_Carryall_ocamo",
	"B_Carryall_khk",
	"B_Carryall_oli",
	"B_Carryall_oucamo",
	"B_Carryall_mcamo"
];

CEN_RAND_GOG_OFF_OPF_F = [ // officer goggles randomisation for non geurilla factions
	"G_Aviator",
	"G_Bandanna_aviator"
];

CEN_RAND_GOG_OPF_F = [ // common goggles randomisation for non geurilla factions
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
CEN_BINOCS_OPF_F = "Binocular";