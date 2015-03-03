CEN_RAND_GUER_BLU_G_F = true;

switch (worldName) do {
	case "Takistan";
	case "Zargabad";
	case "Desert";
	case "Shapur";
	case "Mountains_ACR";
	case "VR": {
		/*CEN_RAND_TEXUNI_BLU_G_F = [];*/
		//CEN_RAND_TEXTURE_BLU_G_F = "a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa";
		//CEN_RAND_TEXOFFICER_BLU_G_F = a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa";
	};
	case "Chernarus";
	case "Chernarus_Summer";
	case "Thirsk";
	case "Woodland_ACR": {
		/*CEN_RAND_TEXUNI_BLU_G_F = [];*/
		//CEN_RAND_TEXTURE_BLU_G_F = "a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa";
		//CEN_RAND_TEXOFFICER_BLU_G_F = "a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa";
	};
	default {
		/*CEN_RAND_TEXUNI_BLU_G_F = [];*/
		//CEN_RAND_TEXTURE_BLU_G_F = "a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa";
		//CEN_RAND_TEXOFFICER_BLU_G_F = "a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa";
	};
};

CEN_RAND_HEADS_BLU_G_F = [
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

CEN_RAND_VOICES_BLU_G_F = [
	"Male01ENGB",
	"Male02ENGB",
	"Male03ENGB",
	"Male04ENGB",
	"Male05ENGB",
	"Male01GRE",
	"Male02GRE",
	"Male03GRE",
	"Male04GRE",
	"Male05GRE",
	"Male06GRE"
];

CEN_RAND_UNIFORMS_BLU_G_F = [
	"U_BG_leader",
	"U_BG_Guerilla1_1",
	"U_BG_Guerilla2_1",
	"U_BG_Guerilla2_2",
	"U_BG_Guerilla2_3",
	"U_BG_Guerilla3_1",
	"U_BG_Guerrilla_6_1"
];

CEN_RAND_UNIFORMS_PILOT_BLU_G_F = [
	"U_C_WorkerCoveralls"
];

CEN_RAND_UNIFORMS_HELIPILOT_BLU_G_F = [
	"U_C_WorkerCoveralls"
];

CEN_RAND_UNIFORMS_OFFICER_BLU_G_F = [
	"U_BG_leader"
];

CEN_RAND_HELMS_OFFICER_BLU_G_F = [
	"H_Beret_blk"
];

CEN_RAND_HELMS_CREW_BLU_G_F = [
	"H_HelmetB_snakeskin",
	"H_HelmetIA",
	"H_HelmetCrew_I"
];

CEN_RAND_HELMS_HELICREW_BLU_G_F = [
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

CEN_RAND_HELMS_PILOT_BLU_G_F = [
	"H_PilotHelmetFighter_B",
	"H_PilotHelmetFighter_O",
	"H_PilotHelmetFighter_I"
];

CEN_RAND_HELMS_HELIPILOT_BLU_G_F = [
	"H_PilotHelmetHeli_B",
	"H_PilotHelmetHeli_O",
	"H_PilotHelmetHeli_I",
	"H_HelmetCrew_I"
];

// For rifles arrays should be aranged as follows:
// [Weapon, default ammo, silencer (if available), GL ammo (if GL)]
// if silencer is not available should still include empty string ""

CEN_RAND_WEAP_GL_BLU_G_F = [
	["hlc_rifle_osw_GL","hlc_20rnd_762x51_b_fal","hlc_muzzle_snds_fal","hlc_VOG25_AK"]
];

CEN_RAND_WEAP_RECGL_BLU_G_F = [
	["hlc_rifle_osw_GL","hlc_20rnd_762x51_b_fal","hlc_muzzle_snds_fal","hlc_VOG25_AK"]
];

CEN_RAND_WEAP_AR_BLU_G_F = [
	["hlc_lmg_m60","hlc_100Rnd_762x51_B_M60E4",""]
];

CEN_RAND_WEAP_RIFLE_BLU_G_F = [
	["hlc_rifle_falosw","hlc_20rnd_762x51_b_fal","hlc_muzzle_snds_fal"]
];

CEN_RAND_WEAP_RECON_BLU_G_F = [
	["hlc_rifle_falosw","hlc_20rnd_762x51_b_fal","hlc_muzzle_snds_fal"]
];

CEN_RAND_WEAP_AT_BLU_G_F = [
	["launch_B_Titan_short_F","Titan_AT","Titan_AP"],
	["launch_O_Titan_short_F","Titan_AT","Titan_AP"],
	["launch_I_Titan_short_F","Titan_AT","Titan_AP"]
];

CEN_RAND_WEAP_LAT_BLU_G_F = [
	["launch_NLAW_F","NLAW_F"]
];

CEN_RAND_WEAP_AA_BLU_G_F = [
	["launch_B_Titan_F","Titan_AA"],
	["launch_O_Titan_F","Titan_AA"],
	["launch_I_Titan_F","Titan_AA"]
];

CEN_RAND_WEAP_MM_BLU_G_F = [
	["hlc_rifle_m14dmr","hlc_20Rnd_762x51_B_M14","hlc_muzzle_snds_M14"]
];

CEN_RAND_WEAP_SNIP_BLU_G_F = [
	["srifle_GM6_camo_F","5Rnd_127x108_Mag",""],
	["srifle_GM6_F","5Rnd_127x108_Mag",""],
	["srifle_LRR_camo_F","7Rnd_408_Mag",""],
	["srifle_LRR_F","7Rnd_408_Mag",""]
];

CEN_RAND_WEAP_PILOT_BLU_G_F = [
	["hlc_rifle_hk51","hlc_20rnd_762x51_b_G3","hlc_muzzle_snds_g3"]
];

CEN_RAND_OPTIC_LEAD_BLU_G_F = [
	""
];

CEN_RAND_OPTIC_COM_BLU_G_F = [
	""
];

CEN_RAND_OPTIC_AR_BLU_G_F = [
	""
];

CEN_RAND_OPTIC_MM_BLU_G_F = [
	"hlc_optic_LRT_m14"
];

CEN_RAND_OPTIC_SNIP_BLU_G_F = [
	"optic_LRPS",
	"optic_SOS"
];

CEN_RAND_BASICS_BLU_G_F = [
	"FirstAidKit", // FAKs
	"SmokeShellYellow", // Smoke type
	"HandGrenade", // Grenade type
	"Chemlight_blue" // Chemlight type
];

CEN_RAND_PACKS_BLU_G_F = [
	"B_FieldPack_cbr",
	"B_FieldPack_oli",
	"B_FieldPack_khk",
	"B_FieldPack_ocamo"
];

CEN_RAND_PACKS_SPEC_BLU_G_F = [ // Special Packs
	"B_FieldPack_oli"
];

CEN_RAND_PACKS_AMMO_BLU_G_F = [ // Ammobearer packs
	"B_Carryall_cbr",
	"B_Carryall_ocamo",
	"B_Carryall_khk",
	"B_Carryall_oli",
	"B_Carryall_oucamo",
	"B_Carryall_mcamo"
];

CEN_RAND_GOG_OFF_BLU_G_F = [ // officer goggles randomisation for non geurilla factions
	"G_Aviator",
	"G_Bandanna_aviator"
];

CEN_RAND_GOG_BLU_G_F = [ // common goggles randomisation for non geurilla factions
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
CEN_BINOCS_BLU_G_F = "Binocular";