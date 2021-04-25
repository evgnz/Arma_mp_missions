/*
  File: fn_moduleSector.sqf
  Author:	Evgeny Chumichev
  Description: Module sector init
*/

#include "scriptComponent.hpp"

private _logic = createGroup sideLogic createUnit ["ModuleSector_F", SECTOR_POS, [], 0, "NONE"];
private _sector = SET_SECTOR(_logic);
SET_GVAR("s_sector",_sector);

waitUntil {!isNil {_sector getVariable "finalized"} && {!(_sector getVariable ["finalized", true])}};
"west_pointer" setMarkerPos (_sector getPos [0, 0]);
"area_marker" setMarkerAlpha 0.15;

_sector synchronizeObjectsAdd [sl_flagPole];
_sector spawn {
  private _sectorAreas = _this getVariable "areas";
  private _sectorTrigger = _sectorAreas select 0;
  private _sectorMarkers = _sectorTrigger getVariable "markers";
  _sectorMarkers params ["_areaGrid", "_iconName", "_iconText"];
  _iconName setMarkerSize [0.75, 0.8];
  _areaGrid setMarkerColor "colorBlack";
  _areaGrid setMarkerAlpha 0;
  _iconText setMarkerText "";
};

private _id = [_sector, "ownerChanged", {
  params ["_sector", "_owner", "_oldOwner"];
  if !(_owner isEqualTo west) then {
    if (GET_VAR("var_inBase",true)) then {
      [7] call SL_fnc_conversations;
      SET_VAR("var_inBase",false);
    };
    playSound3D [
      "A3\Sounds_F\sfx\alarm_independent.wss",
      s_speaker,
      false,
      getPosWorld s_speaker,
      1,
      0.7,
      0 
    ];
  };	
}] call BIS_fnc_addScriptedEventHandler;

private _moduleHQ = createGroup west createUnit ["ModuleHQ_F", SECTOR_POS, [], 10, "CAN_COLLIDE"];
SET_GVAR("BIS_HQ_WEST",_moduleHQ call bis_fnc_modulehq);

true
