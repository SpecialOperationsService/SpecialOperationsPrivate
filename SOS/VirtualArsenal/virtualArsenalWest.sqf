/*
	The script contains public variables which define the available
	backpacks, weapons, magazines and items for all possible NATO roles.

	Created by Lux0r
*/


// Arrays for convenience:

_VA_Uniforms = [
	"U_B_CombatUniform_mcam",			// Combat Fatigues (MTP)
	"U_B_CombatUniform_mcam_vest",		// Recon Fatigues (MTP)
	"U_B_CombatUniform_mcam_tshirt",	// Combat Fatigues (MTP) (Tee)	
	"U_B_CombatUniform_mcam_worn",		// Worn Combat Fatigues (MTP)
	"U_B_CombatUniform_wdl",			// Combat Fatigues (MTP)
	"U_B_CombatUniform_wdl_tshirt",		// Combat Fatigues (MTP) (Tee)	
	"U_B_CombatUniform_wdl_vest",		// Recon Fatigues (MTP)
	"U_B_CombatUniform_sgg",			// Combat Fatigues (MTP)
	"U_B_CombatUniform_sgg_tshirt",		// ombat Fatigues (MTP) (Tee)
	"U_B_CombatUniform_sgg_vest",		// Recon Fatigues (MTP)
	"U_BG_Guerrilla_6_1"				// Guerrilla
	//"U_B_SpecopsUniform_sgg"			// Specop Fatigues (Sage)
];

_VA_Ghillie = [
	"U_B_GhillieSuit",					// Ghillie Suit [NATO]	
	"U_O_GhillieSuit",					// Ghillie Suit [CSAT]
	"U_I_GhillieSuit"					// Ghillie Suit [AAF]	
];

_VA_Guerilla = [
	"U_BG_Guerilla1_1",					// Guerilla Smocks
	"U_BG_Guerilla2_1",		       		// Guerilla Smocks
	"U_BG_Guerilla2_2",					// Guerilla Smocks	
	"U_BG_Guerilla2_3",					// Guerilla Smocks
	"U_BG_Guerilla3_1",					// Guerilla Smocks
	"U_BG_Guerilla3_2",					// Guerilla Smocks	
	"U_BG_leader"						// Guerilla Smocks
];
	
_VA_Helmets = [
	"H_HelmetB",						// ECH
	"H_HelmetB_camo",					// ECH (Camo)
	"H_HelmetB_paint",					// ECH (Spraypaint)
	"H_HelmetB_light",					// ECH (Light)
	"H_HelmetB_grass",					// ECH (Grass)
	"H_HelmetB_snakeskin",				// ECH (Snakeskin)
	"H_HelmetB_desert",					// ECH (Desert)
	"H_HelmetB_black",					// ECH (Black)
	"H_HelmetB_sand",					// ECH (Sand)
	"H_HelmetSpecB_paint1",				// SF Helmet (Light paint)
	"H_HelmetSpecB_paint2",				// SF Helmet (Dark paint)
	"H_HelmetSpecB_blk",				// SF Helmet (Black)
	"H_HelmetB_light_grass",			// ECH (Light, Grass)
	"H_HelmetB_light_snakeskin",		// ECH (Light, Snakeskin)
	"H_HelmetB_light_desert",			// ECH (Light, Desert)
	"H_HelmetB_light_black",			// ECH (Light, Black)
	"H_HelmetB_light_sand"				// ECH (Light, Sand)
];

_VA_Shemags = [
	"H_Shemag_khk",						// Shemag mask (Khaki)
	"H_Shemag_tan",						// Shemag mask (Tan)
	"H_Shemag_olive",					// Shemag (Olive)
	"H_Shemag_olive_hs",				// Shemag (Olive, Headset)
	"H_ShemagOpen_khk",					// Shemag (Khaki)
	"H_ShemagOpen_tan"    				// Shemag (Tan)
];

_VA_Berets = [
	"H_Beret_blk",						// Beret (Black)
	"H_Beret_02",						// Beret [NATO]
	"H_Beret_Colonel"					// Beret [NATO] (Colonel)
];

_VA_AssaultBackpacks = [
	"B_AssaultPackG",					
	"B_AssaultPack_khk",				// Assault Pack (Khaki)
	"B_AssaultPack_dgtl",				// Assault Pack (Digi)
	"B_AssaultPack_rgr",				// Assault Pack (Green)
	//"B_AssaultPack_sgg",				// Assault Pack (Sage)
	"B_AssaultPack_blk",				// Assault Pack (Black)
	"B_AssaultPack_cbr",				// Assault Pack (Coyote)
	"B_AssaultPack_mcamo",				// Assault Pack (MTP)
	"B_AssaultPack_ocamo"				// Assault Pack (Hex)
];

_VA_CarryallBackpacks = [
	"B_Carryall_ocamo",					// Carryall Backpack (Hex)
	"B_Carryall_oucamo",				// Carryall Backpack (Urban)
	"B_Carryall_mcamo",					// Carryall Backpack (MTP)
	"B_Carryall_oli",					// Carryall Backpack (Olive)
	"B_Carryall_khk",					// Carryall Backpack (Khaki)
	"B_Carryall_cbr"					// Carryall Backpack (Coyote)
];

