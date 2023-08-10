local L = LibStub("AceLocale-3.0"):NewLocale("LFGSorter", "enUS", true)

if L then

L['Select ding sound'] = 'Ding sound for selected instances';

L['ReloadRequired'] = 'User interface will be reloaded!'
L['FrameExists'] = 'Chat frame aleady exists'
L['AboutNewFrame'] = 'Adds new chat frame (LFGS) with only selected instaces displayed'
L['CreateChatFrame'] = 'Add chat frame'
L['DeleteChatFrame'] = 'Delete added frame'

L["LookingForGroup"] = 'LookingForGroup'
L["GENERAL"] = 'General'
L["TRADE"] = 'Trade'

L['New'] = 'add'
L["Save"] = 'save'
L["Remove"] = 'del'
L["NewSettings"] = 'New profile'
L["SavedProfiles"] = 'Load profile'

L["self"] = "User added keywords"
L['New custom search'] = 'New custom keywords'
L['User search'] = 'Add your own keywords to search for a group for any occasion. You can add new keywords and delete them when they are not needed. Please note that the search is case-insensitive, based on a complete match of the phrase. \n\n According to \n "alchemy craft"\n messages will also be found:\n"Alchemy craft ANY flask" and "ALCHEMY craft" \n But this message will not be found\n"ALCHEMY |all recipes| craft"'

L['Raids & other'] = 'Raids & other';
L['5 ppl 1'] = 'low lvl inst';
L['5 ppl 2'] = 'high lvl inst';
L['5 ppl bk'] = 'low lvl inst BC';
L['5 ppl bk2'] = 'high lvl inst BC';
L['hero bk'] = 'Hero BC';
L['hero bk2'] = 'Hero BC 2';
L['raid bk'] = 'Raids BC';
L['Wrath insts'] = 'what 1';
L['Wrath insts2'] = 'what 2';
L['5 ppl wrath'] = 'low lvl wrath inst';
L['5 ppl wrath2'] = 'high lvl wrath inst';
L['hero wrath'] = 'Hero wrath';
L['hero wrath2'] = 'Hero wrath 2';
L['wrath raid'] = 'Raids wrath';

L['Inst1'] = 'Detect low lvl inst.';
L['Inst2'] = 'Detect high lvl inst.';
L['Inst3'] = 'Detect raids';
L['Inst4'] = 'Detect BC inst';
L['Inst5'] = 'Detect hero inst';
L['Inst6'] = 'Detect BC raids';

L['Reset'] = 'Load default settings';
L['HideAll'] = 'Set all insts hiden';
L['LFG sorter loading default'] = 'LFG sorter loading default';

L['будут скрыты из чата'] = 'will be hiden';
L['будут показаны в чате'] = 'will not be hiden';
L['Звук включен'] = 'sound on';
L['Звук выключен'] = 'sound off';
L['Сообщения в '] = 'Messages in ';
L[' обрабатываются аддоном - '] = ' are processed by the addon - ';
L['Настройки LFG sorter'] = 'LFG sorter settings';

L['channel 1'] = 'channel 1';
L['channel 2'] = 'channel 2';
L['channel 3'] = 'channel 3';
L['channel 4'] = 'channel 4';
L['channel 5'] = 'channel 5';
L['channel 6'] = 'channel 6';

L['скрыть'] = 'hide';
L['звук'] = 'selected';
L['выбран'] = 'selected';
L['arena'] = 'arena';

L['2x2'] = '2x2';
L['3x3'] = '3x3';
L['5x5'] = '5x5';

L['АФК'] = 'AFK';
L['БАФФ'] = 'BUFF';

L['МАО'] = 'SM';
L['МАРА'] = 'MARA';
L['КТК'] = 'SFK';
L['ЛИ'] = 'RFK';
L['ГЧГ'] = 'BRD';
L['ЗФ'] = 'ZF';
L['НП'] = 'BFD';
L['УЛЬДА'] = 'ULDA';
L['КИ'] = 'RFD';
L['ПС'] = 'WC';
L['ХРАМ'] = 'TEMPLE';
L['МК'] = 'DMs';
L['ТЮ'] = 'ST';
L['ГНОМ'] = 'GNOM';
L['ДМ'] = 'DM';
L['СТРАТ'] = 'STRAT';
L['ШОЛО'] = 'SCHOLO';
L['ОП'] = 'RFC';
L['ЛБРС'] = 'LBRS';
L['УБРС'] = 'UBRS';

L['ЗГ'] = 'ZG';
L['АК20'] = 'AQ20';
L['ОНЯ'] = 'ONY';
L['ОН'] = 'MC';
L['АК40'] = 'AQ40';
L['БВЛ'] = 'BWL';
L['НАКС'] = 'NAX';

L['БАСТ'] = 'HR'; -- бастионы адского пламени
L['КК'] = 'BF'; -- кузня крови
L['УЗИ'] = 'SP'; -- узилище
L['ТОПЬ'] = 'UB'; -- нижнетопь
L['ГМ'] = 'MANA'; -- гробницы маны
L['АУКГ'] = 'AC'; -- аукенайские гробницы
L['ПВ1'] = 'COT1'; -- предгорья хилсбрада
L['СЗ'] = 'SeH'; -- сеттекские залы
L['ПП'] = 'SV'; -- паровое подземелье
L['ТЛ'] = 'SL'; -- темный лабиринт
L['РЗ'] = 'ShH'; -- разрушенные залы
L['МЕХ'] = 'MECH'; -- механар
L['БОТ'] = 'BOT'; -- ботаника
L['ЧТ'] = 'BM'; -- Черные топи
L['АРКА'] = 'ARC'; -- акратрац
L['ТМ'] = 'MT'; -- террасса магистров


