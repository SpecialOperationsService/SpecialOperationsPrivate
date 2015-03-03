class Weather_Overcast {
	title		= "Weather: Overcast (100% means storms and rain are very likely)";
	values[]	= {0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
	texts[]		= {"0%", "10%", "20%", "30%", "40%", "50%", "60%", "70% (Default)", "80%", "90%", "100%"};
	default		= 70;
};

class Weather_Fog {
	title		= "Weather: Fog";
	values[]	= {0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
	texts[]		= {"0%", "10%", "20% (Default)", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%"};
	default		= 20;
};

class Weather_Rain {
	title		= "Weather: Rain (is not possible when overcast is less than 70%)";
	values[]	= {0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
	texts[]		= {"0%", "10% (Default)", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%"};
	default		= 10;
};