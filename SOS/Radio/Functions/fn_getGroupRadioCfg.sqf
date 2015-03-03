/*
	Created by Cenwulf

	Squads radios linked according to this ORBAT: http://i.imgur.com/jcEBXJH.jpg

	returns array
	0: ARRAY - SR Freqs
	1: ARRAY - LR Freqs
	2: ARRAY - Channel setup
		2 0: NUMBER - Group short range channel
		2 1: NUMBER - Group alternate short range channel (not used in current setup included for completeness)
		2 2: NUMBER - Group long range channel
		2 3: NUMBER - Group alternate long range channel
*/

private ["_unit","_grp","_radioCfg"];

_unit = _this select 0;
_grp = group _unit;

// short range frequency arrays
_swFreqsSquad = ["50","50.1","50.2","50.3","50.4","50.5","50.6","50.7"];
_swFreqsPilot = ["50","50.1","50.2","50.3","50.4","50.5","50.6","70.1"];
// long range frequnecy arrays
_lrFreqs = ["60","60.1","60.2","60.3","70","70.1","70.2","70.3","160.1"];

_radioCfg = switch (groupID _grp) do { // Note: When selecting TFR Channels the number refers to an array index NOT the channel number e.g. Channel 1 = 0, Channel 2 = 1...
	case "Platoon Lead":	{[_swFreqsSquad,_lrFreqs,[0,-1,0,4]]}; // -1 for additional (channels index 1 and 3) will result in no additional channel being set.
	case "Ghost Recon":		{[_swFreqsSquad,_lrFreqs,[5,-1,1,0]]};
	case "Ghost 1":			{[_swFreqsSquad,_lrFreqs,[1,-1,1,0]]};
	case "Ghost 2":			{[_swFreqsSquad,_lrFreqs,[2,-1,1,0]]};
	case "Ghost 3":			{[_swFreqsSquad,_lrFreqs,[3,-1,1,0]]};
	case "Ghost 4":			{[_swFreqsSquad,_lrFreqs,[4,-1,1,0]]};
	case "HWT":				{[_swFreqsSquad,_lrFreqs,[6,-1,1,4]]};
	case "Anvil 1":			{[_swFreqsSquad,_lrFreqs,[7,-1,1,4]]};
	case "Reaper 1":		{[_swFreqsPilot,_lrFreqs,[7,-1,5,4]]};
	case "Reaper 2":		{[_swFreqsPilot,_lrFreqs,[7,-1,5,4]]};
	case "Havoc 1":			{[_swFreqsPilot,_lrFreqs,[7,-1,5,4]]};
	default					{[_swFreqsSquad,_lrFreqs,[0,-1,0,4]]};
};

_radioCfg