#include "initBriefing.hpp"

disableMapIndicators [true, true, true, false];
enableEnvironment [false, false];
enableEngineArtillery false;

{player setUnitTrait _x} forEach [
  ["medic", true],
  ["explosiveSpecialist", true],
  ["camouflageCoef", 3]
];

private _numbers = "Tickets" call (missionNamespace getVariable ["BIS_fnc_storeParamsValues_data", {}]);
private _tickets = [player, _numbers] call BIS_fnc_respawnTickets;
private _loadouts = player call SL_fnc_respawnInventory;

if !(didJIP) then {
  private _marker = createMarkerLocal ["brief_flag", [14175.5,21233.9,0]];
  _marker setMarkerTypeLocal "hd_flag";
  _marker setMarkerColorLocal "colorblack";
  _marker setMarkerAlphaLocal 1;
  _marker spawn {waitUntil {time > 0}; deleteMarker _this;};
};

if ((missionNamespace getVariable ["icon_localized", ""]) isEqualTo "") then {
  private _marker = createMarkerLocal ["icon_text", [14175.5,21233.9,0]];
  _marker setMarkerTypeLocal "EmptyIcon";
  _marker setMarkerColorLocal "colorblack";
  _marker setMarkerTextLocal localize "STR_sector_name";
  _marker setMarkerSizeLocal [1.5, 1.5];
  _marker setMarkerAlphaLocal 1;
  missionNamespace setVariable ["icon_localized", _marker];
};

player spawn {
  isNil {
    _this spawn SL_fnc_intro;
    [_this, [14110.3,21256.3,0], localize "STR_West"] call SL_fnc_respawnPositionAdd;
    [_this, [14200.5,21269.3,0], localize "STR_North"] call SL_fnc_respawnPositionAdd;
    [_this, [14245.8,21233.2,0], localize "STR_East"] call SL_fnc_respawnPositionAdd;
    [_this, [14184.4,21186.1,0], localize "STR_South"] call SL_fnc_respawnPositionAdd;
  };
};
