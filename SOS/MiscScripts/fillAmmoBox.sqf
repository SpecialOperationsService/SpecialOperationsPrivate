/*
	Created by Lux0r
*/

// Run this script only on server-side.
if (isServer) then {
	// Settings
	_refreshTime = 300; // refill every 5 minutes
	_this allowDamage false;

	// Loop forever
	while {true} do	{
		// Clear box
		clearWeaponCargoGlobal _this;
		clearMagazineCargoGlobal _this;
		clearItemCargoGlobal _this;
		clearBackpackCargoGlobal _this;

		// Fill box:

		// Items
		_this addItemCargoGlobal ["FirstAidKit",50];							// First Aid Kit

		// Ammo
		_this addMagazinecargoGlobal ["16Rnd_9x21_Mag",20];						// 9mm 16Rnd Mag
		_this addMagazinecargoGlobal ["9Rnd_45ACP_Mag",20];						// .45 ACP 9Rnd Mag
		_this addMagazinecargoGlobal ["11Rnd_45ACP_Mag",20];					// .45 ACP 11Rnd Mag
		_this addMagazinecargoGlobal ["30Rnd_45ACP_Mag_SMG_01",20];				// .45 ACP 30Rnd Vermin Mag
		_this addMagazinecargoGlobal ["30Rnd_45ACP_Mag_SMG_01_Tracer_Green",20];	// .45 30Rnd VerminTracers (Green) Mag
		_this addMagazinecargoGlobal ["30Rnd_65x39_caseless_mag", 100];			// 6.5mm 30Rnd STANAG Mag
		_this addMagazinecargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 100];	// 6.5mm 30Rnd Tracer (Red) Mag
		_this addMagazinecargoGlobal ["100Rnd_65x39_caseless_mag",50];			// 6.5mm 100Rnd Belt Case
		_this addMagazinecargoGlobal ["100Rnd_65x39_caseless_mag_Tracer",50];	// 6.5mm 100Rnd Tracer (Red) Belt Case
		_this addMagazinecargoGlobal ["200Rnd_65x39_cased_Box",50];				// 6.5mm 200Rnd Belt Case
		_this addMagazinecargoGlobal ["200Rnd_65x39_cased_Box_Tracer",50];		// 6.5mm 200Rnd Belt Case Tracer (Yellow)
		_this addMagazinecargoGlobal ["20Rnd_762x51_Mag",50];					// 7.62mm 20Rnd Mag
		_this addMagazinecargoGlobal ["NLAW_F", 10];							// PCML Missile
		_this addMagazinecargoGlobal ["Titan_AA", 10];							// Titan AA Missile
		_this addMagazinecargoGlobal ["Titan_AP", 10];							// Titan AP Missile
		_this addMagazinecargoGlobal ["Titan_AT", 10];							// Titan AT Missile

		// Throw Items
		_this addMagazinecargoGlobal ["HandGrenade", 50];						// RGO Frag Grenade
		_this addMagazinecargoGlobal ["MiniGrenade", 50];						// Mini Grenade
		_this addMagazinecargoGlobal ["SmokeShellRed", 20];						// Smoke Grenade (Red)
		_this addMagazinecargoGlobal ["SmokeShellGreen", 20];					// Smoke Grenade (Green)
		_this addMagazinecargoGlobal ["SmokeShellYellow", 20];					// Smoke Grenade (Yellow)
		_this addMagazinecargoGlobal ["SmokeShellPurple", 20];					// Smoke Grenade (Purple)
		_this addMagazinecargoGlobal ["SmokeShellBlue", 20];					// Smoke Grenade (Blue)
		_this addMagazinecargoGlobal ["SmokeShellOrange", 20];					// Smoke Grenade (Orange)
		_this addMagazinecargoGlobal ["B_IR_Grenade", 20];						// IR Grenade [NATO]
		_this addMagazinecargoGlobal ["Chemlight_red", 20];						// Chemlight (Red)
		_this addMagazinecargoGlobal ["Chemlight_green", 20];					// Chemlight (Green)
		_this addMagazinecargoGlobal ["Chemlight_yellow", 20];					// Chemlight (Yellow)
		_this addMagazinecargoGlobal ["Chemlight_blue", 20];					// Chemlight (Blue)

		// Grenade Launcher HE
		_this addMagazinecargoGlobal ["1Rnd_HE_Grenade_shell",20];				// 40mm HE Grenade Round
		_this addMagazinecargoGlobal ["3Rnd_HE_Grenade_shell",20];				// 40mm 3Rnd HE Grenade

		// Grenade Launcher Smoke
		_this addMagazinecargoGlobal ["1Rnd_SmokeRed_Grenade_shell",20];		// Smoke Round (Red)
		_this addMagazinecargoGlobal ["3Rnd_SmokeRed_Grenade_shell",20];		// 3Rnd 3GL Smoke Rounds (Red)
		_this addMagazinecargoGlobal ["1Rnd_SmokeGreen_Grenade_shell",20];		// Smoke Round (Green)
		_this addMagazinecargoGlobal ["3Rnd_SmokeGreen_Grenade_shell",20];		// 3Rnd 3GL Smoke Rounds (Green)
		_this addMagazinecargoGlobal ["1Rnd_SmokeYellow_Grenade_shell",20];		// Smoke Round (Yellow)
		_this addMagazinecargoGlobal ["3Rnd_SmokeYellow_Grenade_shell",20];		// 3Rnd 3GL Smoke Rounds (Yellow)
		_this addMagazinecargoGlobal ["1Rnd_SmokePurple_Grenade_shell",20];		// Smoke Round (Purple)
		_this addMagazinecargoGlobal ["3Rnd_SmokePurple_Grenade_shell",20];		// 3Rnd 3GL Smoke Rounds (Purple)
		_this addMagazinecargoGlobal ["1Rnd_SmokeBlue_Grenade_shell",20];		// Smoke Round (Blue)
		_this addMagazinecargoGlobal ["3Rnd_SmokeBlue_Grenade_shell",20];		// 3Rnd 3GL Smoke Rounds (Blue)
		_this addMagazinecargoGlobal ["1Rnd_SmokeOrange_Grenade_shell",20];		// Smoke Round (Orange)
		_this addMagazinecargoGlobal ["3Rnd_SmokeOrange_Grenade_shell",20];		// 3Rnd 3GL Smoke Rounds (Orange)

		// Grenade Launcher Flare		
		_this addMagazinecargoGlobal ["UGL_FlareWhite_F",20];					// Flare Round (White)
		_this addMagazinecargoGlobal ["3Rnd_UGL_FlareWhite_F",20];				// 3Rnd 3GL Flares (White)
		_this addMagazinecargoGlobal ["UGL_FlareRed_F",20];						// Flare Round (Red)
		_this addMagazinecargoGlobal ["3Rnd_UGL_FlareRed_F",20];				// 3Rnd 3GL Flares (Red)
		_this addMagazinecargoGlobal ["UGL_FlareGreen_F",20];					// Flare Round (Green)
		_this addMagazinecargoGlobal ["3Rnd_UGL_FlareGreen_F",20];				// 3Rnd 3GL Flares (Green)
		_this addMagazinecargoGlobal ["UGL_FlareYellow_F",20];					// Flare Round (Yellow)
		_this addMagazinecargoGlobal ["3Rnd_UGL_FlareYellow_F",20];				// 3Rnd 3GL Flares (Yellow)
		_this addMagazinecargoGlobal ["UGL_FlareCIR_F",20];						// Flare Round (IR)
		_this addMagazinecargoGlobal ["3Rnd_UGL_FlareCIR_F",20];				// 3Rnd 3GL Flares (IR)

		// Wait the duration of _refreshTime
		sleep _refreshTime;
	};
};