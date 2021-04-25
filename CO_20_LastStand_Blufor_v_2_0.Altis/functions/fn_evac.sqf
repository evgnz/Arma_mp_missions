/*
  File: fn_evac.sqf
  Author:	Evgeny Chumichev
  Description: Evac mission flow

  Note:
  The EH typo is "intentional": it is Dammaged with two "m".
  https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Dammaged
*/

#include "scriptComponent.hpp"

private _class = ["B_Heli_Transport_03_F", "RHS_CH_47F_light"] select ADDONS_LOADED;
private _lzPos = [14156.5,21254.6,0];
private _smoke = createvehicle ["smokeshellpurple", _lzPos, [], 5, "CAN_COLLIDE"];
private _heli  = createVehicle [_class, [9063.96,21427.1,0], [], 50, "FLY"]; 
private _group = [_heli, WEST, true] call SL_fnc_createVehicleCrew;

SL_fnc_damaged = {
  params ["_heli"];
  if (({_x in _heli && (!alive _x)} count ALL_PLAYERS) isEqualTo ALL_PLAYERS_NUMBER) then {
    ["End2", false, 5] remoteExec ["BIS_fnc_endMission"];
  } else {
    SET_GVAR("GVAR_lastStand",1);
    [5] call SL_fnc_conversations;
    [] spawn SL_fnc_lastStand;
  };
};

private _ehID = _heli addEventHandler ["Dammaged", {
  params ["_heli", "_selection", "_damage"];
  if (_damage > 0.85) then {
    _heli removeEventHandler ["Dammaged", _thisEventHandler];
    {_heli setHitPointDamage [_x, 1]} forEach ["HitHRotor", "HitFuel", "HitHull"];
    ["evacID", "FAILED"] remoteExec ["BIS_fnc_taskSetState"];
    _heli call SL_fnc_damaged;
  };
}];

private _flares = {
  while {(alive driver _this) && {canMove _this} && {!(isTouchingGround _this)}} do {
    sleep 10; 
    _this action ["useWeapon", _this, driver _this, 0];
  };
};

{_x call SL_fnc_unitInit} forEach units _group;
{_heli lockTurret [_x, true]} forEach allTurrets _heli;
_heli lockDriver true;
_heli setCombatMode "RED";
_heli setBehaviour "COMBAT";

isNil {
  [3] call SL_fnc_conversations;
  ["call_Heli", "SUCCEEDED"] remoteExec ["BIS_fnc_taskSetState"];
};

sleep SW_DELAY;
private _id = ["evacID", true, TASK_EVAC_DESC, _heli, "AUTOASSIGNED", 1, true, true, "move"] call bis_fnc_setTask;

_heli spawn _flares;
_heli move _lzPos;
_heli flyInHeight 50;

waitUntil {
  sleep 5;
  (_heli distance2d _lzPos) <= 1000
};

_heli land "get in";
_heli flyInHeight 0;

isNil {[4] call SL_fnc_conversations};

waituntil {
  sleep 1;
  ({_x in _heli} count playableUnits) isEqualTo PLAYERS_NUMBER
};

_heli move [9063.96,21427.1,0];
_heli flyInHeight 20;

waitUntil {
  sleep 1;
  (_heli distance2d _lzPos) >= 50
};

{_x allowDamage false} forEach (units _group) + [_heli];
{_x setCaptive true} forEach units _group;

_heli setBehaviour "CARELESS";
_heli removeEventHandler ["Dammaged", _ehID];
_heli spawn _flares;

waitUntil {
  sleep 1;
  (_heli distance2d _lzPos) >= 1500
};

sleep SW_DELAY;
isNil {
  [6] call SL_fnc_conversations;
  ["evacID", "SUCCEEDED"] remoteExec ["BIS_fnc_taskSetState"];
};

sleep (SW_DELAY / 2);
["End4", true] remoteExec ["BIS_fnc_endMission"];

true
