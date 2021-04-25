/*
  File: fn_missionOutro.sqf
  Author:	Evgeny Chumichev
  Description: Last stand round epic ending
*/

#include "scriptComponent.hpp"

if !(local player) exitWith {};

player spawn {
  disableSerialization;
  params ["_unit"];

  cutText ["","BLACK OUT"];
  playSound "vr_goggles";
  10 fadeMusic 0;
  
  enableEnvironment [false, false];
  showHUD [false, false, false, false, false, false, false, false];	
  UI_HIDE;
  uiSleep 5;

private _scriptLoading = [
  [[localize "STR_outro_loading","<t align='left' shadow ='1' size ='0.85' font='PuristaMedium'>%1</t><br/>"]], 
  0.015 * CTRL_W_X, 0.015 * CTRL_H_Y
] spawn SL_fnc_typeTextX;

  if (alive _unit) then {
    private _anim = format ["Acts_AidlPercMstpSlowWrflDnon_warmup_%1", 1 + floor (random 7)];
    _unit switchMove _anim;
    _unit playMove _anim;
  };
  
  if (visibleMap) then {openMap [false, false]};	
  waitUntil {uiSleep 0.5; isNull _scriptLoading};
  private _splendidScript = [[14175.5,21233.9,0], 100, random [240, 250, 260], [], 500, false, true] spawn SL_fnc_splendidShot;
  uiSleep 5;

  private _dateParam = date params ["_year", "_month", "_day", "_hour", "_minute"];
  private _dateText = format [" %1-%2-%3 ", _year, _month, _day];
  private _timeText = format ["%1:%2", _hour, _minute];
  private _scriptText = [[
    [localize "STR_outro_sirep","<t align='left' shadow ='1' size ='0.85' font='PuristaMedium'>%1</t><br/>"],
    [format [localize "STR_outro_date", _dateText, _timeText],"<t align='left' shadow ='1' size ='0.85' font='PuristaMedium'>%1</t><br/>"],
    [localize "STR_outro_location","<t align='left' shadow ='1' size ='0.85' font='PuristaMedium'>%1</t><br/>"],
    [format [localize "STR_text_grid", mapGridPosition _unit],"<t align='left' shadow ='1' size ='0.85' font='PuristaMedium'>%1</t><br/>"],
    [localize "STR_outro_inArea","<t align='left' shadow ='1' size ='0.85' font='PuristaMedium'>%1</t><br/>"],
    [format [localize "STR_outro_inAreaEast", count (allUnits select {side _x isEqualTo east})],
    "<t align='left' shadow ='1' size ='0.85' font='PuristaMedium'>%1</t><br/>"],
    [format [localize "STR_outro_inAreaWest", count playableUnits],
    "<t align='left' shadow ='1' size ='0.85' font='PuristaMedium'>%1</t><br/>"]
  ], 0.015 * CTRL_W_X, 0.015 * CTRL_H_Y] spawn SL_fnc_typeTextX;

  private _scriptTitles = [] spawn {
    private _fnc_typeText = {
      private _ctrlText = MISSION_DISPLAY ctrlCreate ["RscStructuredText", -1];
      _ctrlText ctrlSetPosition [0.628906 * CTRL_W_X, 0.94 * CTRL_H_Y, 0.355781 * safeZoneWAbs, 0.05 * safezoneH];
      _ctrlText ctrlSetStructuredText parseText format ["<t font='PuristaMedium' align='center'>%1</t>", toUpper _this];
      _ctrlText ctrlCommit 0;
      playSound "hintExpand";
      _ctrlText ctrlSetPosition [0.628906 * CTRL_W_X, 0.016 * CTRL_H_Y, 0.355781 * safeZoneWAbs, 0.05 * safezoneH];
      _ctrlText ctrlCommit 20;
      waitUntil {ctrlCommitted _ctrlText};
      ctrlDelete _ctrlText;
    };

    private _playersNames = ALL_PLAYERS apply {format ["%1 %2", rank _x, name _x]};
    private _listTitles = OUTRO_AI_LIST;
    _listTitles deleteRange [0, count _playersNames];
    _listTitles append _playersNames;
    {_x spawn _fnc_typeText; uiSleep 2;} forEach _listTitles;
  };

  private _ctrlFrame = MISSION_DISPLAY ctrlCreate ["RscBackground", -1];
  _ctrlFrame ctrlSetPosition [0.62 * CTRL_W_X, -0.028 * CTRL_H_Y, 0.355781 * safeZoneWAbs, 1.067 * safezoneH];
  _ctrlFrame ctrlSetBackgroundColor [0, 0, 0, 0.35];
  _ctrlFrame ctrlSetFade 1;
  _ctrlFrame ctrlCommit 0;
  playSound "hintExpand";

  _ctrlFrame ctrlSetFade 0;
  _ctrlFrame ctrlCommit 10;

  waitUntil {isNull _scriptText && {isNull _scriptTitles}};
  _ctrlFrame ctrlSetFade 1;
  _ctrlFrame ctrlCommit 20;
  
  waitUntil {ctrlCommitted _ctrlFrame};
  [[
    [localize "STR_victory","<t align='left' shadow ='1' size ='0.85' font='PuristaMedium'>%1</t>"]
  ], 0.015 * CTRL_W_X, 0.015 * CTRL_H_Y] call SL_fnc_typeTextX;

  cutRsc ["RscStatic", "PLAIN"];
  playSound "Spawn";
  uiSleep 2;
  
  playSound "vr_shutdown";
  ["End1", true, 5] remoteExec ["BIS_fnc_endMission"];
};