L['Г-БАСТ'] = 'H-HR'; -- бастионы адского пламени
L['Г-КК'] = 'H-BF'; -- кузня крови
L['Г-УЗИ'] = 'H-SP'; -- узилище
L['Г-ТОПЬ'] = 'H-UB'; -- нижнетопь
L['Г-ГМ'] = 'H-MANA'; -- гробницы маны
L['Г-АУКГ'] = 'H-AC'; -- аукенайские гробницы
L['Г-ПВ1'] = 'H-COT1'; -- предгорья хилсбрада
L['Г-СЗ'] = 'H-SeH'; -- сеттекские залы
L['Г-ПП'] = 'H-SV'; -- паровое подземелье
L['Г-ТЛ'] = 'H-SL'; -- темный лабиринт
L['Г-РЗ'] = 'H-ShH'; -- разрушенные залы
L['Г-МЕХ'] = 'H-MECH'; -- механар
L['Г-БОТ'] = 'H-BOT'; -- ботаника
L['Г-ЧТ'] = 'H-BM'; -- Черные топи
L['Г-АРКА'] = 'H-ARC'; -- акратрац
L['Г-ТМ'] = 'H-MT'; -- террасса магистров

L['ГЕР'] = 'HERO'; -- любой гер
L['КАРА'] = 'KARA'; -- каражан
L['ГРУУЛ'] = 'GRUUL'; -- Груул
L['МАГТ'] = 'MAGTH'; -- Магтеридон
L['ЗА'] = 'ZA'; -- зул аман
L['ССК'] = 'SSC'; -- змеиное святилище
L['ТК'] = 'TK'; -- око бурь
L['ХИДЖ'] = 'Hyjal'; -- Вершина Хиджала 
L['БТ'] = 'BT'; -- Черный Храм 
L['ПЛАТО'] = 'SP'; --Плато Солнечного Колодца 	

L['УТГ'] = 'UTK'; --,'Крепость утгард 69+'};
L['НЕКС'] = 'NEX'; --,'Нексус 71+'};
L['НЕРУБ'] = 'AZN'; --,'Азжол неруб 72+'};
L['АНКАХ'] = 'ANK'; --,'Анкахет 73+'};
L['ДРАК'] = 'DTK'; --,'Драк тарон 74+'};
L['АК'] = 'VH'; --,'Аметистовая крепость 75+'};
L['ЧК'] = 'HoS'; --,'Чертоги камня 77+'};
L['ЧМ'] = 'HoL'; --,'Чертоги молний 79+'};
L['СТРАТ-О'] = 'C-STRAT'; --,'Очищение стратхольма 79+'};
L['ОКУ'] = 'OCC'; --,'Окулус 79+'};
L['ВЕРШ'] = 'UP'; --,'Вершина Утгард 69+'}; -- вершина утгард
L['ГУНД'] = 'GD'; --,'Гундрак 79+'};
L['ИЧ'] = 'ToC'; --,'Испытание чемпиона 79+'};
L['КД'] = 'FoS'; --,'Кузня душ 79+'};
L['ЯС'] = 'PoS'; --,'Яма сарона 79+'};	
L['ЗО'] = 'HoR'; --,'Залы отражений 79+'};

L['Г-УТГ'] = 'H-UTK'; --,'Крепость утгард (гер)'};
L['Г-НЕКС'] = 'H-NEX'; --,'Нексус (гер)'};
L['Г-НЕРУБ'] = 'H-AZN'; --,'Азжол неруб (гер)'};
L['Г-АНКАХ'] = 'H-ANK'; --,'Анкахет (гер)'};
L['Г-ДРАК'] = 'H-DTK'; --,'Драк тарон (гер)'};
L['Г-АК'] = 'H-VH'; --,'Аметистовая крепость (гер)'};
L['Г-ЧК'] = 'H-HoS'; --,'Чертоги камня (гер)'};
L['Г-ЧМ'] = 'H-HoL'; --,'Чертоги молний (гер)'};
L['Г-СТРАТ-О'] = 'H-STRAT'; --,'Очищение стратхольма (гер)'};
L['Г-ОКУ'] = 'H-OCC'; --,'Окулус (гер)'};
L['Г-ВЕРШ'] = 'H-UP'; --,'Вершина Утгард (гер)'}; -- вершина утгард
L['Г-ГУНД'] = 'H-GD'; --,'Гундрак (гер)'};
L['Г-ИЧ'] = 'H-ToC'; --,'Испытание чемпиона (гер)'};
L['Г-КД'] = 'H-FoS'; --,'Кузня душ (гер)'};
L['Г-ЯС'] = 'H-PoS'; --,'Яма сарона (гер)'};	
L['Г-ЗО'] = 'H-HoR'; --,'Залы отражений (гер)'};

