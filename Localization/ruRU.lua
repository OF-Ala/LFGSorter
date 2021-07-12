local L = LibStub("AceLocale-3.0"):NewLocale("LFGSorter", "ruRU")
local old_no_cyr = '[^А-ЯЁа-я%a]'
local no_cyr = '[^\128-\145\176-\191\208\209]'

if L then

L['Select ding sound'] = 'Звук при появлении выбранных инстов';

L['ReloadRequired'] = 'После нажатия интерфейс перезагрузится!'
L['FrameExists'] = 'Вкладка уже создана!'
L['AboutNewFrame'] = 'Добавить отдельную вкладку чата (LFGS) для отображения ЛФГ сообщений только в выбранные подземелья'
L['CreateChatFrame'] = 'Добавить окно чата'
L['DeleteChatFrame'] = 'Закрыть созданное окно'
L["LookingForGroup"] = 'ПоискСпутников'
L["GENERAL"] = 'Общий'
L["TRADE"] = 'Тоговля'

L['New'] = '+'
L["Save"] = 'сохранить настройку'
L["Remove"] = 'удалить настройку'
L["NewSettings"] = 'Новая настройка'
L["SavedProfiles"] = 'Загрузить настройку'


L['Raids & other'] = 'Рейды и пр.';
L['5 ppl 1'] = 'low lvl инсты';
L['5 ppl 2'] = 'high lvl инсты';
L['5 ppl bk'] = 'low lvl инсты БК';
L['5 ppl bk2'] = 'high lvl инсты БК';
L['hero bk'] = 'Героики БК';
L['hero bk2'] = 'Героики БК 2';
L['raid bk'] = 'Рейды БК';

L['Inst1'] = 'Определять low lvl инст.';
L['Inst2'] = 'Определять high lvl инст.';
L['Inst3'] = 'Определять рейды';
L['Inst6'] = 'Определять инсты/гер БК';
L['Inst5'] = 'Определять героики БК';
L['Inst4'] = 'Определять рейды БК';

L['Reset'] = 'Загрузить стандартные настройки';
L['HideAll'] = 'Скрыть все подземелья';
L['LFG sorter loading default'] = 'Загружаются настройки LFGSorter';

L['будут скрыты из чата'] = 'будут скрыты из чата';
L['будут показаны в чате'] = 'будут показаны в чате';
L['Звук включен'] = 'Звук включен';
L['Звук выключен'] = 'Звук выключен';
L['Сообщения в '] = 'Сообщения в ';
L[' обрабатываются аддоном - '] = ' обрабатываются аддоном - ';
L['Настройки LFG sorter'] = 'Настройки LFG sorter';

L['channel 1'] = 'канал 1';
L['channel 2'] = 'канал 2';
L['channel 3'] = 'канал 3';
L['channel 4'] = 'канал 4';
L['channel 5'] = 'канал 5';
L['channel 6'] = 'канал 6';

L['скрыть'] = 'скрыть';
L['звук'] = 'выбран';
L['выбран'] = 'выбран';
L['arena'] = 'Арена';

L['2x2'] = '2x2';
L['3x3'] = '3x3';
L['5x5'] = '5x5';

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

L['БАСТ'] = 'БАП'; -- бастионы адского пламени
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

L['ГЕР'] = 'ГЕР'; -- любой гер
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
L['ССК'] = 'ССК'; -- змеиное святилище
L['ТК'] = 'ТК'; -- око бурь
L['ХИДЖ'] = 'ХИДЖ'; -- Вершина Хиджала 
L['БТ'] = 'БТ'; -- Черный Храм 
L['ПЛАТО'] = 'ПЛАТО'; --Плато Солнечного Колодца 	

LFGSort_Inst1 = {};
LFGSort_Inst2 = {};
LFGSort_Inst3 = {};
LFGSort_Inst6 = {};
LFGSort_Inst5 = {};
LFGSort_Inst4 = {};
LFGSort_Inst7 = {};

