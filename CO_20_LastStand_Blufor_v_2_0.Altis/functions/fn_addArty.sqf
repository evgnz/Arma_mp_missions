/*
  File: fn_addArty.sqf
  Author:	Evgeny Chumichev
  Description: Simple control menu for the virtual artillery support providers
*/

#include "scriptComponent.hpp"

params ["_caller"];

private _display = findDisplay 46 createDisplay "RscDisplayEmpty";
private _ctrlHeader = _display ctrlCreate ["RscStructuredText", -1];
_ctrlHeader ctrlSetPosition [CTRL_X - 0.0275, CTRL_Y - 0.47, CTRL_W + 0.055, CTRL_H / 30];
_ctrlHeader ctrlSetStructuredText parseText CTRL_HEADER_TEXT; 
_ctrlHeader ctrlSetBackgroundColor [PROFILE_RGB_R, PROFILE_RGB_G, PROFILE_RGB_B, PROFILE_RGB_A];

private _ctrlFrame = _display ctrlCreate ["RscBackground", -1];
_ctrlFrame ctrlSetPosition [CTRL_X - 0.0275, CTRL_Y - 0.43, CTRL_W + 0.055, CTRL_H + 0.025];
_ctrlFrame ctrlSetBackgroundColor [0, 0, 0, 0.65];

private _ctrlMap = _display ctrlCreate ["RscMapControl", -1];
_ctrlMap ctrlSetPosition [CTRL_X, CTRL_Y - 0.35, CTRL_W, CTRL_H - 0.099];

private _ctrlButton = _display ctrlCreate ["RscActivePictureKeepAspect", -1];
_ctrlButton ctrlSetPosition [CTRL_X + 1.75, CTRL_Y - 0.47, CTRL_W / 62, CTRL_H / 30];
_ctrlButton ctrlSetText CTRL_ICON_X;
_ctrlButton ctrlSetTooltip CTRL_TT_CLOSE;
_ctrlButton ctrlSetTextColor [1,1,1,0.7];
_ctrlButton ctrlSetActiveColor [1,1,1,1];
_ctrlButton ctrlSetBackgroundColor [0,0,0,0];

private _ctrlText = _display ctrlCreate ["RscStructuredText", -1]; 
_ctrlText ctrlSetPosition [CTRL_X, CTRL_Y - 0.4275, CTRL_W, CTRL_H / 16];
_ctrlText ctrlSetBackgroundColor [0, 0, 0, 0.15]; 
_ctrlText ctrlSetStructuredText parseText (CTRL_CALL_ICON + CTRL_ICON_LINES);

private _ctrlTextUnits = _display ctrlCreate ["RscStructuredText", -1]; 
_ctrlTextUnits ctrlSetPosition [CTRL_X + 0.095, CTRL_Y - 0.4275, CTRL_W / 10, CTRL_H / 16];
_ctrlTextUnits ctrlSetBackgroundColor CTRL_B_COLOR; 
_ctrlTextUnits ctrlSetStructuredText parseText (CTRL_UNITS_TEXT + CTRL_AMMO_TYPE);

private _ctrlTextRounds = _display ctrlCreate ["RscStructuredText", -1]; 
_ctrlTextRounds ctrlSetPosition [CTRL_X + 1.4805, CTRL_Y - 0.4267, CTRL_W / 14, CTRL_H / 16];
_ctrlTextRounds ctrlSetBackgroundColor CTRL_B_COLOR; 
_ctrlTextRounds ctrlSetStructuredText parseText (CTRL_DELAY_TEXT + CTRL_ROUNDS_TEXT);

private _ctrlTextCalls = _display ctrlCreate ["RscStructuredText", 1000]; 
_ctrlTextCalls ctrlSetPosition [CTRL_X + 1.6112, CTRL_Y - 0.4267, CTRL_W / 12.6, CTRL_H / 16];
_ctrlTextCalls ctrlSetBackgroundColor CTRL_B_COLOR; 
_ctrlTextCalls ctrlSetStructuredText parseText (CTRL_FSUPP_TEXT + CTRL_CALLS_TEXT);

