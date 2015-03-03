class Combat_Patrol_Generator_Functions {
	tag = "CPG";
	
	class Common {
		file = "CombatPatrolGenerator\Common";
		class addToBlacklist {};
		class createAirAmbush {};
		class rearmAA {};
	};
	
	class DSM {
		file = "CombatPatrolGenerator\DSM";
		class mainHQ {};
		class SideMission_0 {};
		class SideMission_1 {};
		class SideMission_2 {};
		class SideMission_3 {};
		class SideMission_4 {};
		class SideMission_5 {};
		class SideMission_6 {};
		class SideMission_7 {};
		class SideMission_8 {};
		class SideMission_9 {};
		class SideMission_10 {};
		class SideMission_11 {};
		class SideMission_12 {};
		class SideMission_13 {};
		class SideMission_14 {};
	};
	
	class Markers {
		file = "CombatPatrolGenerator\Markers";
		class createIntelMarker {};
		class createMarker {};
		class updateJIPMarkers {};
		class createPatrolMarker {};
	};
	
	class Spawn {
		file = "CombatPatrolGenerator\Spawn";
		class chooseGroupConfig {};
		class chooseTactic {};
		class spawnVehicles {};
		class startPopulating {};
	};
};