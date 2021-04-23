local L = LibStub("AceLocale-3.0"):NewLocale("LFGSorter", "ruRU")

if L then
L['Raids & other'] = 'Рейды и пр.';
L['5 ppl 1'] = 'low lvl инсты';
L['5 ppl 2'] = 'high lvl инсты';

L['LFG sorter loading default'] = 'Загружаются настройки LFGSorter';

L['будут скрыты из чата'] = 'будут скрыты из чата';
L['будут показаны в чате'] = 'будут показаны в чате';
L['Звук включен'] = 'Звук включен';
L['Звук выключен'] = 'Звук выключен';

L['Настройки LFG sorter'] = 'Настройки LFG sorter';

L['скрыть'] = 'скрыть';
L['звук'] = 'звук';

L['АФК'] = 'АФК';
L['БАФФ'] = 'БАФФ';

L['МАО'] = 'МАО';
L['МАРА'] = 'МАРА';
L['КТК'] = 'КТК';
L['ЛИ'] = 'ЛИ';
L['ГЧГ'] = 'ГЧГ';
L['ЗФ'] = 'ЗФ';
L['НП'] = 'НП';
L['УЛЬДА'] = 'УЛЬДА';
L['КИ'] = 'КИ';
L['ПС'] = 'ПС';
L['ХРАМ'] = 'ХРАМ';
L['МК'] = 'МК';
L['ТЮ'] = 'ТЮ';
L['ГНОМ'] = 'ГНОМ';
L['ДМ'] = 'ДМ';
L['СТРАТ'] = 'СТРАТ';
L['ШОЛО'] = 'ШОЛО';
L['ОП'] = 'ОП';
L['ЛБРС'] = 'ЛБРС';
L['УБРС'] = 'УБРС';

L['ЗГ'] = 'ЗГ';
L['АК20'] = 'АК20';
L['ОНЯ'] = 'ОНЯ';
L['ОН'] = 'ОН';
L['АК40'] = 'АК40';
L['БВЛ'] = 'БВЛ';
L['НАКС'] = 'НАКС';

