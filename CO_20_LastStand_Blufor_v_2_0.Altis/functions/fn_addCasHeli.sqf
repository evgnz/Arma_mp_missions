/*
  File: fn_addCasHeli.sqf
  Author:	Evgeny Chumichev
  Description: Support provider service, CAS(Heli) 
*/

#include "scriptComponent.hpp"

params [
  ["_caller", objNull, [objNull]], 
  ["_position", SECTOR_POS, [[]]]
];

private _heliClass = ["B_Heli_Attack_01_F", "RHS_AH64D_wd"] select ADDONS_LOADED;
private _smoke = createvehicle ["SmokeShellRed", _position, [], 0, "NONE"];
private _start = [worldSize / 2, worldSize / 2, 500];
private _heli  = createVehicle [_heliClass, _start, [], 50, "FLY"]; 
private _group = [_heli, WEST, true] call SL_fnc_createVehicleCrew;

_heli doMove _position;
_heli flyInHeight 250;
[_heli, 5] remoteExec ["SL_fnc_supportProvider", JTAC_player];

private _wp = _group addWaypoint [_position, 0];
_wp setWaypointType "SAD";
_wp setWaypointBehaviour "COMBAT";
_wp setWaypointCombatMode "RED";

private _distance = GET_PARAM("ViewDistance");
waitUntil {
  sleep 1;
  (_heli distance2d _position) <= _distance
};

if (alive driver _heli && {canMove _heli}) then {
  [_heli, 6] remoteExec ["SL_fnc_supportProvider", JTAC_player];
};

sleep 180;

if (isNull _heli || {!alive driver _heli} || {!canMove _heli}) exitWith {};

deleteWaypoint _wp;
private _wpExit = _group addWaypoint [_start, 0];
_wpExit setWaypointType "MOVE";
_wpExit setWaypointCombatMode "BLUE";
_wpExit setWaypointBehaviour "CARELESS";
_wpExit setWaypointStatements ["TRUE", "{deleteVehicle _this} forEach ((units group this) + [vehicle this])"];
[_heli, 7] remoteExec ['SL_fnc_supportProvider', JTAC_player];

true
