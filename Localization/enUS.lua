local L = LibStub("AceLocale-3.0"):NewLocale("LFGSorter", "enUS", true)

if L then
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
L['звук'] = 'sound';

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

L['БАСТ'] = 'БАСТ'; -- бастионы адского пламени
L['КК'] = 'КК'; -- кузня крови
L['УЗИ'] = 'УЗИ'; -- узилище
L['ТОПЬ'] = 'ТОПЬ'; -- нижнетопь
L['ГМ'] = 'ГМ'; -- гробницы маны
L['АУКГ'] = 'АУКГ'; -- аукенайские гробницы
L['ПВ1'] = 'ПВ1'; -- предгорья хилсбрада
L['СЗ'] = 'СЗ'; -- сеттекские залы
L['ПП'] = 'ПП'; -- паровое подземелье
L['ТЛ'] = 'ТЛ'; -- темный лабиринт
L['РЗ'] = 'РЗ'; -- разрушенные залы
L['МЕХ'] = 'МЕХ'; -- механар
L['БОТ'] = 'БОТ'; -- ботаника
L['ЧТ'] = 'ЧТ'; -- Черные топи
L['АРКА'] = 'АРКА'; -- акратрац
L['ТМ'] = 'ТМ'; -- террасса магистров


L['Г-БАСТ'] = 'Г-БАСТ'; -- бастионы адского пламени
L['Г-КК'] = 'Г-КК'; -- кузня крови
L['Г-УЗИ'] = 'Г-УЗИ'; -- узилище
L['Г-ТОПЬ'] = 'Г-ТОПЬ'; -- нижнетопь
L['Г-ГМ'] = 'Г-ГМ'; -- гробницы маны
L['Г-АУКГ'] = 'Г-АУКГ'; -- аукенайские гробницы
L['Г-ПВ1'] = 'Г-ПВ1'; -- предгорья хилсбрада
L['Г-СЗ'] = 'Г-СЗ'; -- сеттекские залы
L['Г-ПП'] = 'Г-ПП'; -- паровое подземелье
L['Г-ТЛ'] = 'Г-ТЛ'; -- темный лабиринт
L['Г-РЗ'] = 'Г-РЗ'; -- разрушенные залы
L['Г-МЕХ'] = 'Г-МЕХ'; -- механар
L['Г-БОТ'] = 'Г-БОТ'; -- ботаника
L['Г-ЧТ'] = 'Г-ЧТ'; -- Черные топи
L['Г-АРКА'] = 'Г-АРКА'; -- акратрац
L['Г-ТМ'] = 'Г-ТМ'; -- террасса магистров


L['КАРА'] = 'КАРА'; -- каражан
L['ГРУУЛ'] = 'ГРУУЛ'; -- Груул
L['МАГТ'] = 'МАГТ'; -- Магтеридон
L['ЗА'] = 'ЗА'; -- зул аман
L['ЗС'] = 'ЗС'; -- змеиное святилище
L['ТК'] = 'ТК'; -- око бурь
L['ХИДЖ'] = 'ХИДЖ'; -- Вершина Хиджала 
L['ХРАМ'] = 'ХРАМ'; -- Черный Храм 
L['ПСК'] = 'ПСК'; --Плато Солнечного Колодца 	

