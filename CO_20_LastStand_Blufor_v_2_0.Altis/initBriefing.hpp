#define ICON_INDENT "<img image='\a3\Ui_f\data\IGUI\RscIngameUI\RscHint\indent_gr.paa' width='17'/>"
#define ICON_MP_TYPE "<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa' color='#fcc137' width='40'/>"

private _rulesText = format [localize "STR_rules_text", ICON_MP_TYPE, ICON_INDENT, missionNamespace getvariable ["EvacWave", 5]];
player createDiaryRecord ["Diary", [localize "STR_Author_diary", "<font size='17'>Evgeny Chumichev</font><br/>Sponsored by VANILLA ™<br/><br/>2013-2018 ©"]];
player createDiaryRecord ["Diary", [localize "STR_rules", format ["<br/><font size='15'>%1 %2</font><br/><br/><br/>",_rulesText]]];
player createDiaryRecord ["Diary", [localize "STR_Sitrep", format ["<font size='16'>%1</font>", 
  format [localize "STR_SitrepText", "<marker name='west_pointer'>141212</marker>"]]]
];
