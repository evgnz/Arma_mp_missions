/*--------------------------------------------------------------------------------------------------
  BASIC DEFINES / MISSION SETTINGS
--------------------------------------------------------------------------------------------------*/

#define RANDOM_POS        [[13567.1,21369.4,0],[13867.9,21665.7,0],[14284.9,20855.9,0],[13925.6,21524.7,0]]
#define POS_LIST 	   		  [[13567.1,21369.4,0],[13867.9,21665.7,0],[14284.9,20855.9,0],[13925.6,21524.7,0]]
#define INF_POS		   		  [[13567.1,21369.4,0],[13867.9,21665.7,0],[14284.9,20855.9,0],[13925.6,21524.7,0]]
#define ARMOR_POS	   		  [[13213,21390.1,0],[14207.3,20432.1,0],[15042.7,20979.9,3.43323e-005],[15117.4,21941.5,1.14441e-005]]
#define TRANSPORT_POS  		[[14164.4,21747.2,-1.52588e-005],[13295.2,21255,0],[14475.8,20496.6,0],[14898.1,21180.3,-1.52588e-005]]
#define BASE_CRATES_POS		[[14191.2,21205.3,0.00900269],[14223.3,21238.9,-0.000831604],[14176.2,21223.6,0],[14117.5,21276.3,0]]

#define SORTED_VEHICLES	  ((entities "LandVehicle") - [st_1,st_2,st_3,st_4,st_5])
#define MISSION_OBJECTS		(entities [["CAManBase", "LandVehicle"], ["SoldierWB", "Car_F", "Tank_F", "Air"]]) select {side _x isEqualTo east}
#define WP_HOLDERS		 	  (nearestObjects [SECTOR_POS, ["WeaponHolder", "GroundWeaponHolder", "WeaponHolderSimulated"], 1000])
#define GARBAGE_LIST		  (WP_HOLDERS + allDead)

#define ALIVE_PLAYERS	   	  (allUnits select {isPlayer _x})
#define ALL_PLAYERS         ((allUnits + allDeadMen) select {isPlayer _x})
#define REMOTE_PLAYERS		  (playableUnits - [player])
#define REMOTE_LEADER       (ALL_PLAYERS select (ALL_PLAYERS findIf {_x isEqualTo leader group _x}))
#define ALL_PLAYERS_NUMBER  (count ALL_PLAYERS)
#define PLAYERS_NUMBER      (count playableUnits)
#define EAST_ALIVE          (allUnits select {side _x isEqualTo east})

#define PUSH_ARG(A,B)     A pushBack B
#define RAND(A)           selectRandom A
#define CRAND(A,B,C)		  (ceil (random [A, B, C]))
#define FRAND(A,B,C)      (floor (random [A, B, C]))
#define RN_RAND(A,B,C)    (round (random [A, B, C]))
#define INC_VAR(A,B)      (call {A = A + B; A})
#define DEC_VAR(A,B)      (call {A = A - B; A})

#define QVAR(A)           (missionNamespace getVariable A)
#define GET_VAR(A,B)      (missionNamespace getVariable [A, B])
#define SET_VAR(A,B)      missionNamespace setVariable [A, B]
#define SET_GVAR(A,B)     missionNamespace setVariable [A, B, true]

#define GET_PARAM(A)      (A call (missionNamespace getVariable ["BIS_fnc_storeParamsValues_data", {}]))
#define EVAC_ROUND        (missionNamespace getvariable ["EvacWave", 5])
#define SW_DELAY          (GET_PARAM("RespawnTime") / 1.25) min 10
#define SKIP_VALUE        "skiptime_value"

#define DIFF_INF_NUMBER   (ceil ((ALL_PLAYERS_NUMBER / 2.25) max 4))
#define DIFF_ARM_NUMBER   ((floor (DIFF_INF_NUMBER / 2)) min 4)
#define DIFF_TRN_NUMBER   (DIFF_ARM_NUMBER - 1) max 2

