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

LFGSort_Inst1 = {};
LFGSort_Inst2 = {};
LFGSort_Inst3 = {};
LFGSort_Inst4 = {};
LFGSort_Inst5 = {};
LFGSort_Inst6 = {};
LFGSort_Inst7 = {};

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
	-- 10. Курганы И
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
	LFGSort_Inst3['[Nn]ax'] = 'НАКС';
	--LFGSort_Inst3['NAX'] = 'НАКС';
	-- 28. Оня
	LFGSort_Inst3['[^%a][Oo]ny[^%a]'] = 'ОНЯ';
	--LFGSort_Inst3['[^%a]ONY'] = 'ОНЯ';

	--LFGSort_Inst6['[^%a]RAMP'] = 'БАСТ';
	LFGSort_Inst6['[rR]amp[^%a]'] = 'БАСТ';
	LFGSort_Inst6['[^%a][rR]amp'] = 'БАСТ';
	LFGSort_Inst6['[^%a]hr[^%a]'] = 'БАСТ';
	
	--LFGSort_Inst6['[^%a]BF[^%a]'] = 'КК';
	LFGSort_Inst6['[^%a]bf[^%a]'] = 'КК';
	LFGSort_Inst6['[Bb]lood [fF]ur'] = 'КК';
	LFGSort_Inst6['furna'] = 'КК';
	
	LFGSort_Inst6['[Ss]lave%s?[Pp]ens'] = 'УЗИ';
	--LFGSort_Inst6['[^%a]SP[^%a]'] = 'УЗИ';
	LFGSort_Inst6['[^%a]sp[^%a]'] = 'УЗИ';
	--LFGSort_Inst6['[^%a]PENS[^%a]'] = 'УЗИ';
	LFGSort_Inst6['[^%a]pens[^%a]'] = 'УЗИ';
	
	LFGSort_Inst6['[^%a]ub[^%a]'] = 'ТОПЬ'; -- нижнетопь
	LFGSort_Inst6['[Uu]nderb'] = 'ТОПЬ'; -- нижнетопь
	
	LFGSort_Inst6['[^%a]mt[^%a]'] = 'ГМ'; -- гробницы маны
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
	
	--LFGSort_Inst6['MT'] = 'ТМ'; -- террасса магистров
	LFGSort_Inst6['[Tt]errac'] = 'ТМ'; -- террасса магистров

	LFGSort_Inst5['[^%a][hH]ero'] = 'ГЕР';
	LFGSort_Inst5['[^%a%|][Hh][^%a%|]'] = 'ГЕР';
	--LFGSort_Inst5['[^%a]hc[^%a]'] = 'ГЕР';
	--LFGSort_Inst5['HERO'] = 'ГЕР';
	LFGSort_Inst5['[^%a]hc[^%a]'] = 'ГЕР';
	
	

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
	--LFGSort_Inst4['[Ss]unwel'] = 'ПЛАТО'; --Плато Солнечного Колодца 	

	LFGSort_Inst7['2x2'] = '2x2'; --
	LFGSort_Inst7['2c '] = '2x2';
	LFGSort_Inst7['2 ?v ?2'] = '2x2';
	
	LFGSort_Inst7['3x3'] = '3x3'; -- 
	LFGSort_Inst7['3c '] = '3x3';
	LFGSort_Inst7['3 ?v ?3'] = '3x3';
	
	LFGSort_Inst7['5x5'] = '5x5'; -- 
	LFGSort_Inst7['5c '] = '5x5';
	LFGSort_Inst7['5 ?v ?5'] = '5x5';
	
L['LFGSort_Inst_ect'] = LFGSort_Inst_ect;
L['LFGSort_Inst1'] = LFGSort_Inst1
L['LFGSort_Inst2'] = LFGSort_Inst2
L['LFGSort_Inst3'] = LFGSort_Inst3

L['LFGSort_Inst4'] = LFGSort_Inst4
L['LFGSort_Inst5'] = LFGSort_Inst5
L['LFGSort_Inst6'] = LFGSort_Inst6

L['LFGSort_Inst7'] = LFGSort_Inst7
end
