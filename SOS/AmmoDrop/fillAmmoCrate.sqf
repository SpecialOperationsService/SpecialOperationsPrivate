/*
	Edited by Lux0r
*/


_crate = _this select 0;

// Clear box
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

// Fill box

// Items
_crate addItemCargoGlobal ["FirstAidKit",50];								// First Aid Kit

// Ammo
_crate addMagazinecargoGlobal ["16Rnd_9x21_Mag",20];						// 9mm 16Rnd Mag
_crate addMagazinecargoGlobal ["9Rnd_45ACP_Mag",20];						// .45 ACP 9Rnd Mag
_crate addMagazinecargoGlobal ["11Rnd_45ACP_Mag",20];						// .45 ACP 11Rnd Mag
_crate addMagazinecargoGlobal ["30Rnd_65x39_caseless_mag", 100];			// 6.5mm 30Rnd STANAG Mag
_crate addMagazinecargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 100];		// 6.5mm 30Rnd Tracer (Red) Mag
_crate addMagazinecargoGlobal ["100Rnd_65x39_caseless_mag",50];				// 6.5mm 100Rnd Belt Case
_crate addMagazinecargoGlobal ["100Rnd_65x39_caseless_mag_Tracer",50];		// 6.5mm 100Rnd Tracer (Red) Belt Case
_crate addMagazinecargoGlobal ["200Rnd_65x39_cased_Box",50];				// 6.5mm 200Rnd Belt Case
_crate addMagazinecargoGlobal ["200Rnd_65x39_cased_Box_Tracer",50];			// 6.5mm 200Rnd Belt Case Tracer (Yellow)
_crate addMagazinecargoGlobal ["20Rnd_762x51_Mag",50];						// 7.62mm 20Rnd Mag
_crate addMagazinecargoGlobal ["NLAW_F", 10];								// PCML Missile
_crate addMagazinecargoGlobal ["Titan_AA", 10];								// Titan AA Missile
_crate addMagazinecargoGlobal ["Titan_AP", 10];								// Titan AP Missile
_crate addMagazinecargoGlobal ["Titan_AT", 10];								// Titan AT Missile

// Throw Items
_crate addMagazinecargoGlobal ["HandGrenade", 50];							// RGO Frag Grenade
_crate addMagazinecargoGlobal ["MiniGrenade", 50];							// Mini Grenade
_crate addMagazinecargoGlobal ["SmokeShellRed", 20];						// Smoke Grenade (Red)
_crate addMagazinecargoGlobal ["SmokeShellGreen", 20];						// Smoke Grenade (Green)
_crate addMagazinecargoGlobal ["SmokeShellYellow", 20];						// Smoke Grenade (Yellow)
_crate addMagazinecargoGlobal ["SmokeShellPurple", 20];						// Smoke Grenade (Purple)
_crate addMagazinecargoGlobal ["SmokeShellBlue", 20];						// Smoke Grenade (Blue)
_crate addMagazinecargoGlobal ["SmokeShellOrange", 20];						// Smoke Grenade (Orange
_crate addMagazinecargoGlobal ["B_IR_Grenade", 20];							// IR Grenade [NATO]
_crate addMagazinecargoGlobal ["Chemlight_red", 20];						// Chemlight (Red)
_crate addMagazinecargoGlobal ["Chemlight_green", 20];						// Chemlight (Green)
_crate addMagazinecargoGlobal ["Chemlight_yellow", 20];						// Chemlight (Yellow)
_crate addMagazinecargoGlobal ["Chemlight_blue", 20];						// Chemlight (Blue)

// Grenade Launcher HE
_crate addMagazinecargoGlobal ["1Rnd_HE_Grenade_shell",20];					// 40mm HE Grenade Round
_crate addMagazinecargoGlobal ["3Rnd_HE_Grenade_shell",20];					// 40mm 3Rnd HE Grenade

// Grenade Launcher Smoke
_crate addMagazinecargoGlobal ["1Rnd_SmokeRed_Grenade_shell",20];			// Smoke Round (Red)
_crate addMagazinecargoGlobal ["3Rnd_SmokeRed_Grenade_shell",20];			// 3Rnd 3GL Smoke Rounds (Red)
_crate addMagazinecargoGlobal ["1Rnd_SmokeGreen_Grenade_shell",20];			// Smoke Round (Green)
_crate addMagazinecargoGlobal ["3Rnd_SmokeGreen_Grenade_shell",20];			// 3Rnd 3GL Smoke Rounds (Green)
_crate addMagazinecargoGlobal ["1Rnd_SmokeYellow_Grenade_shell",20];		// Smoke Round (Yellow)
_crate addMagazinecargoGlobal ["3Rnd_SmokeYellow_Grenade_shell",20];		// 3Rnd 3GL Smoke Rounds (Yellow)
_crate addMagazinecargoGlobal ["1Rnd_SmokePurple_Grenade_shell",20];		// Smoke Round (Purple)
_crate addMagazinecargoGlobal ["3Rnd_SmokePurple_Grenade_shell",20];		// 3Rnd 3GL Smoke Rounds (Purple)
_crate addMagazinecargoGlobal ["1Rnd_SmokeBlue_Grenade_shell",20];			// Smoke Round (Blue)
_crate addMagazinecargoGlobal ["3Rnd_SmokeBlue_Grenade_shell",20];			// 3Rnd 3GL Smoke Rounds (Blue)
_crate addMagazinecargoGlobal ["1Rnd_SmokeOrange_Grenade_shell",20];		// Smoke Round (Orange)
_crate addMagazinecargoGlobal ["3Rnd_SmokeOrange_Grenade_shell",20];		// 3Rnd 3GL Smoke Rounds (Orange)

// Grenade Launcher Flare
_crate addMagazinecargoGlobal ["UGL_FlareWhite_F",20];						// Flare Round (White)
_crate addMagazinecargoGlobal ["3Rnd_UGL_FlareWhite_F",20];					// 3Rnd 3GL Flares (White)
_crate addMagazinecargoGlobal ["UGL_FlareRed_F",20];						// Flare Round (Red)
_crate addMagazinecargoGlobal ["3Rnd_UGL_FlareRed_F",20];					// 3Rnd 3GL Flares (Red)
_crate addMagazinecargoGlobal ["UGL_FlareGreen_F",20];						// Flare Round (Green)
_crate addMagazinecargoGlobal ["3Rnd_UGL_FlareGreen_F",20];					// 3Rnd 3GL Flares (Green)
_crate addMagazinecargoGlobal ["UGL_FlareYellow_F",20];						// Flare Round (Yellow)
_crate addMagazinecargoGlobal ["3Rnd_UGL_FlareYellow_F",20];				// 3Rnd 3GL Flares (Yellow)
_crate addMagazinecargoGlobal ["UGL_FlareCIR_F",20];						// Flare Round (IR)
_crate addMagazinecargoGlobal ["3Rnd_UGL_FlareCIR_F",20];					// 3Rnd 3GL Flares (IR)