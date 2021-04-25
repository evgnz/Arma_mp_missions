/*
  File: fn_suppCrate.sqf
  Author:	Evgeny Chumichev
  Description: Supply drop crates init
*/

#include "scriptComponent.hpp"

clearMagazineCargoGlobal _this; 
clearBackpackCargoGlobal _this;	
clearWeaponcargoGlobal _this; 
clearItemCargoGlobal _this;

if ADDONS_LOADED then {
  _this addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag",20];
  _this addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",20];
  _this addMagazineCargoGlobal ["rhsusf_20Rnd_762x51_m118_special_Mag",20];
  _this addMagazineCargoGlobal ["rhsusf_100Rnd_762x51",5];
  _this addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch",5];
  _this addMagazineCargoGlobal ["16Rnd_9x21_Mag",25];
  _this addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag",5];
  _this addMagazineCargoGlobal ["DemoCharge_Remote_Mag",5];
  _this addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag",5];
  _this addMagazineCargoGlobal ["DemoCharge_Remote_Mag",5];
  _this addWeaponCargoGlobal ["rhs_weap_M136_hedp",2];
  _this addWeaponCargoGlobal ["rhs_weap_M107_d",1];
  _this addItemCargoGlobal ["rhsusf_acc_premier",1];
  _this addMagazineCargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_mk211",10];
  _this addBackpackCargoGlobal ["rhs_M252_Bipod_Bag",1];
  _this addBackpackCargoGlobal ["rhs_M252_Gun_Bag",1];
  } else {
  _this addWeaponCargoGlobal ["launch_NLAW_F", 1];
  _this addMagazineCargoGlobal ["NLAW_F",3];
  _this addWeaponCargoGlobal ["LMG_Mk200_F", 1];
  _this addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer", 5];
  _this addItemCargoGlobal ["optic_Arco", 1]; 
  _this addItemCargoGlobal ["bipod_01_F_blk", 1];
  _this addWeaponCargoGlobal ["srifle_LRR_F", 1]; 
  _this addMagazineCargoGlobal ["7Rnd_408_Mag", 10]; 
  _this addItemCargoGlobal ["optic_LRPS", 1];
  _this addMagazineCargoGlobal ["HandGrenade",10];
  _this addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag",20];
  _this addMagazineCargoGlobal ["B_IR_Grenade",5];
  _this addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag",10];
  _this addMagazineCargoGlobal ["SmokeShell",10];
  _this addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",10];
  _this addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag", 5]; 
  _this addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 5];
};

private _light = "NVG_TargetW" createVehicle [0, 0, 0];
_light attachTo [_this, [0, 0, 0.8]];
_light spawn {sleep 60; deleteVehicle _this};

true
