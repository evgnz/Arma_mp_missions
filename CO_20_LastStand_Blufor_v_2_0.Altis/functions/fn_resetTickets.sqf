/*
  File: fn_resetTickets.sqf
  Author:	Evgeny Chumichev
  Description: Local tickets reset
*/

if (alive player) then {
  private _value = [player] call BIS_fnc_respawnTickets;
  [player, -_value, true] call bis_fnc_respawnTickets;
  playSound "addItemFailed";
};

true
