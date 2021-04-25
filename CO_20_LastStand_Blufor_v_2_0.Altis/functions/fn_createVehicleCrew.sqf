/*
  File: fn_createVehicleCrew.sqf
  Author:	Evgeny Chumichev

  Description: 
  Creates vehicle crew, removes group when empty

  Parameter(s):
  0: OBJECT - vehicle
  1: SIDE - side for the vehicle crew
  2: BOOL - delete group when empty

  Returns:
  GROUP
*/

params [
  ["_vehicle", objNull, [objNull]], 
  ["_side", sideUnknown, [sideEmpty, sideUnknown]], 
  ["_deleteEmpty", false, [false]]
];

private _group = createGroup _side;
createVehicleCrew _vehicle;

crew _vehicle joinSilent _group;
_group addVehicle _vehicle;

if (_deleteEmpty) then {_group deleteGroupWhenEmpty true};

_group