L['10-НАКС'] = 'NAX10'; --,'Наксрамас'};
L['10-ОКО'] = 'EYE10'; --,'Око вечности'};
L['10-ОС'] = 'OS10'; --,'Обсидиановое святилище'};
L['10-УЛЬД'] = 'ULD10'; --,'Ульдуар'};
L['10-ИК'] = 'TOGC10'; --,'Испытание крестоносца'};
L['10-ОНЯ'] = 'ONY10'; --,'Логово ониксии'};
L['10-ЦЛК'] = 'ICC10'; --,'Цитадель ледяной короны'};
L['10-РС'] = 'RS10'; --,'Рубиновое святилище'};
L['10-СКЛЕП'] = 'VALUT10'; --,'Склеп Аркавона'};

L['25-НАКС'] = 'NAX25'; --,'Наксрамас'};
L['25-ОКО'] = 'EYE25'; --,'Око вечности'};
L['25-ОС'] = 'OS25'; --,'Обсидиановое святилище'};
L['25-УЛЬД'] = 'ULD25'; --,'Ульдуар'};
L['25-ИК'] = 'TOGC25'; --,'Испытание крестоносца'};
L['25-ОНЯ'] = 'ONY25'; --,'Логово ониксии'};
L['25-ЦЛК'] = 'ICC25'; --,'Цитадель ледяной короны'};
L['25-РС'] = 'RS25'; --,'Рубиновое святилище'};
L['25-СКЛЕП'] = 'VALUT25'; --,'Склеп Аркавона'};

--------------------------------

L['ТЕКСТ-УТГ-К'] = 'Utgarde Keep 69+';
L['ТЕКСТ-НЕКС'] = 'The Nexus 71+';
L['ТЕКСТ-НЕРУБ'] = 'Azjol-Nerub 72+';
L['ТЕКСТ-АНКАХ'] = 'Ahn\'kahet: The Old Kingdom 73+';
L['ТЕКСТ-ДРАК'] = 'Drak\'Tharon Keep 74+';
L['ТЕКСТ-АК'] = 'The Violet Hold 75+';
L['ТЕКСТ-ЧК'] = 'Halls of Stone 77+';
L['ТЕКСТ-ЧМ'] = 'Halls of Lightning 79+';
L['ТЕКСТ-СТРАТ-О'] = 'The Culling of Stratholme 79+';
L['ТЕКСТ-ОКУ'] = 'The Oculus 79+';
L['ТЕКСТ-ВЕРШ'] = 'Utgarde Pinnacle 79+'; -- вершина утгард
L['ТЕКСТ-ГУНД'] = 'Gundrak 79+';
L['ТЕКСТ-ИЧ'] = 'Trial of the Champion 79+';
L['ТЕКСТ-КД'] = 'The Forge of Souls 79+';
L['ТЕКСТ-ЯС'] = 'Pit of Saron 79+';	
L['ТЕКСТ-ЗО'] = 'Halls of Reflection 79+';

L['ТЕКСТ-Г-УТГ'] = 'Utgarde Keep (H)';
L['ТЕКСТ-Г-НЕКС'] = 'The Nexus (H)';
L['ТЕКСТ-Г-НЕРУБ'] = 'Azjol-Nerub (H)';
L['ТЕКСТ-Г-АНКАХ'] = 'Ahn\'kahet: The Old Kingdom (H)';
L['ТЕКСТ-Г-ДРАК'] = 'Drak\'Tharon Keep (H)';
L['ТЕКСТ-Г-АК'] = 'The Violet Hold (H)';
L['ТЕКСТ-Г-ЧК'] = 'Halls of Stone (H)';
L['ТЕКСТ-Г-ЧМ'] = 'Halls of Lightning (H)';
L['ТЕКСТ-Г-СТРАТ'] = 'The Culling of Stratholme (H)';
L['ТЕКСТ-Г-ОКУ'] = 'The Oculus (H)';
L['ТЕКСТ-Г-ВЕРШ'] = 'Utgarde Pinnacle (H)'; -- вершина утгард
L['ТЕКСТ-Г-ГУНД'] = 'Gundrak (H)';
L['ТЕКСТ-Г-ИЧ'] = 'Trial of the Champion (H)';
L['ТЕКСТ-Г-КД'] = 'The Forge of Souls (H)';
L['ТЕКСТ-Г-ЯС'] = 'Pit of Saron (H)';	
L['ТЕКСТ-Г-ЗО'] = 'Halls of Reflection (H)';

L['ТЕКСТ-10-НАКС'] = 'Naxxramas 10';
L['ТЕКСТ-10-ОКО'] = 'Eye of Eternity 10';
L['ТЕКСТ-10-ОС'] = 'Obsidian Sanctum 10';
L['ТЕКСТ-10-УЛЬД'] = 'Ulduar 10';
L['ТЕКСТ-10-ИК'] = 'Trial of the Crusader 10';
L['ТЕКСТ-10-ОНЯ'] = 'Onyxia\'s Lair 10';
L['ТЕКСТ-10-ЦЛК'] = 'Icecrown Citadel 10';
L['ТЕКСТ-10-РС'] = 'Ruby Sanctum 10';
L['ТЕКСТ-10-СКЛЕП'] = 'Vault of Archavon 10';