LFGSort_Inst_ect = {};

	-- 0. AFK / boost /
	LFGSort_Inst_ect['[^а-я%a]афк[^а-я%a]'] = 'АФК';
	LFGSort_Inst_ect['[^а-я%a]afk[^а-я%a]'] = 'АФК';
	--LFGSort_Inst_ect['[Аа]фк'] = 'АФК';
	--LFGSort_Inst_ect['БУСТ'] = 'АФК';
	LFGSort_Inst_ect['буст'] = 'АФК';
	LFGSort_Inst_ect['boost'] = 'АФК';
	--LFGSort_Inst_ect['BOOST'] = 'АФК';
	LFGSort_Inst_ect['g%-ран'] = 'АФК';
	LFGSort_Inst_ect['g ран'] = 'АФК';
	LFGSort_Inst_ect['g/ран'] = 'АФК';
	LFGSort_Inst_ect['г%-ран'] = 'АФК';
	LFGSort_Inst_ect['г ран'] = 'АФК';
	LFGSort_Inst_ect['г/ран'] = 'АФК';
	
	-- 1. Баффы ДМ
	--LFGSort_Inst_ect['баф.*[^а-я%a]ДМ[^а-я%a]'] = 'БАФФ';
	LFGSort_Inst_ect['баф.*[^а-я%a]дм[^а-я%a]'] = 'БАФФ';
	--LFGSort_Inst_ect['БАФ.*[^а-я%a]ДМ'..no_cyr..''] = 'БАФФ';
	--LFGSort_Inst_ect['БАФ.*[^а-я%a]дм'..no_cyr..''] = 'БАФФ';
	
	LFGSort_Inst_ect['сердце х'] = 'БАФФ';
	LFGSort_Inst_ect['.*баф.*серд.*'] = 'БАФФ';
	--LFGSort_Inst_ect['.*БАФФ.*[Cс]ерд.*'] = 'БАФФ';
	--LFGSort_Inst_ect['БАФФ [Сс]ер'] = 'БАФФ';
	--LFGSort_Inst_ect['БАФФ СЕР'] = 'БАФФ';
	
	--LFGSort_Inst_ect[''..no_cyr..'ДМ'..no_cyr..'.*[Бб]аф'] = 'БАФФ';
	LFGSort_Inst_ect[''..no_cyr..'дм'..no_cyr..'.*баф'] = 'БАФФ';
	--LFGSort_Inst_ect[''..no_cyr..'дм'..no_cyr..'.*БАФ'] = 'БАФФ';
	--LFGSort_Inst_ect[''..no_cyr..'ДМ'..no_cyr..'.*БАФ'] = 'БАФФ';
	--LFGSort_Inst_ect[''..no_cyr..'Дм'..no_cyr..'.*[Бб]аф'] = 'БАФФ';
	
	-- 1. ОП
	LFGSort_Inst1[''..no_cyr..'оп'..no_cyr..''] = 'ОП';
	-- 13. Мертвые копи
	LFGSort_Inst1[''..no_cyr..'мк'..no_cyr..''] = 'МК';
	--LFGSort_Inst1[''..no_cyr..'МК'..no_cyr..''] = 'МК';
	LFGSort_Inst1['копи'] = 'МК';
	
	-- 11. Пещеры стенаний
	LFGSort_Inst1['wc'] = 'ПС';
	LFGSort_Inst1[''..no_cyr..'пс'..no_cyr..''] = 'ПС';
	LFGSort_Inst1['стенаний'] = 'ПС';
	--LFGSort_Inst1['СТЕНАНИЙ'] = 'ПС';
	-- 4. КТК
	LFGSort_Inst1['т[её]много клыка'] = 'КТК';
	--LFGSort_Inst1['ТЕМНОГО КЛЫКА'] = 'КТК';
	--LFGSort_Inst1[''..no_cyr..'КТК'..no_cyr..''] = 'КТК';
	LFGSort_Inst1[''..no_cyr..'ктк'] = 'КТК';
	-- 8. НП пучина
	LFGSort_Inst1[''..no_cyr..'нп'..no_cyr..''] = 'НП';
	LFGSort_Inst1[''..no_cyr..'пучин'] = 'НП';
	--LFGSort_Inst1['ПУЧИН'] = 'НП';
	-- 14. Тюрьма
	LFGSort_Inst1['тюрьм'] = 'ТЮ';
	
	-- 16. Гномер
	LFGSort_Inst1['гномер'] = 'ГНОМ';
	--LFGSort_Inst1['ГНОМЕР'] = 'ГНОМ';
	--LFGSort_Inst1['ГНОМРЕ'] = 'ГНОМ';
	LFGSort_Inst1['гномре'] = 'ГНОМ';
	LFGSort_Inst1['gnomer'] = 'ГНОМ';
	LFGSort_Inst1['gnomre'] = 'ГНОМ';

	-- 5. ЛИ
	LFGSort_Inst1[''..no_cyr..'ли'..no_cyr..''] = 'ЛИ'; -- без ИЛИ
	LFGSort_Inst1['лабиринт.*иглошк'] = 'ЛИ';
	
	-- 2. МАО
	LFGSort_Inst1['мао'] = 'МАО';
	--LFGSort_Inst1['МАО'] = 'МАО';
	LFGSort_Inst1['монастырь'] = 'МАО';
	LFGSort_Inst1[''..no_cyr..'см'..no_cyr..''] = 'МАО';
	LFGSort_Inst1[''..no_cyr..'sm'..no_cyr..''] = 'МАО';
	LFGSort_Inst1['кладбищ'] = 'МАО';
	LFGSort_Inst1['библиотек'] = 'МАО';
	LFGSort_Inst1['собор'] = 'МАО';
	
	-- 10. Курганы И
	LFGSort_Inst1[''..no_cyr..'ки'..no_cyr..''] = 'КИ';
	LFGSort_Inst1['курган'] = 'КИ'; -- КУРГАНЫ
	--LFGSort_Inst1['КУРГАН'] = 'КИ';

	
	-- 3. Мародон
	--LFGSort_Inst2['марадон'] = 'МАРА';
	LFGSort_Inst2['мара[уд%s]'] = 'МАРА';
	LFGSort_Inst2['маро[уд]'] = 'МАРА';
	--LFGSort_Inst2['МАРА'] = 'МАРА';
	--LFGSort_Inst2['МАРОД'] = 'МАРА';
	LFGSort_Inst2['мару'] = 'МАРА';

	-- 7. ЗФ
	LFGSort_Inst2[''..no_cyr..'зф'..no_cyr..''] = 'ЗФ';
	LFGSort_Inst2['фа[р]*ак'] = 'ЗФ';
	--LFGSort_Inst2['ФАРАК'] = 'ЗФ';
	--LFGSort_Inst2['[фФ]аррак'] = 'ЗФ';
	--LFGSort_Inst2['ФАРРАК'] = 'ЗФ';
	
	-- 9. Ульдаман
	LFGSort_Inst2['уль?да'] = 'УЛЬДА';
	--LFGSort_Inst2['УЛЬ?ДА'] = 'УЛЬДА';

	-- 12. Храм
	--LFGSort_Inst2['[хХ]рам'] = 'ХРАМ';
	--LFGSort_Inst2['ХРАМ'] = 'ХРАМ';
	LFGSort_Inst2['тонувш.*храм'] = 'ХРАМ';
	LFGSort_Inst2['хаккар'] = 'ХРАМ';
	LFGSort_Inst2[''..no_cyr..'а[т]*ал'] = 'ХРАМ';
	--LFGSort_Inst2[''..no_cyr..'[аА]тал'] = 'ХРАМ';

	
	-- 6. ГЧГ
	--LFGSort_Inst2['ГЧГ'] = 'ГЧГ';
	--LFGSort_Inst2['ГчГ'] = 'ГЧГ';
	--LFGSort_Inst2['Гчг'] = 'ГЧГ';
	--LFGSort_Inst2['БРД'] = 'ГЧГ';
	--LFGSort_Inst2['BRD'] = 'ГЧГ';
	LFGSort_Inst2['глубин.* ч[еёо]рн.* гор'] = 'ГЧГ';
	LFGSort_Inst2['гчг'] = 'ГЧГ';
	LFGSort_Inst2['брд'] = 'ГЧГ';
	LFGSort_Inst2['brd'] = 'ГЧГ';
	
	-- 21. ЛБРС
	--LFGSort_Inst2['ЛБРС'] = 'ЛБРС';
	LFGSort_Inst2['лбрс'] = 'ЛБРС';
	LFGSort_Inst2['lbrs'] = 'ЛБРС';

	
	-- 17. Страт
	LFGSort_Inst2['страт'] = 'СТРАТ';
	--LFGSort_Inst2['СТРАТ'] = 'СТРАТ';
	-- 18. Шоло
	--LFGSort_Inst2['ШОЛО'] = 'ШОЛО';
	--LFGSort_Inst2['НЕКРОС'] = 'ШОЛО';
	LFGSort_Inst2['шоло'] = 'ШОЛО';
	--LFGSort_Inst2['[шШ]оло'] = 'ШОЛО';
	LFGSort_Inst2['некрос'] = 'ШОЛО';
	
	-- 15. Забытый город
	--LFGSort_Inst2[''..no_cyr..'ДМ'..no_cyr..''] = 'ДМ';
	LFGSort_Inst2[''..no_cyr..'дм'..no_cyr..''] = 'ДМ';
	LFGSort_Inst2[''..no_cyr..'трибут'] = 'ДМ';	
	LFGSort_Inst2['забытый город'] = 'ДМ';
	
	-- 20. УБРС
	--LFGSort_Inst2['УБРС'] = 'УБРС';
	LFGSort_Inst2['убрс'] = 'УБРС';
	LFGSort_Inst2['ренд.*ран'] = 'УБРС';

	
	
	-- 22. ЗГ
	--LFGSort_Inst3['Зг%s'] = 'ЗГ';
	LFGSort_Inst3[''..no_cyr..'зг'..no_cyr..''] = 'ЗГ';
	LFGSort_Inst3['гуруб'] = 'ЗГ';
	--LFGSort_Inst3['ГУРУБ[^Аа]'] = 'ЗГ';
	
	-- 23. АК20
	--LFGSort_Inst3['АК%s*20[^гguГUG]'] = 'АК20';
	--LFGSort_Inst3['АКУ20'] = 'АК20';
	LFGSort_Inst3['ак20'] = 'АК20';
	LFGSort_Inst3['аку 20'] = 'АК20';
	LFGSort_Inst3[''..no_cyr..'ак 20'] = 'АК20';
	--LFGSort_Inst3['AQ%s*20[^гguГUG]'] = 'АК20';
	--LFGSort_Inst3['ак'..no_cyr..'.*20[^гgu]'] = 'АК20';
	LFGSort_Inst3['кираж%s*20[^гgu]'] = 'АК40';
	
	-- 24. АК40
	LFGSort_Inst3[''..no_cyr..'ак40'] = 'АК40';
	LFGSort_Inst3[''..no_cyr..'аку40'] = 'АК40';
	LFGSort_Inst3[''..no_cyr..'аку 40'] = 'АК40';
	LFGSort_Inst3[''..no_cyr..'ак 40'] = 'АК40';
	LFGSort_Inst3[''..no_cyr..'ак.*40^гgu'] = 'АК40';
	--LFGSort_Inst3[''..no_cyr..'ак.*40[^гguГUG]'] = 'АК40';
	LFGSort_Inst3['кираж.*40[^гgu].*'] = 'АК40';
	
	-- 25. ОП
	LFGSort_Inst3['[^А-ЯЁ%a|(по )]мс[^А-ЯЁ>%a]'] = 'ОН';
	--LFGSort_Inst3[''..no_cyr..'мс[^А-ЯЁ>%a]'] = 'ОН';
	LFGSort_Inst3['molten core'] = 'ОН';
	LFGSort_Inst3['недра'] = 'ОН';
	--LFGSort_Inst3['НЕДРА'] = 'ОН';
	--LFGSort_Inst3[''..no_cyr..'ОН'..no_cyr..''] = 'ОН';
	
	-- 26. БВЛ
	--LFGSort_Inst3['БВЛ'] = 'БВЛ';
	--LFGSort_Inst3['BWL'] = 'БВЛ';
	LFGSort_Inst3['бвл'] = 'БВЛ';
	LFGSort_Inst3['bwl'] = 'БВЛ';
	--LFGSort_Inst3['ЛКТ'] = 'БВЛ';
	LFGSort_Inst3['.*[Лл]огов.*[Кк]рыл.*[Тт]ьм.*'] = 'БВЛ';
	--LFGSort_Inst3['.*ЛОГОВ.*КРЫЛ.*ТЬМ.*'] = 'БВЛ';
	--LFGSort_Inst['лкт'] = 'БВЛ'
	
	-- 27. Накс
	LFGSort_Inst3['накс'] = 'НАКС';
	--LFGSort_Inst3['НАКС'] = 'НАКС';
	
	-- 28. Оня
	LFGSort_Inst3['оникси'] = 'ОНЯ';
	LFGSort_Inst3['оня'] = 'ОНЯ';
	LFGSort_Inst3['оню'] = 'ОНЯ';
	--LFGSort_Inst3['ОНЯ'] = 'ОНЯ';
	--LFGSort_Inst3['ОНИКСИ'] = 'ОНЯ';
	LFGSort_Inst3['[Oo]nyx%a'] = 'ОНЯ';
	
	
	LFGSort_Inst6[''..no_cyr..'баст'] = 'БАСТ'; -- бастионы адского пламени
	LFGSort_Inst6['[^%a]hr[^%a]'] = 'БАСТ';
	--LFGSort_Inst6[''..no_cyr..'БАП'..no_cyr..''] = 'БАСТ';
	LFGSort_Inst6['[^А-Яа-яЁ%a]бап[^А-Яа-яЁ%a]'] = 'БАСТ';
	LFGSort_Inst6[''..no_cyr..'рамп'] = 'БАСТ';
	--LFGSort_Inst6[''..no_cyr..'Рамп'] = 'БАСТ';
	--LFGSort_Inst6['[Бб]астио'] = 'БАСТ';
	
	--LFGSort_Inst6['[^%a]BF[^%a]'] = 'КК';
	LFGSort_Inst6['[^%a]bf[^%a]'] = 'КК';
	--LFGSort_Inst6['БФ'] = 'КК';
	LFGSort_Inst6[''..no_cyr..'бф'..no_cyr..''] = 'КК';
	LFGSort_Inst6[''..no_cyr..'кк'..no_cyr..''] = 'КК'; -- кузня крови
	LFGSort_Inst6['кузн[яю]'] = 'КК'; -- кузня крови
	--LFGSort_Inst6['КУЗН[ЯЮ]'] = 'КК'; 
	
	LFGSort_Inst6[''..no_cyr..'узи'] = 'УЗИ'; -- узилище
	LFGSort_Inst6['узили'] = 'УЗИ';
	LFGSort_Inst6[''..no_cyr..'сп'..no_cyr..''] = 'УЗИ';
	
	--LFGSort_Inst6['ТОПЬ'] = 'ТОПЬ'; -- нижнетопь
	LFGSort_Inst6['топь'] = 'ТОПЬ'; -- нижнетопь
	LFGSort_Inst6['нижетоп'] = 'ТОПЬ'; -- нижнетопь
	
	LFGSort_Inst6[''..no_cyr..'ГМ'..no_cyr..''] = 'ГМ'; -- гробницы маны
	LFGSort_Inst6[''..no_cyr..'томб'] = 'ГМ'; -- гробницы маны
	LFGSort_Inst6['манато'] = 'ГМ'; -- гробницы маны
	--LFGSort_Inst6['МАНАТО'] = 'ГМ'; -- гробницы маны
	LFGSort_Inst6['гробницу'] = 'ГМ';
	--LFGSort_Inst6['ГРОБНИЦУ'] = 'ГМ';
	LFGSort_Inst6['(гр)([ао]-)(бни.-)(маны).*'] = 'ГМ';
	LFGSort_Inst6['(гр)([ао]-)(бни.-)(м'..no_cyr..').*'] = 'ГМ';
	--LFGSort_Inst6['ГР[АО]-БН.*МАН'] = 'ГМ';
	
	LFGSort_Inst6['аукенайск'] = 'АУКГ';
	--LFGSort_Inst6['АУКЕНАЙСК'] = 'АУКГ';
	LFGSort_Inst6['[Аа]ук.*[Гг]р[оа]-бн'] = 'АУКГ'; -- аукенайские гробницы
	--LFGSort_Inst6['АУК.*ГР[АО]-БН'] = 'АУКГ';
	LFGSort_Inst6[''..no_cyr..'аг'..no_cyr..''] = 'АУКГ';
	LFGSort_Inst6['[Кк]рипт'] = 'АУКГ'; -- аукенайские гробницы
	
	LFGSort_Inst6['пв1'] = 'ПВ1'; -- предгорья хилсбрада
	LFGSort_Inst6[''..no_cyr..'хф'..no_cyr..''] = 'ПВ1'; -- предгорья хилсбрада
	LFGSort_Inst6['сот'] = 'ПВ1'; -- предгорья хилсбрада
	LFGSort_Inst6['cot'] = 'ПВ1'; -- предгорья хилсбрада
	--LFGSort_Inst6['ПРЕДГ.*ХИЛ'] = 'ПВ1'; -- предгорья хилсбрада
	--LFGSort_Inst6['ДАРНХОЛ'] = 'ПВ1'; -- предгорья хилсбрада
	LFGSort_Inst6['дарнхол'] = 'ПВ1'; -- предгорья хилсбрада
	LFGSort_Inst6['[Пп]редг.*[Хх]ил'] = 'ПВ1'; -- предгорья хилсбрада
	LFGSort_Inst6['стар.*хи[л]*с'] = 'ПВ1'; -- предгорья хилсбрада
	LFGSort_Inst6['[Хх]и[л]+сбра'] = 'ПВ1'; -- предгорья хилсбрада
	--LFGSort_Inst6['ХИ[Л]+СБРАД'] = 'ПВ1'; -- предгорья хилсбрада
	
	LFGSort_Inst6[''..no_cyr..'сз'..no_cyr..''] = 'СЗ'; -- сеттекские залы
	--LFGSort_Inst6['[Сс]ет.*[Зз]ал'] = 'СЗ'; -- сеттекские залы
	LFGSort_Inst6['се[т]+ек'] = 'СЗ'; -- сеттекские залы
	--LFGSort_Inst6['СЕТ.*ЗАЛ'] = 'СЗ';
	
	LFGSort_Inst6[''..no_cyr..'пп'..no_cyr..''] = 'ПП'; -- паровое подземелье
	LFGSort_Inst6['пар.*под'] = 'ПП'; -- паровое подземелье
	--LFGSort_Inst6['паровое'] = 'ПП';
	LFGSort_Inst6['пар[ао]-вое'] = 'ПП';
	LFGSort_Inst6['пар[ао]-вух'] = 'ПП';
	LFGSort_Inst6['сти.*валу'] = 'ПП'; -- паровое подземелье
	
	LFGSort_Inst6['[Шш]адо.*[Лл]аб'] = 'ТЛ'; -- темный лабиринт
	LFGSort_Inst6[''..no_cyr..'тл'..no_cyr..''] = 'ТЛ'; -- темный лабиринт
	LFGSort_Inst6[''..no_cyr..'шл'..no_cyr..''] = 'ТЛ'; -- темный лабиринт
	LFGSort_Inst6['т[её]-мн.*лаб'] = 'ТЛ'; -- темный лабиринт
	LFGSort_Inst6['лабиринт'..no_cyr..''] = 'ТЛ'; -- темный лабиринт
	--LFGSort_Inst6['Т[ЕЁ]-МН.*ЛАБ'] = 'ТЛ'; -- темный лабиринт
	
	LFGSort_Inst6[''..no_cyr..'рз'..no_cyr..''] = 'РЗ'; -- разрушенные залы
	LFGSort_Inst6['[Рр]азруш.*[зЗ]ал'] = 'РЗ'; -- SHATTERED HALLS
	--LFGSort_Inst6['РАЗРУ.*ЗАЛ'] = 'РЗ';
	LFGSort_Inst6['[^А-Яа-яЁ%a]шх[^А-Яа-яЁ%a]'] = 'РЗ'; 
	
	LFGSort_Inst6['мех'] = 'МЕХ'; -- механар
	LFGSort_Inst6['механар'] = 'МЕХ';
	LFGSort_Inst6['меху'..no_cyr..''] = 'МЕХ';
	
	LFGSort_Inst6[''..no_cyr..'бота'] = 'БОТ'; -- ботаника
	--LFGSort_Inst6[''..no_cyr..'ботан'] = 'БОТ'; -- ботаника
	--LFGSort_Inst6[''..no_cyr..'Ботан'] = 'БОТ'; -- ботаника
	
	LFGSort_Inst6['^А-ЯЁа-я%a%/]чт[^А-ЯЁа-я%a%/]'] = 'ЧТ'; -- Черные топи
	--LFGSort_Inst6[''..no_cyr..'Топи'..no_cyr..''] = 'ЧТ'; -- Черные топи
	LFGSort_Inst6[''..no_cyr..'топи'..no_cyr..''] = 'ЧТ';
	--LFGSort_Inst6[''..no_cyr..'ТОПИ'..no_cyr..''] = 'ЧТ'; -- Черные топи
	LFGSort_Inst6['BM'] = 'ЧТ'; -- Черные топи
	LFGSort_Inst6['бм ^(хан)'] = 'ЧТ'; -- Черные топи
	LFGSort_Inst6['морас'] = 'ЧТ'; -- Черные топи
	
	LFGSort_Inst6['арка'] = 'АРКА'; -- акратрац
	LFGSort_Inst6['[^%a]arca'] = 'АРКА'; -- акратрац
	LFGSort_Inst6['ал[ь]-ка'] = 'АРКА'; -- акратрац
	--LFGSort_Inst6['[Аа]л[ь]-ка'] = 'АРКА'; -- акратрац
	LFGSort_Inst6[''..no_cyr..'арк[ау]-'] = 'АРКА'; -- акратрац
	--LFGSort_Inst6[''..no_cyr..'Арк[ау]'] = 'АРКА'; 
	
	--LFGSort_Inst6[''..no_cyr..'ТМ'..no_cyr..''] = 'ТМ'; -- террасса магистров
	LFGSort_Inst6['те[р]*ас'] = 'ТМ'; -- террасса магистров
	--LFGSort_Inst6['[Тт]еррас'] = 'ТМ'; -- террасса магистров
	
	--LFGSort_Inst5['ГЕРОИ[ЧК]'] = 'ГЕР';
	LFGSort_Inst5['герои[чк]'] = 'ГЕР';
	LFGSort_Inst5[''..no_cyr..'гер'..no_cyr..''] = 'ГЕР';
	LFGSort_Inst5[''..no_cyr..'геры'..no_cyr..''] = 'ГЕР';
	LFGSort_Inst5[''..no_cyr..'хм'..no_cyr..''] = 'ГЕР';
	--LFGSort_Inst5[''..no_cyr..'гер'..no_cyr..''] = 'ГЕР';
	--LFGSort_Inst5[''..no_cyr..'ГЕР'..no_cyr..''] = 'ГЕР';
	--LFGSort_Inst5[''..no_cyr..'г'..no_cyr..''] = 'ГЕР';

	LFGSort_Inst5['[^%a]hero'] = 'ГЕР';
	--LFGSort_Inst5['[^%a%d%|][Hh][^%a%|]'] = 'ГЕР';
	--LFGSort_Inst5['[^%a]HC[^%a]'] = 'ГЕР';
	LFGSort_Inst5['[^%a]hc[^%a]'] = 'ГЕР';
	

