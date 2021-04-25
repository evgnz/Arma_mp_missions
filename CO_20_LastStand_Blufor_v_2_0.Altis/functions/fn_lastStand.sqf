/*
  File: fn_lastStand.sqf
  Author:	Evgeny Chumichev
  Description: Last stand round mission flow
*/

#include "scriptComponent.hpp"

GET_CLASSES params ["_randomGroups", "_classesList", "_transportList"];

private _sector = GET_VAR("s_sector",objNull);
if (simulationEnabled _sector) then {_sector enableSimulationGlobal false};

private _fnc_checkWin = {
  waitUntil {
    sleep 10;
    count ALIVE_PLAYERS >= 1 && 
    count EAST_ALIVE <= FRAND(3,4,5)
  };

  SET_GVAR("GVAR_mission_completed",1);
  {_x setDamage 1} foreach EAST_ALIVE;

  [[], 
  {
    private _start = addMusicEventHandler ["MusicStart", {
      params ["_className", "_handlerID"];
      0 fademusic 0;
      5 fademusic 0.7;
      removeMusicEventHandler ["MusicStart", _handlerID];
    }];
    playMusic ["LeadTrack01c_F", 55];
  }] remoteExec ["call", ALL_PLAYERS];

  sleep SW_DELAY; 
  ["lastStand", "SUCCEEDED"] remoteExec ["BIS_fnc_taskSetState"]; 

  sleep (SW_DELAY / 2);
  [] remoteExec ["SL_fnc_missionOutro", ALL_PLAYERS];
};

private _fnc_checkFailed = {
  waitUntil {sleep 10; count ALIVE_PLAYERS isEqualTo 0};
  ["lastStand", "FAILED"] remoteExec ["BIS_fnc_taskSetState"]; 

  sleep SW_DELAY; 
  ["End2", false] remoteExec ["BIS_fnc_endMission"];
};

sleep SW_DELAY;
[setPlayerRespawnTime 1e10] remoteExec ["spawn", ALL_PLAYERS, true]; 

private _id = ["lastStand", true, TASK_LWAVE_DESC, [], "AUTOASSIGNED", 1, true, true, "defend"] call bis_fnc_setTask;
[] remoteExec ["SL_fnc_resetTickets", ALL_PLAYERS, true];
[] spawn _fnc_checkFailed;
[] spawn _fnc_checkWin;

sleep SW_DELAY;

for "_i" from 1 to (DIFF_INF_NUMBER - 2) do {		
  private _infantry = [RAND(INF_POS), east, RAND(_randomGroups)] call BIS_fnc_spawnGroup;
  [_infantry, SECTOR_POS] call SL_fnc_taskAttack;
};

true