_VA_Kitbags = [
	"B_Kitbag_rgr",						// Kitbag (Green)
	"B_Kitbag_mcamo",					// Kitbag (MTP)
	//"B_Kitbag_sgg",					// Kitbag (Sage)
	"B_Kitbag_cbr"						// Kitbag (Coyote)
];

_VA_Longrange = [
	"tf_rt1523g",
	"tf_rt1523g_big"
];

_VA_Statics = [
	"B_Mortar_01_support_F",			// Folded Mk6 Mortar Bipod
	"B_Mortar_01_weapon_F",				// Folded Mk6 Mortar Tube
	"B_HMG_01_support_F",				// Folded Tripod
	"B_HMG_01_support_high_F",			// Folded Tripod Raised
	"B_HMG_01_weapon_F",				// Dismantled Mk30 HMG
	"B_GMG_01_weapon_F",				// Dismantled Mk32 GMG
	"B_HMG_01_high_weapon_F",			// Dismantled Mk30 HMG (Raised)
	"B_GMG_01_high_weapon_F",			// Dismantled Mk32 GMG (Raised)
	"B_AA_01_weapon_F",					// Static Titan Launcher (AA)
	"B_AT_01_weapon_F"					// Static Titan Launcher (AT)
];

_VA_Scopes = [
	"optic_MRD",						// MRD					
	"optic_Aco",						// ACO (Red)
	"optic_ACO_grn",					// ACO (Green)
	"optic_Holosight",					// MK17 Holosight		
	"optic_MRCO",						// MRCO					
	"optic_Hamr",						// RCO					
	"optic_Arco",						// ARCO	
	"hlc_optic_suit",					// FAL Suit
	"hlc_optic_PVS4FAL",                // FAL NVS
	"hlc_optic_kobra,",					// Kobra Collimator Sight
	"HLC_Optic_PSO1",
	"hlc_optic_accupoint_g3",
	"rhsusf_acc_HAMR",
    "rhsusf_acc_eotech_552",
	"rhsusf_acc_EOTECH",
	"rhsusf_acc_ELCAN",
	"rhsusf_acc_ACOG",
	"rhsusf_acc_ACOG2",
	"rhsusf_acc_ACOG3",
	"rhsusf_acc_compm4",
	"rhs_acc_1p29",
	"rhs_acc_pgo7v",
	"rhs_acc_pkas",
	"rhs_acc_pso1m2"
];

_VA_Scopes_SMG = [
	"optic_Aco_smg",										
	"optic_ACO_grn_smg",					
	"optic_Holosight_smg"					
];	

_VA_Scopes_Marksman = [
	"optic_DMS",						
	"optic_NVS",
	"optic_LRPS",
	"optic_SOS",
	"hlc_optic_LRT_m14",
	"hlc_optic_artel_m14",
	"rhsusf_acc_LEUPOLDMK4_2",
	"rhsusf_acc_LEUPOLDMK4",
	"hlc_optic_artel_m14"							
];

_VA_4five = [
	"hgun_Pistol_heavy_01_F"			// 4-five .45
];

_VA_TAR21 = [
    "arifle_TRG21_F"
];

_VA_HLC_MP5 = [
	"hlc_smg_mp5k_PDW",	
	"hlc_smg_mp5n"
];

_VA_HLC_AR15 = [
	"hlc_rifle_bcmjack",				// 'Jack" Carbine
	"hlc_rifle_Bushmaster300",			// Busmaster .300 Carbine
	"hlc_rifle_vendimus",				// AR15 .300 Dissipator
	"hlc_rifle_samr2",
	"hlc_rifle_m4",
	"hlc_rifle_cqbr"
];

_VA_RHS_M4 = [
	"rhs_weap_m4_grip",
	"rhs_weap_m4a1_grip"
];

_VA_RHS_M16 = [
	"rhs_weap_m16a4",
	"rhs_weap_m16a4_grip",
	"rhs_weap_m16a4_carryhandle"
];

_VA_HLC_FAL = [
	"hlc_rifle_falosw",
	"hlc_rifle_FAL5061"					
];

_VA_HLC_AK = [
	"hlc_rifle_ak12",
	"hlc_rifle_saiga12k",	
    "hlc_rifle_aku12"
];

_VA_HLC_G3 = [		 
	"hlc_rifle_g3ka4"		 
];

_VA_Weap_GL = [
	"hlc_rifle_Colt727_GL",
	"hlc_rifle_osw_GL",
	"hlc_rifle_akmgl",
	"hlc_rifle_aks74_GL",
	"HLC_Rifle_g3ka4_GL",
	"hlc_smg_mp5n",
	"hlc_smg_9mmar",	
	"rhs_weap_M320",
	"arifle_TRG21_GL_F",	
	"hlc_rifle_ak12gl",
	"rhs_m4a1_m320",	
	"hlc_rifle_m4m203"

];

