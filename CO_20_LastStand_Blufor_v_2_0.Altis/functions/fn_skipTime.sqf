/*
  File: fn_skipTime.sqf
  Author:	Evgeny Chumichev
  Description: Skips time with... style
*/

#include "scriptComponent.hpp"

if (isServer) then {
  private _oldDate = date;
  private _newDate = param [0, _oldDate];
  private _hours = _oldDate param [2];
  private _steps = [CRAND(5,10,20), 5] select (_hours < 5);

  _steps spawn {
    sleep 3;
    skipTime _this;
    0 setFog (0 + random 0.2);
    call SL_fnc_cleanUp;
  };
  SET_GVAR(SKIP_VALUE,_steps);
};

if (hasInterface) exitWith {
  private _showFX = [] spawn {
    disableSerialization;
    cutText ["","BLACK OUT"]; 
    UI_HIDE;

    private _volume = soundVolume;
    private _textLayer = "SL_layer_time" call BIS_fnc_rscLayer;
    _textLayer cutRsc ["RscDynamicText", "PLAIN"];

    2 fadeSound 0;

    private _layerTime = uiNamespace getVariable "BIS_dynamicText";	
    private _ctrlTime = _layerTime displayCtrl 9999;
    _ctrlTime ctrlSetPosition [0 * CTRL_W_X, 0.475 * CTRL_H_Y, safeZoneWAbs, safeZoneH];
    _ctrlTime ctrlSetFade 1;
    _ctrlTime ctrlCommit 0;
    
    sleep (SW_DELAY / 2);
    
    private _textLater = "<t align = 'center' size = '1.25' font = 'PuristaMedium'>" + (toUpper localize "STR_skip_time_hours") + "</t>";
    private _parsedTime = parseText format [_textLater, round GET_VAR(SKIP_VALUE,0)];
    _ctrlTime ctrlSetStructuredText _parsedTime;
    _ctrlTime ctrlSetFade 0;
    _ctrlTime ctrlCommit 2;

    sleep SW_DELAY;

    _ctrlTime ctrlSetFade 1;
    _ctrlTime ctrlCommit 2;

    waitUntil {ctrlCommitted _ctrlTime};
    _textLayer cutFadeOut 0;
    2 fadeSound _volume;			
  };

  waitUntil {isNull _showFX};
  private _reward = GET_PARAM("TicketsRewards");
  if ([player, _reward] call BIS_fnc_respawnTickets >= 1) then {
    setPlayerRespawnTime (GET_PARAM("RespawnTime"));
  };
  sleep 5;
  cutText ["","BLACK IN"];
  UI_SHOW; 	
};	

true