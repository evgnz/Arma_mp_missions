/*
  File: fn_cleanUp.sqf
  Author:	Evgeny Chumichev
  Description: Waves endings / cleanup
*/

#include "scriptComponent.hpp"
//FIXME:
isNil {
  {_x setDamage [1, false]} forEach MISSION_OBJECTS;
  {deleteVehicle _x} forEach GARBAGE_LIST;
  {DELETE_EMPTY(_x)} forEach SORTED_VEHICLES;
};

true
