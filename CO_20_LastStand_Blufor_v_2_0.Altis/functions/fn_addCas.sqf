/*
  File: fn_addCas.sqf
  Author:	Evgeny Chumichev
  Description: Support provider service, CAS(Plane) 
*/

#include "scriptComponent.hpp"

params [
  ["_caller", objNull, [objNull]], 
  ["_position", SECTOR_POS, [[]]]
];

private _smoke = createvehicle ["SmokeShellRed", _position, [], 0, "NONE"];
private _start = [worldSize / 2, worldSize / 2, 500];
private _plane = createVehicle ["B_Plane_CAS_01_dynamicLoadout_F", _start, [], 50, "FLY"]; 
private _group = [_plane, WEST, true] call SL_fnc_createVehicleCrew;

private _wp = _group addWaypoint [_position, 0];
_wp setWaypointType "SAD";
_wp setWaypointBehaviour "COMBAT";
_wp setWaypointCombatMode "RED";

private _ehID = _plane addEventHandler ["Fired", {
  params ["_plane"];
  if (assignedTarget _plane isKindOf "LaserTargetW") then {
    [_plane, 3] remoteExec ["SL_fnc_supportProvider", JTAC_player];
  };
}];

[_plane, 1] remoteExec ["SL_fnc_supportProvider", JTAC_player];

private _distance = GET_PARAM("ViewDistance");
waitUntil {
  sleep 5;
  (_plane distance2d _position) <= _distance
};

if (alive driver _plane && {canMove _plane}) then {
  [_plane, 2] remoteExec ["SL_fnc_supportProvider", JTAC_player];
};

sleep 300;

if (isNull _plane || {!alive driver _plane} || {!canMove _plane}) exitWith {};

deleteWaypoint _wp;
private _wpExit = _group addWaypoint [_start, 0];
_wpExit setWaypointType "MOVE";
_wpExit setWaypointCombatMode "BLUE";
_wpExit setWaypointBehaviour "CARELESS";
_wpExit setWaypointStatements ["TRUE", "{deleteVehicle _this} forEach ((units group this) + [vehicle this])"];
[_plane, 4] remoteExec ['SL_fnc_supportProvider', JTAC_player];

true