LFGSort_Inst1 = {};
LFGSort_Inst2 = {};
LFGSort_Inst3 = {};
LFGSort_Inst4 = {};
LFGSort_Inst5 = {};
LFGSort_Inst6 = {};

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
	LFGSort_Inst_ect['buf.*DM'] = 'БАФФ';
	LFGSort_Inst_ect['DM.*Buf'] = 'БАФФ';
	LFGSort_Inst_ect['DM.*BUF'] = 'БАФФ';

	-- 2. МАО
	LFGSort_Inst1['SM'] = 'МАО';
	LFGSort_Inst1['[^%a]smgy[^%a]'] = 'МАО';
	LFGSort_Inst1['[^%a]sm[^%a]'] = 'МАО';
	LFGSort_Inst1['[^%a]smlib[^%a]'] = 'МАО';
	-- 3. Мародон
	LFGSort_Inst2['mara'] = 'МАРА';
	LFGSort_Inst2['MARA'] = 'МАРА';
	LFGSort_Inst2['[Mm]ara'] = 'МАРА';

	-- 4. КТК
	LFGSort_Inst1['[Ss]adow [Ff]ang'] = 'КТК';
	LFGSort_Inst1['SFK'] = 'КТК';
	-- 5. ЛИ
	LFGSort_Inst1['RFK'] = 'ЛИ'; -- без ИЛИ
	LFGSort_Inst1['[Kk]raul'] = 'ЛИ';
	-- 6. ГЧГ
	LFGSort_Inst2['BRD'] = 'ГЧГ';
	LFGSort_Inst2['brd'] = 'ГЧГ';

	-- 7. ЗФ
	LFGSort_Inst2['ZF'] = 'ЗФ';
	LFGSort_Inst2['[Ff]arak'] = 'ЗФ';
	LFGSort_Inst2['FARAK'] = 'ЗФ';
	LFGSort_Inst2['[Ff]arrak'] = 'ЗФ';
	LFGSort_Inst2['FARRAK'] = 'ЗФ';
	-- 8. НП пучина
	LFGSort_Inst1['BFD'] = 'НП';
	LFGSort_Inst1['[Bb]lack [Ff]athom [Dd]eeps'] = 'НП';
	LFGSort_Inst1['[Bb]lackfathom'] = 'НП';
	-- 9. Ульдаман
	LFGSort_Inst2['[uU]lda'] = 'УЛЬДА';
	LFGSort_Inst2['ULDA'] = 'УЛЬДА';
	-- 10. Курганы И
	LFGSort_Inst1['[^%a]downs[^%a]'] = 'КИ';
	LFGSort_Inst1['RFD'] = 'КИ'; -- КУРГАНЫ

	-- 11. Пещеры стенаний
	LFGSort_Inst1['[^%a]WC[^%a]'] = 'ПС';
	-- 12. Храм
	LFGSort_Inst2['[Tt]emple'] = 'ХРАМ';
	LFGSort_Inst2['[Aa]tal'] = 'ХРАМ';

	-- 13. Мертвые копи
	LFGSort_Inst1['[Dd]eadmines'] = 'МК';
	LFGSort_Inst1['[Mm]ines'] = 'МК';
	LFGSort_Inst1['DMs'] = 'МК';
	LFGSort_Inst1['DEADMINES'] = 'МК';
	-- 14. Тюрьма
	LFGSort_Inst1['[^%a]ST[^%a]'] = 'ТЮ';
	LFGSort_Inst1['Stocade'] = 'ТЮ';
	LFGSort_Inst1['Stocad'] = 'ТЮ';
	-- 15. Забытый город
	LFGSort_Inst2['[^%a]DM[^%a]'] = 'ДМ';
	LFGSort_Inst2['[dD]ire [mM]aul'] = 'ДМ';
	LFGSort_Inst2['dm [Nn]orth'] = 'ДМ';
	LFGSort_Inst2['dm [Ee]ast'] = 'ДМ';
	LFGSort_Inst2['dm [Ww]est'] = 'ДМ';
	-- 16. Гномер
	LFGSort_Inst1['[Gg]nomer'] = 'ГНОМ';
	LFGSort_Inst1['GNOMER'] = 'ГНОМ';
	-- 17. Страт
	LFGSort_Inst2['[Ss]trat[^%a]'] = 'СТРАТ';
	LFGSort_Inst2['[Ss]trath'] = 'СТРАТ';
	LFGSort_Inst2['STRAT[^%a]'] = 'СТРАТ';
	LFGSort_Inst2['[^%a]ST L'] = 'СТРАТ';
	-- 18. Шоло
	LFGSort_Inst2['SCHOLO'] = 'ШОЛО';
	LFGSort_Inst2['SHOLO'] = 'ШОЛО';
	LFGSort_Inst2['[Ss]cholo'] = 'ШОЛО';
	-- 19. ОП
	LFGSort_Inst1['RFC'] = 'ОП';
	LFGSort_Inst1['[Rr]agefire'] = 'ОП';
	LFGSort_Inst1['[^%a]rfc[^%a]'] = 'ОП';
	-- 20. УБРС
	LFGSort_Inst2['UBRS'] = 'УБРС';
	LFGSort_Inst2['ubrs'] = 'УБРС';
	LFGSort_Inst2['[^%a][Rr]end[^%a].*[^%a][Rr]un[^%a]'] = 'УБРС';
	-- 21. ЛБРС
	LFGSort_Inst2['LBRS'] = 'ЛБРС';
	LFGSort_Inst2['lbrs'] = 'ЛБРС';

	-- 22. ЗГ
	LFGSort_Inst3['[^%a]Zg[^%a]'] = 'ЗГ';
	LFGSort_Inst3['[^%a]ZG[^%a]'] = 'ЗГ';
	LFGSort_Inst3['[Gg]urub'] = 'ЗГ';
	LFGSort_Inst3['GURUB[^Aa]'] = 'ЗГ';
	-- 23. АК20
	LFGSort_Inst3['AQ20'] = 'АК20';
	LFGSort_Inst3['AQ%s*20^g'] = 'АК20';

	-- 24. АК40
	LFGSort_Inst3['AQ.*40^g'] = 'АК40';
	LFGSort_Inst3['QIRAJ%s*40^g'] = 'АК40';
	LFGSort_Inst3['[Qq]iraj%s*40^g'] = 'АК40';
	-- 25. ОП
	LFGSort_Inst3['[^%a]MC[^%a]'] = 'ОН';
	LFGSort_Inst3['[mM]olten [Cc]ore'] = 'ОН';

	-- 26. БВЛ

	LFGSort_Inst3['BWL'] = 'БВЛ';
	LFGSort_Inst3['bwl'] = 'БВЛ';

	-- 27. Накс
	LFGSort_Inst3['[Nn]ax'] = 'НАКС';
	LFGSort_Inst3['NAX'] = 'НАКС';
	-- 28. Оня
	LFGSort_Inst3['[^%a][Oo]ny'] = 'ОНЯ';
	LFGSort_Inst3['[^%a]ONY'] = 'ОНЯ';


	LFGSort_Inst4['БАСТ'] = 'БАСТ'; -- бастионы адского пламени
	LFGSort_Inst4['КК'] = 'КК'; -- кузня крови
	LFGSort_Inst4['УЗИ'] = 'УЗИ'; -- узилище
	LFGSort_Inst4['ТОПЬ'] = 'ТОПЬ'; -- нижнетопь
	LFGSort_Inst4['ГМ'] = 'ГМ'; -- гробницы маны
	LFGSort_Inst4['АУКГ'] = 'АУКГ'; -- аукенайские гробницы
	LFGSort_Inst4['ПВ1'] = 'ПВ1'; -- предгорья хилсбрада
	LFGSort_Inst4['СЗ'] = 'СЗ'; -- сеттекские залы
	LFGSort_Inst4['ПП'] = 'ПП'; -- паровое подземелье
	LFGSort_Inst4['ТЛ'] = 'ТЛ'; -- темный лабиринт
	LFGSort_Inst4['РЗ'] = 'РЗ'; -- разрушенные залы
	LFGSort_Inst4['МЕХ'] = 'МЕХ'; -- механар
	LFGSort_Inst4['БОТ'] = 'БОТ'; -- ботаника
	LFGSort_Inst4['ЧТ'] = 'ЧТ'; -- Черные топи
	LFGSort_Inst4['АРКА'] = 'АРКА'; -- акратрац
	LFGSort_Inst4['ТМ'] = 'ТМ'; -- террасса магистров


	LFGSort_Inst5['Г-БАСТ'] = 'Г-БАСТ'; -- бастионы адского пламени
	LFGSort_Inst5['Г-КК'] = 'Г-КК'; -- кузня крови
	LFGSort_Inst5['Г-УЗИ'] = 'Г-УЗИ'; -- узилище
	LFGSort_Inst5['Г-ТОПЬ'] = 'Г-ТОПЬ'; -- нижнетопь
	LFGSort_Inst5['Г-ГМ'] = 'Г-ГМ'; -- гробницы маны
	LFGSort_Inst5['Г-АУКГ'] = 'Г-АУКГ'; -- аукенайские гробницы
	LFGSort_Inst5['Г-ПВ1'] = 'Г-ПВ1'; -- предгорья хилсбрада
	LFGSort_Inst5['Г-СЗ'] = 'Г-СЗ'; -- сеттекские залы
	LFGSort_Inst5['Г-ПП'] = 'Г-ПП'; -- паровое подземелье
	LFGSort_Inst5['Г-ТЛ'] = 'Г-ТЛ'; -- темный лабиринт
	LFGSort_Inst5['Г-РЗ'] = 'Г-РЗ'; -- разрушенные залы
	LFGSort_Inst5['Г-МЕХ'] = 'Г-МЕХ'; -- механар
	LFGSort_Inst5['Г-БОТ'] = 'Г-БОТ'; -- ботаника
	LFGSort_Inst5['Г-ЧТ'] = 'Г-ЧТ'; -- Черные топи
	LFGSort_Inst5['Г-АРКА'] = 'Г-АРКА'; -- акратрац
	LFGSort_Inst5['Г-ТМ'] = 'Г-ТМ'; -- террасса магистров


	LFGSort_Inst6['КАРА'] = 'КАРА'; -- каражан
	LFGSort_Inst6['ГРУУЛ'] = 'ГРУУЛ'; -- Груул
	LFGSort_Inst6['МАГТ'] = 'МАГТ'; -- Магтеридон
	LFGSort_Inst6['ЗА'] = 'ЗА'; -- зул аман
	LFGSort_Inst6['ЗС'] = 'ЗС'; -- змеиное святилище
	LFGSort_Inst6['ТК'] = 'ТК'; -- око бурь
	LFGSort_Inst6['ХИДЖ'] = 'ХИДЖ'; -- Вершина Хиджала 
	LFGSort_Inst6['ХРАМ'] = 'ХРАМ'; -- Черный Храм 
	LFGSort_Inst6['ПСК'] = 'ПСК'; --Плато Солнечного Колодца 	

L['LFGSort_Inst_ect'] = LFGSort_Inst_ect;
L['LFGSort_Inst1'] = LFGSort_Inst1
L['LFGSort_Inst2'] = LFGSort_Inst2
L['LFGSort_Inst3'] = LFGSort_Inst3

L['LFGSort_Inst4'] = LFGSort_Inst4
L['LFGSort_Inst5'] = LFGSort_Inst5
L['LFGSort_Inst6'] = LFGSort_Inst6

end