L['ТЕКСТ-25-НАКС'] = 'Naxxramas 25';
L['ТЕКСТ-25-ОКО'] = 'Eye of Eternity 25';
L['ТЕКСТ-25-ОС'] = 'Obsidian Sanctum 25';
L['ТЕКСТ-25-УЛЬД'] = 'Ulduar 25';
L['ТЕКСТ-25-ИК'] = 'Trial of the Crusader 25';
L['ТЕКСТ-25-ОНЯ'] = 'Onyxia\'s Lair 25';
L['ТЕКСТ-25-ЦЛК'] = 'Icecrown Citadel 25';
L['ТЕКСТ-25-РС'] = 'Ruby Sanctum 25';
L['ТЕКСТ-25-СКЛЕП'] = 'Vault of Archavon 25';

LFGSort_Inst1 = {};
LFGSort_Inst2 = {};
LFGSort_Inst3 = {};
LFGSort_Inst4 = {};
LFGSort_Inst5 = {};
LFGSort_Inst6 = {};
LFGSort_Inst7 = {};
LFGSort_Inst8 = {};
LFGSort_Inst9 = {};
LFGSort_Inst10 = {};
LFGSort_Inst11 = {};
LFGSort_Inst12 = {};
LFGSort_Inst_ect = {};

	-- 0. AFK / boost /
	--LFGSort_Inst['[^|%s][Аа][Фф][кК][%s|$]'] = 'АФК';

	LFGSort_Inst_ect['AFK'] = 'АФК';
	LFGSort_Inst_ect['BUST'] = 'АФК';
	LFGSort_Inst_ect['BOOST'] = 'АФК';
	LFGSort_Inst_ect['[Bb]oost'] = 'АФК';
	LFGSort_Inst_ect['boost'] = 'АФК';
	LFGSort_Inst_ect['g%-run'] = 'АФК';
	LFGSort_Inst_ect['g run'] = 'АФК';
	LFGSort_Inst_ect['g/run'] = 'АФК';

	-- 1. Баффы ДМ
	LFGSort_Inst_ect['buf.*dm'] = 'БАФФ';
	--LFGSort_Inst_ect['DM.*Buf'] = 'БАФФ';
	--LFGSort_Inst_ect['DM.*BUF'] = 'БАФФ';

	-- 2. МАО
	LFGSort_Inst1['[^%a]sm[^%a]'] = 'МАО';
	LFGSort_Inst1['[^%a]smgy[^%a]'] = 'МАО';
	LFGSort_Inst1['[^%a]sm[^%a]'] = 'МАО';
	LFGSort_Inst1['[^%a]smlib[^%a]'] = 'МАО';
	-- 3. Мародон
	LFGSort_Inst2['mara'] = 'МАРА';
	--LFGSort_Inst2['MARA'] = 'МАРА';
	--LFGSort_Inst2['[Mm]ara'] = 'МАРА';

	-- 4. КТК
	--LFGSort_Inst1['[Ss]adow [Ff]ang'] = 'КТК';
	LFGSort_Inst1['[^%a]sfk[^%a]'] = 'КТК';
	-- 5. ЛИ
	LFGSort_Inst1['[^%a]rfk[^%a]'] = 'ЛИ'; -- без ИЛИ
	LFGSort_Inst1['[Kk]raul'] = 'ЛИ';
	-- 6. ГЧГ
	--LFGSort_Inst2['BRD'] = 'ГЧГ';
	LFGSort_Inst2['brd'] = 'ГЧГ';
	LFGSort_Inst2['blackrock depths'] = 'ГЧГ';

	-- 7. ЗФ
	LFGSort_Inst2['[^%a]zf[^%a]'] = 'ЗФ';
	LFGSort_Inst2['[Ff]arak'] = 'ЗФ';
	--LFGSort_Inst2['FARAK'] = 'ЗФ';
	LFGSort_Inst2['[Ff]arrak'] = 'ЗФ';
	--LFGSort_Inst2['FARRAK'] = 'ЗФ';
	-- 8. НП пучина
	LFGSort_Inst1['[^%a]bfd[^%a]'] = 'НП';
	LFGSort_Inst1['[Bb]lack [Ff]athom [Dd]eeps'] = 'НП';
	LFGSort_Inst1['[Bb]lackfathom'] = 'НП';
	-- 9. Ульдаман
	LFGSort_Inst2['[uU]lda'] = 'УЛЬДА';
	--LFGSort_Inst2['ULDA'] = 'УЛЬДА';
	-- 25. Курганы И
	LFGSort_Inst1['[^%a]downs[^%a]'] = 'КИ';
	LFGSort_Inst1['razorfen down'] = 'КИ';
	LFGSort_Inst1['[^%a]rfd[^%a]'] = 'КИ'; -- КУРГАНЫ
	LFGSort_Inst1['[^%a]rd[^%a]'] = 'КИ';

	-- 11. Пещеры стенаний
	LFGSort_Inst1['[^%a]wc[^%a]'] = 'ПС';
	-- 12. Храм
	LFGSort_Inst2['[Tt]emple'] = 'ХРАМ';
	LFGSort_Inst2['[Aa]tal'] = 'ХРАМ';

	-- 13. Мертвые копи
	LFGSort_Inst1['[Dd]eadmines'] = 'МК';
	LFGSort_Inst1['[Mm]ines'] = 'МК';
	LFGSort_Inst1['[^%a]dms'] = 'МК';
	--LFGSort_Inst1['DEADMINES'] = 'МК';
	-- 14. Тюрьма
	LFGSort_Inst1['[^%a]st[^%a]'] = 'ТЮ';
	--LFGSort_Inst1['stocade'] = 'ТЮ';
	LFGSort_Inst1['stocad'] = 'ТЮ';
	-- 15. Забытый город
	LFGSort_Inst2['[^%a]dm[^%a]'] = 'ДМ';
	LFGSort_Inst2['[dD]ire [mM]aul'] = 'ДМ';
	LFGSort_Inst2['dm [Nn]orth'] = 'ДМ';
	LFGSort_Inst2['dm [Ee]ast'] = 'ДМ';
	LFGSort_Inst2['dm [Ww]est'] = 'ДМ';
	-- 16. Гномер
	LFGSort_Inst1['[Gg]nomer'] = 'ГНОМ';
	--LFGSort_Inst1['GNOMER'] = 'ГНОМ';
	-- 17. Страт
	LFGSort_Inst2['[Ss]trat[^%a]'] = 'СТРАТ';
	LFGSort_Inst2['[Ss]trath'] = 'СТРАТ';
	--LFGSort_Inst2['STRAT[^%a]'] = 'СТРАТ';
	LFGSort_Inst2['[^%a]st l '] = 'СТРАТ';
	-- 18. Шоло
	--LFGSort_Inst2['SCHOLO'] = 'ШОЛО';
	--LFGSort_Inst2['SHOLO'] = 'ШОЛО';
	LFGSort_Inst2['[Ss]cholo'] = 'ШОЛО';
	-- 19. ОП
	--LFGSort_Inst1['RFC'] = 'ОП';
	LFGSort_Inst1['[Rr]agefire'] = 'ОП';
	LFGSort_Inst1['[^%a]rfc[^%a]'] = 'ОП';
	-- 20. УБРС
	--LFGSort_Inst2['UBRS'] = 'УБРС';
	LFGSort_Inst2['ubrs'] = 'УБРС';
	LFGSort_Inst2['[^%a][Rr]end[^%a].*[^%a][Rr]un[^%a]'] = 'УБРС';
	-- 21. ЛБРС
	--LFGSort_Inst2['LBRS'] = 'ЛБРС';
	LFGSort_Inst2['lbrs'] = 'ЛБРС';

	-- 22. ЗГ
	LFGSort_Inst3['[^%a]zg[^%a]'] = 'ЗГ';
	--LFGSort_Inst3['[^%a]ZG[^%a]'] = 'ЗГ';
	LFGSort_Inst3['[Gg]urub'] = 'ЗГ';
	--LFGSort_Inst3['GURUB[^Aa]'] = 'ЗГ';
	-- 23. АК20
	LFGSort_Inst3['[^%a]aq20'] = 'АК20';
	LFGSort_Inst3['[^%a]aq%s*20^g'] = 'АК20';

	-- 24. АК40
	LFGSort_Inst3['[^%a]aq.*40^g'] = 'АК40';
	--LFGSort_Inst3['QIRAJ%s*40^g'] = 'АК40';
	LFGSort_Inst3['[Qq]iraj%s*40^g'] = 'АК40';
	-- 25. ОП
	--LFGSort_Inst3['[^%a]MC[^%a]'] = 'ОН';
	LFGSort_Inst3['[mM]olten [Cc]ore'] = 'ОН';

	-- 26. БВЛ

	--LFGSort_Inst3['BWL'] = 'БВЛ';
	LFGSort_Inst3['bwl'] = 'БВЛ';

	-- 27. Накс
	--LFGSort_Inst3['[Nn]ax'] = 'НАКС';
	--LFGSort_Inst3['NAX'] = 'НАКС';
	-- 28. Оня
	--LFGSort_Inst3['[^%a][Oo]ny[^%a]'] = 'ОНЯ';
	--LFGSort_Inst3['[^%a]ONY'] = 'ОНЯ';

	--LFGSort_Inst6['[^%a]RAMP'] = 'БАСТ';
	LFGSort_Inst6['[rR]amp[^%a]'] = 'БАСТ';
	LFGSort_Inst6['[^%a][rR]amp'] = 'БАСТ';
	--LFGSort_Inst6['[^%a]hr[^%a]'] = 'БАСТ';
	
	--LFGSort_Inst6['[^%a]BF[^%a]'] = 'КК';
	LFGSort_Inst6['[^%a]bf[^%a]'] = 'КК';
	LFGSort_Inst6['[Bb]lood [fF]ur'] = 'КК';
	LFGSort_Inst6['furna'] = 'КК';
	
	LFGSort_Inst6['[Ss]lave%s?[Pp]ens'] = 'УЗИ';
	--LFGSort_Inst6['[^%a]SP[^%a]'] = 'УЗИ';
	--LFGSort_Inst6['[^%a]sp[^%a]'] = 'УЗИ';
	--LFGSort_Inst6['[^%a]PENS[^%a]'] = 'УЗИ';
	LFGSort_Inst6['[^%a]pens[^%a]'] = 'УЗИ';
	
	LFGSort_Inst6['[^%a]ub[^%a]'] = 'ТОПЬ'; -- нижнетопь
	LFGSort_Inst6['[Uu]nderb'] = 'ТОПЬ'; -- нижнетопь
	
	--LFGSort_Inst6['[^%a]mt[^%a]'] = 'ГМ'; -- гробницы маны
	LFGSort_Inst6['tombs'] = 'ГМ'; -- гробницы маны
	LFGSort_Inst6['[Mm]ana.?[Tt]om'] = 'ГМ'; -- гробницы маны
	LFGSort_Inst6['mana t'] = 'ГМ'; -- гробницы маны
	
	LFGSort_Inst6['[Cc]rypt'] = 'АУКГ'; -- аукенайские гробницы
	LFGSort_Inst6['[^%a]ac[^%a]'] = 'АУКГ'; -- аукенайские гробницы
	
	LFGSort_Inst6['[^%a]hf[^%a]'] = 'ПВ1'; -- предгорья хилсбрада
	--LFGSort_Inst6['COT1'] = 'ПВ1'; -- предгорья хилсбрада
	LFGSort_Inst6['cot1'] = 'ПВ1'; -- предгорья хилсбрада
	LFGSort_Inst6['[^%a]ohf[^%a]'] = 'ПВ1'; -- предгорья хилсбрада
	LFGSort_Inst6['[Dd]arnho'] = 'ПВ1'; -- предгорья хилсбрада
	LFGSort_Inst6['[Oo]ld.*[Hh]i[l]*sb'] = 'ПВ1'; -- предгорья хилсбрада
	--LFGSort_Inst6['OLD.*HI[L]*SB'] = 'ПВ1'; -- предгорья хилсбрада
	LFGSort_Inst6['[Hh]ills.*[Ff]oot'] = 'ПВ1'; -- предгорья хилсбрада
	
	LFGSort_Inst6['[sS]e[th]*.*[hH]al'] = 'СЗ'; -- сеттекские залы
	LFGSort_Inst6['[sS]e[th]*ek'] = 'СЗ';
	LFGSort_Inst6['seth'] = 'СЗ';
	--LFGSort_Inst6['SET[TH]*EK'] = 'СЗ';
	
	LFGSort_Inst6['[^%a]sv[^%a]'] = 'ПП'; -- паровое подземелье
	LFGSort_Inst6['[Ss]tea.*[Vv]a'] = 'ПП'; -- паровое подземелье
	
	LFGSort_Inst6['[^%a]sl[^%a]'] = 'ТЛ'; -- темный лабиринт
	--LFGSort_Inst6['SLABS'] = 'ТЛ'; 
	LFGSort_Inst6['slab'] = 'ТЛ';
	LFGSort_Inst6['[sS]had.*[Ll]ab'] = 'ТЛ'; -- темный лабиринт
	--LFGSort_Inst6['SHAD.*LAB'] = 'ТЛ'; -- темный лабиринт
	
	--LFGSort_Inst6['[^%a]SH[^%a]'] = 'РЗ';
	LFGSort_Inst6['[^%a]shh[^%a]'] = 'РЗ';	
	LFGSort_Inst6['[^%a]sh[^%a]'] = 'РЗ';
	--LFGSort_Inst6['SHATTER.*HALLS'] = 'РЗ';
	LFGSort_Inst6['[Ss]hat.*[Hh]'] = 'РЗ';
	

	LFGSort_Inst6['[^%a][Mm]echa'] = 'МЕХ'; -- механар
	LFGSort_Inst6['[^%a][Mm]ec[^%a]'] = 'МЕХ'; -- механар
	LFGSort_Inst6['[^%a][Mm]ech[^%a]'] = 'МЕХ';

	LFGSort_Inst6['[^%a][Bb]ota'] = 'БОТ'; -- ботаника
	LFGSort_Inst6['[^%a][Bb]ot[^%a]'] = 'БОТ'; -- ботаника
	
	LFGSort_Inst6['[^%a]bm[^%a]'] = 'ЧТ'; -- Черные топи
	LFGSort_Inst6['[Bb]lack [mM]or'] = 'ЧТ'; -- Черные топи
	
	LFGSort_Inst6['[^%a]arca[^%a]'] = 'АРКА'; -- акратрац
	LFGSort_Inst6['[^%a]arc[^%a]'] = 'АРКА'; -- акратрац
	LFGSort_Inst6['[^%a]arcat'] = 'АРКА'; -- акратрац
	--LFGSort_Inst6['ARCA'] = 'АРКА'; -- акратрац
	
	LFGSort_Inst6['mgt'] = 'ТМ'; -- террасса магистров
	LFGSort_Inst6['[Tt]errac'] = 'ТМ'; -- террасса магистров

	LFGSort_Inst5['[^%a][hH]ero'] = 'ГЕР';
	LFGSort_Inst5['[^%a%|][Hh][^%a%|]'] = 'ГЕР';
	--LFGSort_Inst5['[^%a]hc[^%a]'] = 'ГЕР';
	--LFGSort_Inst5['HERO'] = 'ГЕР';
	LFGSort_Inst5['[^%a]h+[^%a]'] = 'ГЕР';
	LFGSort_Inst5['[^%a]h++[^%a]'] = 'ГЕР';
	
	LFGSort_Inst5['[^%a]alfa[^%a]'] = 'ГЕР';
	LFGSort_Inst5['[^%a]alpha[^%a]'] = 'ГЕР';
	LFGSort_Inst5['[^%a]beta[^%a]'] = 'ГЕР';
	LFGSort_Inst5['[^%a]betta[^%a]'] = 'ГЕР';
	
	LFGSort_Inst9['[^%d]25[^%d]'] = '25';
	LFGSort_Inst9['[^%d]10[^%d]'] = '10';
	

