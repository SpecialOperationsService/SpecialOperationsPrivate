class WEST_PL_SL {
	displayName = "Platoon Leader";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\captain_gs.paa";

	weapons[] = {
		"HLC_Rifle_g3ka4_GL",
		"hgun_Pistol_heavy_01_F",				    // 4-five .45
		"Rangefinder"								// Rangefinder
	};
	magazines[] = {
		"11Rnd_45ACP_Mag",							// .45 ACP 11Rnd Mag
		"11Rnd_45ACP_Mag",							// .45 ACP 11Rnd Mag
		"1Rnd_HE_Grenade_shell",					// 40mm HE Grenade Round
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3"						// 20 Round magazine of 7.62x51mm Tracer Rounds
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_Beret_Colonel",							// Beret [NATO] (Colonel)
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"optic_MRD",								// MRD								// Magnification: 1x
		"optic_Hamr",								// RCO								// Magnification: 10x
		"acc_pointer_IR",							// IR Laser Pointer
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio",								// Radio
		"ItemGPS"									// GPS
	};
	uniformClass = "U_B_CombatUniform_mcam";		// Combat Fatigues (MTP)
	backpack = "tf_rt1523g";
};

class WEST_PL_AA {
	displayName = "Platoon Missile Specialist (AA)";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"hlc_rifle_g3ka4",							// H&K G3KA4 (Modernised,slightly shorter Infantry rifle)
		"hgun_P07_F",							    // P07 9 mm
		"Rangefinder",								// Rangefinder
		"launch_B_Titan_F"  						// Titan MPRL Launcher
	};
	magazines[] = {
		"Titan_AA",									// Titan AA Missile
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3"						// 20 Round magazine of 7.62x51mm Tracer Rounds
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		// -------------------- Backpack Items --------------------
		"Titan_AA",									// Titan AA Missile
		"Titan_AA",									// Titan AA Missile
		"Titan_AA"									// Titan AA Missile
	};
	linkedItems[] = {
		"H_HelmetSpecB_paint1",						// SF Helmet (Light paint)
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		// Rifle Attachments:
		"optic_Hamr",								// RCO								// Magnification: 10x
		"muzzle_snds_H",							// Sound Suppressor (6.5 mm)
		"acc_pointer_IR",							// IR Laser Pointer
		// Pistol Attachments:
		"muzzle_snds_L",							// Sound Suppressor (9 mm)
		// Items:
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_B_CombatUniform_mcam";		// Combat Fatigues (MTP)
	backpack = "B_Carryall_mcamo";					// Carryall Backpack (MTP)
};

class WEST_PL_Medic {
	displayName = "Platoon Medic";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"hlc_rifle_g3ka4",							// H&K G3KA4 (Modernised,slightly shorter Infantry rifle)
		"hgun_P07_F",							// P07 9 mm
		"Rangefinder"								// Rangefinder
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3"						// 20 Round magazine of 7.62x51mm Tracer Rounds
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		// -------------------- Backpack Items --------------------
		"Medikit",									// Medikit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		// --------------------------------------------------------
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_HelmetB_light_grass",					// ECH (Light, Grass)
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"optic_Hamr",								// RCO								// Magnification: 10x
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio",								// Radio
		"ItemGPS"									// GPS
	};
	uniformClass = "U_B_CombatUniform_mcam_tshirt";	// Combat Fatigues (MTP) (Tee)
	backpack = "B_AssaultPack_rgr";					// Assault Pack (Green)
};

