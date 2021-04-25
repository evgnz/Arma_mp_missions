/*
  File: fn_fireSupport.sqf
  Author:	Evgeny Chumichev
  Description: Simple virtual artillery
*/

#include "scriptComponent.hpp"

params [
  ["_position", objNull, [objNull, []]],
  ["_ammo", "", [""]],
  ["_limit", 10, [0]],
  ["_radius", 100, [0]],
  ["_delay", 0.1, [0]]
];

sleep GET_VAR("var_delay",25);

private _velocity = [100, 0.02] select (_ammo isEqualto "F_40mm_White");

for "_i" from 1 to _limit do {
  if (GET_VAR("lvarStop",false)) exitWith {};

  private _spawnPos = _position getPos [_radius * sqrt random 1, random 360]; 
  _spawnPos set [2, FRAND(150,185,225)]; 

  private _shell = _ammo createVehicle _spawnPos;
  _shell setVectorUp [0, 0, -1]; 
  _shell setVelocity [0, 0, -_velocity];

  sleep _delay;
};

true
