/*
  File: fn_typeTextX.sqf
  Author: Jiri Wainar, edited by Evgeny Chumichev

  Description: 
  Types a structured text on the screen, letter by letter, cursor blinking.

  Returns:
  BOOL
*/

#define DELAY_CHR 0.07
#define DELAY_CUR 0.03
#define DELAY_CLR 5

params [
  ["_data", [], [[]]],
  ["_posX", 0, [0]],
  ["_posY", 0.5, [0]],
  ["_rootFormat", "<t >%1</t>", [""]]
];

private _blockCount = count _data;
private _invisCursor = "<t color ='#00000000' shadow = '0'>_</t>";
private _blocks 	 = [];
private _formats 	 = [];
private _blinkCounts = [];

{
  private _inputData  = _x;
  private _block 		= _inputData param [0, "", [""]];
  private _format 	= _inputData param [1, "<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>", [""]];
  private _blinkCount = _inputData param [2, 5, [123]];
  private _blockArray = toArray _block;

  {_blockArray set [_forEachIndex, toString [_x]]} forEach _blockArray;

  _blocks  = _blocks + [_blockArray];
  _formats = _formats + [_format];
  _blinkCounts = _blinkCounts + [_blinkCount];

} forEach _data;

private _processedTextF  = "";
{
  private _blockArray  = _x;
  private _blockNr     = _forEachIndex;
  private _blockFormat = _formats select _blockNr;
  private _blockText   = "";
  private _blockTextF  = "";
  private _blockTextFB = "";

  {
    private _char = _x;
    _blockText   = _blockText + _char;
    _blockTextF  = format [_blockFormat, _blockText + _invisCursor];
    _blockTextFB = format [_blockFormat, _blockText + "_"];

    private _toDisplay = format [_rootFormat, _processedTextF + _blockTextFB];
    [_toDisplay, _posX, _posY, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;

    playSound "Click";
    uiSleep DELAY_CHR;

    _toDisplay = format [_rootFormat, _processedTextF + _blockTextF];
    [_toDisplay, _posX, _posY, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;

    uiSleep DELAY_CUR;

  } forEach _blockArray;

  private _blinkCount = _blinkCounts select _forEachIndex;
  if (_blinkCount > 0) then {
    for "_i" from 1 to _blinkCount do {
      _toDisplay = format [_rootFormat, _processedTextF + _blockTextFB];
      [_toDisplay, _posX, _posY, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;

      uiSleep DELAY_CHR;

      _toDisplay = format [_rootFormat, _processedTextF + _blockTextF];
      [_toDisplay, _posX, _posY, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
      
      uiSleep DELAY_CUR;
    };
  };
  
  _processedTextF = _processedTextF + _blockTextF;	
  
} forEach _blocks;

uiSleep DELAY_CLR;

["", _posX, _posY, 1, 0, 0, 90] spawn BIS_fnc_dynamicText;

true
