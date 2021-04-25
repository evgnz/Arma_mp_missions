/*
  File: fn_addSupply.sqf
  Author:	Evgeny Chumichev
  Description: Supply drop service provider
*/

#include "scriptComponent.hpp"

params [
  ["_caller", objNull, [objNull]], 
  ["_position", SECTOR_POS, [[]]]
];

private _class = ["B_Heli_Transport_01_camo_F", "RHS_UH60M_d"] select ADDONS_LOADED;
private _smoke = createvehicle ["SmokeShellYellow", _position, [], 0, "NONE"];
SET_VAR("drop_pos",getPosWorld _smoke);

SL_fnc_drop = {
  params ["_heli"];
  private _crate = createVehicle ["B_CargoNet_01_ammo_F", [0, 0, 0], [], 0, "NONE"];
  private _chute = "B_Parachute_02_F" createVehicle [0, 0, 0];
  private _dropPos = GET_VAR("drop_pos",[]); _dropPos set [2, 300];
  _chute setPosWorld _dropPos;
  _crate attachTo [_chute, [0, 0, 0]];
  _crate disableCollisionWith _chute;
  _crate spawn {
    _this call SL_fnc_suppCrate;
    waitUntil {sleep 0.5; (getPosATLVisual _this select 2) <= 3};
    detach _this;
  };
  [_heli, 9] remoteExec ["SL_fnc_supportProvider", JTAC_player];
  true
};

private _start = [worldSize / 2, worldSize / 2, 500];
private _heli  = createVehicle [_class, _start, [], 0, "FLY"]; 
private _group = [_heli, WEST, true] call SL_fnc_createVehicleCrew;

_heli doMove _position;
_heli flyInHeight 450;
[_heli, 8] remoteExec ["SL_fnc_supportProvider", JTAC_player];

private _wpDrop = _group addWaypoint [_position, 0];
_wpDrop setWaypointType "MOVE";
_wpDrop setWaypointCombatMode "BLUE";
_wpDrop setWaypointBehaviour "CARELESS";
_wpDrop setWaypointStatements ["TRUE", "vehicle this call SL_fnc_drop"];

private _wpExit = _group addWaypoint [_start, 0];
_wpExit setWaypointType "MOVE";
_wpExit setWaypointStatements ["TRUE", "{deleteVehicle _this} forEach ((units group this) + [vehicle this])"];

true