#define FULL_CREW(V)      ((fullCrew [V, "", false]) apply {_x select 0})
#define GET_UNIT(A,B)     (A isEqualTo GET_VAR("JTAC_player", objNull) && {A isEqualTo B})
#define ADDONS_LOADED     (isClass (configFile >> "cfgPatches" >> "rhsusf_main"))

#define DELETE_EMPTY(A)	(call {\
  if (FULL_CREW(A) findIf {alive _x} isEqualTo -1) then {\
    deleteVehicle A;\
  };\
})

#define EXSTATE(A,B) (\
  (isNull A) || {!alive A} || {A isEqualTo B} || {group A != group B} || {A getVariable ["BIS_revive_incapacitated", false]}\
)

/*--------------------------------------------------------------------------------------------------
  ADDONS SETTINGS
--------------------------------------------------------------------------------------------------*/

#define UNIT_TYPES [\
  "B_soldier_LAT2_F","B_soldier_exp_F","B_recon_JTAC_F",\
  "B_soldier_M_F","B_Patrol_Soldier_MG_F","B_medic_F"\
]

#define BASE_LOADOUTS [\
  "B_ATSpecialist","B_ExplosiveSpecialist","B_JTAC",\
  "B_Marksman","B_HeavyGunner","B_CombatLifesaver"\
]

#define ADDON_LOADOUTS [\
  "INF_AT","INF_USMC_EOD","INF_JTAC",\
  "INF_MARKSMAN","INF_HMG","INF_MEDIC"\
]

#define DEFAULT_LOADOUTS  	[["B_Grenadier","B_Autorifleman"],["INF_GRENADIER","INF_LMG"]]
#define CLASSES_LOADOUTS	([BASE_LOADOUTS, ADDON_LOADOUTS] select ADDONS_LOADED)

#define ADDONS_GROUPS [\
  (configfile >> "CfgGroups" >> "East" >> "rhs_faction_vdv" >> "rhs_group_rus_vdv_infantry_flora" >> "rhs_group_rus_vdv_infantry_flora_squad_mg_sniper"),\
  (configfile >> "CfgGroups" >> "East" >> "rhs_faction_vdv" >> "rhs_group_rus_vdv_infantry_recon" >> "rhs_group_rus_vdv_infantry_recon_squad_mg_sniper"),\
  (configfile >> "CfgGroups" >> "East" >> "rhs_faction_vdv" >> "rhs_group_rus_vdv_infantry_mflora" >> "rhs_group_rus_vdv_infantry_mflora_squad_2mg"),\
  (configfile >> "CfgGroups" >> "East" >> "rhs_faction_vdv" >> "rhs_group_rus_vdv_infantry_mflora" >> "rhs_group_rus_vdv_infantry_mflora_squad"),\
  (configfile >> "CfgGroups" >> "East" >> "rhs_faction_msv" >> "rhs_group_rus_msv_infantry_emr" >> "rhs_group_rus_msv_infantry_emr_squad_2mg")\
]

#define DEFAULT_GROUPS [\
  (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad_Weapons"),\
  (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad"),\
  (configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "Infantry" >> "O_T_InfSquad_Weapons"),\
  (configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "Infantry" >> "O_T_InfSquad"),\
  (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconTeam")\
]

#define ADDONS_CLASSES [\
  ADDONS_GROUPS,[\
    ["rhs_tigr_m_vdv", "rhs_tigr_m_3camo_vdv"],\
    ["rhs_tigr_sts_3camo_vdv","rhs_gaz66_zu23_msv","RHS_Ural_Zu23_VDV_01"],\
    ["rhs_btr80a_vdv","rhs_zsu234_aa"],\
    ["rhs_bmp3mera_msv", "rhs_bmd4m_vdv"],\
    ["rhs_bmd4m_vdv", "rhs_t80um"],\
    ["rhs_t90a_tv", "rhs_bmd4m_vdv", "rhs_bmp3mera_msv"]\
  ],["rhs_kamaz5350_vdv", "rhs_kamaz5350_open_vdv"]\
]