_VA_Weap_MG = [
	"hlc_rifle_rpk12",
	"rhs_weap_m249_pip",	
	"rhs_weap_m240B",	
	"hlc_rifle_rpk",
	"hlc_lmg_M60E4",
	"hlc_lmg_m60",
	"LMG_Zafir_F",
	"rhs_weap_pkp"					
];

_VA_Weap_MM = [
	"hlc_rifle_psg1",						
	"hlc_rifle_M14",					
	"hlc_rifle_M21",		
	"hlc_rifle_M14DMR",
	"hlc_rifle_m14sopmod",
	"rhs_weap_mk14",
	"srifle_GM6_F",
	"srifle_GM6_SOS_F",
	"srifle_LRR_F",
	"hs_weap_XM2010",
	"rhs_weap_XM2010_wd",
	"rhs_weap_XM2010_d",
	"rhs_weap_XM2010_sa",	
	"srifle_LRR_SOS_F"				
];

_VA_AT = [
	"rhs_weap_M136",
	"rhs_weap_fim92",
	"rhs_weap_fgm148",
	"rhs_weap_rpg26"
];

_VA_Titan = [	
	"launch_B_Titan_short_F",
	"launch_B_Titan_F"
];

_VA_Mines = [
	"rhs_mine_pmn2_mag",
    "rhs_mine_tm62m_mag",
    "rhs_mine_M19_mag",
	"ATMine_Range_mag",
	"APERSMine_Range_mag",
	"APERSBoundingMine_Range_mag",
	"SLAMDirectionalMine_Wire_mag",
	"APERSTripMine_Wire_mag",
	"ClaymoreDirectionalMine_Remote_mag",
	"SatchelCharge_Remote_mag",
	"DemoCharge_Remote_mag"	
];

_VA_Engi = [
	"ToolKit",							// Tool Kit
	"MineDetector"   					// Mine Detector
];

