#define VIEW_DISTANCE_DEFAULT 	 1000
#define DAYTIMEHOUR_DEFAULT		 12
#define WEATHER_DEFAULT			 100
#define RESPAWN_DELAY_DEFAULT 	 20
#define PARAM_EVACWAVE_DEFAULT 	 5
#define PARAM_TICKETS_DEFAULT	 5
#define PARAM_TICKETS_REWARD	 1
#define PLAYERS_MARKERS_DEFAULT	 1
#define PLAYERS_NAMETAGS_DEFAULT 2
#define DEBUGCONSOLE_DEFAULT 	 0
#define DIFF_AI_ACCURACY_DEFAULT 1

class ViewDistance {
  title = $STR_param_view_dist;
  isGlobal = 1;
  values[] = {1000,1500,2000,2500,3000,3500,3800};
  texts[] = {"1000","1500","2000","2500","3000","3500","3800"};
  default = VIEW_DISTANCE_DEFAULT;
  function = "BIS_fnc_paramViewDistance";
};
class Daytime {
  title = $STR_a3_cfgvehicles_moduledate_f_arguments_hour_0;
  values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
  texts[] = {"00:00","01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00"};
  default = DAYTIMEHOUR_DEFAULT;
  function = "BIS_fnc_paramDaytime";
};
class Weather {
  title = $STR_A3_rscattributeovercast_title;
  values[] = {0,25,50,75,100};
  texts[] = {
    $STR_A3_rscattributeovercast_value000_tooltip,
    $STR_A3_rscattributeovercast_value025_tooltip,
    $STR_A3_rscattributeovercast_value050_tooltip,
    $STR_A3_rscattributeovercast_value075_tooltip,
    $STR_A3_rscattributeovercast_value100_tooltip
  };
  default = WEATHER_DEFAULT;
  function = "BIS_fnc_paramWeather";
};
class EvacWave {
  title = $STR_param_evacWave;
  values[] = {3,4,5};
  texts[] = {"3","4","5"};
  default = PARAM_EVACWAVE_DEFAULT;
};
class Tickets {
  title = $STR_param_tickets; 
  values[] = {1,5,10,20};		
  texts[] = {"1","5","10","20"};
  default = PARAM_TICKETS_DEFAULT;
};	
class TicketsRewards {
  title = $STR_param_tickets_reward; 
  values[] = {1,2,3,4,5};		
  texts[] = {"1","2","3","4","5"};
  default = PARAM_TICKETS_REWARD;
};
class RespawnTime {
  title = $STR_param_respawn_time;
  values[] = {10, 15, 20, 25, 30};
  texts[] = {"10", "15", "20", "25", "30"};
  default = RESPAWN_DELAY_DEFAULT;
};
class SkillAI {
  title = $STR_paramAI;
  values[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  texts[] = {"0.1", "0.2", "0.3", "0.4", "0.5", "0.6", "0.7", "0.8", "0.9", "1"};
  default = DIFF_AI_ACCURACY_DEFAULT;
};
class ReviveMode {
  title = $STR_A3_ReviveMode;
  isGlobal = 1;
  values[] = {-100,0,1};
  texts[] = {
    $STR_A3_MissionDefault,
    $STR_A3_Disabled,
    $STR_A3_EnabledForAllPlayers
  };
  default = 0;
  function = "bis_fnc_paramReviveMode";
};
class ReviveDuration {
  title = $STR_A3_ReviveDuration;
  isGlobal = 1;
  values[] = {-100,6,8,10,12,15,20,25,30};
  texts[] = {$STR_A3_MissionDefault,6,8,10,12,15,20,25,30};
  default = -100;
  function = "bis_fnc_paramReviveDuration";
};
class ReviveRequiredTrait {
  title = $STR_A3_RequiredTrait;
  isGlobal = 1;
  values[] = {-100,0,1};
  texts[] = {
    $STR_A3_MissionDefault,
    $STR_A3_None,
    $STR_A3_Medic
  };
  default = -100;
  function = "bis_fnc_paramReviveRequiredTrait";
};
class ReviveMedicSpeedMultiplier {
  title = $STR_A3_RequiredTrait_MedicSpeedMultiplier;
  isGlobal = 1;
  values[] = {-100,1,1.5,2,2.5,3};
  texts[] = {$STR_A3_MissionDefault,"1x","1.5x","2x","2.5x","3x"};
  default = -100;
  function = "bis_fnc_paramReviveMedicSpeedMultiplier";
};
class ReviveRequiredItems {
  title = $STR_A3_RequiredItems;
  isGlobal = 1;
  values[] = {-100,0,1,2};
  texts[] = {
    $STR_A3_MissionDefault,
    $STR_A3_None,
    $STR_A3_Medikit,
    $STR_A3_FirstAidKitOrMedikit
  };
  default = -100;
  function = "bis_fnc_paramReviveRequiredItems";
};
class UnconsciousStateMode {
  title = $STR_A3_IncapacitationMode;
  isGlobal = 1;
  values[] = {-100,0,1};
  texts[] = {
    $STR_A3_MissionDefault,
    $STR_A3_Basic,
    $STR_A3_Advanced
  };
  default = -100;
  function = "bis_fnc_paramReviveUnconsciousStateMode";
};
class ReviveBleedOutDuration {
  title = $STR_A3_BleedOutDuration;
  isGlobal = 1;
  values[] = {-100,10,15,20,30,45,60,90,180};
  texts[] = {$STR_A3_MissionDefault,10,15,20,30,45,60,90,180};
  default = -100;
  function = "bis_fnc_paramReviveBleedOutDuration";
};
class ReviveForceRespawnDuration {
  title = $STR_A3_ForceRespawnDuration;
  isGlobal = 1;
  values[] = {-100,3,4,5,6,7,8,9,10};
  texts[] = {$STR_A3_MissionDefault,3,4,5,6,7,8,9,10};
  default = -100;
  function = "bis_fnc_paramReviveForceRespawnDuration";
};
class playersMarkers {
  title = $STR_param_markers;
  values[] = {0,1};
  texts[] = {$STR_DISABLED,$STR_ENABLED};
  default = PLAYERS_MARKERS_DEFAULT;
};
class playersNameTags {
  title = $STR_param_nameTags;
  values[] = {0,1,2};
  texts[] = {$STR_DISABLED,$STR_A3_Basic,$STR_A3_Advanced};
  default = PLAYERS_NAMETAGS_DEFAULT;
};
class DebugConsole {
  title = $STR_A3_paramDebugConsole_title;
  values[] = {0,1};
  texts[] = {$STR_DISABLED,$STR_ENABLED};
  default = DEBUGCONSOLE_DEFAULT;
};
