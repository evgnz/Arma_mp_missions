private _evacround = "EvacWave" call (missionnamespace getVariable ["BIS_fnc_storeparamsValues_data", {}]);
missionnamespace setVariable ["EvacWave", _evacround, true];

{
  missionnamespace setVariable [_x, 0, true]
} forEach ["GVAR_swave", "GVAR_evac", "GVAR_lastStand", "GVAR_notickets", "GVAR_mission_completed"];

private _idDisconnect = addMissionEventHandler ["HandleDisconnect", {
  params ["_unit"];
  deletevehicle _unit;
}];

private _idKilled = addMissionEventHandler ["EntityKilled", {
  params ["_object"];
  if (!isplayer _object && {_object isKindOf "CAManBase"}) then {
    _object spawn {
      sleep (20 + random 10);
      if (!isNull _this) then {
        hideBody _this
      };
    };
  };
}];

[[14176.5, 21236.3, 0], [1200, 1200]] call SL_fnc_coverMap;

{
  private _smoke = "test_EmptyObjectforSmoke" createvehicle [0, 0, 0];
  _smoke setPosWorld (getPosWorld _x);
} forEach [dummy_1, dummy_2, dummy_3, dummy_4];

[] spawn {
  private _ismod = isClass (configFile >> "cfgPatches" >> "rhsusf_main");
  private _class = ["B_Heli_Transport_01_camo_F", "RHS_UH60M_d"] select _ismod;
  private _heli = _class createvehicle [14156, 21255.3, 0];
  private _group = [_heli, west, true] call SL_fnc_createvehiclecrew;

  _heli setDir 265;
  _heli allowdamage false;
  _heli setvehicleLock "lockedplayer";
  _heli setBehaviour "CARELESS";

  {
    _x setCaptive true
  } forEach units _group;

  clearitemCargoGlobal _heli;
  clearBackpackCargoGlobal _heli;

  _heli move [9186.02, 21610.8, 0];
  _heli flyinHeight 80;

  private _distance = "viewDistance" call (missionnamespace getVariable ["BIS_fnc_storeparamsValues_data", {}]);
  waitUntil {
    sleep 5;
    (_heli distance2D [14176.5, 21236.3, 0]) > _distance
  };

  {
    deletevehicle _x
  } forEach ((units group _heli) + [_heli]);
};

[] spawn {
  waitUntil {time > 0};
  call SL_fnc_moduleSector;
  call SL_fnc_initinventory;
  waitUntil {time > 5};
  call SL_fnc_initMission;
};
