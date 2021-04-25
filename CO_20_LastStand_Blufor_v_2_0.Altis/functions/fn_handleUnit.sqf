/*
  File: fn_handleUnit.sqf
  Author:	Evgeny Chumichev
  Description: AI's handlers
*/

params ["_unit"];

private _hitID = _unit addEventHandler ["Hit", {
  params ["_unit", "_source", "_damage", "_instigator"];
  if (side _source isEqualTo west && {isPlayer _source}) then {
    if ((_unit distance2d _source) > (random 250 + 200)) then {
      {_x reveal _source; _x removeEventHandler ["Hit", 0];} forEach (units group _unit);
      _unit doTarget _source;
      _unit forceWeaponFire ["SmokeShellMuzzle", "SmokeShellMuzzle"];	
    };		
  };
}];

private _firedID = _unit addEventHandler ["FiredNear", {
  params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];
  if (side _gunner isEqualTo west && {isPlayer _gunner}) then {
    _unit doMove (_gunner modelToWorld [0, 0, 0]);
    _unit removeEventHandler ["FiredNear", _thisEventHandler];
  };
}];

_unit