#define DEFAULT_CLASSES [\
  DEFAULT_GROUPS,[\
    ["O_MRAP_02_hmg_F"],["O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F"],\
    ["O_APC_Tracked_02_cannon_F", "O_APC_Wheeled_02_rcws_v2_F"],\
    ["O_APC_Tracked_02_cannon_F", "O_MBT_02_cannon_F"],\
    ["O_MBT_04_cannon_F", "O_MBT_04_command_F"],\
    ["O_MBT_04_command_F", "O_APC_Tracked_02_cannon_F", "O_MBT_04_cannon_F"]\
  ],["O_Truck_03_covered_F", "O_Truck_03_transport_F"]\
]

#define GET_CLASSES (call {\
  [DEFAULT_CLASSES,ADDONS_CLASSES] select ADDONS_LOADED\
})

#define ST_DEFAULT [\
  "O_Soldier_TL_F","O_support_AMG_F","O_support_GMG_F",\
  "Laserdesignator","O_GMG_01_weapon_F","O_HMG_01_support_F"\
]

#define ST_ADDONS	[\
  "rhs_vdv_mflora_sergeant","rhs_vdv_mflora_grenadier",\
  "rhs_vdv_mflora_RShG2","rhs_pdu4","RHS_AGS30_Gun_Bag","RHS_AGS30_Tripod_Bag"\
]

#define SET_CLASSES (call {\
  [ST_DEFAULT,ST_ADDONS] select ADDONS_LOADED\
})

/*--------------------------------------------------------------------------------------------------
  UI SETTINGS
--------------------------------------------------------------------------------------------------*/

#define CTRL_W_X      safeZoneWAbs + safeZoneXAbs
#define CTRL_H_Y      safeZoneH + safeZoneY
#define CTRL_WH       (safeZoneWAbs / safezoneH)
#define CTRL_SR_XY    (0.005 * CTRL_W_X), (0.005 * CTRL_H_Y)
#define CTRL_EP_W 		(17 * ((CTRL_WH min 1.2) / 80))
#define CTRL_EP_H 		((((CTRL_WH min 1.2) / 1.2) / 20) * 0.85)
#define CTRL_EP_X 		(safeZoneXAbs + 1 * ((CTRL_WH min 1.2) / 40))
#define CTRL_EP_Y 		(safezoneY + safezoneH - 27 * (((CTRL_WH min 1.2) / 1.2) / 25))
#define CTRL_SKIP     [0.396875 * CTRL_W_X, 0.731 * CTRL_H_Y, 0.20625 * safeZoneWAbs, 0.02485 * safezoneH]

#define CTRL_W 				 1.75
#define CTRL_H 				 1.15
#define CTRL_X 				 ((safeZoneXAbs + (safeZoneWAbs / 2)) - (CTRL_W / 2))
#define CTRL_Y 				 ((safeZoneY + safeZoneH) - CTRL_H)

#define MISSION_DISPLAY      (findDisplay 46)
#define DISPLAY_STATUS 		   (uiNamespace getVariable ["RscMissionStatus", displayNull])
#define DISPLAY_COMMMENU 	   (uiNamespace getVariable ["RscCommMenuItems", displayNull])
#define RSC_LAYER_PROGRESS	 ("RscMissionStatus" call BIS_fnc_rscLayer)

#define CTRL_FONT_H			  0.035
#define CTRL_B_COLOR		  [0, 0, 0, 1]
#define CTRL_FONT			    "PuristaMedium"
#define CTRL_INT_LOGO		  "\a3\Ui_f\data\GUI\Cfg\Hints\CompetitiveRules_ca.paa"
#define CTRL_INT_IMAGE    "\a3\ui_f\data\GUI\Rsc\RscDisplayWelcome\welcome_nexus3_ca.paa"
#define CTRL_ICON_X			  "\a3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa"
#define CTRL_ICON_BI		  "\a3\ui_f\data\GUI\RscCommon\RscDebugConsole\forum_ca.paa"

#define CTRL_INT_ICONS (\
  "<img image='\a3\ui_f\data\GUI\Cfg\CommunicationMenu\casheli_ca.paa' align='left' valign='true'/>" + "<br/>" +\
  "<img image='\a3\ui_f\data\GUI\Cfg\CommunicationMenu\cas_ca.paa' align='left' valign='true'/>" + "<br/>" +\
  "<img image='\a3\ui_f\data\GUI\Cfg\CommunicationMenu\artillery_ca.paa' align='left' valign='true'/>" + "<br/>" +\
  "<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\supplydrop_ca.paa' align='left' valign='true'/>"\
)

