class CfgRoles
{
  class Assault
  {
    displayName = $STR_A3_Role_Assault;
    icon = "a3\Ui_f\data\GUI\Cfg\RespawnRoles\assault_ca.paa";
  };
  class Support
  {
    displayName = $STR_A3_Role_Support;
    icon = "a3\Ui_f\data\GUI\Cfg\RespawnRoles\support_ca.paa";
  };
  class Recon
  {
    displayName = $STR_A3_Role_Recon;
    icon = "a3\Ui_f\data\GUI\Cfg\RespawnRoles\recon_ca.paa";
  };
};

class CfgRespawnInventory
{
  class INF_USMC_EOD
  {
    displayName = $STR_RHSUSF_INF_USMC_EOD;
    role = "Support";
    weapons[] = {
      "rhs_weap_m4a1_blockII",
      "rhsusf_weap_m9",
      "Binocular"
    };
    magazines[] = {
      "rhs_mag_an_m8hc",
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "APERSTripMine_Wire_Mag",
      "APERSTripMine_Wire_Mag",
      "APERSTripMine_Wire_Mag",
      "APERSTripMine_Wire_Mag",
      "rhsusf_m112_mag",
      "rhsusf_m112_mag",
      "rhsusf_m112_mag",
      "rhsusf_m112_mag",
      "rhs_mag_m67"
    };
    items[] = {
      "FirstAidKit",
      "FirstAidKit",
      "MineDetector"
    };
    linkedItems[] = {
      "ItemMap",
      "ItemCompass",
      "ItemWatch",
      "ItemRadio",
      "ItemGPS",
      "rhsusf_ANPVS_14",
      "rhsusf_acc_anpeq15_bk",
      "rhsusf_acc_eotech_xps3",
      "rhsusf_spc_patchless_radio",
      "rhsusf_ach_bare_des_headset"
    };
    uniformClass = "rhs_uniform_FROG01_wd";
    backpack = "rhsusf_falconii_coy";
  };
  class INF_GRENADIER
  {
    displayName = $STR_RHS_INF_GRENADIER;
    role = "Assault";
    weapons[] = {
      "rhs_weap_m4a1_blockII_M203_d",
      "rhsusf_weap_m9",
      "Binocular"
    };
    magazines[] = {
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_M433_HEDP",
      "rhs_mag_M433_HEDP",
      "rhs_mag_M433_HEDP",
      "rhs_mag_M433_HEDP",
      "rhs_mag_M433_HEDP",
      "rhs_mag_M433_HEDP",
      "rhs_mag_M433_HEDP",
      "rhs_mag_M433_HEDP",
      "rhs_mag_M433_HEDP",
      "rhs_mag_M433_HEDP",
      "rhs_mag_M433_HEDP",
      "rhs_mag_M433_HEDP",
      "rhs_mag_M433_HEDP",
      "rhs_mag_M433_HEDP",
      "rhs_mag_M433_HEDP",
      "rhs_mag_M433_HEDP",
      "rhs_mag_M433_HEDP",
      "rhs_mag_M433_HEDP",
      "rhs_mag_M433_HEDP",
      "rhs_mag_M433_HEDP",
      "rhs_mag_m67",
      "rhs_mag_an_m8hc"
    };
    items[] = {
      "FirstAidKit",
      "FirstAidKit"

    };
    linkedItems[] = {
      "ItemMap",
      "ItemCompass",
      "ItemWatch",
      "ItemRadio",
      "ItemGPS",
      "rhsusf_ANPVS_14",
      "rhsusf_acc_T1_high",
      "rhsusf_acc_anpeq15side_bk",
      "rhsusf_spc_teamleader",
      "rhsusf_ach_bare_semi_headset"
    };
    uniformClass = "rhs_uniform_FROG01_wd";
    backpack = "B_AssaultPack_rgr";
  };
  class INF_MARKSMAN
  {
    displayName = $STR_RHSUSF_INF_MARKSMAN;
    role = "Recon";
    weapons[] = {
      "rhs_weap_m40a5",
      "rhsusf_weap_m9",
      "lerca_1200_tan"
    };
    magazines[] = {
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhsusf_10Rnd_762x51_m993_Mag",
      "rhs_mag_m67",
      "rhs_mag_an_m8hc"
    };
    items[] = {
      "FirstAidKit",
      "FirstAidKit",
      "Leupold_Mk4",
      "rhsusf_ANPVS_14",
      "rhsusf_acc_premier_anpvs27"
    };
    linkedItems[] = {
      "ItemMap",
      "ItemCompass",
      "ItemWatch",
      "ItemRadio",
      "ItemGPS",
      "rhsusf_spc_light",
      "rhsusf_ach_bare_wood_headset",
      "rhsusf_acc_anpeq15side_bk",
      "rhsusf_acc_premier",
      "rhsusf_acc_harris_swivel"
    };
    uniformClass = "rhs_uniform_FROG01_wd";
    backpack = "rhsusf_falconii_coy";
  };
  class INF_HMG
  {
    displayName = $STR_RHSUSF_INF_MG;
    role = "Support";
    weapons[] = {
      "rhs_weap_m240B",
      "rhsusf_weap_m9",
      "Binocular"
    };
    magazines[] = {
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhsusf_100Rnd_762x51",
      "rhsusf_100Rnd_762x51",
      "rhsusf_100Rnd_762x51",
      "rhsusf_100Rnd_762x51",
      "rhsusf_100Rnd_762x51",
      "rhsusf_100Rnd_762x51",
      "rhsusf_100Rnd_762x51",
      "rhsusf_100Rnd_762x51",
      "rhs_mag_m67",
      "rhs_mag_an_m8hc"
    };
    items[] = {
      "FirstAidKit",
      "FirstAidKit"

    };
    linkedItems[] = {
      "ItemMap",
      "ItemCompass",
      "ItemWatch",
      "ItemRadio",
      "rhsusf_ANPVS_14",
      "ItemGPS",
      "H_HelmetSpecB_sand",
      "rhsusf_spc_mg",
      "rhsusf_acc_anpeq15side_bk"
    };
    uniformClass = "rhs_uniform_FROG01_wd";
    backpack = "rhsusf_assault_eagleaiii_coy";
  };
  class INF_AT
  {
    displayName = $STR_RHSUSF_INF_RIFLEMAN_AT;
    role = "Assault";
    weapons[] = {
      "rhs_weap_m4a1_d",
      "rhsusf_weap_m9",
      "lerca_1200_tan",
      "rhs_weap_M136_hedp"
    };
    magazines[] = {
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_m67",
      "rhs_mag_an_m8hc"
    };
    items[] = {
      "FirstAidKit",
      "FirstAidKit"

    };
    linkedItems[] = {
      "ItemMap",
      "ItemCompass",
      "ItemWatch",
      "rhsusf_ANPVS_14",
      "ItemRadio",
      "ItemGPS",
      "rhsusf_spc_rifleman",
      "rhsusf_ach_bare_des",
      "rhsusf_acc_anpeq15A",
      "rhsusf_acc_T1_high",
      "rhsusf_acc_anpeq15_top"
    };
    uniformClass = "rhs_uniform_FROG01_wd";
    backpack = "rhsusf_assault_eagleaiii_coy";
  };
  class INF_JTAC
  {
    displayName = $STR_JTAC_unit;
    role = "Recon";
    weapons[] = {
      "rhs_weap_m4a1_d_mstock",
      "rhsusf_weap_m9",
      "Laserdesignator"
    };
    magazines[] = {
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_m67",
      "Laserbatteries",
      "rhs_mag_an_m8hc"
    };
    items[] = {
      "FirstAidKit",
      "FirstAidKit"
    };
    linkedItems[] = {
      "ItemMap",
      "ItemCompass",
      "ItemWatch",
      "ItemRadio",
      "ItemGPS",
      "rhsusf_ANPVS_14",
      "rhsusf_acc_anpeq15_bk",
      "rhsusf_acc_eotech_552_d",
      "rhsusf_ANPVS_14",
      "rhsusf_spc_light",
      "rhsusf_ach_bare"
    };
    uniformClass = "rhs_uniform_FROG01_wd";
    backpack = "B_AssaultPack_rgr";
  };
  class INF_MEDIC
  {
    displayName = $STR_b_medic_f0;
    role = "Support";
    weapons[] = {
      "rhs_weap_hk416d10_LMT_d_grip2",
      "rhsusf_weap_m9",
      "Binocular"
    };
    magazines[] = {
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_30Rnd_556x45_Mk318_Stanag",
      "rhs_mag_m67",
      "rhs_mag_an_m8hc"
    };
    items[] = {
      "FirstAidKit",
      "FirstAidKit",
      "FirstAidKit",
      "FirstAidKit",
      "FirstAidKit",
      "Medikit"
    };
    linkedItems[] = {
      "ItemMap",
      "ItemCompass",
      "ItemWatch",
      "ItemRadio",
      "ItemGPS",
      "rhsusf_ANPVS_14",
      "rhsusf_spc_corpsman",
      "rhsusf_acc_M952V",
      "rhsusf_acc_T1_high",
      "rhsusf_acc_grip2",
      "rhsusf_lwh_helmet_marpatwd"
    };
    uniformClass = "rhs_uniform_FROG01_wd";
    backpack = "rhsusf_falconii_coy";
  };
  class INF_LMG
  {
    displayName = $STR_RHSUSF_INF_MG;
    role = "Support";
    weapons[] = {
      "rhs_weap_m249_pip_L_vfg",
      "rhsusf_weap_m9",
      "Binocular"
    };
    magazines[] = {
      "rhs_mag_m67",
      "SmokeShell",
      "rhsusf_mag_15Rnd_9x19_JHP",
      "rhsusf_100Rnd_556x45_soft_pouch",
      "rhsusf_100Rnd_556x45_soft_pouch",
      "rhsusf_100Rnd_556x45_soft_pouch",
      "rhsusf_100Rnd_556x45_soft_pouch",
      "rhsusf_100Rnd_556x45_soft_pouch",
      "rhsusf_100Rnd_556x45_soft_pouch"
    };
    items[] = {
      "FirstAidKit"
    };
    linkedItems[] = {
      "rhsusf_spc_mg",
      "rhsusf_mich_helmet_marpatwd_norotos_arc_headset",
      "rhsusf_acc_grip4",
      "acc_pointer_IR",
      "rhsusf_ANPVS_14",
      "ItemGPS",
      "ItemMap",
      "ItemCompass",
      "ItemWatch",
      "ItemRadio"
    };
    uniformClass = "rhs_uniform_FROG01_wd";
    backpack = "rhsusf_assault_eagleaiii_coy";
  };