// Define basic weapons, magazines and items available to (almost) all roles.
_VA_Basic_Weapons = [
	"Binocular",						// Binoculars
	//"Rangefinder",				     	// Rangefinder
	"hgun_P07_F",						// P07 9 mm
	"hgun_ACPC2_F"						// P07 9 mm
];
_VA_Basic_Magazines = [
	// Ammo
	"9Rnd_45ACP_Mag",
	"150Rnd_762x51_Box",
	"150Rnd_762x51_Box_Tracer",
	"11Rnd_45ACP_Mag",
	"hlc_30rnd_556x45_EPR",			
	"hlc_30rnd_556x45_SOST",	
	"hlc_30rnd_556x45_SPR",					
	"29rnd_300BLK_STANAG",
	"29rnd_300BLK_STANAG_T",
	"29rnd_300BLK_STANAG_S",	
	"hlc_20Rnd_762x51_B_fal",					
	"hlc_20Rnd_762x51_t_fal",
	"hlc_20Rnd_762x51_S_fal",
	"hlc_50rnd_762x51_M_FAL",
	"hlc_30Rnd_545x39_B_AK",	
	"hlc_30Rnd_545x39_T_AK",	 
	"hlc_30Rnd_545x39_EP_AK",	
	"hlc_45Rnd_545x39_t_rpk",	 
	"hlc_30Rnd_762x39_b_ak",	 
	"hlc_30Rnd_762x39_t_ak",	 
	"hlc_45Rnd_762x39_t_rpk",	 
	"hlc_45Rnd_762x39_m_rpk",	 
	"hlc_75rnd_762x39_m_rpk",	
	"hlc_10rnd_12g_buck_S12",	
	"hlc_10rnd_12g_slug_S12",
	"hlc_20Rnd_762x51_B_G3",	 
	"hlc_20rnd_762x51_T_G3",	 
	"hlc_50rnd_762x51_M_G3",
	"hlc_30Rnd_9x19_B_MP5",	
	"hlc_30Rnd_9x19_GD_MP5",	
	"hlc_30Rnd_9x19_SD_MP5", 
	"hlc_30Rnd_10mm_B_MP5",	
	"hlc_30Rnd_10mm_JHP_MP5", 	 
	"hlc_100Rnd_762x51_B_M60E4",	 
	"hlc_100Rnd_762x51_T_M60E4",	
	"hlc_100Rnd_762x51_M_M60E4",
	"hlc_20Rnd_762x51_B_M14",	 
	"hlc_20rnd_762x51_T_M14",	 
	"hlc_50rnd_762x51_M_M14",
	"rhs_mag_30Rnd_556x45_Mk318_Stanag",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow",
	"rhsusf_100Rnd_556x45_soft_pouch",
	"rhsusf_100Rnd_762x51",
	"rhsusf_5Rnd_300winmag_xm2010",
	"20Rnd_762x51_Mag",
	"rhs_100Rnd_762x54mmR",
	"rhs_100Rnd_762x54mmR_green",
	"5Rnd_127x108_Mag",
	"5Rnd_127x108_APDS_Mag",
	"7Rnd_408_Mag",

	// Rockets
	"NLAW_F",							// PCML Missile
	"rhs_m136_mag",
	"rhs_fgm148_magazine_AT",
	"rhs_fim92_mag",
	"rhs_weap_rpg26",
	"Titan_AA",
	"Titan_AT",
	"Titan_AP",

	// Throw Items
	"HandGrenade",						// RGO Frag Grenade
	"MiniGrenade",						// Mini Grenade
	"SUPER_flash",
	"SmokeShellRed",					// Smoke Grenade (Red)
	"SmokeShellGreen",					// Smoke Grenade (Green)
	"SmokeShellYellow",					// Smoke Grenade (Yellow)
	"SmokeShellPurple",					// Smoke Grenade (Purple)
	"SmokeShellBlue",					// Smoke Grenade (Blue)
	"SmokeShellOrange",					// Smoke Grenade (Orange)
	"B_IR_Grenade",						// IR Grenade [NATO]
	"Chemlight_red",					// Chemlight (Red)
	"Chemlight_green",					// Chemlight (Green)
	"Chemlight_yellow",					// Chemlight (Yellow)
	"Chemlight_blue",					// Chemlight (Blue)

	// Grenade Launcher HE
	"1Rnd_HE_Grenade_shell",			// 40mm HE Grenade Round
	"hlc_VOG25_AK",						// HE Round for the GP25 and GP30
	"rhs_mag_M433_HEDP",
	"3Rnd_HE_Grenade_shell",
    "1Rnd_HE_Grenade_shell",
    "3Rnd_UGL_FlareWhite_F",
    "3Rnd_UGL_FlareGreen_F",
    "3Rnd_UGL_FlareRed_F",
    "3Rnd_UGL_FlareYellow_F",
    "3Rnd_UGL_FlareCIR_F",
	"UGL_FlareWhite_F",
    "UGL_FlareGreen_F",
    "UGL_FlareRed_F",
    "UGL_FlareYellow_F",
    "UGL_FlareCIR_F",
    "1Rnd_Smoke_Grenade_shell",
    "1Rnd_SmokeRed_Grenade_shell",
    "1Rnd_SmokeGreen_Grenade_shell",
    "1Rnd_SmokeYellow_Grenade_shell",
    "1Rnd_SmokePurple_Grenade_shell",
    "1Rnd_SmokeBlue_Grenade_shell",
    "1Rnd_SmokeOrange_Grenade_shell",
    "3Rnd_Smoke_Grenade_shell",
    "3Rnd_SmokeRed_Grenade_shell",
    "3Rnd_SmokeGreen_Grenade_shell",
    "3Rnd_SmokeYellow_Grenade_shell",
    "3Rnd_SmokePurple_Grenade_shell",
    "3Rnd_SmokeBlue_Grenade_shell",
    "3Rnd_SmokeOrange_Grenade_shell",

	// Grenade Launcher Smoke
	"hlc_GRD_White",					// GP25 and GP30
	"hlc_GRD_red",						// GP25 and GP30
	"hlc_GRD_green",					// GP25 and GP30
	"hlc_GRD_blue",						// GP25 and GP30
	"hlc_GRD_orange",					// GP25 and GP30
	"hlc_GRD_purple",					// GP25 and GP30
	"rhs_mag_M713_red",
	"rhs_mag_M714_white",
	"rhs_mag_M715_green",
	"rhs_mag_M716_yellow",

	// Grenade Launcher Stun/Buck
	"rhs_mag_M4009",
	"rhs_mag_m576",

	// Grenade Launcher Flare
	"rhs_mag_M585_white",
	"rhs_mag_M661_green",
	"rhs_mag_M662_red"
];
_VA_Basic_Items = [
	// Items
	"ItemCompass",						// Compass
	//"ItemGPS",						// GPS
	"ItemMap",							// Map
	"ItemRadio",						// Radio
	"tf_anprc152",						// TFAR
	"ItemWatch",						// Watch
	"NVGoggles",						// NV Goggles (Brown)
	"NVGoggles_OPFOR",					// NV Goggles (Black)
	"NVGoggles_INDEP",					// NV Goggles (Green)
	"FirstAidKit",						// First Aid Kit
	"AGM_HandFlare_Green",
    "AGM_HandFlare_Red",
    "AGM_HandFlare_White",
    "AGM_HandFlare_Yellow",
	// Goggles
	"G_Diving",							// Diving Goggles
	"G_Shades_Black",					// Shades (Black)
	"G_Shades_Blue",					// Shades (Blue)
	"G_Sport_Blackred",					// Sport Shades (Vulcan)
	"G_Tactical_Clear",					// Tactical Glasses
	"G_Spectacles",						// Spectacle Glasses
	"G_Spectacles_Tinted",				// Tinted Spectacles
	"G_Combat",							// Combat Goggles
	"G_Lowprofile",						// Low Profile Goggles
	"G_Shades_Green",					// Shades (Green)
	"G_Shades_Red",						// Shades (Red)
	"G_Squares",						// Square Spectacles
	"G_Squares_Tinted",					// Square Shades
	"G_Sport_BlackWhite",				// Sport Shades (Shadow)	
	"G_Sport_Blackyellow",				// Sport Shades (Poison)	
	"G_Sport_Greenblack",				// Sport Shades (Yetti)	
	"G_Sport_Checkered",				// Sport Shades (Style)	
	"G_Sport_Red",						// Sport Shades (Fire)	
	"G_Tactical_Black",					// Tactical Shades
	"G_Aviator",						// Aviator Glasses
	"G_Lady_Mirror",					// Ladies Shades (Iridium)
	"G_Lady_Dark",						// Ladies Shades (Sea)
	"G_Lady_Red",						// Ladies Shades (Fire)
	"G_Lady_Blue",						// Ladies Shades (Ice)
	"G_Balaclava_blk",					// Balaclava
	"G_Balaclava_lowprofile",			// Balaclava
	"G_Balaclava_combat",				// Balaclava
	"G_Balaclava_oli",					// Balaclava
	"G_Bandanna_aviator",				// Bandanna
	"G_Bandanna_beast",					// Bandanna
	"G_Bandanna_tan",					// Bandanna
	"G_Bandanna_sport",					// Bandanna
	"G_Bandanna_blk",					// Bandanna
	"G_Bandanna_oli",					// Bandanna
	"G_Bandanna_shades",				// Bandanna

	// Muzzle Attachments
	"muzzle_snds_M",
	"muzzle_snds_H",
	"muzzle_snds_H_MG",
	
    //HLC Muzzles
	"hlc_rifle_honeybase",
	"hlc_muzzle_556NATO_KAC",			// Sound Suppressor AR-15
	"hlc_muzzle_300blk_KAC",			// Sound Suppressor Colt Carbine	
	"hlc_muzzle_snds_fal",				// FAL Suppressor
	"hlc_muzzle_545SUP_AK",	
	"hlc_muzzle_762SUP_AK",
	"hlc_muzzle_snds_HK33",
	"hlc_muzzle_snds_G3",
	"hlc_muzzle_Agendasix",
	"hlc_muzzle_Tundra",
	"hlc_muzzle_Agendasix10mm",
	"hlc_muzzle_snds_M14",

    //RHS Muzzles
	"rhsusf_acc_M2010S",                // Suppressor M2010S
	"rhsusf_acc_rotex5_grey",           // Suppressor rotex 5 (grey)
	"rhsusf_acc_rotex5_tan",            // Suppressor rotex 5 (tan)
	"rhsusf_acc_SFMB556",               // Surfire SFMB
	"rhsusf_acc_SF3P556",               // Surfire SF3P rotex 5

	// Rail Attachments
	"acc_pointer_IR",					// IR Laser Pointer
	"acc_flashlight",					// Flashlight
	"rhsusf_acc_anpeq15",               // AN/PEQ-15
	"rhsusf_acc_anpeq15A",              // AN/PEQ-15A
    "rhsusf_acc_anpeq15_light",         // AN/PEQ-15/M952V (Light)   
	
	// Vests
	"V_Rangemaster_belt",				// Rangemaster Belt							// Side(s): Blufor
	//"V_BandollierB_khk",				// Slash Bandolier (Khaki)					// Side(s): All
	//"V_BandollierB_cbr",				// Slash Bandolier (Coyote)					// Side(s): -
	//"V_BandollierB_rgr",				// Slash Bandolier (Green)					// Side(s): Blufor
	//"V_BandollierB_blk",				// Slash Bandolier (Black)					// Side(s): All
	//"V_BandollierB_oli",				// Slash Bandolier (Olive)					// Side(s): Independent
	"V_PlateCarrier1_rgr",				// Carrier Lite (Green)						// Side(s): Blufor
	"V_PlateCarrier2_rgr",				// Carrier Rig (Green)						// Side(s): Blufor
	"V_PlateCarrier3_rgr",				// Carrier Rig (Green)						// Side(s): -
	"V_PlateCarrierGL_rgr",				// Carrier GL Rig (Green)					// Side(s): Blufor
	"V_PlateCarrier1_blk",				// Carrier Lite (Black)						// Side(s): -
	"V_PlateCarrierSpec_rgr",			// Carrier Special Rig (Green)				// Side(s): Blufor
	"V_Chestrig_khk",					// Chest rig (Khaki)						// Side(s): Opfor
	"V_Chestrig_rgr",					// Chest rig (Green)						// Side(s): Blufor
	"V_Chestrig_blk",					// Fighter Chestrig (Black)					// Side(s): All
	"V_Chestrig_oli",					// Fighter Chestrig (Olive)					// Side(s): All
	"V_TacVest_khk",					// Tactical Vest (Khaki)					// Side(s): Opfor, Independent
	"V_TacVest_brn",					// Tactical Vest (Brown)					// Side(s): Opfor
	"V_TacVest_oli",					// Tactical Vest (Olive)					// Side(s): Independent
	"V_TacVest_blk",					// Tactical Vest (Black)					// Side(s): All
	"V_TacVest_camo",					// Tactical Vest (Camo)						// Side(s): -
	"V_TacVest_blk_POLICE",				// Tactical Vest (Police)					// Side(s): -
	"V_TacVestIR_blk",					// Raven Vest								// Side(s): -
	"V_TacVestCamo_khk",				// Camouflaged Vest							// Side(s): -
	"V_HarnessO_brn",					// LBV Harness								// Side(s): Opfor
	"V_HarnessOGL_brn",					// LBV Grenadier Harness					// Side(s): Opfor
	"V_HarnessO_gry",					// LBV Harness (Gray)						// Side(s): Opfor
	"V_HarnessOGL_gry",					// LBV Grenadier Harness (Gray)				// Side(s): Opfor
	"V_HarnessOSpec_brn",				// ELBV Harness								// Side(s): Opfor
	"V_HarnessOSpec_gry",				// ELBV Harness (Gray)						// Side(s): -
	"V_PlateCarrierIA1_dgtl",			// GA Carrier Lite (Digi)					// Side(s): Independent
	"V_PlateCarrierIA2_dgtl",			// GA Carrier Rig (Digi)					// Side(s): Independent
	"V_PlateCarrierIAGL_dgtl",			// GA Carrier GL Rig (Digi)					// Side(s): Independent
	"V_RebreatherB",					// Rebreather [NATO]						// Side(s): Blufor
	"V_RebreatherIR",					// Rebreather [CSAT]						// Side(s): Opfor
	"V_RebreatherIA",					// Rebreather [AAF]							// Side(s): Independent
	"V_PlateCarrier_Kerry",				// US Plate Carrier Rig (Kerry)				// Side(s): Blufor (Story)
	"V_PlateCarrierL_CTRG",				// CTRG Plate Carrier Rig Mk.1 (Light)		// Side(s): Blufor
	"V_PlateCarrierH_CTRG"				// CTRG Plate Carrier Rig Mk.2 (Heavy)		// Side(s): Blufor
	//"V_I_G_resistanceLeader_F"		// Tactical Vest (Stavrou)					// Side(s): Independent
	//"V_Press_F"						// Vest (Press)								// Side(s): -
];

