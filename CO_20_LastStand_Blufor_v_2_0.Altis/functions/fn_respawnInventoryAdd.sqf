/*
  File: fn_respawnInventoryAdd.sqf
  Author:	Evgeny Chumichev
  Description: Respawn inventories from the CfgRespawnInventory (replacement for BIS_fnc_addRespawnInventory)
*/

#include "scriptComponent.hpp"

params [
  ["_target", missionNamespace, [missionNamespace, grpNull, objNull]],
  ["_inventory", "", ["", []]],
  ["_inventoryLimit", -1, [0]],
  ["_roleLimit", -1, [0]]	
];

private _inventoriesList = "BIS_fnc_getRespawnInventories_list";
private _inventoryVar = _target getVariable [_inventoriesList, [-1, [], [], [], []]];
_inventoryVar params ["_inventoryID", "_inventoryIDs", "_inventoryData", "_inventoryLimits", "_roleLimits"];

if (_inventory in _inventoryData) exitWith {[_target, -1]};
_inventoryID = (_inventoryVar select 0) + 1;
_inventoryVar set [0, _inventoryID];

PUSH_ARG(_inventoryIDs,_inventoryID);
PUSH_ARG(_inventoryData,_inventory);
PUSH_ARG(_inventoryLimits,_inventoryLimit);
PUSH_ARG(_roleLimits,_roleLimit);

_target setVariable [_inventoriesList, _inventoryVar, true];

[_target, _inventoryID]
