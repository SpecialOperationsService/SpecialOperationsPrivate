//While Loop for Uniform and Insignia. By Catshannon [S.O.S]

while {true} do {
	switch (uniform player) do {
		case "U_B_CombatUniform_mcam";
		case "U_B_CombatUniform_mcam_vest";
		case "U_B_CombatUniform_mcam_tshirt";
		case "U_B_GhillieSuit":
		{
			player setObjectTextureGlobal [0,"SOS\Textures\Uniform.paa"];
		};
		case "U_I_CombatUniform_shortsleeve";	  
		case "U_I_CombatUniform";
		case "U_I_CombatUniform_tshirt";
		case "U_BG_Guerrilla_6_1";
		case "U_OG_Guerrilla_6_1":
		{
			player setObjectTextureGlobal [0,"SOS\Textures\UniformM.paa"];
		};
	};
	
        //Sorting out insignia bug (version 1.36+)        
		
  		switch (vehicleVarName player) do {

		case "Ghost1_TL";
		case "Ghost1_MMG1";
		case "Ghost1_AT";
		case "Ghost1_CombatEngineer";
		case "Ghost1_Grenadier";
		case "Ghost1_MMG2";
		case "Ghost1_AssistantMMG";
		case "Ghost1_Medic": 
		{		
        [player,"Ghost1"] call BIS_fnc_setUnitInsignia;
		};
		case "Ghost2_TL";
		case "Ghost2_MMG1";
		case "Ghost2_AT";
		case "Ghost2_CombatEngineer";
		case "Ghost2_Grenadier";
		case "Ghost2_MMG2";
		case "Ghost2_AssistantMMG";
		case "Ghost2_Medic":
		{	
		[player,"Ghost2"] call BIS_fnc_setUnitInsignia;
		};		
		case "Anvil_Commander";
		case "Anvil_Driver";
		case "Anvil_Gunner":	
		{	
		[player,"Anvil1"] call BIS_fnc_setUnitInsignia;
		};	
	};
	Sleep 10;
};