_VA_AssaultRifles = _VA_HLC_AR15 + _VA_RHS_M4 + _VA_RHS_M16 + _VA_HLC_FAL + _VA_HLC_AK + _VA_HLC_G3 + _VA_TAR21;

// ----------------------------------------------------------------------------------------------------
// NATO default weapons. Requirement for "removeUnauthorizedGear.sqf".
VA_WeaponsWest = _VA_Basic_Weapons + _VA_HLC_MP5 + _VA_AssaultRifles + _VA_Weap_GL + _VA_Weap_MG + _VA_Weap_MM + _VA_AT + _VA_Titan + [
	"launch_NLAW_F",					// PCML
	"rhs_weap_M136",					// M136
	"Rangefinder"						// Rangefinder
];

// ----------------------------------------------------------------------------------------------------
// Arrays with backpacks, weapons, magazines and items for all different roles of this side:

// Platoon Lead - Squad Leader
VA_PL_SL_Backpacks = _VA_Longrange + [
	// Add more/new backpacks here.
];
VA_PL_SL_Weapons = _VA_Basic_Weapons + _VA_4five + _VA_HLC_MP5 + _VA_Weap_GL + _VA_AssaultRifles + [
	"rhs_weap_M136",					// M136
	"Rangefinder"						// Rangefinder
];
VA_PL_SL_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_PL_SL_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Berets + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + [	
	"ItemGPS",							// GPS
	"AGM_CableTie"
];

