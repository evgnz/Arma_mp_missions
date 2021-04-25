/*
  File: fn_addSupport.sqf
  Author:	Evgeny Chumichev
  Description: Support requester commmenu items
*/

#include "scriptComponent.hpp"

if GET_UNIT(player,JTAC_player) then {
  if (GET_VAR("GVAR_swave",0) isEqualTo 2) then {
    private _commMenuID = [JTAC_player, "fireMission"] call BIS_fnc_addCommMenuItem;
    SET_VAR("fireMission_id",_commMenuID);
  };
  if (GET_VAR("GVAR_swave",0) isEqualTo 3) then {
    private _commMenuID = [JTAC_player, "casHeli"] call BIS_fnc_addCommMenuItem;
    SET_VAR("casHeli_id",_commMenuID);
  };
  if (GET_VAR("GVAR_swave",0) isEqualTo 4) then {
    private _commMenuID = [JTAC_player, "casPlane"] call BIS_fnc_addCommMenuItem;
    SET_VAR("casPlane_id",_commMenuID);
  };
  if (GET_VAR("GVAR_swave",0) isEqualTo 5) then {
    private _commMenuID = [JTAC_player, "supplyDrop"] call BIS_fnc_addCommMenuItem;
    SET_VAR("supplyDrop_id",_commMenuID);
  };
};

if (GET_VAR("GVAR_swave",0) isEqualTo (EVAC_ROUND + 1)) then {
  private _commMenuID = [REMOTE_LEADER, "evacHelo"] call BIS_fnc_addCommMenuItem;
  waitUntil {
    sleep 5;
    GET_VAR("GVAR_evac",0) > 0
  };
  if (!isNil "_commMenuID") then {
    [REMOTE_LEADER, _commMenuID] call BIS_fnc_removeCommMenuItem;
  };
};

true
