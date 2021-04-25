/*
  File: fn_splendidShot.sqf
  Author:	Evgeny Chumichev
  Description: Splendid fake UAV splendid camera
*/

#include "scriptComponent.hpp"

params [
  ["_target", objNull, [objNull, []]],
  ["_altitude", 100, [0]], 
  ["_radius", 250, [0]],
  ["_icons", [], [[]]], 
  ["_runTime", 40, [0]],
  ["_interruptible", true, [false]],
  ["_worldScene", false, [true]],
  ["_ppTemplate", true, [false]]
];

disableSerialization;

titleCut ["", "BLACK FADED", 10e10]; 
SET_VAR("SL_splendidShot_playing",true);

private _position = _target getPos [_radius, random 360];
_position set [2, _altitude];

private _camera = "camera" camCreate _position;
_camera cameraEffect ["internal", "back"]; 
_camera camPrepareFOV 0.9;
_camera camPrepareTarget _target;
_camera camCommitPrepared 0;

waitUntil {camCommitted _camera};
if (_ppTemplate) then {
  ["introPPTemplate", 0, false] call BIS_fnc_setPPeffectTemplate
};

private _hours = date param [3]; 
camUseNVG (_hours > 19 || _hours < 5);
showHUD [true, false, false, false, false, false, false, true];
cameraEffectEnableHUD true;
showCinemaBorder false;
showChat true; 

titleCut ["", "PLAIN"]; 
0 cutRsc ["RscStatic", "PLAIN"];
1 cutRsc ["RscInterlacing", "PLAIN"];
2 cutRsc ["RscEstablishingShot", "PLAIN"];
playSound "Spawn";

private _startTime = time;
uiNamespace setVariable ["SL_skipEH_skiped", false];
uiNamespace setVariable ["SL_skipEH_stoped", false];

private _cameraAnims = [_camera, _target, _radius, _altitude] spawn {
  params ["_camera", "_target", "_radius", "_altitude"];
  while {!isNull _camera} do {
    private _position = _target getPos [_radius, (_target getdir _camera) + 0.1];
    _position set [2, _altitude];
    _camera camPreparePos _position;
    _camera camCommitPrepared 0.05;
  };
};

private _cameraSounds = _camera spawn {
  while {!isNull _this} do {
    private _sound = format ["UAV_0%1", round (1 + random 8)];
    private _duration = getNumber (configFile >> "CfgSounds" >> _sound >> "duration");
    playSound _sound;
    uiSleep _duration;
  };
};

if !(_icons isEqualTo []) then {
  uiNamespace setVariable ["draw_icons", _icons];
  private _drawEH = addMissionEventHandler ["Draw3D", {
    {
      _x params ["_texture", "_color", "_pos", "_width", "_height", "_angle", "_text", "_shadow"];
      drawIcon3D [_texture, _color, _pos, _width, _height, _angle, _text, _shadow];
    } forEach (uiNamespace getVariable ["draw_icons", []]);
  }];
  uiNamespace setVariable ["drawEH", _drawEH];
};

if (_interruptible) then {
  private _skipEH = MISSION_DISPLAY displayAddEventHandler ["KeyDown", {
    params ["_display", "_key"];
    if (_key in [57]) then {
      _display displayRemoveEventHandler ["KeyDown", uiNamespace getVariable ["SL_skipEH", nil]];
      uiNamespace setVariable ["SL_skipEH_skiped", true];
      uiNamespace setVariable ["SL_skipEH", nil];
      playSound "click";
    };
  }];
  uiNamespace setVariable ["SL_skipEH", _skipEH];
};

if (_worldScene) exitWith {};

_runTime spawn {
  params ["_delay"];
  uiSleep _delay; 
  uiNamespace setVariable ["SL_skipEH_stoped", true];
};

waitUntil {
  uiSleep 0.5;
  (uiNamespace getVariable ["SL_skipEH_skiped", false]) || 
  (uiNamespace getVariable ["SL_skipEH_stoped", false])
};

if (!isNil {uiNamespace getVariable "SL_skipEH"}) then {
  MISSION_DISPLAY displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "SL_skipEH"];
  uiNamespace setVariable ["SL_skipEH", nil];
};

if (!isNil {uiNamespace getVariable "drawEH"}) then {
  removeMissionEventHandler ["Draw3D", uiNamespace getVariable "drawEH"];
  uiNamespace setVariable ["draw_icons", nil];
  uiNamespace setVariable ["drawEH", nil];
};

playSound "Spawn";
cutText ["", "BLACK OUT"];

{_x cutFadeOut 0} forEach [0, 1, 2];
showHUD [true, true, true, true, true, true, true, true];
if (_ppTemplate) then {["Default", 0, false] call BIS_fnc_setPPeffectTemplate};

_camera cameraEffect ["terminate", "back"];
camDestroy _camera;

SET_VAR("SL_splendidShot_playing",false);
cutText ["","BLACK IN", 3]; 

true
