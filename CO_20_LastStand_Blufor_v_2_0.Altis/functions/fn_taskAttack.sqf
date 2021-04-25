/*
  File: fn_attack.sqf
  Author:	Evgeny Chumichev
  Description: Attackers init
*/

params ["_group", "_position"];

private _wp = _group addWaypoint [_position, 0];
_wp setWaypointType "GUARD";
_wp setWaypointSpeed "FULL";
_group lockWP true;

{
  private _unit = _x call SL_fnc_unitInit call SL_fnc_handleUnit;
  private _target = _position call SL_fnc_nearTarget;
  if (_unit isEqualTo gunner objectParent _unit) then {
    private _vehicle = vehicle _unit;
    if (_target isEqualType objNull) then {
      _vehicle reveal _target;
    } else {
      _vehicle doWatch (_position getPos [0, 0]);
    };
    [_group, currentWaypoint _group] setWaypointSpeed "LIMITED";
  };
} forEach units _group;

true