#define CTRL_TEXT_FIRE		 localize "STR_key_fire"
#define CTRL_TEXT_TPOS		 localize "STR_text_grid_target"
#define CTRL_TEXT_RPOS		 localize "STR_text_grid_FO"
#define CTRL_TEXT_CHECK		 localize "STR_key_checkFire"
#define CTRL_TT_CLOSE      localize "STR_key_close"
#define CTRL_TT_TEXT_LMB	 localize "STR_key_toolTip"

#define CTRL_HEADER_TEXT	 format ["<t align='left' size='1' font='PuristaMedium' color='#ffffff'>%1</t>", localize "STR_key_header"]
#define CTRL_UNITS_TEXT		 format ["<t align='right' size='0.85' font='PuristaMedium'>%1</t>",localize "STR_text_units"] + "<br/>"
#define CTRL_AMMO_TYPE		 format ["<t align='right' size='0.85' font='PuristaMedium'>%1</t>",localize "STR_text_ammo"]
#define CTRL_DELAY_TEXT		 format ["<t align='left' size='0.85' font='PuristaMedium'>%1</t>",localize "STR_text_delay"] + "<br/>"
#define CTRL_ROUNDS_TEXT	 format ["<t align='left' size='0.85' font='PuristaMedium'>%1</t>",localize "STR_text_rounds"]
#define CTRL_FSUPP_TEXT		 format ["<t align='left' size='0.85' font='PuristaMedium'>%1</t>",localize "STR_fire_support"] + "<br/>"
#define CTRL_CALLS_TEXT		 format ["<t align='left' size='0.85' font='PuristaMedium'>%1 %2</t>",localize "STR_calls_support",GET_VAR("calls_left",5)]

#define CTRL_CALL_ICON    "<img image='\a3\ui_f\data\gui\cfg\Hints\CallSupport_CA.paa' align='left' size='1.88'/>"
#define CTRL_ICON_LINES   "<t align='left' size='1.15' font='PuristaLight' color='#a8a8a8'>ııllı</t>"

#define HINT_TEXT_UNITS   format ["<t align='left' font='PuristaMedium'>%1</t>",localize "STR_rep_units"]
#define HINT_TEXT_ROUNDS  format ["<t align='left' font='PuristaMedium'>%1</t>",localize "STR_rep_rounds"]
#define HINT_TEXT_NROUNDS format ["<t align='left' font='PuristaMedium'>%1</t>",localize "STR_rep_roundsN"]
#define HINT_TEXT_DELAY		format ["<t align='left' font='PuristaMedium'>%1</t>",localize "STR_rep_delay"]
#define HINT_TEXT_ETA     format ["<t align='left' font='PuristaMedium'>%1</t>",localize "STR_rep_eta"]
#define HINT_ICON_TEXT    format ["<t align='left' font='PuristaMedium'>%1</t>",localize "STR_req_received"]

#define HINT_ICON_UNITS   "<img image='\a3\ui_f\data\GUI\Cfg\CommunicationMenu\artillery_ca.paa' align='left' size='1.15'/>"
#define HINT_TEXT_GRID    "<t align='left' font='PuristaMedium'>%1</t>"

#define SCORCHER_NAME		 (getText (configFile >> "CfgVehicles" >> "B_T_MBT_01_arty_F" >> "DisplayName"))
#define MORTAR_NAME			 (getText (configFile >> "CfgVehicles" >> "B_T_Mortar_01_F" >> "DisplayName"))

#define LB_UNITS_LIST     [SCORCHER_NAME,MORTAR_NAME]
#define LB_ROUNS_LIST_A   ["155 mm HE","155 mm DPICM"]
#define LB_ROUNS_LIST_B   ["82 mm HE","82 mm Smoke","82 mm ILLUM"]
#define LB_NUMBER_LIST_A  ["1","2","3","4","5","6","7","8","9","10"]
#define LB_NUMBER_LIST_B  ["1"]
#define LB_DELAY_LIST     ["5","10","15","20","25","30","35","40"]