// Platoon- Medic
VA_PL_Medic_Backpacks = _VA_AssaultBackpacks + [
	// Add more/new backpacks here.
];
VA_PL_Medic_Weapons = _VA_Basic_Weapons + _VA_HLC_MP5 + _VA_AssaultRifles + [
	"Rangefinder"						// Rangefinder
];
VA_PL_Medic_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_PL_Medic_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + [
	"Medikit",							// Medikit
	"ItemGPS"							// GPS
];

// Platoon Lead - Marksman
VA_PL_Marksman_Backpacks = _VA_AssaultBackpacks + [
	// Add more/new backpacks here.
];
VA_PL_Marksman_Weapons = _VA_Basic_Weapons + _VA_HLC_MP5 + _VA_Weap_MM + [
	"Rangefinder"						// Rangefinder
];
VA_PL_Marksman_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_PL_Marksman_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_Marksman + _VA_Scopes_SMG + _VA_Helmets + _VA_Shemags + [
	// Add more/new items here.
];

// Platoon Lead - Missile Specialist (AA)
VA_PL_AA_Backpacks = _VA_CarryallBackpacks + [
	// Add more/new backpacks here.
];
VA_PL_AA_Weapons = _VA_Basic_Weapons + _VA_AssaultRifles + [
	"launch_B_Titan_F",					// Titan MPRL Launcher
	"Rangefinder"						// Rangefinder
];
VA_PL_AA_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_PL_AA_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_Marksman + _VA_Scopes_SMG + _VA_Helmets + [
	// Add more/new items here.
];

