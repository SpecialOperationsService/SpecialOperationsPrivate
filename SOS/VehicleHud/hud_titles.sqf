class infomessage {
	idd = 101;
	movingEnable=0;
	duration = 1000000000;
	fadeIn=0;
	name="infomessage";
	controlsBackground[] = {"crewtext"};
	onLoad = "uiNamespace setVariable ['crewdisplay', _this select 0];";
	onUnload = "uiNamespace setVariable ['crewdisplay', objNull];";
	class crewtext {
		idc = 102;
		type = CT_STRUCTURED_TEXT;
		style = ST_RIGHT;
		x = safeZoneX;
		y = (safeZoneY + 0.4);
		w = safeZoneW;
		h = 0.5;
		size = 0.02;
		colorBackground[] = {0,0,0,0};
		colorText[] = {0,0,0,0.8};
		text ="";
		class Attributes {
			align = "right";
			vAlign = "middle";
			size = "1";
			shadow = true;
			shadowColor = "#2D2D2D";
		};
	};
};

class infomessage2 {
	idd = 103;
	movingEnable=1;
	duration = 10000000;
	fadeIn=0;
	name="infomessage2";
	controlsBackground[] = {"platoontext"};
	onLoad = "uiNamespace setVariable ['hud_platoonDisplay', _this select 0];";
	onUnload = "uiNamespace setVariable ['hud_platoonDisplay', objNull];";
	class platoontext {
		idc = 104;
		type = CT_STRUCTURED_TEXT;
		style = ST_LEFT;
		x = safeZoneX;
		y = (safeZoneY + 0.03);
		w = safeZoneW;
		h = 1.5;
		size = 0.02;
		colorBackground[] = {0,0,0,0};
		colorText[] = {0,0,0,0.8};
		text ="";
		class Attributes {
			align = "left";
			vAlign = "middle";
			size = "1";
			shadow = true;
			shadowColor = "#2D2D2D";
		};
	};
};