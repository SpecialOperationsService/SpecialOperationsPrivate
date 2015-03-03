_heli = _this select 0; 


_heli addAction ["<t color='#4169E1'>Open Slidedoors</t>", "panda_doors\doors_mohawk\Doors_back.sqf",1,6,false,true,"","(_target animationPhase 'Door_back_R' == 0) && (_target animationPhase 'Door_back_L' == 0) && ((_this distance _target) < 7)"];  

_heli addAction ["<t color='#CFCF44'>Close Slidedoors</t>", "panda_doors\doors_mohawk\Doors_back.sqf",0,6,false,true,"","(_target animationPhase 'Door_back_R' == 1) && (_target animationPhase 'Door_back_L' == 1) && ((_this distance _target) < 7)"]; 


sleep 1;