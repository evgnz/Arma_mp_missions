/*
  File: fn_earPlugs.sqf
  Author:	Evgeny Chumichev
  Description: Earplugs "API" /s
*/

#include "scriptComponent.hpp"

params ["_unit"];

private _showHint = {
  disableSerialization;
  params ["_mode"];

  private _control  = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
  _control ctrlSetPosition [CTRL_EP_X - 5, CTRL_EP_Y, CTRL_EP_W, CTRL_EP_H];
  _control ctrlSetFade 1;
  _control ctrlCommit 0; 

  private _picture = "<img image='\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\listen_ca' align='left'/>";
  private _stringOut = format ["<t align='left' font='PuristaMedium'> %1</t>", toUpper localize "STR_textEP_OFF"];
  private _stringIn = format ["<t align='left' font='PuristaMedium'> %1</t>", toUpper localize "STR_textEP_ON"];
  private _text = [_stringOut, _stringIn] select _mode;			
  private _textParsed = parseText (_picture + _text);
  _control ctrlSetStructuredText _textParsed; 
  _control ctrlSetBackgroundColor [0, 0, 0, 0.4]; 
  _control ctrlSetPosition [CTRL_EP_X - 0.028, CTRL_EP_Y, CTRL_EP_W, CTRL_EP_H];
  
  _control ctrlSetFade 0;
  _control ctrlCommit 0.5;

  waitUntil {ctrlCommitted _control};
  playSound "zoomin";
  sleep 2;
  
  _control ctrlSetPosition [CTRL_EP_X - 5, CTRL_EP_Y, CTRL_EP_W, CTRL_EP_H];
  _control ctrlCommit 1;
  playSound "zoomOut";

  waitUntil {ctrlCommitted _control};
  ctrlDelete _control; 
};

private _id = _unit addAction [localize "STR_EP_ON", {
  params ["_target", "_caller", "_id", "_showHint"];
  if (soundVolume isEqualTo 1) then {
    2 fadeSound 0.25; 1 spawn _showHint;
    _target setUserActionText [_id, localize "STR_EP_OFF"];
  } else {
    2 fadeSound 1; 0 spawn _showHint;
    _target setUserActionText [_id, localize "STR_EP_ON"];
  };
}, _showHint, -1, false, true, "", "local _target"];

2 fadeSound 1; 

true
