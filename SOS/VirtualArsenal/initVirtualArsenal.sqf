/*
	This script initializes the Virtual Arsenal and adds it to the defined objects.

	IMPORTANT:
	There must be a script available, which contains the backpacks, weapons, magazines and items for all roles of the players side.
	E.g.: virtualArsenalWest.sqf, virtualArsenalEast.sqf, virtualArsenalGuer.sqf, virtualArsenalCiv.sqf

	Created by Lux0r
*/


// Run this script only on client-side.
if (!isDedicated) then {
	private ["_objects","_gear","_backpacks","_weapons","_magazines","_items"];
	_objects = [AmmoBox1, AmmoBox2, AmmoBox3, Sign_Jet_1, Sign_Heli_1, Sign_Heli_2, Sign_Heli_3];
	
	waitUntil {!IsNull Player && alive player};
	
	_side = side player;
	if !(_side in [sideLogic, sideEnemy]) then {
		[] call compile preprocessFileLineNumbers format["SOS\VirtualArsenal\virtualArsenal%1.sqf", _side];
		
		_role = player getVariable "SOS_role";		
		if (!isNil "_role") then {
			_gear = switch (_role) do {
				// Platoon Lead
				case "PlatoonLeader":	{[VA_PL_SL_Backpacks, VA_PL_SL_Weapons, VA_PL_SL_Magazines, VA_PL_SL_Items];};
				case "PlatoonMedic":	{[VA_PL_Medic_Backpacks, VA_PL_Medic_Weapons, VA_PL_Medic_Magazines, VA_PL_Medic_Items];};
				case "PlatoonMarksman":	{[VA_PL_Marksman_Backpacks, VA_PL_Marksman_Weapons, VA_PL_Marksman_Magazines, VA_PL_Marksman_Items];};
				case "PlatoonAA":		{[VA_PL_AA_Backpacks, VA_PL_AA_Weapons, VA_PL_AA_Magazines, VA_PL_AA_Items];};
				
				// Ghost 1 + 2
				case "TeamLeader":		{[VA_TL_Backpacks, VA_TL_Weapons, VA_TL_Magazines, VA_TL_Items];};
				case "MMG":			    {[VA_MMG_Backpacks, VA_MMG_Weapons, VA_MMG_Magazines, VA_MMG_Items];};
				case "AntiTank":		{[VA_AT_Backpacks, VA_AT_Weapons, VA_AT_Magazines, VA_AT_Items];};
				case "CombatEngineer":  {[VA_CombatEngineer_Backpacks, VA_CombatEngineer_Weapons, VA_CombatEngineer_Magazines, VA_CombatEngineer_Items];};
				case "AssistantMMG":	{[VA_Assmmg_Backpacks, VA_Assmmg_Weapons, VA_Assmmg_Magazines, VA_Assmmg_Items];};
				case "Medic":			{[VA_Medic_Backpacks, VA_Medic_Weapons, VA_Medic_Magazines, VA_Medic_Items];};
				case "Grenadier":		{[VA_Grenadier_Backpacks, VA_Grenadier_Weapons, VA_Grenadier_Magazines, VA_Grenadier_Items];};
				
				// Ghost Recon
				case "ReconTeamLeader":	{[VA_RCN_TL_Backpacks, VA_RCN_TL_Weapons, VA_RCN_TL_Magazines, VA_RCN_TL_Items];};
				case "ReconScout":		{[VA_RCN_Scout_Backpacks, VA_RCN_Scout_Weapons, VA_RCN_Scout_Magazines, VA_RCN_Scout_Items];};
				case "ReconMarksman":	{[VA_RCN_Marksman_Backpacks, VA_RCN_Marksman_Weapons, VA_RCN_Marksman_Magazines, VA_RCN_Marksman_Items];};
				case "ReconParamedic":	{[VA_RCN_Paramedic_Backpacks, VA_RCN_Paramedic_Weapons, VA_RCN_Paramedic_Magazines, VA_RCN_Paramedic_Items];};

				// HWT
				case "HWT_TL":			{[VA_HWT_TL_Backpacks, VA_HWT_TL_Weapons, VA_HWT_TL_Magazines, VA_HWT_TL_Items];};
				case "HWT_Crew":		{[VA_HWT_Crew_Backpacks, VA_HWT_Crew_Weapons, VA_HWT_Crew_Magazines, VA_HWT_Crew_Items];};
				case "HWT_MissileSpec":	{[VA_HWT_MissileSpec_Backpacks, VA_HWT_MissileSpec_Weapons, VA_HWT_MissileSpec_Magazines, VA_HWT_MissileSpec_Items];};

				// Anvil 1
				case "TankCommander":	{[VA_TankCommander_Backpacks, VA_TankCommander_Weapons, VA_TankCommander_Magazines, VA_TankCommander_Items];};
				case "TankDriver";
				case "TankGunner":		{[VA_Crew_Backpacks, VA_Crew_Weapons, VA_Crew_Magazines, VA_Crew_Items];};

				// Pilots
				case "HelicopterPilot":	{[VA_Reaper_Backpacks, VA_Reaper_Weapons, VA_Reaper_Magazines, VA_Reaper_Items];};
				case "JetPilot":		{[VA_Havoc_Backpacks, VA_Havoc_Weapons, VA_Havoc_Magazines, VA_Havoc_Items];};
				default 				{[[], [], [], []]};
			};
			
			_backpacks	= _gear select 0;
			_weapons	= _gear select 1;
			_magazines	= _gear select 2;
			_items		= _gear select 3;
			
			{
				[_x, _backpacks] call BIS_fnc_addVirtualBackpackCargo;
				[_x, _weapons] call BIS_fnc_addVirtualWeaponCargo;
				[_x, _magazines] call BIS_fnc_addVirtualMagazineCargo;
				[_x, _items] call BIS_fnc_addVirtualItemCargo;
			} forEach _objects;
			
			// Remove unauthorized gear from the player.
			//[_backpacks, _weapons, _items] execVM "SOS\VirtualArsenal\removeUnauthorizedGear.sqf";
		};
	};
};