// Recon - Team Leader
VA_RCN_TL_Backpacks = _VA_Longrange + [
	"AGM_CableTie"
	// Add more/new backpacks here.
];
VA_RCN_TL_Weapons = _VA_Basic_Weapons + _VA_4five + _VA_HLC_MP5 + _VA_AssaultRifles + [
	"rhs_weap_M136",					// M136
	"Rangefinder",						// Rangefinder
	"AGM_Vector",
	"AGM_ItemKestrel"
];
VA_RCN_TL_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_RCN_TL_Items = _VA_Basic_Items + _VA_Uniforms+ _VA_Scopes + _VA_Scopes_SMG + _VA_Ghillie + _VA_Shemags  + [
	"ItemGPS",							// GPS
	"AGM_CableTie"
];

// Recon - Scout
VA_RCN_Scout_Backpacks = [
	"B_UAV_01_backpack_F"				// UAV Backpack
];
VA_RCN_Scout_Weapons = _VA_Basic_Weapons + _VA_HLC_MP5 + _VA_AssaultRifles + [
	"rhs_weap_M136",					// M136
	"Rangefinder",						// Rangefinder
	"AGM_Vector",
	"AGM_ItemKestrel"
];
VA_RCN_Scout_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_RCN_Scout_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Ghillie + _VA_Helmets + _VA_Shemags + [
	"B_UavTerminal"						// GPS
];

// Recon - Marksman
VA_RCN_Marksman_Backpacks = _VA_AssaultBackpacks + [
	// Add more/new backpacks here.
];
VA_RCN_Marksman_Weapons = _VA_Basic_Weapons + _VA_HLC_MP5 + _VA_Weap_MM + [
	"rhs_weap_M136",					// M136
	"Rangefinder",						// Rangefinder
	"AGM_Vector",
	"hlc_rifle_g3ka4"                   // G3KA4 RAS
];
VA_RCN_Marksman_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_RCN_Marksman_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_Marksman + _VA_Scopes_SMG + _VA_Ghillie + _VA_Helmets + _VA_Shemags + [
	"ItemGPS",	// GPS
	"AGM_Vector",
	"AGM_ItemKestrel"
];

// Recon - Paramedic
VA_RCN_Paramedic_Backpacks = _VA_AssaultBackpacks + [
	// Add more/new backpacks here.
];
VA_RCN_Paramedic_Weapons = _VA_Basic_Weapons + _VA_HLC_MP5 + _VA_AssaultRifles + [
	"rhs_weap_M136",					// M136
	"Rangefinder"						// Rangefinder
];
VA_RCN_Paramedic_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_RCN_Paramedic_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + _VA_Ghillie + [
	"Medikit",							// Medikit
	"ItemGPS"							// GPS
];

// Ghost 1+2 Teamleader
VA_TL_Backpacks = _VA_Longrange + [
	// Add more/new backpacks here.
];
VA_TL_Weapons = _VA_Basic_Weapons + _VA_4five + _VA_HLC_MP5 + _VA_Weap_GL + _VA_AssaultRifles + [
	"rhs_weap_M136",					// M136
	"Rangefinder"						// Rangefinder
];
VA_TL_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_TL_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + [
	"ItemGPS",							// GPS
	"AGM_CableTie"
];

// Ghost 1+2 - MMG
VA_MMG_Backpacks = _VA_AssaultBackpacks + [
	// Add more/new backpacks here.
];
VA_MMG_Weapons = _VA_Basic_Weapons + _VA_HLC_MP5 + _VA_Weap_MG + [

];
VA_MMG_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_MMG_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + [
];

// Ghost 1+2 - AssistantMMG
VA_Assmmg_Backpacks = _VA_CarryallBackpacks + [
	// Add more/new backpacks here.
];
VA_Assmmg_Weapons = _VA_Basic_Weapons + _VA_HLC_MP5 + _VA_AssaultRifles + [
	"Rangefinder"						// Rangefinder
];
VA_Assmmg_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_Assmmg_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + [
	"ItemGPS"							// GPS
];

// Ghost 1+2 - Antitank
VA_AT_Backpacks = _VA_AssaultBackpacks + [
	// Add more/new backpacks here.
];
VA_AT_Weapons = _VA_Basic_Weapons + _VA_HLC_MP5 + _VA_AssaultRifles + _VA_AT + [
	"launch_NLAW_F"						// PCML
];
VA_AT_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_AT_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + [
	// Add more/new items here.
];

// Ghost 1+2 - Medic
VA_Medic_Backpacks = _VA_AssaultBackpacks + [
	// Add more/new backpacks here.
];
VA_Medic_Weapons = _VA_Basic_Weapons + _VA_HLC_MP5 + _VA_AssaultRifles + [

];
VA_Medic_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_Medic_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + [
	"Medikit",							// Medikit
	"ItemGPS"
];

// Ghost 1+2 - CombatEngineer
VA_CombatEngineer_Backpacks = _VA_AssaultBackpacks + _VA_CarryallBackpacks + [
	// Add more/new backpacks here.
	"AGM_RazorWire_Crate",
	"AGM_SandbagBarrier_Crate",
	"AGM_SpareWheel",
	"AGM_SpareTrack"
];
VA_CombatEngineer_Weapons = _VA_Basic_Weapons + _VA_HLC_MP5 + _VA_AssaultRifles + [

];
VA_CombatEngineer_Magazines = _VA_Basic_Magazines + _VA_Mines + [
	// Add more/new magazines here.
];
VA_CombatEngineer_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Engi + _VA_Helmets + [
	// Add more/new items here.
	"AGM_M26_Clacker",
	"AGM_Clacker",
    "AGM_DefusalKit"
];

