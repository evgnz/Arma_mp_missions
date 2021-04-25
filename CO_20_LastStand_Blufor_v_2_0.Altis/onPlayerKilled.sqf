#define SPECTATOR_KEY (uiNamespace getVariable "BIS_RscRespawnControlsMap_ctrlButtonSpectate")

params ["_unit"];

setPlayerRespawntime ("Respawntime" call (missionnamespace getVariable ["BIS_fnc_storeparamsValues_data", {}]));
private _tickets = [_unit, 0, true] call BIS_fnc_respawnTickets;
if (_tickets == 0 || ((missionnamespace getVariable ["GVAR_lastStand", 0]) > 0)) then {
[] spawn {
  setPlayerRespawntime 1e10;
  sleep 5;
  [] remoteExec ["SL_fnc_endMission", 2];
  };
};

if (count playableunits > 0) then {
  if (!isnil {SPECTATOR_KEY}) then {
    SPECTATOR_KEY ctrlEnable true;
    SPECTATOR_KEY ctrlsettooltip "";
    SPECTATOR_KEY ctrlShow true;
    };
  } else {
  if (!isnil {SPECTATOR_KEY}) then {
    SPECTATOR_KEY ctrlEnable false;
    SPECTATOR_KEY ctrlsettooltip "";
    SPECTATOR_KEY ctrlShow false;
  };
};