class WEST_PL_Marksman {
	displayName = "Platoon Marksman";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"hlc_rifle_m14sopmod",						// M14
		"hgun_P07_F",							// P07 9 mm
		"Rangefinder"								// Rangefinder
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"hlc_20Rnd_762x51_B_M14",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_M14",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_M14",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_M14",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_M14",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_M14",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20rnd_762x51_T_M14",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_M14",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_M14",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_M14",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_M14"					// 20 Round magazine of 7.62x51mm Tracer Rounds
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"optic_NVS"									// NVS								// Magnification: 10x
	};
	linkedItems[] = {
		"H_HelmetSpecB_paint1",						// SF Helmet (Light paint)
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"optic_Hamr",								// RCO								// Magnification: 10x
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_B_CombatUniform_mcam";		// Combat Fatigues (MTP)
	backpack = "B_AssaultPack_rgr";					// Assault Pack (Green)
};

class WEST_RCN_TL {
	displayName = "Recon - Team Leader";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";

	weapons[] = {
		"hlc_rifle_Bushmaster300",					// Busmaster .300 Carbine
		"hgun_P07_F",							// P07 9 mm
		"Rangefinder"								// Rangefinder
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"29rnd_300BLK_STANAG",						// 30 Round magazine of .300 Blackout FMJ (-1 to ensure smooth feeding)
		"29rnd_300BLK_STANAG",						// 30 Round magazine of .300 Blackout FMJ (-1 to ensure smooth feeding)
		"29rnd_300BLK_STANAG",						// 30 Round magazine of .300 Blackout FMJ (-1 to ensure smooth feeding)
		"29rnd_300BLK_STANAG",						// 30 Round magazine of .300 Blackout FMJ (-1 to ensure smooth feeding)
		"29rnd_300BLK_STANAG",						// 30 Round magazine of .300 Blackout FMJ (-1 to ensure smooth feeding)
		"29rnd_300BLK_STANAG",						// 30 Round magazine of .300 Blackout FMJ (-1 to ensure smooth feeding)
		"29rnd_300BLK_STANAG_T",					// 30 Round magazine of .300 Blackout Tracer Rounds
		"29rnd_300BLK_STANAG_T",					// 30 Round magazine of .300 Blackout Tracer Rounds
		"29rnd_300BLK_STANAG_T",					// 30 Round magazine of .300 Blackout Tracer Rounds
		"29rnd_300BLK_STANAG_T",					// 30 Round magazine of .300 Blackout Tracer Rounds
		"29rnd_300BLK_STANAG_T"						// 30 Round magazine of .300 Blackout Tracer Rounds
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"optic_NVS"									// NVS								// Magnification: 10x
	};
	linkedItems[] = {
		"H_Shemag_olive_hs",						// Shemag (Olive, Headset)
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"optic_Hamr",								// RCO								// Magnification: 10x
		"acc_pointer_IR",							// IR Laser Pointer
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio",								// Radio
		"ItemGPS"									// GPS
	};
	uniformClass = "U_B_CombatUniform_mcam_vest";	// Recon Fatigues (MTP)
	backpack = "tf_rt1523g";
};

class WEST_RCN_Scout {
	displayName = "Recon - Scout";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";

	weapons[] = {
		"hlc_rifle_Bushmaster300",					// Busmaster .300 Carbine
		"hgun_P07_F",							// P07 9 mm
		"Rangefinder"								// Rangefinder
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"29rnd_300BLK_STANAG",						// 30 Round magazine of .300 Blackout FMJ (-1 to ensure smooth feeding)
		"29rnd_300BLK_STANAG",						// 30 Round magazine of .300 Blackout FMJ (-1 to ensure smooth feeding)
		"29rnd_300BLK_STANAG",						// 30 Round magazine of .300 Blackout FMJ (-1 to ensure smooth feeding)
		"29rnd_300BLK_STANAG",						// 30 Round magazine of .300 Blackout FMJ (-1 to ensure smooth feeding)
		"29rnd_300BLK_STANAG",						// 30 Round magazine of .300 Blackout FMJ (-1 to ensure smooth feeding)
		"29rnd_300BLK_STANAG",						// 30 Round magazine of .300 Blackout FMJ (-1 to ensure smooth feeding)
		"29rnd_300BLK_STANAG_T",					// 30 Round magazine of .300 Blackout Tracer Rounds
		"29rnd_300BLK_STANAG_T",					// 30 Round magazine of .300 Blackout Tracer Rounds
		"29rnd_300BLK_STANAG_T",					// 30 Round magazine of .300 Blackout Tracer Rounds
		"29rnd_300BLK_STANAG_T",					// 30 Round magazine of .300 Blackout Tracer Rounds
		"29rnd_300BLK_STANAG_T"						// 30 Round magazine of .300 Blackout Tracer Rounds
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"optic_NVS"									// NVS								// Magnification: 10x
	};
	linkedItems[] = {
		"H_Shemag_olive_hs",						// Shemag (Olive, Headset)
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"optic_Hamr",								// RCO								// Magnification: 10x
		"acc_pointer_IR",							// IR Laser Pointer
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio",								// Radio
		"B_UavTerminal"								// UAV Terminal
	};
	uniformClass = "U_B_CombatUniform_mcam_vest";	// Recon Fatigues (MTP)
	backpack = "B_UAV_01_backpack_F";				// UAV Backpack
};