#define PROFILE_RGB_R    (profilenamespace getvariable ["GUI_BCG_RGB_R", 0.13])
#define PROFILE_RGB_G    (profilenamespace getvariable ["GUI_BCG_RGB_G", 0.54])
#define PROFILE_RGB_B    (profilenamespace getvariable ["GUI_BCG_RGB_B", 0.21])
#define PROFILE_RGB_A    (profilenamespace getvariable ["GUI_BCG_RGB_A", 0.8])

#define LB_ROUNDS_ADD(A,B) (call {\
  lnbClear A;\
  if (B isEqualTo 0) then {\
    {A lbAdd _x} forEach LB_ROUNS_LIST_A;\
  } else {\
    {A lbAdd _x} forEach LB_ROUNS_LIST_B;\
  };\
  A lbSetCurSel 0;\
})

#define LB_NUMBER_SET(A,B,C) (call {\
  lnbClear A;\
  if !(B isEqualTo 1 && {C isEqualTo 0}) then {\
    {A lbAdd _x} forEach LB_NUMBER_LIST_A;\
  } else {\
    {A lbAdd _x} forEach LB_NUMBER_LIST_B;\
  };\
  A lbSetCurSel 0;\
})

#define LB_NUMBER_ADD(A,B) (call {\
  lnbClear A;\
  if (B isEqualTo 0) then {\
    {A lbAdd _x} forEach LB_NUMBER_LIST_A;\
  } else {\
    {A lbAdd _x} forEach LB_NUMBER_LIST_B;\
  };\
  A lbSetCurSel 0;\
})

#define UI_HIDE (call {\
  if (!isNull DISPLAY_STATUS) then {\
    private _ctrlStatus = DISPLAY_STATUS displayCtrl 15283;\
    if (ctrlShown _ctrlStatus) then {_ctrlStatus ctrlShow false};\
  };\
  if GET_UNIT(player,JTAC_player) then {\
    if (!isNull DISPLAY_COMMMENU) then {\
      private _ctrlCommMenu = DISPLAY_COMMMENU displayCtrl 2300;\
      if (ctrlShown _ctrlCommMenu) then {_ctrlCommMenu ctrlShow false};\
    };\
  };\
  true\
})

#define UI_SHOW (call {\
  if (!isNull DISPLAY_STATUS) then {\
    private _ctrlStatus = DISPLAY_STATUS displayCtrl 15283;\
    if !(ctrlShown _ctrlStatus) then {_ctrlStatus ctrlShow true};\
  };\
  if GET_UNIT(player,JTAC_player) then {\
    if (!isNull DISPLAY_COMMMENU) then {\
      private _ctrlCommMenu = DISPLAY_COMMMENU displayCtrl 2300;\
      if !(ctrlShown _ctrlCommMenu) then {_ctrlCommMenu ctrlShow true};\
    };\
  };\
  true\
})

#define CTRL_SHOW(A,B)\
  A ctrlSetFade 0; A ctrlCommit B; playSound "hintExpand";

#define CTRL_HIDE(A)\
  A ctrlSetFade 1; A ctrlCommit 0;

#define OUTRO_AI_LIST [\
  "Private Ryan Lee","Sergeant Oliver Griffiths","Corporal Andy Evans","Staff Sergeant Jack Jackson","Corporal Nathan O'Connor",\
  "Private Paul Jackson","Staff Sergeant Ryan Davies","Private John Evans","Staff Sergeant Thomas Snowe","Sergeant Sean Miller",\
  "Sergeant Henry Price","Private Cameron Campbell","Corporal Charlie Jones","Sergeant Nathan Coburn","Private Charles Thomas",\
  "Corporal Paul Jones","Sergeant Corey Thomson","Private Lucas Reed","Private Sean Abbey","Private Oliver Jackson"\
]

/*--------------------------------------------------------------------------------------------------
  ICONS / MARKERS
--------------------------------------------------------------------------------------------------*/

