/*
  File: fn_intro.sqf
  Author:	Evgeny Chumichev
  Description: Intro 
*/

#include "scriptComponent.hpp"

params ["_unit"];

disableSerialization;
waitUntil {!isNull MISSION_DISPLAY};
titleCut ["", "BLACK FADED", 10e10];

0 fademusic 0; 
playMusic ["Track02_SolarPower", 58];
15 fademusic 0.5;

waitUntil {visibleMap};
openMap [false, false];
setViewDistance -1;

private _splendidScript = [[14175.5,21233.9,0], 100, CRAND(240,250,260), INTRO_ICONS] spawn SL_fnc_splendidShot;
private _ctrlSitrep = MISSION_DISPLAY ctrlCreate ["RscStructuredText", -1];
_ctrlSitrep ctrlSetPosition [0.00396872 * CTRL_W_X, 0.00720002 * CTRL_H_Y, 0.325 * safezoneW, 0.09 * safezoneH];
_ctrlSitrep ctrlSetStructuredText parseText format ["<t font='PuristaMedium'>%1</t>", localize "STR_outro_sirep"];

private _ctrlBackGround = MISSION_DISPLAY ctrlCreate ["RscBackground", -1];
_ctrlBackGround ctrlSetPosition [0.0617187 * CTRL_W_X, 0.126 * CTRL_H_Y, 0.0257812 * safeZoneWAbs, 0.044 * safezoneH];
_ctrlBackGround ctrlSetBackgroundColor [0, 0, 0, 0.09];

private _ctrlLogo = MISSION_DISPLAY ctrlCreate ["RscPicture", -1];
_ctrlLogo ctrlSetPosition [0.0617187 * CTRL_W_X, 0.126 * CTRL_H_Y, 0.0257812 * safeZoneWAbs, 0.044 * safezoneH];
_ctrlLogo ctrlSetText CTRL_INT_LOGO;
_ctrlLogo ctrlSetTextColor [1, 0.72, 0.25, 1];

private _ctrlPicture = MISSION_DISPLAY ctrlCreate ["RscPicture", -1];
_ctrlPicture ctrlSetPosition [0.025625 * CTRL_W_X, 0.126 * CTRL_H_Y, 0.03 * safeZoneWAbs, 0.066 * safezoneH];
_ctrlPicture ctrlSetText CTRL_INT_IMAGE;

private _ctrlTextMission = MISSION_DISPLAY ctrlCreate ["RscStructuredText", -1];
_ctrlTextMission ctrlSetPosition [0.0905937 * CTRL_W_X, 0.126 * CTRL_H_Y, 0.09 * safeZoneWAbs, 0.066 * safezoneH];
_ctrlTextMission ctrlSetBackgroundColor [0, 0, 0, 0.55];
_ctrlTextMission ctrlSetStructuredText parseText format [
  "<t align='left'>%1<br/>%2<br/>%3</t>", localize "STR_introMission", localize "STR_introGM", localize "STR_introSIDES"
];

private _ctrlSuppIcons = MISSION_DISPLAY ctrlCreate ["RscStructuredText", -1];
_ctrlSuppIcons ctrlSetPosition [0.327781 * CTRL_W_X, 0.2008 * CTRL_H_Y, 0.0134062 * safeZoneWAbs, 0.0924 * safezoneH];
_ctrlSuppIcons ctrlSetStructuredText parseText CTRL_INT_ICONS;

private _ctrlTextRules = MISSION_DISPLAY ctrlCreate ["RscStructuredText", -1];
_ctrlTextRules ctrlSetPosition [0.0905937 * CTRL_W_X, 0.1991 * CTRL_H_Y, 0.115 * safeZoneWAbs, 0.045 * safezoneH];
_ctrlTextRules ctrlSetBackgroundColor [0, 0, 0, 0.55];
_ctrlTextRules ctrlSetStructuredText parseText format [localize "STR_introRules", missionNamespace getvariable ["EvacWave", 5]];

private _ctrlSkip = MISSION_DISPLAY ctrlCreate ["RscStructuredText", -1];
private _keyColor = format ["<t color = '%1'>", ["GUI", "BCG_RGB"] call BIS_fnc_displayColorGet call BIS_fnc_colorRGBtoHTML];
private _skipText = format [
  localize "STR_A3_BIS_fnc_titlecard_pressSpace", "<t align= 'center' font='PuristaMedium'>", 
  _keyColor, "</t>", "</t>"
];

