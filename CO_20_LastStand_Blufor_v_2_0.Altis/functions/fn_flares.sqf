/*
  File: fn_flares.sqf
  Author:	Evgeny Chumichev
  Description: Illuminations
*/

params ["_position"];

private _count = floor (random [25, 35, 45]);
private _radius = random [150, 225, 275];
private _altitude = 150 + (random _radius);

for "_i" from 1 to _count do {	
  private _flarePos = _position getPos [random _radius, random 360];
  _flarePos set [2, _altitude];

  private _flare = "F_20mm_Red" createVehicle _flarePos;
  _flare setVelocity [0, 0, -0.02];
    
  sleep (5 + random 10);
};		

true
