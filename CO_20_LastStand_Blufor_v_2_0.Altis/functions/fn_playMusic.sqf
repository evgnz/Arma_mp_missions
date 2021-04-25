/*
  File: fn_playMusic.sqf
  Author:	Evgeny Chumichev
  Description: Music for skip time / end round transitions
*/

#define START_TYPE	["Track05_Underwater2", 92]
#define END_TYPE	["Track02_SolarPower", 58]

params ["_mode"];

private _start = addMusicEventHandler ["MusicStart", {
  params ["_className", "_handlerID"];
  0 fademusic 0; 
  1 fademusic 0.7;
  removeMusicEventHandler ["MusicStart", _handlerID];
}];

private _stop = addMusicEventHandler ["MusicStop", {
  params ["_className", "_handlerID"];
  0 fademusic 0; 
  5 fademusic 0.3;
  removeMusicEventHandler ["MusicStop", _handlerID];
}];

playMusic ([START_TYPE, END_TYPE] select _mode);

true