/*
  File: fn_sectorCaptured.sqf
  Author:	Evgeny Chumichev
  Description: Sector module expression
*/

#include "scriptComponent.hpp"

params ["_sector", "_owner"];

if (_owner isEqualTo EAST) then {
  if (simulationEnabled _sector) then {_sector enableSimulationGlobal false};
  [setPlayerRespawnTime 1e10] remoteExec ["spawn"]; 
  
  sleep 5;
  [GET_VAR("GVAR_taskID",""), "FAILED"] remoteExec ["BIS_fnc_taskSetState"];	

  sleep 5;
  ["End3", false] remoteExec ["BIS_fnc_endMission"]; 
};

true
