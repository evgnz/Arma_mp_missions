/*
  File: fn_supportProvider.sqf
  Author:	Evgeny Chumichev
  Description: Support providers reports
*/

#include "scriptComponent.hpp"

params ["_vehicle", "_message"];

private _text = SUPP_MESSAGE_LIST select _message;
if (_message isEqualTo 8) then {
  player sideChat localize "STR_A3_requesting_supply_drop_at_the_transmitted_coordinates__over_";
};

sleep (2 + random 2);
driver _vehicle sideChat localize _text;

true