class WEST_RCN_Marksman {
	displayName = "Recon - Marksman";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"hlc_rifle_m14sopmod",						// M14
		"hgun_P07_F",							// P07 9 mm
		"Rangefinder"								// Rangefinder
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"hlc_20Rnd_762x51_B_M14",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_M14",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_M14",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_M14",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_M14",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_M14",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20rnd_762x51_T_M14",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_M14",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_M14",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_M14",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_M14"					// 20 Round magazine of 7.62x51mm Tracer Rounds
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"optic_NVS"									// NVS								// Magnification: 10x
	};
	linkedItems[] = {
		"H_Shemag_olive_hs",						// Shemag (Olive, Headset)
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"optic_Hamr",								// RCO								// Magnification: 10x
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_B_CombatUniform_mcam_vest";	// Recon Fatigues (MTP)
	backpack = "B_AssaultPack_rgr";					// Assault Pack (Green)
};

class WEST_RCN_Paramedic {
	displayName = "Recon - Paramedic";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"hlc_rifle_g3ka4",							// H&K G3KA4 (Modernised,slightly shorter Infantry rifle)
		"hgun_P07_F",							// P07 9 mm
		"Rangefinder"								// Rangefinder
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3"						// 20 Round magazine of 7.62x51mm Tracer Rounds
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		// -------------------- Backpack Items --------------------
		"Medikit",									// Medikit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		// --------------------------------------------------------
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_HelmetB_light_grass",					// ECH (Light, Grass)
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"optic_Hamr",								// RCO								// Magnification: 10x
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio",								// Radio
		"ItemGPS"									// GPS
	};
	uniformClass = "U_B_CombatUniform_mcam_vest";	// Recon Fatigues (MTP)
	backpack = "B_AssaultPack_rgr";					// Assault Pack (Green)
};

class WEST_TL {
	displayName = "Team Leader";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";

	weapons[] = {
		"HLC_Rifle_g3ka4_GL",
		"hgun_Pistol_heavy_01_F",				// 4-five .45
		"Rangefinder"								// Rangefinder
	};
	magazines[] = {
		"11Rnd_45ACP_Mag",							// .45 ACP 11Rnd Mag
		"11Rnd_45ACP_Mag",							// .45 ACP 11Rnd Mag
		"1Rnd_HE_Grenade_shell",					// 40mm HE Grenade Round
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3"						// 20 Round magazine of 7.62x51mm Tracer Rounds
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		// -------------------- Backpack Items --------------------
		"DemoCharge_Remote_Mag",					// Explosive Charge
		"DemoCharge_Remote_Mag"						// Explosive Charge
		// --------------------------------------------------------
	};
	linkedItems[] = {
		"H_HelmetSpecB_paint1",						// SF Helmet (Light paint)
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"optic_MRD",								// MRD								// Magnification: 1x
		"optic_Hamr",								// RCO								// Magnification: 10x
		"acc_pointer_IR",							// IR Laser Pointer
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio",								// Radio
		"ItemGPS"									// GPS
	};
	uniformClass = "U_B_CombatUniform_mcam";		// Combat Fatigues (MTP)
	backpack = "tf_rt1523g";
};

