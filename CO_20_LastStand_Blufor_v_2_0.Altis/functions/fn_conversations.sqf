/*
  File: fn_conversations.sqf
  Author:	Evgeny Chumichev
  Description: Mission flow conversations
*/

#include "scriptComponent.hpp"

params [
  ["_topic", 0, [123]]
];

private _sentence = CONV_LIST select _topic;

_sentence spawn bis_fnc_kbTell;

true
