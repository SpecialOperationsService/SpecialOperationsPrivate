_heli = _this select 0; 


//rechte tür
_heli addAction ["<t color='#4169E1'>Open right Slidedoor</t>", "panda_doors\doors_ghosthawk\Doors_R.sqf",1,6,false,true,"","(_target animationPhase 'Door_R' == 0) && ((_this distance _target) < 6)"];  

_heli addAction ["<t color='#CFCF44'>Close right Slidedoor</t>", "panda_doors\doors_ghosthawk\Doors_R.sqf",0,6,false,true,"","(_target animationPhase 'Door_R' == 1) && ((_this distance _target) < 6)"]; 


//linke tür
_heli addAction ["<t color='#4169E1'>Open left Door</t>", "panda_doors\doors_ghosthawk\Doors_L.sqf",1,6,false,true,"","(_target animationPhase 'Door_L' == 0) && ((_this distance _target) < 6)"];  

_heli addAction ["<t color='#CFCF44'>Close left Door</t>", "panda_doors\doors_ghosthawk\Doors_L.sqf",0,6,false,true,"","(_target animationPhase 'Door_L' == 1) && ((_this distance _target) < 6)"]; 

sleep 1;