LFGSort_Inst = {};
LFGSort_Inst_ect = {};

	-- 0. AFK / boost /
	--LFGSort_Inst['[^|%s][Аа][Фф][кК][%s|$]'] = 'АФК';
	LFGSort_Inst_ect['АФК'] = 'АФК';
	LFGSort_Inst_ect['AFK'] = 'АФК';
	LFGSort_Inst_ect['афк'] = 'АФК';
	LFGSort_Inst_ect['БУСТ'] = 'АФК';
	LFGSort_Inst_ect['Буст'] = 'АФК';
	LFGSort_Inst_ect['буст'] = 'АФК';
	LFGSort_Inst_ect['boost'] = 'АФК';
	LFGSort_Inst_ect['BOOST'] = 'АФК';
	LFGSort_Inst_ect['g%-ран'] = 'АФК';
	LFGSort_Inst_ect['g ран'] = 'АФК';
	LFGSort_Inst_ect['g/ран'] = 'АФК';
	LFGSort_Inst_ect['г%-ран'] = 'АФК';
	LFGSort_Inst_ect['г ран'] = 'АФК';
	LFGSort_Inst_ect['г/ран'] = 'АФК';
	-- 1. Баффы ДМ
	LFGSort_Inst_ect['баф.*ДМ'] = 'БАФФ';
	LFGSort_Inst_ect['Баф.*ДМ'] = 'БАФФ';
	LFGSort_Inst_ect['БАФ.*ДМ'] = 'БАФФ';
	LFGSort_Inst_ect['ДМ.*Баф'] = 'БАФФ';
	LFGSort_Inst_ect['дм.*баф'] = 'БАФФ';
	LFGSort_Inst_ect['дм.*БАФ'] = 'БАФФ';

	-- 2. МАО
	LFGSort_Inst['мао'] = 'МАО';
	LFGSort_Inst['МАО'] = 'МАО';
	LFGSort_Inst['[мМ]онастырь'] = 'МАО';
	LFGSort_Inst['СМ'] = 'МАО';
	LFGSort_Inst['SM'] = 'МАО';
	LFGSort_Inst['[кК]ладбищ'] = 'МАО';
	LFGSort_Inst['[бБ]иблиотек'] = 'МАО';
	LFGSort_Inst['[сС]обор'] = 'МАО';
	-- 3. Мародон
	LFGSort_Inst['марадон'] = 'МАРА';
	LFGSort_Inst['[мМ]ара[уд%s]'] = 'МАРА';
	LFGSort_Inst['[мМ]аро[уд]'] = 'МАРА';
	LFGSort_Inst['МАРА'] = 'МАРА';
	LFGSort_Inst[' [Мм]ару'] = 'МАРА';
	-- 4. КТК
	LFGSort_Inst['[Тт]емного клыка'] = 'КТК';
	LFGSort_Inst['ТЕМНОГО КЛЫКА'] = 'КТК';
	LFGSort_Inst['КТК'] = 'КТК';
	LFGSort_Inst[' ктк'] = 'КТК';
	-- 5. ЛИ
	LFGSort_Inst['[^И]ЛИ'] = 'ЛИ'; -- без ИЛИ
	LFGSort_Inst['лабиринты'] = 'ЛИ';
	-- 6. ГЧГ
	LFGSort_Inst['ГЧГ'] = 'ГЧГ';
	LFGSort_Inst['ГчГ'] = 'ГЧГ';
	LFGSort_Inst['Гчг'] = 'ГЧГ';
	LFGSort_Inst['БРД'] = 'ГЧГ';
	LFGSort_Inst['BRD'] = 'ГЧГ';
	LFGSort_Inst['гчг'] = 'ГЧГ';
	LFGSort_Inst['брд'] = 'ГЧГ';
	LFGSort_Inst['brd'] = 'ГЧГ';
	-- 7. ЗФ
	LFGSort_Inst['ЗФ'] = 'ЗФ';
	LFGSort_Inst['[фФ]арак'] = 'ЗФ';
	LFGSort_Inst['ФАРАК'] = 'ЗФ';
	LFGSort_Inst['[фФ]аррак'] = 'ЗФ';
	LFGSort_Inst['ФАРРАК'] = 'ЗФ';
	-- 8. НП пучина
	LFGSort_Inst['НП'] = 'НП';
	LFGSort_Inst['[Пп]учин'] = 'НП';
	LFGSort_Inst['ПУЧИН'] = 'НП';
	-- 9. Ульдаман
	LFGSort_Inst['[уУ]льда'] = 'УЛЬДА';
	-- 10. Курганы И
	LFGSort_Inst['КИ'] = 'КИ';
	LFGSort_Inst['[Кк]урган'] = 'КИ'; -- КУРГАНЫ
	LFGSort_Inst['КУРГАН'] = 'КИ';
	-- 11. Пещеры стенаний
	LFGSort_Inst['wc'] = 'ПС';
	-- 12. Храм
	LFGSort_Inst['[хХ]рам'] = 'ХРАМ';
	LFGSort_Inst['[хХ]аккар'] = 'ХРАМ';
	LFGSort_Inst['[аА]ттал'] = 'ХРАМ';
	LFGSort_Inst['[аА]тал'] = 'ХРАМ';
	-- 13. Мертвые копи
	LFGSort_Inst[' мк'] = 'МК';
	LFGSort_Inst['мк '] = 'МК';
	LFGSort_Inst['МК'] = 'МК';
	LFGSort_Inst['[Кк]опи'] = 'МК';
	-- 14. Тюрьма
	LFGSort_Inst['[тТ]юрьм'] = 'ТЮ';
	-- 15. Забытый город
	LFGSort_Inst['ДМ'] = 'ДМ';
	-- 16. Гномер
	LFGSort_Inst['[гГ]номер'] = 'ГНОМ';
	LFGSort_Inst['ГНОМЕР'] = 'ГНОМ';
	LFGSort_Inst['[гГ]номре'] = 'ГНОМ';
	-- 17. Страт
	LFGSort_Inst['[сС]трат'] = 'СТРАТ';
	LFGSort_Inst['СТРАТ'] = 'СТРАТ';
	-- 18. Шоло
	LFGSort_Inst['ШОЛО'] = 'ШОЛО';
	LFGSort_Inst['НЕКРОС'] = 'ШОЛО';
	LFGSort_Inst['шоло'] = 'ШОЛО';
	LFGSort_Inst['[шШ]оло'] = 'ШОЛО';
	LFGSort_Inst['[Нн]екро'] = 'ШОЛО';
	-- 19. ОП
	LFGSort_Inst['ОП'] = 'ОП';
	-- 20. УБРС
	LFGSort_Inst['УБРС'] = 'УБРС';
	LFGSort_Inst['убрс'] = 'УБРС';
	LFGSort_Inst['[Рр]енд.*[Рр]ан'] = 'УБРС';
	-- 21. ЛБРС
	LFGSort_Inst['ЛБРС'] = 'ЛБРС';
	LFGSort_Inst['лбрс'] = 'ЛБРС';
	LFGSort_Inst['lbrs'] = 'ЛБРС';
	-- 22. ЗГ
	LFGSort_Inst['Зг%s'] = 'ЗГ';
	LFGSort_Inst['ЗГ'] = 'ЗГ';
	LFGSort_Inst['[Гг]уруб'] = 'ЗГ';
	LFGSort_Inst['ГУРУБ[^Аа]'] = 'ЗГ';
	-- 23. АК20
	LFGSort_Inst['АК%s*20^г'] = 'АК20';
	LFGSort_Inst['АКУ20'] = 'АК20';
	LFGSort_Inst['АК20'] = 'АК20';
	LFGSort_Inst['АКУ 20'] = 'АК20';
	LFGSort_Inst['АК 20'] = 'АК20';
	LFGSort_Inst['AQ%s*20^г'] = 'АК20';
	LFGSort_Inst['[аА]к.*20^г'] = 'АК20';
	LFGSort_Inst['[кК]ираж%s*20^г'] = 'АК40';
	-- 24. АК40
	LFGSort_Inst['АК40'] = 'АК40';
	LFGSort_Inst['АКУ40'] = 'АК40';
	LFGSort_Inst['АКУ 40'] = 'АК40';
	LFGSort_Inst['АК 40'] = 'АК40';
	LFGSort_Inst['АК.*40^г'] = 'АК40';
	LFGSort_Inst['[Аа]к%s*40^г'] = 'АК40';
	LFGSort_Inst['[кК]ираж%s*40^г'] = 'АК40';
	-- 25. ОП
	LFGSort_Inst['МС^К'] = 'ОН';
	LFGSort_Inst['MC^К'] = 'ОН';
	LFGSort_Inst['[mM]olten [Cc]ore'] = 'ОН';
	LFGSort_Inst['[нН]едра'] = 'ОН';
	-- 26. БВЛ
	LFGSort_Inst['БВЛ'] = 'БВЛ';
	LFGSort_Inst['BWL'] = 'БВЛ';
	LFGSort_Inst['бвл'] = 'БВЛ';
	LFGSort_Inst['bwl'] = 'БВЛ';
	LFGSort_Inst['ЛКТ'] = 'БВЛ';
	--LFGSort_Inst['лкт'] = 'БВЛ'
	-- 27. Накс
	LFGSort_Inst['[Нн]акс'] = 'НАКС';
	LFGSort_Inst['НАКС'] = 'НАКС';
	-- 28. Оня
	LFGSort_Inst['[Оо]никси'] = 'ОНЯ';
	LFGSort_Inst['ОНЯ'] = 'ОНЯ';
	LFGSort_Inst['ОНЮ'] = 'ОНЯ';
	LFGSort_Inst['ОНЯ'] = 'ОНЯ';
	LFGSort_Inst['ОНИКСИ'] = 'ОНЯ';

L['LFGSort_Inst_ect'] = LFGSort_Inst_ect;
L['LFGSort_Inst'] = LFGSort_Inst
end