--[^А-ЯЁ%a]

	LFGSort_Inst4['kara'] = 'КАРА'; -- каражан
	--LFGSort_Inst4['Kara'] = 'КАРА'; -- каражан
	--LFGSort_Inst4['KARA'] = 'КАРА'; -- каражан
	
	--LFGSort_Inst4['GRUUL'] = 'ГРУУЛ'; -- Груул
	LFGSort_Inst4['[Gg]rull'] = 'ГРУУЛ'; -- Груул
	
	LFGSort_Inst4['[^%a]mag[^%a]'] = 'МАГТ';
	LFGSort_Inst4['magth'] = 'МАГТ'; -- Магтеридон
	LFGSort_Inst4['maggy'] = 'МАГТ'; -- Магтеридон
	--LFGSort_Inst4['[^%a]ZA[^%a]'] = 'ЗА'; -- зул аман
	LFGSort_Inst4['[^%a]ssc[^%a]'] = 'ССК'; -- змеиное святилище
	LFGSort_Inst4['[^%a]tk[^%a]'] = 'ТК'; -- око бурь
	LFGSort_Inst4['hyjal'] = 'ХИДЖ'; -- Вершина Хиджала 
	LFGSort_Inst4['[^%a]mh[^%a]'] = 'ХИДЖ'; -- Вершина Хиджала 
	LFGSort_Inst4['[^%a]bt[^%a]'] = 'БТ'; -- Черный Храм 
	LFGSort_Inst4['[Ss]unwel'] = 'ПЛАТО'; --Плато Солнечного Колодца 	
	LFGSort_Inst4['[^%a]swp[^%a]'] = 'ПЛАТО'; --Плато Солнечного Колодца 
	
	LFGSort_Inst7['2x2'] = '2x2'; --
	LFGSort_Inst7['2c '] = '2x2';
	LFGSort_Inst7['2 ?v ?2'] = '2x2';
	
	LFGSort_Inst7['3x3'] = '3x3'; -- 
	LFGSort_Inst7['3c '] = '3x3';
	LFGSort_Inst7['3 ?v ?3'] = '3x3';
	
	LFGSort_Inst7['5x5'] = '5x5'; -- 
	LFGSort_Inst7['5c '] = '5x5';
	LFGSort_Inst7['5 ?v ?5'] = '5x5';

	LFGSort_Inst8['utgard keep'] = 'УТГ-К';
	LFGSort_Inst8['[^%a]utk[^%a]'] = 'УТГ-К';
	LFGSort_Inst8['nexus'] = 'НЕКС';
	LFGSort_Inst8['[^%a]nex[^%a]'] = 'НЕКС';
	
	LFGSort_Inst8['nerub'] = 'НЕРУБ';
	LFGSort_Inst8['azjol'] = 'НЕРУБ';
	LFGSort_Inst8['[^%a]AZN[^%a]'] = 'НЕРУБ';
	
	LFGSort_Inst8['[^%a]ANK[^%a]'] = 'АНКАХ';
	LFGSort_Inst8['[^%a]AKO[^%a]'] = 'АНКАХ';
	LFGSort_Inst8['[^%a]ahn\''] = 'АНКАХ';
	LFGSort_Inst8['[^%a]ahnkahet'] = 'АНКАХ';
	LFGSort_Inst8['kahet[^%a]'] = 'АНКАХ';
	
	LFGSort_Inst8['[^%a]drak[^о]'] = 'ДРАК';
	LFGSort_Inst8['[^%a]DTK[^о]'] = 'ДРАК';
	LFGSort_Inst8['tharon[^%a]'] = 'ДРАК';
	
	LFGSort_Inst8['violet'] = 'АК';
	LFGSort_Inst8['[^%a]vh[^%a]'] = 'АК';
	
	LFGSort_Inst8['[^%a]hos[^%a]'] = 'ЧК';
	LFGSort_Inst8['[^%a]of stone[^%a]'] = 'ЧК';
	LFGSort_Inst8['[^%a]hol[^%a]'] = 'ЧМ';
	LFGSort_Inst8['[^%a]of light[^%a]'] = 'ЧМ';
	LFGSort_Inst8['strath'] = 'СТРАТ-О';
	LFGSort_Inst8['culling'] = 'СТРАТ-О';
	LFGSort_Inst8['[^%a]cos[^%a]'] = 'СТРАТ-О';
	
	LFGSort_Inst8['oculus'] = 'ОКУ';
	LFGSort_Inst8['[^%a]occ[^%a]'] = 'ОКУ';
	LFGSort_Inst8['[^%a]pinnacle'] = 'ВЕРШ'; -- вершина утгард

	LFGSort_Inst8['gundrak'] = 'ГУНД';
	LFGSort_Inst8['[^%a]GD[^%a'] = 'ГУНД';
	
	LFGSort_Inst8['[^%a]toc[^%a]'] = 'ИЧ';
	LFGSort_Inst8['trial.*champ'] = 'ИЧ';

	LFGSort_Inst8['[^%a]fos[^%a]'] = 'КД';	
	LFGSort_Inst8['[^%a]forge.*soul'] = 'КД';
	LFGSort_Inst8['[^%a]pos[^%a]'] = 'ЯС';
	LFGSort_Inst8['[^%a]pit.*saron'] = 'ЯС';	
	LFGSort_Inst8['[^%a]hall.*refle'] = 'ЗО';
	LFGSort_Inst8['[^%a]hor[^%a]'] = 'ЗО';
	
	--LFGSort_Inst9['[^%a]hc[^%a]'] = 'ГЕР';
	LFGSort_Inst9['[^%a]alpha[^%a]'] = 'ГЕР';
	
	LFGSort_Inst10['[^%a]nax'] = 'НАКС';
	LFGSort_Inst10['[^%a]eye'] = 'ОКО';
	LFGSort_Inst10['[^%a]obsidi'] = 'ОС';
	--LFGSort_Inst10['[^%a]святили'] = 'ОС';
	--LFGSort_Inst10['[^%a]os[^%a]'] = 'ОС';
	LFGSort_Inst10['[^%a]uldu'] = 'УЛЬД';
	LFGSort_Inst10['[^%a]uld[^%a]'] = 'УЛЬД';
	LFGSort_Inst10['[^%a]tria.*crus'] = 'ИК';
	LFGSort_Inst10['[^%a]toc[^%a]'] = 'ИК';
	LFGSort_Inst10['totc[^%a]'] = 'ИК';
	LFGSort_Inst10['togc[^%a]'] = 'ИК';
	
	LFGSort_Inst10['[^%a]onyx'] = 'ОНЯ';
	--LFGSort_Inst10['[^%a]onix'] = 'ОНЯ';
	LFGSort_Inst10['[^%a]ony[^%a]'] = 'ОНЯ';
	
	LFGSort_Inst10['[^%a]icc[^%a]'] = 'ЦЛК';
	LFGSort_Inst10['[^%a]icecrown'] = 'ЦЛК';
	LFGSort_Inst10['[^%a]citad'] = 'ЦЛК';
	
	LFGSort_Inst10['[^%a]rs[^%a]'] = 'РС';
	LFGSort_Inst10['[^%a]halion[^%a]'] = 'РС';
	LFGSort_Inst10['[^%a]ruby[^%a]'] = 'РС';
	
	LFGSort_Inst10['[^%a]vault[^%a]'] = 'СКЛЕП';
	LFGSort_Inst10['[^%a]voa[^%a]'] = 'СКЛЕП';
	LFGSort_Inst10['[^%a]voa15[^%a]'] = 'СКЛЕП25';
	LFGSort_Inst10['[^%a]archa'] = 'СКЛЕП';
	

	LFGSort_Inst11['[^%a]nax'] = 'НАКС25';
	--LFGSort_Inst11['[^%a]eye'] = 'ОКО25';
	--LFGSort_Inst11['[^%a]obsidi'] = 'ОС25';
	----LFGSort_Inst11['[^%a]святили'] = 'ОС25';
	--LFGSort_Inst11['[^%a]os[^%a]'] = 'ОС25';
	--LFGSort_Inst11['[^%a]uldu'] = 'УЛЬД25';
	--LFGSort_Inst11['[^%a]uld[^%a]'] = 'УЛЬД25';
	--LFGSort_Inst11['[^%a]tria.*crus'] = 'ИК25';
	--LFGSort_Inst11['[^%a]toc[^%a]'] = 'ИК25';
	
	--LFGSort_Inst11['[^%a]onix'] = 'ОНЯ25';
	--LFGSort_Inst11['[^%a]ony[^%a]'] = 'ОНЯ25';
	--LFGSort_Inst11['[^%a]icc[^%a]'] = 'ЦЛК25';
	--LFGSort_Inst11['[^%a]icecrown'] = 'ЦЛК25';
	--LFGSort_Inst11['[^%a]citad'] = 'ЦЛК25';
	
	--LFGSort_Inst11['[^%a]rs[^%a]'] = 'РС25';
	--LFGSort_Inst11['[^%a]halion[^%a]'] = 'РС25';
	--LFGSort_Inst11['[^%a]ruby[^%a]'] = 'РС25';
	
	--LFGSort_Inst11['[^%a]vault[^%a]'] = 'СКЛЕП25';
	--LFGSort_Inst11['[^%a]archa'] = 'СКЛЕП25';
	
L['LFGSort_Inst_ect'] = LFGSort_Inst_ect;
L['LFGSort_Inst1'] = LFGSort_Inst1
L['LFGSort_Inst2'] = LFGSort_Inst2
L['LFGSort_Inst3'] = LFGSort_Inst3

L['LFGSort_Inst4'] = LFGSort_Inst4
L['LFGSort_Inst5'] = LFGSort_Inst5
L['LFGSort_Inst6'] = LFGSort_Inst6

L['LFGSort_Inst7'] = LFGSort_Inst7

L['LFGSort_Inst8'] = LFGSort_Inst8
L['LFGSort_Inst9'] = LFGSort_Inst9
L['LFGSort_Inst10'] = LFGSort_Inst10
L['LFGSort_Inst11'] = LFGSort_Inst11
end