private _lbUnits = _display ctrlCreate ["RscXListbox", 1001];
_lbUnits ctrlSetPosition [CTRL_X + 0.275, CTRL_Y - 0.4267, CTRL_W / 5, CTRL_H / 34];
{_lbUnits lbAdd _x} forEach LB_UNITS_LIST;

private _lbSelUnits = _lbUnits ctrlAddEventHandler ["LBSelChanged", {
  params ["_lbUnits", "_id"];
  private _lbRounds = ctrlParent _lbUnits displayCtrl 1002;
  private _lbNumber = ctrlParent _lbUnits displayCtrl 1003;
  LB_ROUNDS_ADD(_lbRounds,_id);

  private _curSelRounds = lbCurSel _lbRounds;
  LB_NUMBER_ADD(_lbNumber,_curSelRounds);
  playSound "ReadoutHideClick2";
}];

private _lbRounds = _display ctrlCreate ["RscXListbox", 1002];
_lbRounds ctrlSetPosition [CTRL_X + 0.275, CTRL_Y - 0.389, CTRL_W / 5, CTRL_H / 34];

private _lbNumber = _display ctrlCreate ["RscCombo", 1003];
_lbNumber ctrlSetPosition [CTRL_X + 1.3825, CTRL_Y - 0.389, CTRL_W / 19, CTRL_H / 34];
private _lbNumChanged = _lbNumber ctrlAddEventHandler ["LBSelChanged", {playSound "ReadoutHideClick2"}];

private _lbxDelay = _display ctrlCreate ["RscCombo", 1004];
_lbxDelay ctrlSetPosition [CTRL_X + 1.3825, CTRL_Y - 0.4267, CTRL_W / 19, CTRL_H / 34];

private _lbDelayChanged = _lbxDelay ctrlAddEventHandler ["LBSelChanged", {playSound "ReadoutHideClick2"}];
{_lbxDelay lbAdd _x} forEach LB_DELAY_LIST;
{_x lbSetCurSel 0} forEach [_lbUnits, _lbRounds, _lbxDelay];

private _lbSelRouns = _lbRounds ctrlAddEventHandler ["LBSelChanged", {
  params ["_lbRounds", "_id"];
  private _lbUnits = ctrlParent _lbRounds displayCtrl 1001;
  private _lbNumber = ctrlParent _lbRounds displayCtrl 1003;
  private _csUnits = lbCurSel _lbUnits;
  LB_NUMBER_SET(_lbNumber,_id,_csUnits);
  playSound "ReadoutHideClick2";
}];

private _ctrlGrid = _display ctrlCreate ["RscText", 1005];
_ctrlGrid ctrlSetPosition [CTRL_X + 1.03, CTRL_Y - 0.4267, CTRL_W / 12, CTRL_H / 34];
_ctrlGrid ctrlSetBackgroundColor CTRL_B_COLOR;
_ctrlGrid ctrlSetFont CTRL_FONT;
_ctrlGrid ctrlSetFontHeight CTRL_FONT_H;

private _ctrlTextFOPos = _display ctrlCreate ["RscText", -1]; 
_ctrlTextFOPos ctrlSetPosition [CTRL_X + 1.03, CTRL_Y - 0.389, CTRL_W / 12, CTRL_H / 34];
_ctrlTextFOPos ctrlSetBackgroundColor CTRL_B_COLOR; 
_ctrlTextFOPos ctrlSetText format [localize "STR_text_grid", mapGridPosition _caller];
_ctrlTextFOPos ctrlSetFont CTRL_FONT;
_ctrlTextFOPos ctrlSetFontHeight CTRL_FONT_H;

private _ctrlTextInfo = _display ctrlCreate ["RscText", -1]; 
_ctrlTextInfo ctrlSetPosition [CTRL_X + 0.8309, CTRL_Y - 0.389, CTRL_W / 9, CTRL_H / 34];
_ctrlTextInfo ctrlSetBackgroundColor CTRL_B_COLOR; 
_ctrlTextInfo ctrlSetText CTRL_TEXT_RPOS;
_ctrlTextInfo ctrlSetFont CTRL_FONT;
_ctrlTextInfo ctrlSetFontHeight CTRL_FONT_H;

