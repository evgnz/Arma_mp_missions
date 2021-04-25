params ["_newUnit", "_oldUnit"];

if (!isNull _oldUnit) then {hideBody _oldUnit};
private _ep = _newUnit call SL_fnc_earPlugs;