// Ghost 1+2 - Grenadier
VA_Grenadier_Backpacks = _VA_AssaultBackpacks + [
	// Add more/new backpacks here.
];
VA_Grenadier_Weapons = _VA_Basic_Weapons + _VA_HLC_MP5 + _VA_Weap_GL + [
	"rhs_weap_M136"						// M136
];
VA_Grenadier_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_Grenadier_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + [
	"AGM_CableTie"
];

// Heavy Weapons Team - Teamleader
VA_HWT_TL_Backpacks = _VA_Longrange + [
	// Add more/new backpacks here.
];
VA_HWT_TL_Weapons =  _VA_Basic_Weapons + _VA_4five + _VA_HLC_MP5 + _VA_AssaultRifles + [
	"rhs_weap_M136",					// M136
	"Rangefinder"						// Rangefinder	
];
VA_HWT_TL_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_HWT_TL_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + [
	"ItemGPS"							//GPS
];

// Heavy Weapons - Static Crew
VA_HWT_Crew_Backpacks = _VA_Statics + [
	// Add more/new backpacks here.
];
VA_HWT_Crew_Weapons =  _VA_Basic_Weapons + _VA_HLC_MP5 + _VA_AssaultRifles + [
	"rhs_weap_M136",					// M136
	"Rangefinder"						// Rangefinder	
];
VA_HWT_Crew_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_HWT_Crew_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + [
	"ItemGPS"							//GPS
];

// Heavy Weapons - Missile Specialist
VA_HWT_MissileSpec_Backpacks = _VA_AssaultBackpacks + _VA_CarryallBackpacks + [
	// Add more/new backpacks here.
];
VA_HWT_MissileSpec_Weapons = _VA_Basic_Weapons + _VA_HLC_MP5 + _VA_AssaultRifles + _VA_Titan + [
	"rhs_weap_M136",					// M136
	"Rangefinder"						// Rangefinder	
];
VA_HWT_MissileSpec_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_HWT_MissileSpec_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + [
	"ItemGPS"							//GPS
];

// Anvil - TankCommander
VA_TankCommander_Backpacks = _VA_Longrange + [
	// Add more/new backpacks here.
];
VA_TankCommander_Weapons = _VA_Basic_Weapons + _VA_4five + _VA_HLC_MP5 + [
	"rhs_weap_M136",					// M136
	"hlc_rifle_cqbr",
	"rhs_weap_m4a1_grip",
	"hlc_rifle_aku12"	
];
VA_TankCommander_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_TankCommander_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes_SMG + [
	"optic_Holosight",					// MK17 Holosight
	"H_HelmetCrew_I",                   //Crew Helmet I
	"H_HelmetCrew_B",                   //Crew Helmet B
	"H_Beret_blk",						// Beret (Black)
	"ToolKit"							// Tool Kit
];

// Anvil - Crew
VA_Crew_Backpacks = [
	// Add more/new backpacks here.
];
VA_Crew_Weapons = _VA_Basic_Weapons + _VA_HLC_MP5 + [
	"rhs_weap_M136",					// M136
	"hlc_rifle_cqbr",
	"rhs_weap_m4a1_grip",
	"hlc_rifle_aku12"	
];
VA_Crew_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_Crew_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes_SMG + [
	"optic_Holosight",					// MK17 Holosight
	"H_HelmetCrew_I",                   //Crew Helmet I
	"H_HelmetCrew_B",                   //Crew Helmet B
	"ToolKit"							// Tool Kit
];

// Reaper
VA_Reaper_Backpacks = _VA_Longrange + [
	"B_Parachute", 						// Steerable Parachute
	"tf_rt1523g"
];
VA_Reaper_Weapons = _VA_Basic_Weapons + _VA_HLC_MP5 + [
	"hlc_rifle_cqbr",
	"rhs_weap_m4a1_grip",
	"hlc_rifle_aku12"
];

VA_Reaper_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_Reaper_Items = _VA_Basic_Items + _VA_Scopes_SMG + [
	"H_PilotHelmetHeli_B",				// Heli Pilot Helmet [NATO]
	"U_B_HeliPilotCoveralls"			// Heli Pilot Coveralls
];

// Havoc
VA_Havoc_Backpacks = _VA_Longrange + [
	"B_Parachute", 						// Steerable Parachute
	"tf_rt1523g"
];
VA_Havoc_Weapons = _VA_Basic_Weapons + _VA_HLC_MP5 + [
	// Add more/new weapons here.
];
VA_Havoc_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_Havoc_Items = _VA_Basic_Items + _VA_Scopes_SMG + [
	"H_PilotHelmetFighter_B",			// Pilot Helmet [NATO]
	"U_B_PilotCoveralls"				// Pilot Coveralls [NATO]
];