private _ctrlTextTarget = _display ctrlCreate ["RscText", -1]; 
_ctrlTextTarget ctrlSetPosition [CTRL_X + 0.8309, CTRL_Y - 0.4267, CTRL_W / 9, CTRL_H / 34];
_ctrlTextTarget ctrlSetBackgroundColor CTRL_B_COLOR; 
_ctrlTextTarget ctrlSetText CTRL_TEXT_TPOS;
_ctrlTextTarget ctrlSetFont CTRL_FONT;
_ctrlTextTarget ctrlSetFontHeight CTRL_FONT_H;

private _ctrlTips = _display ctrlCreate ["RscActivePicture", -1];
_ctrlTips ctrlSetText CTRL_ICON_BI;
_ctrlTips ctrlSetPosition [CTRL_X + 1.71, CTRL_Y - 0.47, CTRL_W / 60, CTRL_H / 30];
_ctrlTips ctrlSetTooltip CTRL_TT_TEXT_LMB;

private _buttonFire = _display ctrlCreate ["RscButton", -1];
_buttonFire ctrlSetPosition [CTRL_X + 1.18242, CTRL_Y - 0.4275, CTRL_W / 9, CTRL_H / 16];
_buttonFire ctrlSetText CTRL_TEXT_FIRE;
_buttonFire ctrlSetFont CTRL_FONT;
_buttonFire ctrlSetFontHeight CTRL_FONT_H;

private _buttonClick = _ctrlButton ctrlAddEventHandler ["ButtonClick", {
  params ["_control"];
  playSound "Click";
  SET_VAR("target_pos",[]);
  ctrlParent _control closeDisplay 0;
}];

private _escEh = _ctrlFrame ctrlAddEventHandler ["Destroy", {
  playSound "Click";
  SET_VAR("target_pos",[]);
}];

private _buttonDownMap = _ctrlMap ctrlAddEventHandler ["MouseButtonDown", {
  params ["_control", "_button", "_posX", "_posY", "_shift"];
  if (_shift && _button == 0) then {
    private _gridTarget = ctrlParent _control displayCtrl 1005;
    private _worldPos = _control ctrlMapScreenToWorld [_posX, _posY];
    _gridTarget ctrlSetText format [localize "STR_text_grid", mapGridPosition _worldPos];
    SET_VAR("target_pos",_worldPos);

    if (GET_VAR("icon_target", "") isEqualTo "") then  {
      private _marker = createMarkerLocal [format ["icon_fo_%1", _worldPos], _worldPos];
      _marker setMarkerTypeLocal "selector_selectedEnemy";
      _marker setMarkerColorLocal "colorBlack";
      _marker setMarkerSizeLocal [2, 2];
      _marker setMarkerAlphaLocal 1;
      SET_VAR("icon_target",_marker);

      _marker spawn {
        while {!(GET_VAR("target_pos",[]) isEqualTo [])} do {
          _this setMarkerDirLocal (markerDir _this + 1);
          _this setMarkerPosLocal target_pos;
          sleep 0.025;
        };
        deleteMarkerLocal _this;
        SET_VAR("icon_target","");
      };
    };
    playSound "Click";
  };
}];