_ctrlSkip ctrlSetPosition CTRL_SKIP;
_ctrlSkip ctrlSetStructuredText parseText _skipText;
_ctrlSkip ctrlSetBackgroundColor [0, 0, 0, 0.55];

{CTRL_HIDE(_x)} forEach [_ctrlPicture, _ctrlTextMission, _ctrlTextRules, _ctrlLogo, _ctrlBackGround, _ctrlSuppIcons, _ctrlSitrep, _ctrlSkip];

private _animScript = [_ctrlPicture, _ctrlTextMission, _ctrlTextRules, _ctrlLogo, _ctrlBackGround, _ctrlSuppIcons, _ctrlSitrep, _ctrlSkip] spawn {
  params ["_ctrlPicture", "_ctrlTextMission", "_ctrlTextRules", "_ctrlLogo", "_ctrlBackGround", "_ctrlSuppIcons", "_ctrlSitrep", "_ctrlSkip"];

  uiSleep CRAND(2,3,4);
  CTRL_SHOW(_ctrlSitrep,0);

  uiSleep FRAND(2,3,4);  
  {CTRL_SHOW(_x,0)} forEach [_ctrlPicture, _ctrlTextMission];

  _ctrlPicture ctrlSetPosition [0.025625 * CTRL_W_X, 0.126 * CTRL_H_Y, 0.061875 * safeZoneWAbs, 0.066 * safezoneH];
  _ctrlTextMission ctrlSetPosition [0.0905937 * CTRL_W_X, 0.126 * CTRL_H_Y, 0.180469 * safeZoneWAbs, 0.066 * safezoneH];
  _ctrlTextRules ctrlSetPosition [0.0905937 * CTRL_W_X, 0.1991 * CTRL_H_Y, 0.23478 * safeZoneWAbs, 0.0958 * safezoneH];
  _ctrlBackGround ctrlSetPosition [0.0617187 * CTRL_W_X, 0.1991 * CTRL_H_Y, 0.0257812 * safeZoneWAbs, 0.044 * safezoneH];
  _ctrlLogo ctrlSetPosition [0.0617187 * CTRL_W_X, 0.1991 * CTRL_H_Y, 0.0257812 * safeZoneWAbs, 0.044 * safezoneH];
  _ctrlSuppIcons ctrlSetPosition [0.32425 * CTRL_W_X, 0.203 * CTRL_H_Y, 0.025 * safeZoneWAbs, 0.0958 * safezoneH];
  _ctrlPicture ctrlCommit 0.25; 
  _ctrlTextMission ctrlCommit 0.5; 

  uiSleep FRAND(2,3,4); 
  CTRL_SHOW(_ctrlLogo,0.25); 
  CTRL_SHOW(_ctrlBackGround,0); 

  uiSleep FRAND(1,2,3); 
  CTRL_SHOW(_ctrlTextRules,0.25); 
  CTRL_SHOW(_ctrlSuppIcons,0.5); 
  
  uiSleep FRAND(2,3,4); 
  CTRL_SHOW(_ctrlSkip,0);	

  waitUntil {
    uiSleep 0.5;
    (uiNamespace getVariable ["SL_skipEH_skiped", false]) || 
    (uiNamespace getVariable ["SL_skipEH_stoped", false])
  };

  {ctrlDelete _x} forEach [_ctrlPicture, _ctrlTextMission, _ctrlTextRules, _ctrlLogo, _ctrlBackGround, _ctrlSuppIcons, _ctrlSitrep, _ctrlSkip];
};

waitUntil {!isNil "SL_splendidShot_playing" && {!(GET_VAR("SL_splendidShot_playing",false))}};
{ctrlDelete _x} forEach [_ctrlPicture, _ctrlTextMission, _ctrlTextRules, _ctrlLogo, _ctrlBackGround, _ctrlSuppIcons, _ctrlSitrep, _ctrlSkip];
if !(isNull _animScript) then {terminate _animScript}; 

openMap [true, true];
waitUntil {uiSleep 1; visibleMap};
mapAnimAdd [1, 0.005, [14175, 21219.6, 0]];
mapAnimCommit;
0 fadeSound 0;

private _viewDistance = GET_PARAM("ViewDistance");
setObjectViewDistance _viewDistance;
setViewDistance (_viewDistance + 125);

if (_unit isEqualTo (missionNamespace getVariable ["JTAC_player", objNull])) then {
  [["Support", "CallSupport"]] call BIS_fnc_advHint;
};

if (isNull DISPLAY_STATUS) then {
  RSC_LAYER_PROGRESS cutRsc ["RscMPProgress", "PLAIN", 0, true];
};

call SL_fnc_drawIcons
