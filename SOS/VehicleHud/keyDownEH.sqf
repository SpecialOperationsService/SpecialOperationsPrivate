/*
	Add a KeyDown event handler to show/hide the platoon list, with keybinding: "Ctrl+Alt+P".

	Created by Lux0r
*/


systemChat "Show/hide Platoon List";
systemChat "Keybinding: ""Ctrl+Alt+P""";

hud_keyDownEHId = (findDisplay 46) displayAddEventHandler ["KeyDown", {
	private ["_handled","_ctrl","_dikCode","_shiftKey","_ctrlKey","_altKey"];
    _ctrl		= _this select 0;
    _dikCode	= _this select 1;
    _shiftKey	= _this select 2;
    _ctrlKey	= _this select 3;
    _altKey		= _this select 4;
 
    _handled = false;
 
    if (_ctrlKey && _altKey && _dikCode == 25) then {
		hud_showPlatoonList = !hud_showPlatoonList;
		_handled = true;
    };
 
    _handled;
}];