--'..no_cyr..'
	--LFGSort_Inst4['КАРА'] = 'КАРА'; -- каражан
	LFGSort_Inst4[''..no_cyr..'кара'..no_cyr..''] = 'КАРА'; -- каражан
	LFGSort_Inst4[''..no_cyr..'кару'..no_cyr..''] = 'КАРА'; -- каражан
	LFGSort_Inst4['караж[а-я]'] = 'КАРА';
	
	LFGSort_Inst4['гр[у]+л'] = 'ГРУУЛ'; -- Груул
	--LFGSort_Inst4['[Гг]рул'] = 'ГРУУЛ'; -- Груул
	--LFGSort_Inst4['[Гг]руул'] = 'ГРУУЛ'; -- Груул
	--LFGSort_Inst4['[Гг]руля'] = 'ГРУУЛ'; -- Груул
	LFGSort_Inst4['грул[ья]'] = 'ГРУУЛ'; -- Груул
	
	LFGSort_Inst4['магт'] = 'МАГТ'; -- Магтеридон
	LFGSort_Inst4['магги'] = 'МАГТ'; -- Магтеридон
	LFGSort_Inst4['магтер'] = 'МАГТ'; -- Магтеридон
	LFGSort_Inst4['магер'] = 'МАГТ'; -- Магтеридон
	--LFGSort_Inst4['магтер'] = 'МАГТ'; -- Магтеридон
	
	--LFGSort_Inst4['ЗА'] = 'ЗА'; -- зул аман
	--LFGSort_Inst4['ССК'] = 'ССК'; -- змеиное святилище
	--LFGSort_Inst4['ТК'] = 'ТК'; -- око бурь
	--LFGSort_Inst4['ХИДЖ'] = 'ХИДЖ'; -- Вершина Хиджала 
	--LFGSort_Inst4['БТ'] = 'БТ'; -- Черный Храм 
	--LFGSort_Inst4['ПЛАТО'] = 'ПЛАТО'; --Плато Солнечного Колодца 	

	
	LFGSort_Inst7['2[xXхХ]+2'] = '2x2'; -- 
	LFGSort_Inst7['2[cс]%s'] = '2x2'; -- 
	LFGSort_Inst7['2 ?на ?2'] = '2x2';
	LFGSort_Inst7['2 ?v ?2'] = '2x2';
	
	LFGSort_Inst7['3[xXхХ]+3'] = '3x3'; --
	LFGSort_Inst7['3[cс]%s'] = '3x3'; -- 
	LFGSort_Inst7['3 ?на ?3'] = '5x5';
	LFGSort_Inst7['3 ?v ?3'] = '3x3';
	
	LFGSort_Inst7['5[xXхХ]+5'] = '5x5'; --
	LFGSort_Inst7['5[cс]%s'] = '5x5'; -- 	
	LFGSort_Inst7['5 ?на ?5'] = '5x5';
	LFGSort_Inst7['5 ?v ?5'] = '5x5';
	
L['LFGSort_Inst_ect'] = LFGSort_Inst_ect;
L['LFGSort_Inst1'] = LFGSort_Inst1
L['LFGSort_Inst2'] = LFGSort_Inst2
L['LFGSort_Inst3'] = LFGSort_Inst3

L['LFGSort_Inst6'] = LFGSort_Inst6
L['LFGSort_Inst5'] = LFGSort_Inst5
L['LFGSort_Inst4'] = LFGSort_Inst4

L['LFGSort_Inst7'] = LFGSort_Inst7
end