#define SIZE_F          0.035
#define NAME_X          (name _x)
#define VEH_X           (vehicle _x)
#define DIR_X           (getDir VEH_X)
#define POS_X           (visiblePosition VEH_X)
#define NAME_DRIVER     (name driver VEH_X)
#define GET_CREW(A)     count ((crew A) select {alive _x})
#define GET_NAME        [NAME_DRIVER, ""] select (isNull driver VEH_X)
#define ICON_SHAPE      getText (configfile >> "CfgVehicles" >> typeOf VEH_X >> "icon")
#define DISPLAY_NAME    getText (configfile >> "CfgVehicles" >> typeOf VEH_X >> "displayName")
#define DNAME_SHORT(A)  format ["%1.%2", [A, "displayNameShort"] call BIS_fnc_rankParams, NAME_X]
#define ICON_RANK(A)	  format ["a3\Ui_f\data\GUI\Cfg\Ranks\%1_gs.paa", rank A]

#define POS_ADV(A)    A modelToWorldVisual [0, 0, ((A selectionPosition "head") select 2) + 0.5]
#define POS_SHORT(A)  A modelToWorldVisual [0, 0, ((A selectionPosition "head") select 2) - 0.35]

#define FONT_M        "PuristaMedium"
#define FONT_L        "PuristaLight"
#define INCAP_COLOR   [0.4,0,0,0.55]
#define EAST_COLOR    [0.5,0,0,1]
#define WEST_COLOR    [0,0.3,0.5,0.85]
#define GUER_COLOR    [0,0.5,0,1]
#define CIV_COLOR     [0.5,0.5,0.5,1]
#define XX_COLOR      [1,1,1,1]

#define ALL_SIDES     [east,west,independent,civilian,sideUnknown]
#define GET_COLOR(A)  [WEST_COLOR,INCAP_COLOR] select (lifeState A == "INCAPACITATED")
#define FIND_COLOR(A) [EAST_COLOR,WEST_COLOR,GUER_COLOR,CIV_COLOR,XX_COLOR] select (ALL_SIDES find (side group A))

#define INTRO_ICONS [\
  ["\a3\ui_f\data\Map\Markers\NATO\respawn_inf_ca", WEST_COLOR, [14110.3,21256.3,0], 0.65, 0.65, 0, "", 0],\
  ["\a3\ui_f\data\Map\Markers\NATO\respawn_inf_ca", WEST_COLOR, [14200.5,21269.3,0], 0.65, 0.65, 0, "", 0],\
  ["\a3\ui_f\data\Map\Markers\NATO\respawn_inf_ca", WEST_COLOR, [14245.5,21233.7,0], 0.65, 0.65, 0, "", 0],\
  ["\a3\ui_f\data\Map\Markers\NATO\respawn_inf_ca", WEST_COLOR, [14184.4,21186.1,0], 0.65, 0.65, 0, "", 0],\
  ["\a3\ui_f\data\Map\Markers\NATO\o_inf", EAST_COLOR, [14756.6,21738,0], 0.75, 0.75, 0, "", 0],\
  ["\a3\ui_f\data\Map\Markers\NATO\o_inf", EAST_COLOR, [14726.9,20854.8,0], 0.75, 0.75, 0, "", 0],\
  ["\a3\ui_f\data\Map\Markers\NATO\o_inf", EAST_COLOR, [13507.7,20810,0], 0.75, 0.75, 0, "", 0],\
  ["\a3\ui_f\data\Map\Markers\NATO\o_inf", EAST_COLOR, [13593,21877.5,0], 0.75, 0.75, 0, "", 0],\
  ["\a3\ui_f\data\Map\Markers\NATO\b_hq", WEST_COLOR, sl_flagPole modelToWorld [0, 0, 5], 0.75, 0.8, 0, "", 0]\
]

/*--------------------------------------------------------------------------------------------------
  MODULE SECTOR
--------------------------------------------------------------------------------------------------*/

