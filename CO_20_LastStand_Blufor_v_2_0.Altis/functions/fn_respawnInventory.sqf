/*
  File: fn_respawnInventory.sqf
  Author:	Evgeny Chumichev
  Description: Loadouts with classes restrictions
*/

#include "scriptComponent.hpp"

params ["_unit"];

private _index = UNIT_TYPES findIf {_x isEqualTo typeOf _unit};
private _baseLoadouts = DEFAULT_LOADOUTS select ADDONS_LOADED;

if (_index != -1) then {_baseLoadouts pushBack (CLASSES_LOADOUTS select _index)};
{[_unit, _x] call SL_fnc_respawnInventoryAdd} forEach _baseLoadouts;

_unit
