/*
	Script changes overcast, fog and rain by using the defined values from the mission parameters.

	Created by Lux0r
*/


// Run this script only on server-side.
if (isServer) then {
	_weather_overcast	= ["Weather_Overcast", 10] call BIS_fnc_getParamValue;
	_weather_fog		= ["Weather_Fog", 0] call BIS_fnc_getParamValue;
	_weather_rain		= ["Weather_Rain", 0] call BIS_fnc_getParamValue;

	0 setOvercast (_weather_overcast / 100);
	0 setFog (_weather_fog / 100);
	0 setRain (_weather_rain / 100);
	forceWeatherChange;
};