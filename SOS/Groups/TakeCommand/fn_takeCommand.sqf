private ["_newLeader","_grp"];
_newLeader = _this select 0;
_grp = group _newLeader;

_grp selectLeader _newLeader;