class WEST_MMG_Mk200 {
	displayName = "MMG - Mk200";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"LMG_Mk200_F",						// Mk200 6.5 mm
		"hgun_P07_F",							// P07 9 mm
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"200Rnd_65x39_cased_Box",					// 6.5mm 200Rnd Belt Case
		"200Rnd_65x39_cased_Box",					// 6.5mm 200Rnd Belt Case
		"200Rnd_65x39_cased_Box_Tracer",			// 6.5mm 200Rnd Belt Case Tracer (Yellow)
		"200Rnd_65x39_cased_Box_Tracer"				// 6.5mm 200Rnd Belt Case Tracer (Yellow)
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_HelmetSpecB_paint1",						// SF Helmet (Light paint)
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"optic_Hamr",								// RCO								// Magnification: 10x
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_B_CombatUniform_mcam";		// Combat Fatigues (MTP)
	backpack = "B_AssaultPack_rgr";					// Assault Pack (Green)
};

class WEST_MMG_M60E4 {
	displayName = "MMG - M60E4";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"hlc_lmg_m60",								// M60E4
		"hgun_P07_F",							// P07 9 mm
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"hlc_100Rnd_762x51_B_M60E4",				// 100 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_100Rnd_762x51_B_M60E4",				// 100 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_100Rnd_762x51_B_M60E4",				// 100 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_100Rnd_762x51_T_M60E4",				// 100 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_100Rnd_762x51_T_M60E4",				// 100 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_100Rnd_762x51_T_M60E4",				// 100 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_100Rnd_762x51_T_M60E4"					// 100 Round magazine of 7.62x51mm Tracer Rounds
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_HelmetSpecB_paint1",						// SF Helmet (Light paint)
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"optic_Hamr",								// RCO								// Magnification: 10x
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_B_CombatUniform_mcam";		// Combat Fatigues (MTP)
	backpack = "B_AssaultPack_rgr";					// Assault Pack (Green)
};

class WEST_AT {
	displayName = "Rifleman (AT)";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"hlc_rifle_g3ka4",							// H&K G3KA4 (Modernised,slightly shorter Infantry rifle)
		"launch_NLAW_F",							// PCML
		"hgun_P07_F",							// P07 9 mm
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"NLAW_F",									/// PCML Missile
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3"						// 20 Round magazine of 7.62x51mm Tracer Rounds
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		// -------------------- Backpack Items --------------------
		"NLAW_F",									/// PCML Missile
		"NLAW_F"									/// PCML Missile
		// --------------------------------------------------------
	};
	linkedItems[] = {
		"H_HelmetSpecB_paint1",						// SF Helmet (Light paint)
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"optic_Hamr",								// RCO								// Magnification: 10x
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_B_CombatUniform_mcam_tshirt";	// Combat Fatigues (MTP) (Tee)
	backpack = "B_AssaultPack_rgr";					// Assault Pack (Green)
};

class WEST_CombatEngineer {
	displayName = "Combat Engineer";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"hlc_rifle_g3ka4",							// H&K G3KA4 (Modernised,slightly shorter Infantry rifle)
		"hgun_P07_F",							// P07 9 mm
		"Rangefinder"								// Rangefinder
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3"						// 20 Round magazine of 7.62x51mm Tracer Rounds
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		// -------------------- Backpack Items --------------------
		"ToolKit",									// ToolKit
		// --------------------------------------------------------
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_Watchcap_blk",							// Beanie
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"optic_Hamr",								// RCO								// Magnification: 10x
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio",								// Radio
	};
	uniformClass = "U_B_CombatUniform_mcam";		// Combat Fatigues (MTP)
	backpack = "B_AssaultPack_rgr";					// Assault Pack (Green)
};

