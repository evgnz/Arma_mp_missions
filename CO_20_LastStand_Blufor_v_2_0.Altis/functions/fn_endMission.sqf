/*
  File: fn_endMission.sqf
  Author:	Evgeny Chumichev
  Description: Tickets exhausted ending
*/

#include "scriptComponent.hpp"

if (GET_VAR("var_scriptRunning","") == _fnc_scriptName) exitWith {};
SET_VAR("var_scriptRunning",_fnc_scriptName);

waitUntil {
  sleep 10; 
  count ALIVE_PLAYERS isEqualTo 0
};

if (ALL_PLAYERS findIf {[_x, 0, true] call bis_fnc_respawntickets > 0} == -1) then {
  ["End2", false] remoteExec ["BIS_fnc_endMission"];
} else {
  SET_VAR("var_scriptRunning","");
};

true
