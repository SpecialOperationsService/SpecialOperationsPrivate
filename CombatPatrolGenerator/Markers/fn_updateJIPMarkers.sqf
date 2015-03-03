/*
	Update markers after a player connects. This should send the markers to all clients and hence said markers should show up for JIPs.

	Dynamically create code that checks if a marker exists and if so, set the marker's position.
	This code checks marker names starting with "m_cpg_intelNo?", "m_cpg_sideMission?" and "m_cpg_mainMission?", where ? is a number.
	
	Edited by Lux0r
*/

diag_log format ["updateJIPMarkers (%1, %2, %3)", _name, _id, _uid];

// Intel markers on enemy locations
for [{_i = 1}, {(getMarkerType (format["m_cpg_intelNo%1", _i])) != ""}, {_i = _i + 1}] do {
	(format["m_cpg_intelNo%1",_i]) setMarkerPos (getMarkerPos (format["m_cpg_intelNo%1", _i]));	
};

// Side missions
for [{_i = 1}, {(getMarkerType (format["m_cpg_sideMission%1", _i])) != ""}, {_i = _i + 1}] do {
	(format["m_cpg_sideMission%1", _i]) setMarkerPos (getMarkerPos (format["m_cpg_sideMission%1", _i]));	
};

// Main missions
for [{_i = 1}, {(getMarkerType (format["m_cpg_mainMission%1", _i])) != ""}, {_i = _i +1 }] do {
	(format["m_cpg_mainMission%1", _i]) setMarkerPos (getMarkerPos (format["m_cpg_mainMission%1", _i]));	
};