#define SECTOR_OWNER_CHANGED  "_this call SL_fnc_sectorCaptured"
#define SECTOR_NAME           localize "STR_sector_name"
#define SECTOR_SIGN           localize "STR_sector_ID"
#define SECTOR_POS            [14176.5,21236.3,0]
#define SECTOR_AREA           [30, 25, 0, false]
#define SECTOR_SIDES          [east,west]
#define SECTOR_OWNER          1
#define SECTOR_REWARD         50
#define SECTOR_TASK_OWNER     0
#define SECTOR_TASK_TITLE     ""
#define SECTOR_TASK_DESCR     ""
#define SECTOR_OWNER_LIMIT    1
#define COST_INFANTRY         0.25
#define COST_WHEELED          0.25
#define COST_TRACKED          0.45
#define COST_WATER            0
#define COST_AIR              0
#define COST_PLAYERS          "2.25"
#define CAP_COEFICENT         0.05

#define SET_SECTOR(A) (call {\
  A setVariable ["Name", SECTOR_NAME];\
  A setVariable ["Designation", SECTOR_SIGN];\
  A setVariable ["objectArea",SECTOR_AREA];\
  A setVariable ["OwnerLimit", SECTOR_OWNER_LIMIT];\
  A setVariable ["OnOwnerChange", SECTOR_OWNER_CHANGED];\
  A setVariable ["CaptureCoef", CAP_COEFICENT];\
  A setVariable ["CostInfantry", COST_INFANTRY];\
  A setVariable ["CostWheeled", COST_WHEELED];\
  A setVariable ["CostTracked", COST_TRACKED];\
  A setVariable ["CostWater", COST_WATER];\
  A setVariable ["CostAir", COST_AIR];\
  A setVariable ["CostPlayers", COST_PLAYERS];\
  A setVariable ["DefaultOwner", SECTOR_OWNER];\
  A setVariable ["TaskOwner", SECTOR_TASK_OWNER];\
  A setVariable ["TaskTitle", SECTOR_TASK_TITLE];\
  A setVariable ["taskDescription", SECTOR_TASK_DESCR];\
  A setVariable ["ScoreReward", SECTOR_REWARD];\
  A setVariable ["Sides", SECTOR_SIDES];\
  A setvariable ["BIS_fnc_initModules_disableAutoActivation", false, true];\
  createGuardedPoint [east, SECTOR_POS, -1, objNull];\
  A\
})

/*--------------------------------------------------------------------------------------------------
  TASKS TITLES / DESCRIPTIONS / SUPPORTS MESSAGES
--------------------------------------------------------------------------------------------------*/

#define TASK_LWAVE_DESC   ["STR_lastwave_desc", "STR_lastwave_title", "STR_evac_marker"]
#define TASK_EVAC_DESC    ["STR_evac_desc", "STR_evac_title", "STR_evac_marker"]
#define TASK_CALL_DESC    ["STR_callheli_desc", "STR_callheli_title", ""]
#define TASK_WAVE_DESC    "STR_wave_desc"
#define TASK_WAVE_TITLE   "STR_wave_title"

#define SUPP_MESSAGE_LIST [\
  "","STR_request","STR_supporting","STR_supported","STR_support_rtb",\
  "STR_requestHeli","STR_supportingHeli","STR_supportedHeli",\
  "STR_A3_affirmative__supplies_en_route__out_","STR_A3_the_supplies_have_been_dropped__out_"\
]

#define CONV_LIST [\
  ["01_BLUFOR", "MPType_Defense", [["BHQ", 0], true], "SIDE"],\
  ["01_BLUFOR", "MPType_Defense", [["BHQ", 1], true], "SIDE"],\
  ["01_BLUFOR", "MPType_Defense", [["BHQ", 3], true], "SIDE"],\
  ["01_BLUFOR", "MPType_Defense", [["BHQ", 4], true], "SIDE"],\
  ["01_BLUFOR", "MPType_Defense", [["BHQ", 7], true], "SIDE"],\
  ["01_BLUFOR", "MPType_Defense", [["BHQ", 8], true], "SIDE"],\
  ["01_BLUFOR", "MPType_Defense", [["BHQ", 9], true], "SIDE"],\
  ["01_BLUFOR", "MPType_Defense", [["BHQ", 11], true], "SIDE"]\
]
