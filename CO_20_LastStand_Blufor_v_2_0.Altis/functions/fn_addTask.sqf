/*
  File: fn_addTask.sqf
  Author:	Evgeny Chumichev
  Description: Mission tasks
*/

#include "scriptComponent.hpp"

private _sector = GET_VAR("s_sector",objNull);
private _currentWave = GET_VAR("GVAR_swave",0);

if (_currentWave <= GET_VAR("EvacWave",5)) then {
  private _number = format ["%1", _currentWave];
  private _desc = [TASK_WAVE_DESC, [TASK_WAVE_TITLE, _number call bis_fnc_romanNumeral], ""];
  private _round = format ["task_%1", _currentWave];
  private _taskId = [_round, true, _desc, _sector getPos [0, 0], "AUTOASSIGNED", 1, true, true, "defend"] call bis_fnc_setTask;	
  
  SET_GVAR("GVAR_taskID",_taskId);

  if (_taskId isEqualTo "task_1") then {
    [0] call SL_fnc_conversations;
  };
} else {
  if (simulationEnabled _sector) then {
    _sector enableSimulationGlobal false;
    private _taskId = ["call_Heli", true, TASK_CALL_DESC, [], "ASSIGNED", 1, true, true, "radio"] call bis_fnc_setTask;
    [2] call SL_fnc_conversations;
  };
};

[] remoteExec ["SL_fnc_addSupport", ALL_PLAYERS];

true
