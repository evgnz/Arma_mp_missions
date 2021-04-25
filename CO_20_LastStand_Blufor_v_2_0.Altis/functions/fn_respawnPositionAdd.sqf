/*
  File: fn_respawnPositionAdd.sqf
  Author:	Evgeny Chumichev
  Description: Respawn position (replacement for BIS_fnc_addRespawnPosition)
*/

#include "scriptComponent.hpp"

params [
  ["_target", missionNamespace, [missionNamespace, grpNull, objNull]],
  ["_position", "", ["", grpNull, objNull, []]],
  ["_posName", "", [""]],
  ["_posID", -1, [0]],
  ["_showName", true, [true]]
];

private _positionsList = "BIS_fnc_getRespawnPositions_list";
if (_position isEqualType objNull) then {
  _position = _position call bis_fnc_objectVar;
};

private _positionsVar = _target getvariable [_positionsList, [-1, [], [], [], []]];
_positionsVar params ["_index", "_positionIDs", "_positionData", "_positionNames", "_positionShowNames"];

if (_position in _positionData) exitWith {[_target, -1]};
_posID = _index + 1;
_positionsVar set [0, _posID];

PUSH_ARG(_positionIDs,_posID);
PUSH_ARG(_positionData,_position);
PUSH_ARG(_positionNames,_posName);
PUSH_ARG(_positionShowNames,_showName);

_target setvariable [_positionsList, _positionsVar, true];

true