class WEST_AssistantMMG {
	displayName = "Assistant MMG";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"hlc_rifle_g3ka4",							// H&K G3KA4 (Modernised,slightly shorter Infantry rifle)
		"hgun_P07_F",							// P07 9 mm
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3"						// 20 Round magazine of 7.62x51mm Tracer Rounds
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_HelmetSpecB_paint1",						// SF Helmet (Light paint)
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"optic_Hamr",								// RCO								// Magnification: 10x
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_B_CombatUniform_mcam";		// Combat Fatigues (MTP)
	backpack = "B_Carryall_mcamo";					// Carryall Backpack (MTP)
};

class WEST_Medic {
	displayName = "Medic";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"hlc_rifle_g3ka4",							// H&K G3KA4 (Modernised,slightly shorter Infantry rifle)
		"hgun_P07_F",							// P07 9 mm
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3"						// 20 Round magazine of 7.62x51mm Tracer Rounds
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		// -------------------- Backpack Items --------------------
		"Medikit",									// Medikit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		// --------------------------------------------------------
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_HelmetB_light_grass",					// ECH (Light, Grass)
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"optic_Hamr",								// RCO								// Magnification: 10x
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio",								// Radio
		"ItemGPS"									// GPS
	};
	uniformClass = "U_B_CombatUniform_mcam_tshirt";	// Combat Fatigues (MTP) (Tee)
	backpack = "B_AssaultPack_rgr";					// Assault Pack (Green)
};

class WEST_Grenadier {
	displayName = "Grenadier";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";

	weapons[] = {
		"HLC_Rifle_g3ka4_GL",
		"hgun_P07_F",							// P07 9 mm
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"1Rnd_HE_Grenade_shell",					// 40mm HE Grenade Round
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3"						// 20 Round magazine of 7.62x51mm Tracer Rounds
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_HelmetSpecB_paint1",						// SF Helmet (Light paint)
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"optic_Hamr",								// RCO								// Magnification: 10x
		"acc_pointer_IR",							// IR Laser Pointer
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_B_CombatUniform_mcam";		// Combat Fatigues (MTP)
	backpack = "B_AssaultPack_rgr";					// Assault Pack (Green)
};

class WEST_HWT_TL {
	displayName = "HWT - Team Leader";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";

	weapons[] = {
		"hlc_rifle_g3ka4",							// H&K G3KA4 (Modernised,slightly shorter Infantry rifle)
		"hgun_P07_F",							// P07 9 mm
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3"						// 20 Round magazine of 7.62x51mm Tracer Rounds
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_HelmetSpecB_paint1",						// SF Helmet (Light paint)
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"optic_Hamr",								// RCO								// Magnification: 10x
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_B_CombatUniform_mcam";		// Combat Fatigues (MTP)
	backpack = "tf_rt1523g";
};

class WEST_HWT_Crew {
	displayName = "HWT - Crew";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"hlc_rifle_g3ka4",							// H&K G3KA4 (Modernised,slightly shorter Infantry rifle)
		"hgun_P07_F",							// P07 9 mm
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3"						// 20 Round magazine of 7.62x51mm Tracer Rounds
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_HelmetSpecB_paint1",						// SF Helmet (Light paint)
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"optic_Hamr",								// RCO								// Magnification: 10x
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_B_CombatUniform_mcam";		// Combat Fatigues (MTP)
};

class WEST_HWT_MissileSpec {
	displayName = "HWT - Missile Specialist";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"hlc_rifle_g3ka4",							// H&K G3KA4 (Modernised,slightly shorter Infantry rifle)
		"launch_B_Titan_short_F",					// Titan MPRL Compact
		"hgun_P07_F",							// P07 9 mm
		"Rangefinder"								// Rangefinder
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20Rnd_762x51_B_G3",					// 20 Round magazine of 7.62x51mm Ball Rounds (i.e, standard bullets)
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3",					// 20 Round magazine of 7.62x51mm Tracer Rounds
		"hlc_20rnd_762x51_T_G3"						// 20 Round magazine of 7.62x51mm Tracer Rounds
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		// -------------------- Backpack Items --------------------
		"Titan_AT",									/// Titan AT Missile
		"Titan_AT"									/// Titan AT Missile
		// --------------------------------------------------------
	};
	linkedItems[] = {
		"H_HelmetSpecB_paint1",						// SF Helmet (Light paint)
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"optic_Hamr",								// RCO								// Magnification: 10x
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_B_CombatUniform_mcam_tshirt";	// Combat Fatigues (MTP) (Tee)
	backpack = "B_Carryall_mcamo";					// Carryall Backpack (MTP)
};

class WEST_TankCommander {
	displayName = "Tank Commander";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";

