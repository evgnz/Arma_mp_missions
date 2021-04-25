/*
  File: fn_static.sqf
  Author:	Evgeny Chumichev
  Description: Static weapons groups
*/

#include "scriptComponent.hpp"

SET_CLASSES params ["_leaderClass", "_assistClass", "_gunnerClass", "_opticsClass", "_weaponClass", "_wpbaseClass"];

private _pos = selectRandom POS_LIST;
private _group = createGroup EAST; 
private _unit_1 = _group createUnit [_leaderClass, _pos, [], 2, "CAN_COLLIDE"];
private _unit_2 = _group createUnit [_assistClass, _pos, [], 3, "CAN_COLLIDE"];
private _unit_3 = _group createUnit [_gunnerClass, _pos, [], 4, "CAN_COLLIDE"];

if ADDONS_LOADED then {
  _unit_1 addWeapon _opticsClass;
  _unit_2 addBackpack _weaponClass;
  _unit_3 addBackpack _wpbaseClass;
};

private _hours = date select 3; 
if (_hours > 20 || _hours < 8) then {[SECTOR_POS] spawn SL_fnc_flares};

private _leader = leader _group;
private _units = (units _group) - [_leader];
private _gunner = _units select {unitBackpack _x isKindOf _weaponClass} param [0, objNull];
private _assistant = (_units - [_gunner]) select {unitBackpack _x isKindOf _wpbaseClass} param [0, objNull];
private _weaponBase = unitBackpack _assistant;
private _unitsReady = (units _group) apply {_x call SL_fnc_unitInit};

_group move SECTOR_POS;

waitUntil {
  sleep 5;
  {_x distance2d SECTOR_POS <= FRAND(200,225,250)} forEach _unitsReady
};

if (isNull leader _group || isNull _gunner || isNull _assistant) exitWith {};
private _eh = _gunner addEventHandler ["WeaponAssembled", {
  params ["_gunner", "_weapon"];
  _gunner action ["GetInGunner", _weapon];

  private _group = group _gunner;
  _group addVehicle _weapon;

  private _targetPos = getPosWorld s_sector;
  private _target = _targetPos call SL_fnc_nearTarget;

  if (_target isEqualType objNull) then {
    _group reveal _target;
    _gunner commandSuppressiveFire _target;
  } else {
    _gunner doWatch _targetPos;
  };

  private _eh = _weapon addEventHandler ["GetOut", {
    private _weapon = param [0];
    private _group = group param [2];

    if (({alive _x} count units _group) < 2) then {
      _weapon setVehicleAmmo 0;
    };
    _weapon removeEventHandler ["GetOut", _thisEventHandler];
  }];
  _gunner removeEventHandler ["WeaponAssembled", _thisEventHandler];
}];

[_group, _leader, _assistant, _gunner, _weaponBase] spawn {
  params ["_group", "_leader", "_assistant", "_gunner", "_weaponBase"];

  doStop units _group;

  if (!isNull _leader && {alive _leader}) then {
    _leader setUnitPos "MIDDLE";
    _leader selectWeapon binocular _leader;
    _leader commandWatch getPosWorld s_sector;
  };

  if (!isNull _assistant && {alive _assistant}) then {
    if (!isNull _gunner && {alive _gunner}) then {	
      _assistant move position _gunner;
    };
  } else {
    if (!isNull _gunner && {alive _gunner}) then {	
      _gunner removeAllEventHandlers "WeaponAssembled";
    };
  };

  if (!isNull _gunner && {alive _gunner}) then {	
    _gunner setUnitPos "MIDDLE";
    _gunner doWatch getPosWorld s_sector;
    _gunner action ["PutBag", _assistant];
    _gunner action ["Assemble", _weaponBase];
  };
};

true
