CEN_RAND_GUER_IND_F = false;

switch (worldName) do {
	case "Takistan";
	case "Zargabad";
	case "Desert";
	case "Shapur";
	case "Mountains_ACR": {
		/*CEN_RAND_TEXUNI_IND_F = [
			"U_I_CombatUniform",
			"U_I_CombatUniform_shortsleeve"
		];*/
		//CEN_RAND_TEXTURE_IND_F = "SOS\Textures\dane.paa";
		//CEN_RAND_TEXOFFICER_IND_F = "SOS\Textures\daneOfficer.paa";
	};
	case "Chernarus";
	case "Chernarus_Summer";
	case "Thirsk";
	case "Woodland_ACR": {
		/*CEN_RAND_TEXUNI_IND_F = [
			"U_I_CombatUniform",
			"U_I_CombatUniform_shortsleeve"
		];*/
		//CEN_RAND_TEXTURE_IND_F = "SOS\Textures\dane.paa";
		//CEN_RAND_TEXOFFICER_IND_F = "SOS\Textures\daneOfficer.paa";
	};
	case "Bornholm";
	case "VR": {
		/*CEN_RAND_TEXUNI_IND_F = [
			"U_I_CombatUniform",
			"U_I_CombatUniform_tshirt",
			"U_I_CombatUniform_shortsleeve"
		];
		CEN_RAND_TEXTURE_IND_F = "SOS\Textures\UniformM.paa";*/
		//CEN_RAND_TEXOFFICER_IND_F = "SOS\Textures\daneOfficer.paa";
	};
	default {
		/*CEN_RAND_TEXUNI_IND_F = [
			"U_I_CombatUniform",
			"U_I_CombatUniform_shortsleeve"
		];*/
		//CEN_RAND_TEXTURE_IND_F = "SOS\Textures\dane.paa";
		//CEN_RAND_TEXOFFICER_IND_F = "SOS\Textures\daneOfficer.paa";
	};
};

CEN_RAND_HEADS_IND_F = [
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

CEN_RAND_VOICES_IND_F = [
	"Male01GRE",
	"Male02GRE",
	"Male03GRE",
	"Male04GRE",
	"Male05GRE",
	"Male06GRE"
];

CEN_RAND_UNIFORMS_IND_F = [
	"U_I_CombatUniform",
	"U_I_CombatUniform_shortsleeve"
];

CEN_RAND_UNIFORMS_PILOT_IND_F = [
	"U_I_HeliPilotCoveralls"
];

CEN_RAND_UNIFORMS_HELIPILOT_IND_F = [
	"U_I_pilotCoveralls"
];

CEN_RAND_UNIFORMS_OFFICER_IND_F = [
	"U_I_OfficerUniform"
];

CEN_RAND_HELMS_OFFICER_IND_F = [
	"H_Beret_blk"
];

CEN_RAND_HELMS_CREW_IND_F = [
	"H_HelmetCrew_I"
];

CEN_RAND_HELMS_HELICREW_IND_F = [
	"H_CrewHelmetHeli_I"
];

CEN_RAND_HELMS_PILOT_IND_F = [
	"H_PilotHelmetFighter_I"
];

CEN_RAND_HELMS_HELIPILOT_IND_F = [
	"H_PilotHelmetHeli_I"
];

// For rifles arrays should be aranged as follows:
// [Weapon, default ammo, silencer (if available), GL ammo (if GL)]
// if silencer is not available should still include empty string ""

CEN_RAND_WEAP_GL_IND_F = [
	["HLC_Rifle_g3ka4_GL","hlc_20rnd_762x51_b_G3","hlc_muzzle_snds_g3","1Rnd_HE_Grenade_shell"]
];

CEN_RAND_WEAP_RECGL_IND_F = [
	["HLC_Rifle_g3ka4_GL","hlc_20rnd_762x51_b_G3","hlc_muzzle_snds_g3","1Rnd_HE_Grenade_shell"]
];

CEN_RAND_WEAP_AR_IND_F = [
	["hlc_lmg_m60","hlc_100Rnd_762x51_B_M60E4",""]
];

CEN_RAND_WEAP_RIFLE_IND_F = [
	["hlc_rifle_g3sg1","hlc_20rnd_762x51_b_G3","hlc_muzzle_snds_g3"]
];

CEN_RAND_WEAP_RECON_IND_F = [
	["hlc_rifle_hk53","hlc_30rnd_556x45_b_HK33","hlc_muzzle_snds_HK33"]
];

CEN_RAND_WEAP_AT_IND_F = [
	["launch_I_Titan_short_F","Titan_AT","Titan_AP"]
];

CEN_RAND_WEAP_LAT_IND_F = [
	["launch_NLAW_F","NLAW_F"]
];

CEN_RAND_WEAP_AA_IND_F = [
	["launch_I_Titan_F","Titan_AA"]
];

CEN_RAND_WEAP_MM_IND_F = [
	["hlc_rifle_g3sg1","hlc_20rnd_762x51_b_G3","hlc_muzzle_snds_g3"]
];

CEN_RAND_WEAP_SNIP_IND_F = [
	["hlc_rifle_psg1","hlc_20rnd_762x51_b_G3",""]
];

CEN_RAND_WEAP_PILOT_IND_F = [
	["hlc_rifle_hk53","hlc_30rnd_556x45_b_HK33","hlc_muzzle_snds_HK33"]
];

CEN_RAND_OPTIC_LEAD_IND_F = [
	""
];

CEN_RAND_OPTIC_COM_IND_F = [
	""
];

CEN_RAND_OPTIC_AR_IND_F = [
	""
];

CEN_RAND_OPTIC_MM_IND_F = [
	"hlc_optic_accupoint_g3"
];

CEN_RAND_OPTIC_SNIP_IND_F = [
	""
];

CEN_RAND_BASICS_IND_F = [
	"FirstAidKit", // FAKs
	"SmokeShellGreen", // Smoke type
	"HandGrenade", // Grenade type
	"Chemlight_yellow" // Chemlight type
];

CEN_RAND_PACKS_IND_F = [ // Common packs
	"B_FieldPack_oli"
];

CEN_RAND_PACKS_SPEC_IND_F = [ // Special Packs
	"B_AssaultPack_dgtl",
	"B_AssaultPack_blk"
];

CEN_RAND_PACKS_AMMO_IND_F = [ // Ammobearer packs
	"B_Carryall_oli"
];

CEN_RAND_GOG_OFF_IND_F = [ // officer goggles randomisation for non geurilla factions
	"G_Aviator",
	"G_Bandanna_aviator"
];

CEN_RAND_GOG_IND_F = [ // common goggles randomisation for non geurilla factions
	"G_Bandanna_blk",
	"G_Bandanna_oli",
	"G_Bandanna_beast",
	"G_Bandanna_shades",
	"G_Balaclava_blk",
	"G_Balaclava_lowprofile",
	"G_Balaclava_oli"
];

// not randomised just change to whatever binocular type equipment you want SLs, TLs and Spotters to have
CEN_BINOCS_IND_F = "Binocular";