	weapons[] = {
		"hlc_smg_mp5k_PDW",							// MP5K-PDW (Primary Weapon Slot)
		"hgun_P07_F",							// P07 9 mm
		"Rangefinder"								// Rangefinder
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5"						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_HelmetCrew_B",							// Crew Helmet
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_B_CombatUniform_mcam_vest";	// Recon Fatigues (MTP)
	backpack = "tf_rt1523g";
};

class WEST_TankDriver {
	displayName = "Tank Driver";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"hlc_smg_mp5k_PDW",							// MP5K-PDW (Primary Weapon Slot)
		"hgun_P07_F",							// P07 9 mm
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5"						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_HelmetCrew_B",							// Crew Helmet
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_B_CombatUniform_mcam_vest";	// Recon Fatigues (MTP)
	backpack = "";
};

class WEST_TankGunner {
	displayName = "Tank Gunner";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"hlc_smg_mp5k_PDW",							// MP5K-PDW (Primary Weapon Slot)
		"hgun_P07_F",						     	// P07 9 mm
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5"						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_HelmetCrew_B",							// Crew Helmet
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_B_CombatUniform_mcam_vest";	// Recon Fatigues (MTP)
	backpack = "";
};

class WEST_HelicopterPilot {
	displayName = "Helicopter Pilot";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";

	weapons[] = {
		"hlc_smg_mp5k_PDW",							// MP5K-PDW (Primary Weapon Slot)
		"hgun_P07_F"							// P07 9 mm
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5"						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"Chemlight_green",							// Chemlight (Green)
		"Chemlight_green",							// Chemlight (Green)
		"B_IR_Grenade",								// IR Grenade [NATO]
		"B_IR_Grenade",								// IR Grenade [NATO]
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_PilotHelmetHeli_B",						// Heli Pilot Helmet [NATO]
		"V_PlateCarrierGL_rgr",						// Carrier GL Rig (Green)
		"acc_pointer_IR",							// IR Laser Pointer
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio",								// Radio
		"ItemGPS"									// GPS
	};
	uniformClass = "U_B_HeliPilotCoveralls";		// Heli Pilot Coveralls
	backpack = "";
};

class WEST_JetPilot {
	displayName = "Jet Pilot";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";

	weapons[] = {
		"hlc_smg_mp5k_PDW",							// MP5K-PDW (Primary Weapon Slot)
		"hgun_P07_F"							// P07 9 mm
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5",						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
		"hlc_30Rnd_9x19_B_MP5"						// 30 Round MP5 Magazine of 9x19mm M882 NATO Ball
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"Chemlight_green",							// Chemlight (Green)
		"B_IR_Grenade"								// IR Grenade [NATO]
	};
	linkedItems[] = {
		"H_PilotHelmetFighter_B",					// Pilot Helmet [NATO]
		"acc_pointer_IR",							// IR Laser Pointer
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio",								// Radio
		"ItemGPS"									// GPS
	};
	uniformClass = "U_B_PilotCoveralls";			// Pilot Coveralls [NATO]
	backpack = "B_Parachute";						// Steerable Parachute
};