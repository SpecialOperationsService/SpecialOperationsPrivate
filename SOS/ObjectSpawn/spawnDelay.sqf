/*
	This script reduces the timer for spawning vehicles. It does so roughly every 10 seconds.
	Run this script on the clients.
*/


OS_spawnDelay = 0;

[] Spawn {
	while {true} do {		
		sleep 10;
		
		if (OS_spawnDelay > 0) then {
			OS_spawnDelay = OS_spawnDelay - 10;		
		};
	};
};