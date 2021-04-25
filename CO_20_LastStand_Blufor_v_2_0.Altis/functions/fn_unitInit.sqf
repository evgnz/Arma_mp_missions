/*
  File: fn_unitInit.sqf
  Author:	Evgeny Chumichev
  Description: AI settings
*/

#include "scriptComponent.hpp"

params ["_unit"];

_unit setskill ["aimingAccuracy", (GET_PARAM("SkillAI") / 10)];
_unit setskill ["aimingShake", (GET_PARAM("SkillAI") / 10)];
_unit setskill ["aimingSpeed", (GET_PARAM("SkillAI") / 20)];
{_unit setskill [_x, 1]} forEach ["reloadSpeed", "spotDistance", "spotTime", "commanding", "courage", "general"];
_unit addMagazine "SmokeShell";

_unit
