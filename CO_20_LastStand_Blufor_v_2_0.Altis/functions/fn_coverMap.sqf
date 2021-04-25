/*
  File: fn_coverMap.sqf
  Author:	Evgeny Chumichev 

  Description: 
  Covers the map, remake of cover map module for Arma 2 by Karel Moricky.

  Parameter(s):
  0: ARRAY - Center position
  1: ARRAY - (OPTIONAL) Area size [_x, _y]
  2: NUMBER - (OPTIONAL) Borders scale multiplier

  Returns:
  BOOL 
*/

params [
  ["_centerPos", [worldSize / 2, worldSize / 2], [[]]],
  ["_centerSize", [2500, 2500], [[]]],
  ["_scaleMultiply", 120, [0]]
];

_centerPos params ["_posX", "_posY"];
_centerSize params ["_sizeX", "_sizeY"];

private _bordersScale = (_sizeX max _sizeY) / _scaleMultiply;
private _sizeArea = worldSize;

for "_i" from 0 to 270 step 90 do {
  private _dirTo = 0;
  private _dirTemp = _dirTo + _i;
  private _sizeMarker = [_sizeX, _sizeArea] select ((_i / 90) % 2);
  private _markerPos = [_posX + (sin _dirTemp * (_sizeX + _sizeArea)), _posY + (cos _dirTemp * (_sizeY + _sizeArea))];

  for "_m" from 1 to 4 do {
    private _markerArea = createMarker [format ["area_%1_%2", _i, _m], _markerPos];
    _markerArea setMarkerSize [_sizeMarker, _sizeArea];
    _markerArea setMarkerDir _dirTemp;
    _markerArea setMarkerShape "rectangle";
    _markerArea setMarkerBrush "solid";
    _markerArea setMarkerColor "colorBlack";
    _markerArea setMarkerAlpha 0.35;
  };

  private _sizeMarkerBorder = [_sizeX, _sizeY + _bordersScale * 2] select ((_i / 90) % 2);
  private _sizeBorderTemp = _bordersScale;
  private _markerPos = [_posX + (sin _dirTemp * (_sizeX + _sizeBorderTemp)), _posY + (cos _dirTemp * (_sizeY + _sizeBorderTemp))];

  for "_m" from 1 to 4 do {
    private _markerBorder = createMarker [format ["areaBorder_%1_%2", _i, _m], _markerPos];
    _markerBorder setMarkerSize [_sizeMarkerBorder, _sizeBorderTemp];
    _markerBorder setMarkerDir _dirTemp;
    _markerBorder setMarkerShape "rectangle";
    _markerBorder setMarkerBrush "solid";
    _markerBorder setMarkerColor "colorblack";
    _markerBorder setMarkerAlpha 0.5;
  };
};

private _borderFrameIn = createMarker ["frameBorderIn", _centerPos];
_borderFrameIn setMarkerSize [_sizeX, _sizeY];
_borderFrameIn setMarkerDir 0;
_borderFrameIn setMarkerShape "rectangle";
_borderFrameIn setMarkerBrush "border";
_borderFrameIn setMarkerColor "colorRed";
_borderFrameIn setMarkerAlpha 0.7;

private _borderFrameOut = createMarker ["frameBorderOut", _centerPos];
_borderFrameOut setMarkerSize [_sizeX + _bordersScale * 2, _sizeY + _bordersScale * 2];
_borderFrameOut setMarkerDir 0;
_borderFrameOut setMarkerShape "rectangle";
_borderFrameOut setMarkerBrush "border";
_borderFrameOut setMarkerColor "colorblack";
_borderFrameOut setMarkerAlpha 0.7;

true
