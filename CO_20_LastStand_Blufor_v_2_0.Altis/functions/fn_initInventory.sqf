/*
  File: fn_initInventory.sqf
  Author:	Evgeny Chumichev
  Description: Ammo crates init
*/

#include "scriptComponent.hpp"

private _crates = [];

{
  private _crate = createVehicle ["B_CargoNet_01_ammo_F", _x, [], 0, "NONE"];
  _crates pushBack _crate;
} forEach BASE_CRATES_POS;

if ADDONS_LOADED then {
  {
    clearWeaponCargoGlobal _x;
    clearMagazineCargoGlobal _x;
    clearItemCargoGlobal _x;
    clearBackPackCargoGlobal _x;
    _x addMagazineCargoGlobal ["rhs_mag_M433_HEDP", 20];
    _x addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag", 20];
    _x addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", 20];
    _x addMagazineCargoGlobal ["rhsusf_10Rnd_762x51_m993_Mag", 20];
    _x addMagazineCargoGlobal ["rhsusf_100Rnd_762x51", 10];
    _x addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 10];
    _x addMagazineCargoGlobal ["rhsusf_mag_15Rnd_9x19_JHP", 10];
    _x addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag", 1];
    _x addWeaponCargoGlobal ["rhs_weap_M136_hedp", 1];
    _x addWeaponCargoGlobal ["rhs_weap_M136", 1];
  } forEach _crates;
} else {
  {
    clearWeaponCargoGlobal _x;
    clearMagazineCargoGlobal _x;
    clearItemCargoGlobal _x;
    clearBackPackCargoGlobal _x;
    _x addWeaponCargoGlobal ["launch_MRAWS_green_rail_F", 1];		
    _x addMagazineCargoGlobal ["MRAWS_HEAT_F",1];
    _x addMagazineCargoGlobal ["MRAWS_HE_F",2];
    _x addMagazineCargoGlobal ["HandGrenade",10];
    _x addBackpackCargoGlobal ["B_Fieldpack_oli",2];
    _x addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag",20];
    _x addMagazineCargoGlobal ["B_IR_Grenade",5];
    _x addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag",10];
    _x addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer",5];
    _x addMagazineCargoGlobal ["SmokeShell",10];
    _x addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",10];
    _x addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag", 5]; 
    _x addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 5];
  } forEach _crates;
};

{
  clearMagazineCargoGlobal _x; 
  clearWeaponCargoGlobal _x; 
  _x addItemCargoGlobal ["FirstAidKit", 50];  
} forEach [st_16, st_17];
