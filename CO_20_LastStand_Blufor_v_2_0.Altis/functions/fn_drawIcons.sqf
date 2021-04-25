/*
  File: fn_mapIcons.sqf
  Author:	Evgeny Chumichev
  Description: Players map markers and name tags
*/

#include "scriptComponent.hpp"

if (GET_PARAM("playersMarkers") isEqualTo 1) then {
  private _id = findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw", {
    params ["_control"];
    {
      private _iconText = format ["%1", NAME_X];
      if (!isNull objectParent _x && {GET_CREW(VEH_X) > 1}) then {
        _iconText = format ["%1%2%3%4", GET_NAME, "(", GET_CREW(VEH_X), ")"];
      };
      _control drawIcon [
        ICON_SHAPE, GET_COLOR(_x), POS_X, 25, 25, DIR_X, _iconText, 0, SIZE_F, FONT_M, "right"
      ];
    } forEach playableUnits;
  }];
};

if (GET_PARAM("playersNameTags") isEqualTo 1) then {
  private _tagsID = addMissionEventHandler ["Draw3D", {
    { 
      if (cursorTarget isEqualTo _x) then {
        private _distance = player distance2d _x;
        private _textColor = [[0.709, 0.972, 0.384,1], [1, 0.75, 0, 1]] select (group _x isEqualTo group player);
        _textColor set [3, 1 - ((_distance * 0.025) min 1)];
        drawIcon3D ["", _textColor, POS_SHORT(_x), 0, 0, 0, DNAME_SHORT(_x), 2, 0.030, FONT_L];
      };
    } forEach REMOTE_PLAYERS;
  }];
};

if (GET_PARAM("playersNameTags") isEqualTo 2) then {
  private _tagsID = addMissionEventHandler ["Draw3D", {
    {
      if (cursorTarget isEqualTo _x) then {
        private _alpha = ((player distance _x) * 0.025) min 1;
        private _color = [1, 1, 1, 1 - _alpha]; 
        drawIcon3D ["",_color, POS_ADV(_x), 1.35, -1.40 , -1 , NAME_X, 2, 0.04, FONT_M, "Right"];
        drawIcon3D ["", [1, 0.75, 0, 1 - _alpha], POS_ADV(_x), 1.45, 0.20, -1, DISPLAY_NAME, 1, 0.03, FONT_L, "Right"];			
        drawIcon3D [ICON_RANK(_x), _color, POS_ADV(_x), 0.65, 0.65, 0, "", 2, 0.03];
      };
    } forEach REMOTE_PLAYERS;
  }];
};

true 
