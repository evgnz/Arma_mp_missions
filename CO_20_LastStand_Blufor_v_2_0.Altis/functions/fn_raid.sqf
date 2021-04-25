/*
  File: fn_raid.sqf
  Author:	Evgeny Chumichev
  Description: Transport unload
*/

#include "scriptComponent.hpp"

params ["_vehicleGroup", "_vehicle", "_randomGroups"];
private _startPos = getPosWorld _vehicle;
_vehicle setDir (_startPos getDir SECTOR_POS);

private _driverVehicle = driver _vehicle;
private _cargoGroup = [_startPos, EAST, selectRandom _randomGroups] call BIS_fnc_spawnGroup;
private _unitsCargo = units _cargoGroup;
{_x call SL_fnc_unitInit call SL_fnc_handleUnit moveInCargo _vehicle} forEach _unitsCargo;

_vehicleGroup move SECTOR_POS;

private _wp = _cargoGroup addWaypoint [SECTOR_POS, 0];
_wp setWaypointType "GUARD";
_wp setWaypointSpeed "FULL";
_cargoGroup lockWP true;

waitUntil {
  sleep 5; 
  (_vehicle distance2d SECTOR_POS) <= FRAND(200,275,350) || 
  (!canMove _vehicle) || (isNull _vehicle) || (!alive _driverVehicle)
};

if ((!canMove _vehicle) || (!alive _driverVehicle)) exitWith {};
doStop _vehicle;
waitUntil {velocity _vehicle isEqualTo [0, 0, 0]};

{
  [_x] allowGetIn false; 
  _x action ["GetOut", vehicle _x];
} forEach _unitsCargo;

waitUntil {
  sleep 5;
  count (_unitsCargo select {alive _x && (!isNull objectParent _x)}) == 0
};

if ((canMove _vehicle) && (alive _driverVehicle)) then {
  _driverVehicle setBehaviour "CARELESS";
  _driverVehicle doFollow leader _vehicleGroup;
  [_vehicle, _startPos] spawn {
    params ["_vehicle", "_startPos"];
    _vehicle move _startPos;
    waitUntil {
      sleep 5; 
      (_vehicle distance2d _startPos) <= 50 || (!canMove _vehicle) || (!alive (driver _vehicle))
    };
    {deleteVehicle _x} forEach ((units group _vehicle) + [_vehicle]);
  }; 
};

true
