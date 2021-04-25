/*
  File: fn_initMission.sqf
  Author:	Evgeny Chumichev
  Description: Sqf version of missionFlow.fsm
*/

#include "scriptComponent.hpp"

GET_CLASSES params ["_randomGroups", "_classesList", "_transportList"];

private _currentWave = GET_VAR("GVAR_swave",0);
private _armoredList = _classesList select (_currentWave min 5);
SET_GVAR("GVAR_swave",INC_VAR(_currentWave,1));

for "_i" from 1 to DIFF_INF_NUMBER do {		
  private _infantry = [RAND(INF_POS), east, RAND(_randomGroups)] call BIS_fnc_spawnGroup;
  [_infantry, SECTOR_POS] call SL_fnc_taskAttack;
};

for "_i" from 1 to DIFF_TRN_NUMBER do {
  private _lightVehicle = createVehicle [RAND(_transportList), RAND(TRANSPORT_POS), [], 15, "NONE"];
  private _vehGroup = [_lightVehicle, east, true] call SL_fnc_createVehicleCrew;
  [_vehGroup, _lightVehicle, _randomGroups] spawn SL_fnc_raid; 
};

for "_i" from 1 to DIFF_ARM_NUMBER do {
  private _armor = createVehicle [RAND(_armoredList), RAND(ARMOR_POS), [], 15, "NONE"];
  private _groupVeh = [_armor, east, true] call SL_fnc_createVehicleCrew;
  [_groupVeh, SECTOR_POS] call SL_fnc_taskAttack;
};

private _lastWave = GET_VAR("EvacWave",5);
if (_currentWave <= (_lastWave + 1)) then {
  if (_currentWave >= 2 && {(random 1) > 0.3}) then {[] spawn SL_fnc_static};
  sleep SW_DELAY;
  isNil {	
    [0] remoteExecCall ["SL_fnc_playMusic", west];
    [] call SL_fnc_addTask;	
  };
};

waitUntil {
  sleep 10; 
  count EAST_ALIVE <= CRAND(3,4,5)
};

if (_currentWave <= _lastWave) then {
  [1] remoteExecCall ["SL_fnc_playMusic", west];
  sleep SW_DELAY;
  
  [GET_VAR("GVAR_taskID",""), "SUCCEEDED"] remoteExec ["BIS_fnc_taskSetState"];
  {_x setDamage 1} foreach EAST_ALIVE;
  
  if (_currentWave isEqualTo 1) then {
    isNil {[1] call SL_fnc_conversations};
  };
  
  sleep SW_DELAY;
  [] remoteExec ["SL_fnc_skipTime"];
};

sleep SW_DELAY;
if (GET_VAR("GVAR_lastStand",0) < 1) exitWith {call SL_fnc_initMission};

true