private _bClickFire = _buttonFire ctrlAddEventHandler ["ButtonClick", {
  params ["_buttonFire"];
  private _ctrlCalls = ctrlParent _buttonFire displayCtrl 1000;
  private _lbUnits  = ctrlParent _buttonFire displayCtrl 1001;
  private _lbRounds = ctrlParent _buttonFire displayCtrl 1002;
  private _lbNumber = ctrlParent _buttonFire displayCtrl 1003;
  private _lbxDelay = ctrlParent _buttonFire displayCtrl 1004;
  private _ctrlGrid = ctrlParent _buttonFire displayCtrl 1005;
  private _textGrid = ctrlText _ctrlGrid;
  private _lbDelaySel = lbCurSel _lbxDelay;  
  private _lbNumberSel = lbCurSel _lbNumber;  
  private _curSelUnits = lbCurSel _lbUnits;   
  private _curSelRounds = lbCurSel _lbRounds; 
  
  private _pos2D = GET_VAR("target_pos",[]);
  private _callsLeft = GET_VAR("calls_left",5);

  if (_callsLeft isEqualTo 0) then {
    playSound "addItemFailed";
    
    private _commMenuID = QVAR("fireMission_id");
    if (!isNil "_commMenuID") then {
      [_caller, _commMenuID] call BIS_fnc_removeCommMenuItem;
      SET_VAR("fireMission_id",nil);
    };
  } else {
    if !(_pos2D isEqualTo []) then {
      SET_VAR("calls_left",DEC_VAR(_callsLeft,1));
      SET_VAR("request_completed", true);

      private _numRounds = parseNumber (_lbNumber lbText _lbNumberSel);
      private _delay = parseNumber (_lbxDelay lbText _lbDelaySel);
      _ctrlCalls ctrlSetStructuredText parseText (CTRL_FSUPP_TEXT + CTRL_CALLS_TEXT);

      private _roundType = "";
      if (_lbRounds lbText _curSelRounds isEqualTo "155 mm HE") then {_roundType = "Sh_155mm_AMOS"};
      if (_lbRounds lbText _curSelRounds isEqualTo "155 mm DPICM") then {_roundType = "G_40mm_HEDP"};
      if (_lbRounds lbText _curSelRounds isEqualTo "82 mm Smoke") then {_roundType = "Smoke_82mm_AMOS_White"};
      if (_lbRounds lbText _curSelRounds isEqualTo "82 mm ILLUM") then {_roundType = "F_40mm_White"};

      private _handle = [_pos2D, _numRounds, _delay, _roundType] spawn {
        params ["_pos2D", "_numRounds", "_delay", "_roundType"];
        _pos2D set [count _pos2D, 0];

        private _etaDelay = 15 + (random 20);
        SET_GVAR("var_delay",_etaDelay);
        SET_GVAR("lvarStop",false);
        SET_VAR("target_pos",[]);
        sleep (_delay / 2);
        
        if !(_roundType isEqualTo "G_40mm_HEDP") then {
          [_pos2D, _roundType, _numRounds, 80, FRAND(1,3,5) + _delay] remoteExec ["SL_fnc_fireSupport", 2];
        } else {
          [_pos2D, "Sh_155mm_AMOS", 1, 15] remoteExec ["SL_fnc_fireSupport", 2];
          [_pos2D, _roundType, 40, 50] remoteExec ["SL_fnc_fireSupport", 2];
        };
        SET_VAR("request_completed",false);
      };

      private _fnc_hint = {
        disableSerialization;
        params ["_buttonFire", "_units", "_rounds", "_roundsNumber", "_delay", "_textGrid"];
        private _control = ctrlParent _buttonFire ctrlCreate [ "RscStructuredText", -1]; 
        _control ctrlSetPosition [CTRL_X, CTRL_Y - 0.45, CTRL_W / 4, 0]; 
        _control ctrlSetFade 1;
        _control ctrlCommit 0; 

        private _text = parseText (
          HINT_ICON_UNITS + HINT_ICON_TEXT + ("<br/>") +
          format [HINT_TEXT_UNITS, _units] + ("<br/>") +
          format [HINT_TEXT_ROUNDS, _rounds] + ("<br/>") +
          format [HINT_TEXT_NROUNDS, _roundsNumber] + ("<br/>") +
          format [HINT_TEXT_DELAY, _delay] + ("<br/>") +
          format [HINT_TEXT_GRID, _textGrid] + ("<br/>") +
          format [HINT_TEXT_ETA, round GET_VAR("var_delay",25)]	
        );

        _control ctrlSetStructuredText _text; 
        _control ctrlSetBackgroundColor [0, 0, 0, 0.75]; 
        _control ctrlSetPosition [CTRL_X, CTRL_Y - 0.35, CTRL_W / 4, CTRL_H / 4]; 
        _control ctrlSetFade 0;
        _control ctrlCommit 0.25;
        playSound "zoomin";
        sleep 5;
        
        _control ctrlSetFade 1;
        _control ctrlCommit 0;
        waitUntil {ctrlCommitted _control};
        ctrlDelete _control;
      };
      
      [_buttonFire, _lbUnits lbText _curSelUnits, _lbRounds lbText _curSelRounds, _numRounds, _delay, _textGrid] spawn _fnc_hint;
    } else {
      playSound "addItemFailed";
    };
  };
}];

