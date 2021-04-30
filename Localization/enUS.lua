local L = LibStub("AceLocale-3.0"):NewLocale("LFGSorter", "enUS", true)

if L then
L['Raids & other'] = 'Raids & other';
L['5 ppl 1'] = 'low lvl inst';
L['5 ppl 2'] = 'high lvl inst';
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

LFGSort_Inst = {};
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

	-- 2. МАО
	LFGSort_Inst['SM'] = 'МАО';
	LFGSort_Inst['[^%a]smgy[^%a]'] = 'МАО';
	LFGSort_Inst['[^%a]sm[^%a]'] = 'МАО';
	LFGSort_Inst['[^%a]smlib[^%a]'] = 'МАО';
	-- 3. Мародон
	LFGSort_Inst['mara'] = 'МАРА';
	LFGSort_Inst['MARA'] = 'МАРА';
	LFGSort_Inst['[Mm]ara'] = 'МАРА';

	-- 4. КТК
	LFGSort_Inst['[Ss]adow [Ff]ang'] = 'КТК';
	LFGSort_Inst['SFK'] = 'КТК';
	-- 5. ЛИ
	LFGSort_Inst['RFK'] = 'ЛИ'; -- без ИЛИ
	LFGSort_Inst['[Kk]raul'] = 'ЛИ';
	-- 6. ГЧГ
	LFGSort_Inst['BRD'] = 'ГЧГ';
	LFGSort_Inst['brd'] = 'ГЧГ';

	-- 7. ЗФ
	LFGSort_Inst['ZF'] = 'ЗФ';
	LFGSort_Inst['[Ff]arak'] = 'ЗФ';
	LFGSort_Inst['FARAK'] = 'ЗФ';
	LFGSort_Inst['[Ff]arrak'] = 'ЗФ';
	LFGSort_Inst['FARRAK'] = 'ЗФ';
	-- 8. НП пучина
	LFGSort_Inst['BFD'] = 'НП';
	LFGSort_Inst['[Bb]lack [Ff]athom [Dd]eeps'] = 'НП';
	LFGSort_Inst['[Bb]lackfathom'] = 'НП';
	-- 9. Ульдаман
	LFGSort_Inst['[uU]lda'] = 'УЛЬДА';
	LFGSort_Inst['ULDA'] = 'УЛЬДА';
	-- 10. Курганы И
	LFGSort_Inst['[^%a]downs[^%a]'] = 'КИ';
	LFGSort_Inst['RFD'] = 'КИ'; -- КУРГАНЫ

	-- 11. Пещеры стенаний
	LFGSort_Inst['[^%a]WC[^%a]'] = 'ПС';
	-- 12. Храм
	LFGSort_Inst['[Tt]emple'] = 'ХРАМ';
	LFGSort_Inst['[Aa]tal'] = 'ХРАМ';

	-- 13. Мертвые копи
	LFGSort_Inst['[Dd]eadmines'] = 'МК';
	LFGSort_Inst['[Mm]ines'] = 'МК';
	LFGSort_Inst['DMs'] = 'МК';
	LFGSort_Inst['DEADMINES'] = 'МК';
	-- 14. Тюрьма
	LFGSort_Inst['[^%a]ST[^%a]'] = 'ТЮ';
	LFGSort_Inst['Stocade'] = 'ТЮ';
	LFGSort_Inst['Stocad'] = 'ТЮ';
	-- 15. Забытый город
	LFGSort_Inst['[^%a]DM[^%a]'] = 'ДМ';
	LFGSort_Inst['[dD]ire [mM]aul'] = 'ДМ';
	LFGSort_Inst['dm [Nn]orth'] = 'ДМ';
	LFGSort_Inst['dm [Ee]ast'] = 'ДМ';
	LFGSort_Inst['dm [Ww]est'] = 'ДМ';
	-- 16. Гномер
	LFGSort_Inst['[Gg]nomer'] = 'ГНОМ';

	-- 17. Страт
	LFGSort_Inst['[Ss]trat[^%a]'] = 'СТРАТ';
	LFGSort_Inst['[Ss]trath'] = 'СТРАТ';
	LFGSort_Inst['STRAT[^%a]'] = 'СТРАТ';
	LFGSort_Inst['[^%a]ST L'] = 'СТРАТ';
	-- 18. Шоло
	LFGSort_Inst['SCHOLO'] = 'ШОЛО';
	LFGSort_Inst['SHOLO'] = 'ШОЛО';
	LFGSort_Inst['[Ss]cholo'] = 'ШОЛО';
	-- 19. ОП
	LFGSort_Inst['RFC'] = 'ОП';
	LFGSort_Inst['[^%a]rfc[^%a]'] = 'ОП';
	-- 20. УБРС
	LFGSort_Inst['UBRS'] = 'УБРС';
	LFGSort_Inst['ubrs'] = 'УБРС';
	LFGSort_Inst['[^%a][Rr]end[^%a].*[^%a][Rr]un[^%a]'] = 'УБРС';
	-- 21. ЛБРС
	LFGSort_Inst['LBRS'] = 'ЛБРС';
	LFGSort_Inst['lbrs'] = 'ЛБРС';

	-- 22. ЗГ
	LFGSort_Inst['[^%a]Zg[^%a]'] = 'ЗГ';
	LFGSort_Inst['[^%a]ZG[^%a]'] = 'ЗГ';
	LFGSort_Inst['[Gg]urub'] = 'ЗГ';
	LFGSort_Inst['GURUB[^Aa]'] = 'ЗГ';
	-- 23. АК20
	LFGSort_Inst['AQ20'] = 'АК20';
	LFGSort_Inst['AQ%s*20^g'] = 'АК20';

	-- 24. АК40
	LFGSort_Inst['AQ.*40^g'] = 'АК40';
	LFGSort_Inst['QIRAJ%s*40^g'] = 'АК40';
	LFGSort_Inst['[Qq]iraj%s*40^g'] = 'АК40';
	-- 25. ОП
	LFGSort_Inst['[^%a]MC[^%a]'] = 'ОН';
	LFGSort_Inst['[mM]olten [Cc]ore'] = 'ОН';

	-- 26. БВЛ

	LFGSort_Inst['BWL'] = 'БВЛ';
	LFGSort_Inst['bwl'] = 'БВЛ';

	-- 27. Накс
	LFGSort_Inst['[Nn]ax'] = 'НАКС';
	LFGSort_Inst['NAX'] = 'НАКС';
	-- 28. Оня
	LFGSort_Inst['[^%a][Oo]ny'] = 'ОНЯ';
	LFGSort_Inst['[^%a]ONY'] = 'ОНЯ';


L['LFGSort_Inst_ect'] = LFGSort_Inst_ect;
L['LFGSort_Inst'] = LFGSort_Inst

end