  /* Vanilla */
  class B_Grenadier
  {
    displayName = $STR_b_soldier_gl_f0;
    role = "Assault";
    weapons[] = {
      "arifle_MX_GL_Black_F"
    };
    magazines[] = {
      "SmokeShell",
      "SmokeShell",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "HandGrenade",
      "HandGrenade",
      "1Rnd_HE_Grenade_shell",
      "1Rnd_HE_Grenade_shell",
      "1Rnd_HE_Grenade_shell",
      "1Rnd_HE_Grenade_shell",
      "1Rnd_HE_Grenade_shell",
      "1Rnd_HE_Grenade_shell",
      "1Rnd_HE_Grenade_shell",
      "1Rnd_HE_Grenade_shell",			
      "1Rnd_HE_Grenade_shell"
    };
    items[] = {
      "FirstAidKit"
    };
    linkedItems[] = {
      "V_PlateCarrierGL_rgr",
      "H_HelmetB_grass",
      "optic_Aco",
      "acc_pointer_IR",
      "ItemGPS",
      "ItemMap",
      "ItemCompass",
      "ItemWatch",
      "ItemRadio",
      "NVGoggles"			
    };
    uniformClass = "U_B_CombatUniform_mcam";
  };
  class B_HeavyGunner
  {
    displayName = $STR_a3_cfgvehicles_b_heavygunner_f0;
    role = "Support";
    weapons[] = {
      "LMG_Mk200_F"
    };
    magazines[] = {
      "SmokeShell",
      "SmokeShell",
      "200Rnd_65x39_cased_Box_Tracer",
      "200Rnd_65x39_cased_Box",
      "200Rnd_65x39_cased_Box",
      "200Rnd_65x39_cased_Box",
      "HandGrenade",
      "HandGrenade"
    };
    items[] = {
      "FirstAidKit"
    };
    linkedItems[] = {
      "V_PlateCarrier1_rgr",
      "H_HelmetB_light_sand",
      "optic_Aco",
      "acc_pointer_IR",
      "ItemGPS",
      "ItemMap",
      "ItemCompass",
      "ItemWatch",
      "ItemRadio",
      "NVGoggles"			
    };
    uniformClass = "U_B_CombatUniform_mcam_tshirt";
    backpack = "B_AssaultPack_rgr";
  };
  class B_Marksman
  {
    displayName = $STR_b_soldier_m_f0;
    role = "Recon";
    weapons[] = {
      "arifle_MXM_Black_F",
      "hgun_P07_F"
    };
    magazines[] = {
      "SmokeShell",
      "SmokeShell",
      "16Rnd_9x21_Mag",
      "16Rnd_9x21_Mag",
      "16Rnd_9x21_Mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",						
      "MiniGrenade",
      "MiniGrenade"
    };
    items[] = {
      "FirstAidKit"
    };
    linkedItems[] = {
      "V_PlateCarrier1_blk",
      "H_HelmetB_light_black",
      "optic_MRCO",
      "acc_pointer_IR",
      "bipod_01_F_blk",
      "ItemGPS",
      "ItemMap",
      "ItemCompass",
      "ItemWatch",
      "ItemRadio",
      "NVGoggles"			
    };
    uniformClass = "U_B_CombatUniform_mcam_tshirt";
  };
  class B_Autorifleman
  {
    displayName = $STR_b_soldier_ar_f0;
    role = "Support";
    weapons[] = {
      "arifle_MX_SW_Black_F"
    };
    magazines[] = {
      "SmokeShell",
      "SmokeShell",
      "100Rnd_65x39_caseless_mag",
      "100Rnd_65x39_caseless_mag",
      "100Rnd_65x39_caseless_mag",
      "100Rnd_65x39_caseless_mag",
      "100Rnd_65x39_caseless_mag",
      "100Rnd_65x39_caseless_mag",
      "100Rnd_65x39_caseless_mag",			
      "HandGrenade",
      "HandGrenade"
    };
    items[] = {
      "FirstAidKit"
    };
    linkedItems[] = {
      "V_PlateCarrier2_rgr",
      "H_HelmetB_grass",
      "bipod_01_F_blk",
      "optic_Aco",
      "acc_pointer_IR",
      "ItemGPS",
      "ItemMap",
      "ItemCompass",
      "ItemWatch",
      "ItemRadio",
      "NVGoggles"
    };
    uniformClass = "U_B_CombatUniform_mcam";
    backpack = "B_AssaultPack_rgr";
  };
    class B_ExplosiveSpecialist
  {
    displayName = $STR_b_soldier_exp_f0;
    role = "Support";
    weapons[] = {
      "arifle_MX_Black_F"
    };
    magazines[] = {
      "SmokeShell",
      "SmokeShell",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "DemoCharge_Remote_Mag",			
      "DemoCharge_Remote_Mag",
      "APERSMine_Range_Mag",
      "APERSMine_Range_Mag",
      "APERSBoundingMine_Range_Mag",
      "APERSBoundingMine_Range_Mag",
      "APERSTripMine_Wire_Mag",
      "APERSTripMine_Wire_Mag"
    };
    items[] = {
      "FirstAidKit",
      "Toolkit",
      "MineDetector"
    };
    linkedItems[] = {
      "V_PlateCarrier1_rgr",
      "H_HelmetSpecB_sand",
      "optic_Aco",
      "acc_flashlight",
      "ItemGPS",
      "ItemMap",
      "ItemCompass",
      "ItemWatch",
      "ItemRadio",
      "NVGoggles"			
    };
    uniformClass = "U_B_CombatUniform_mcam_vest";
    backpack = "B_Kitbag_cbr";
  };
  class B_CombatLifesaver
  {
    displayName = $STR_b_medic_f0;
    role = "Support";
    weapons[] = {
      "arifle_MX_Black_F"
    };
    magazines[] = {
      "SmokeShell",
      "SmokeShell",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",						
      "30Rnd_65x39_caseless_mag"
    };
    items[] = {
      "FirstAidKit",
      "FirstAidKit",
      "FirstAidKit",
      "FirstAidKit",
      "FirstAidKit",
      "FirstAidKit",
      "FirstAidKit",
      "FirstAidKit",		
      "Medikit"
    };
    linkedItems[] = {
      "V_PlateCarrier1_rgr",
      "H_HelmetB_grass",
      "optic_aco",
      "acc_pointer_IR",
      "ItemGPS",
      "ItemMap",
      "ItemCompass",
      "ItemWatch",
      "ItemRadio",
      "NVGoggles"			
    };
    uniformClass = "U_B_CombatUniform_mcam_tshirt";
    backpack = "B_AssaultPack_mcamo";
  };
  class B_JTAC
  {
    displayName = $STR_JTAC_unit;
    role = "Recon";
    weapons[] = {
      "arifle_MX_Black_F",
      "Laserdesignator",
    };
    magazines[] = {
      "SmokeShell",
      "SmokeShell",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",						
      "HandGrenade",
      "HandGrenade",
      "Laserbatteries"
    };
    items[] = {
      "FirstAidKit"
    };
    linkedItems[] = {
      "V_PlateCarrier2_rgr",
      "H_HelmetB_light_sand",
      "optic_Aco",
      "acc_pointer_IR",
      "ItemGPS",
      "ItemMap",
      "ItemCompass",
      "ItemWatch",
      "ItemRadio",
      "NVGoggles"			
    };
    uniformClass = "U_B_CombatUniform_mcam_tshirt";
  };
  class B_ATSpecialist
  {
    displayName = $STR_b_soldier_at_f0;
    role = "Assault";
    weapons[] = {
      "arifle_MX_Black_F",
      "launch_MRAWS_green_rail_F"
    };
    magazines[] = {
      "SmokeShell",
      "SmokeShell",
      "B_IR_Grenade",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag",
      "30Rnd_65x39_caseless_mag_Tracer",
      "30Rnd_65x39_caseless_mag_Tracer",
      "MRAWS_HE_F",
      "MRAWS_HE_F",
      "MRAWS_HEAT_F"
    };
    items[] = {
      "FirstAidKit"
    };
    linkedItems[] = {
      "V_PlateCarrier1_rgr",
      "H_HelmetSpecB_sand",
      "optic_Aco",
      "acc_pointer_IR",
      "ItemGPS",
      "ItemMap",
      "ItemCompass",
      "ItemWatch",
      "ItemRadio",
      "NVGoggles"			
    };
    uniformClass = "U_B_CombatUniform_mcam";
    backpack = "B_Kitbag_rgr";
  };
};
