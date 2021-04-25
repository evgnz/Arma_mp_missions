/*
  File: fn_nearTargets.sqf
  Author:	Evgeny Chumichev
  Description: Returns first player in area or position, if there are no players present
*/

#include "scriptComponent.hpp"

params ["_position"];

ALIVE_PLAYERS param [ALIVE_PLAYERS findIf {_x inArea [SECTOR_POS, 100, 100, 0, false]}, _position]
