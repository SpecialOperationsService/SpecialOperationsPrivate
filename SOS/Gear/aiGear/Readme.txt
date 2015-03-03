Random AI Gear by Cenwulf [S.O.S]

Version: 0.4

Usage:

Add to description.ext:
class Params {
	#include "SOS\Gear\aiGear\aiGearParams.hpp"
};

class CfgFunctions {
	#include "SOS\Gear\aiGear\functions.hpp"
};


Do one or more of the following:

1.	Execute for individual units or group leaders from unit's init fields:
	nul = [this] execVM "SOS\Gear\aiGear\initAiGearUnit.sqf";

2.	Call from init.sqf for all units (experimental, may not work as intended): 
	[] execVM "SOS\Gear\aiGear\initAiGear.sqf";

3.	Call from init.sqf for all Zeus placed units:
	[] execVM "SOS\Gear\aiGear\initAiGearZeus.sqf";

Just call it for all machines, no need to use if (isServer) or if (!dedicated).