private _buttonCheckFire = _display ctrlCreate ["RscButton", -1];
_buttonCheckFire ctrlSetPosition [CTRL_X + 0.63, CTRL_Y - 0.4275, CTRL_W / 9, CTRL_H / 16];
_buttonCheckFire ctrlSetText CTRL_TEXT_CHECK;
_buttonCheckFire ctrlSetFont CTRL_FONT;
_buttonCheckFire ctrlSetFontHeight CTRL_FONT_H;

private _buttonDownID = _buttonCheckFire ctrlAddEventHandler ["ButtonClick", {
  params ["_buttonCheckFire"];
  if (GET_VAR("request_completed",false)) then {
    [] spawn {
      disableSerialization;
      private _ctrlWidth  = 0.9;  
      private _ctrlHeight = 0.1215; 
      private _ctrlPosX = (safeZoneXAbs + (safeZoneWAbs / 2)) - (_ctrlWidth / 2);  
      private _ctrlPosY = (safeZoneY + safeZoneH) - _ctrlHeight;  
      private _control  = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
      _control ctrlSetPosition [_ctrlPosX - 5, _ctrlPosY - 1.6, _ctrlWidth - 0.2, _ctrlHeight - 0.05];
      _control ctrlSetFade 1;
      _control ctrlCommit 0; 

      private _break = "<br/>";
      private _string = format ["<t size='1.52' align='left' font='PuristaMedium'> %1</t>", toUpper localize "STR_req_canseled"];
      private _picture = "<img image='\a3\ui_f\data\GUI\Cfg\CommunicationMenu\artillery_ca.paa' align='left' size='1.65'/>";			
      private _textParsed = parseText (_picture + _string + _break);
      _control ctrlSetStructuredText _textParsed; 
      _control ctrlSetBackgroundColor [0, 0, 0, 0.55]; 
      _control ctrlSetPosition [_ctrlPosX - 0.75, _ctrlPosY - 1.6, _ctrlWidth - 0.2, _ctrlHeight - 0.05]; 
      _control ctrlSetFade 0;
      _control ctrlCommit 0.5;

      waitUntil {ctrlCommitted _control};
      playSound "zoomin";
      sleep 5;

      _control ctrlSetPosition [_ctrlPosX - 5, _ctrlPosY - 1.6, _ctrlWidth - 0.2, _ctrlHeight - 0.05];
      _control ctrlCommit 1;
      playSound "zoomOut";

      waitUntil {ctrlCommitted _control};
      ctrlDelete _control; 
    };

    SET_GVAR("lvarStop",true);
    SET_VAR("target_pos",[]);
    SET_VAR("request_completed",false);
    playSound "Click";	

    private _callsLeft = GET_VAR("calls_left",5);
    SET_VAR("calls_left",INC_VAR(_callsLeft,1));
    
    private _display = ctrlParent _buttonCheckFire;	
    _display closeDisplay 0;
  } else {
    playSound "addItemFailed";
  };
}];

{_x ctrlCommit 0} forEach [
  _ctrlMap, _ctrlFrame, _ctrlHeader, _lbUnits, _lbRounds, _ctrlButton, _ctrlText, _lbNumber, _lbxDelay, _buttonFire, _buttonCheckFire, 
  _ctrlTextUnits, _ctrlTextRounds, _ctrlGrid, _ctrlTextFOPos, _ctrlTextInfo, _ctrlTextTarget, _ctrlTips, _ctrlTextCalls
];

SET_VAR("target_pos",[]);
ctrlSetFocus _ctrlMap;
playSound "Click";

_ctrlMap ctrlMapAnimAdd [0, 0.005, [14222.2, 21190.7, 0]];
ctrlMapAnimCommit _ctrlMap;

ctrlMapAnimDone _ctrlMap
