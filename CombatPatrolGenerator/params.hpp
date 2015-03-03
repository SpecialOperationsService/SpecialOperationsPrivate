class PatrolArea_Guerillas {
	title		= "Patrol Generator: OPFOR Gear";
	values[]	= {0, 1, 2};
	texts[]		= {"Random (Default)", "Conventional", "Guerilla"};
	default		= 0;
};

class PatrolArea_Number {
	title		= "Patrol Generator: Number of patrol areas";
	values[]	= {1, 2, 3};
	texts[]		= {"1 patrol area (Default)", "2 patrol areas", "3 patrol areas"};
	default		= 1;
};

class PatrolArea_ShowMarker {
	title		= "Patrol Generator: Show the standard blue Patrol The Area marker?";
	values[]	= {1, 0};
	texts[]		= {"Yes (Default)", "No"};
	default		= 1;
};

class PatrolArea_AutoScale {
	title		= "Patrol Generator: Automatically scale the mission according to the number of players?";
	values[]	= {1, 0};
	texts[]		= {"Yes (Default)", "No"};
	default		= 1;
};

class PatrolArea_RadiusMulti {
	title		= "Patrol Generator: Radius multiplication factor for the patrol area (Only on disabled auto-scale)";
	values[]	= {50, 75, 100, 125, 150, 175, 200};
	texts[]		= {"0.5", "0.75", "1 (Default)", "1.25", "1.5", "1.75", "2"};
	default		= 100;
};

class PatrolArea_Enemies {
	title		= "Patrol Generator: Number of enemies around each patrol area (Only on disabled auto-scale)";
	values[]	= {0, 25, 50, 75, 100, 125, 150, 175, 200, 225, 250, 275};
	texts[]		= {"0-25", "25-50", "50-75", "75-100", "100-125", "125-150 (Default)", "150-175", "175-200", "200-225", "225-250", "250-275", "275-300"};
	default		= 125;
};

class PatrolGenerator_MarkerProb {
	title		= "Patrol Generator: Probability to see enemy positions marked on the map";
	values[]	= {100, 75, 50, 40, 30, 25, 20, 10, 0};
	texts[]		= {"100% of them", "75% of them", "50% of them (Default)", "40% of them", "30% of them", "25% of them", "20% of them", "10% of them", "None"};
	default		= 50;
};

class PatrolGenerator_MarkerTypeProb {
	title		= "Patrol Generator: Probability to know the unit type of marked enemies";
	values[]	= {100, 75, 50, 40, 30, 25, 20, 10, 0};
	texts[]		= {"100% of them", "75% of them", "50% of them (Default)", "40% of them", "30% of them", "25% of them", "20% of them", "10% of them", "None"};
	default		= 50;
};

class PatrolGenerator_VehicleProb {
	title		= "Patrol Generator: Probability factor for enemy vehicle appearance";
	values[]	= {15, 10, 5, 2, 0};
	texts[]		= {"High", "Normal (Default)", "Half", "Low", "Zero"};
	default		= 10;
};

class PatrolGenerator_Mortars {
	title		= "Patrol Generator: Enemy mortars present in the normal troop mix?";
	values[]	= {1, 0};
	texts[]		= {"Yes (Default)", "No"};
	default		= 1;
};

class PatrolGenerator_AirAmbushes {
	title		= "Patrol Generator: Number of enemy air-ambushes (Only on disabled auto-scale)";
	values[]	= {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 20, 25, 30};
	texts[]		= {"0","1","2","3","4","5","6","7","8","9","10","15","20 (Default)","25","30"};
	default		= 20;
};

class SideMissions_Min {
	title		= "Side Missions: Minimum number of side missions (Only on disabled auto-scale)";
	values[]	= {0, 1, 2, 3, 4, 5, 6, 8, 10, 20};
	texts[]		= {"0", "1", "2", "3 (Default)", "4", "5", "6", "8", "10", "15", "20"};
	default		= 3;
};

class SideMissions_Max {
	title		= "Side Missions: Maximum number of side missions (Only on disabled auto-scale)";
	values[]	= {0, 1, 2, 3, 4, 5, 6, 8, 10, 20, 40};
	texts[]		= {"0", "1", "2", "3", "4", "5", "6 (Default)", "8", "10", "15", "20"};
	default		= 6;
};

class SideMissions_ShowMarker {
	title		= "Side Missions: Show Side Mission markers?";
	values[]	= {1, 0};
	texts[]		= {"Yes (Default)", "No"};
	default		= 1;
};

class SideMissions_RadiusMulti {
	title		= "Side Missions: Radius multiplication factor for the Side Missions (Only on disabled auto-scale)";
	values[]	= {50, 75, 100, 125, 150, 175, 200};
	texts[]		= {"0.5", "0.75", "1 (Default)", "1.25", "1.5", "1.75", "2"};
	default		= 100;
};