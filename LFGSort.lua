local info = ChatTypeInfo["SYSTEM"];
local SName = GetCVar( "realmName" );
local PName = UnitName("player");
local version = "LFGSorter 1.0.3";
local clear_saves = false;
local AceGUI = LibStub("AceGUI-3.0");
local addon = LibStub("AceAddon-3.0"):NewAddon("LFGSorter", "AceConsole-3.0");
--local AceDB = LibStub("AceDB-3.0")
--local L = LibStub("AceLocale-3.0"):GetLocale("NovaWorldBuffs");

local bLogOn = 0;
local hooks = {}
local lastCall = 0;
local icon = LibStub("LibDBIcon-1.0");
local IMM_LDB = nil;
local l_debug = false;

--LFGSortFirstUse = 0;
LFGSortEnabled = 0;
LFGSort_Inst = {};
LFGSort_Inst_ect = {};

local LFG_Settings_Table = {};

function LFGSort_OnEvent(self, event, ...)
	
	if (event == "VARIABLES_LOADED") then
	
		if (LFGSortFirstUse ~= version) then
			print("LFG sorter loading default");
			LFGNum = 4;
		    LFGSortFirstUse = version;
			
			
			--LFG_sorter_opt = LibStub("AceDB-3.0"):New("LFG_sorter_opt", { profile = { minimap = { hide = false, }, }, })
			mmap_pos = {
				["minimapPos"] = 206.3376812873,
				["hide"] = false,
			};
			CustomTable = NewCustomTable();
			
			LFG_sorter_settings = LibStub("AceDB-3.0"):New("LFG_sorter", {
				profile = {
					minimap = {
						["hide"] = false,
						["minimapPos"] = 206.3376812873,
					},
				},
			})	
		end
					
		messageReceived = 0;
		SlashCmdList["LFGSortCOMMAND"] = LFGSortSlash;
		SLASH_LFGSortCOMMAND1 = "/lfgsorter"; 
		GetInstTable();
		SettingsTable();
		
		ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", filterAddonChatMsg);

		for index = 2, NUM_CHAT_WINDOWS do
			local chatFrame = _G["ChatFrame" .. index]
			LFGSort_Message(chatFrame)
			if chatFrame ~= _G.COMBATLOG then
				hooks[chatFrame] = chatFrame.AddMessage
				chatFrame.AddMessage = AddMessage
			end
		end
		
		CreateMMB();
	end
end

function filterAddonChatMsg(self, event, msg, author, ...)
	if (event == "CHAT_MSG_CHANNEL") then
		instID = '';
		for k,v in pairs(LFGSort_Inst) do
			if string.find(msg, k) then
				LFGSort_Debug_Message('filtering msg: '..instID);
				instID = v;

				break;
			end
		end
		
		if instID == '' then
			
			return false, msg, author, ...;
		else
			--LFGSort_Debug_Message('filtering msg: '..instID);
			v = CustomTable[instID];
		
			if v[1] == 1 then
				LFGSort_Debug_Message('filtering msg: '..instID..' yes');
				return true;
			else
				--LFGSort_Debug_Message('filtering msg: '..instID..' no filtr');
				return false, msg, author, ...;
			end
		end
    end
	
	
end

function NewCustomTable_test()
	-- inst abbr + hide + sound + color
	newTable = {};
	newTable[1] = {'АФК', 0, 0, '|cb3b1aa60'};
	newTable[2] = {'БАФФ', 0, 0, '|cffff6060'};
	newTable[3] = {'МАО', 0, 0, '|c218f2cf1'};
	newTable[4] = {'МАРА', 0, 0, '|c6d65c9f1'};
	newTable[5] = {'КТК', 0, 0, '|cbc20e3f1'};
	newTable[6] = {'ЛИ', 0, 0, '|ce320cff1'};
	newTable[7] = {'ГЧГ', 0, 0, '|c782d17f1'};
	newTable[8] = {'ЗФ', 0, 0, '|c457a0ff1'};
	newTable[9] = {'НП', 0, 0, '|c02754bf1'};
	newTable[10] = {'УЛЬДА', 0, 0, '|c02754bf1'};
	newTable[11] = {'КИ', 0, 0, '|cbde861f1'};
	newTable[12] = {'ПС', 0, 0, '|c61e8c0f1'};
	newTable[13] = {'ХРАМ', 0, 0, '|c61e8d8f1'};
	newTable[14] = {'МК', 0, 0, '|ce861b2f1'};
	newTable[15] = {'ТЮ', 0, 0, '|cbd61e8f1'};
	newTable[16] = {'ГНОМ', 0, 0, '|c617fe8f1'};
	newTable[17] = {'ДМ', 0, 0, '|c617fe8f1'};
	newTable[18] = {'СТРАТ', 0, 0, '|ca913cffb'};
	newTable[19] = {'ШОЛО', 0, 0, '|c1396cffb'};
	newTable[20] = {'ОН', 0, 0, '|c780a11fb'};
	newTable[21] = {'ЛБРС', 0, 0, '|c1aa4ad0d'};
	newTable[22] = {'УБРС', 0, 1, '|cffDA70D6'};
	newTable[23] = {'ЗГ', 0, 0, '|c8eb81cf7'};
	newTable[24] = {'АК20', 0, 0, '|ccf5813fb'};
	newTable[25] = {'АК40', 0, 0, '|cffFF6EB4'};
	newTable[26] = {'БВЛ', 0, 0, '|cffFF4500'};
	newTable[27] = {'НАКС', 0, 0, '|cffFFC125'};
	newTable[28] = {'ОНЯ', 0, 0, '|cffFFC125'};
	return newTable;

end

function SettingsTable()
	-- inst abbr + hide + sound + color
	LFG_Settings_Table = {};
	LFG_Settings_Table[1] = {name = 'Raids & other', data = 
	{'АФК', 
	'БАФФ',
	'ЗГ',
	'АК20',
	'ОНЯ',
	'ОН',
	'АК40',
	'БВЛ',
	'НАКС'}
	};
	
	LFG_Settings_Table[2] = {name = '5 ppl 1', data = {
	'ОП',
	'ПС',
	'МК',
	'КТК',
	'НП',	
	'ТЮ',
	'ГНОМ',	
	'ЛИ',	
	'МАО',
	'КИ'
	}}
	
	LFG_Settings_Table[3] = {name = '5 ppl 2', data = {
	'МАРА',
	'ЗФ',
	'УЛЬДА',
	'ХРАМ',
	'ГЧГ',
	'ДМ',
	'СТРАТ',
	'ШОЛО',
	'ЛБРС',
	'УБРС'
	}}
	
	

end

function NewCustomTable()
	-- inst abbr + hide + sound + color
	newTable = {};
	newTable['АФК'] = {0, 0, '|cb3b1aa60'};
	newTable['БАФФ'] = {0, 0, '|cffff6060'};
	
	newTable['МАО'] = {0, 0, '|c218f2cf1'};
	newTable['МАРА'] = {0, 0, '|c6d65c9f1'};
	newTable['КТК'] = {0, 0, '|cbc20e3f1'};
	newTable['ЛИ'] = {0, 0, '|ce320cff1'};
	newTable['ГЧГ'] = {0, 0, '|c782d17f1'};
	newTable['ЗФ'] = {0, 0, '|c457a0ff1'};
	newTable['НП'] = {0, 0, '|c02754bf1'};
	newTable['УЛЬДА'] = {0, 0, '|c02754bf1'};
	newTable['КИ'] = {0, 0, '|cbde861f1'};
	newTable['ПС'] = {0, 0, '|c61e8c0f1'};
	newTable['ХРАМ'] = {0, 0, '|c61e8d8f1'};
	newTable['МК'] = {0, 0, '|ce861b2f1'};
	newTable['ТЮ'] = {0, 0, '|cbd61e8f1'};
	newTable['ГНОМ'] = {0, 0, '|c617fe8f1'};
	newTable['ДМ'] = {0, 0, '|c617fe8f1'};
	newTable['СТРАТ'] = {0, 0, '|ca913cffb'};
	newTable['ШОЛО'] = {0, 0, '|c1396cffb'};
	newTable['ОП'] = {0, 0, '|c780a11fb'};
	newTable['ЛБРС'] = {0, 0, '|c1aa4ad0d'};
	newTable['УБРС'] = {0, 0, '|cffDA70D6'};
	
	newTable['ЗГ'] = {0, 0, '|c8eb81cf7'};
	newTable['АК20'] = {0, 0, '|ccf5813fb'};
	newTable['ОНЯ'] = {0, 0, '|cffFFC125'};
	newTable['ОН'] = {0, 0, '|c780a11fb'};
	newTable['АК40'] = {0, 0, '|cffFF6EB4'};
	newTable['БВЛ'] = {0, 0, '|cffFF4500'};
	newTable['НАКС'] = {0, 0, '|cffFFC125'};
		
	return newTable;

end

function GetInstTable()
	
	-- 0. AFK / boost /
	--LFGSort_Inst['[^|%s][Аа][Фф][кК][%s|$]'] = 'АФК';
	LFGSort_Inst_ect['АФК'] = 'АФК';
	LFGSort_Inst_ect['AFK'] = 'АФК';
	LFGSort_Inst_ect['афк'] = 'АФК';
	LFGSort_Inst_ect['БУСТ'] = 'АФК';
	LFGSort_Inst_ect['Буст'] = 'АФК';
	LFGSort_Inst_ect['буст'] = 'АФК';
	LFGSort_Inst_ect['boost'] = 'АФК';
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
	LFGSort_Inst['[гГ]номре'] = 'ГНОМ';
	-- 17. Страт
	LFGSort_Inst['[сС]трат'] = 'СТРАТ';
	LFGSort_Inst['СТРАТ'] = 'СТРАТ';
	-- 18. Шоло
	LFGSort_Inst['ШОЛО'] = 'ШОЛО';
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
	LFGSort_Inst['AQ%s*20^г'] = 'АК20';
	LFGSort_Inst['[аА]к.*20^г'] = 'АК20';
	LFGSort_Inst['[кК]ираж%s*20^г'] = 'АК40';
	-- 24. АК40
	LFGSort_Inst['АК.*40^г'] = 'АК40';
	LFGSort_Inst['[Аа]к%s*40^г'] = 'АК40';
	LFGSort_Inst['[кК]ираж%s*40^г'] = 'АК40';
	-- 25. ОП
	LFGSort_Inst['МС'] = 'ОН';
	LFGSort_Inst['MC'] = 'ОН';
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
	
	--table.sort(LFGSort_Inst, function(a,b) return a[4] > b[4] or a[4] == b[4] and a[5] > b[5] end)
	
end

function AddMessage(frame, message, ...)
	
	instID = '';
	
	for i,j in pairs(LFGSort_Inst_ect) do
		if string.find(message, i) then
			instID = j;
			LFGSort_Debug_Message('found: '..j..' template '..i);
			break;
		end
	end
	
	if instID == '' then
		LFGSort_Debug_Message('looking more');
		for k,v in pairs(LFGSort_Inst) do
			if string.find(message, k) then
				instID = v;
				LFGSort_Debug_Message('found: '..v..' template '..k);
				break;
			end
		end
	end
	
	if instID ~= '' then
		data = CustomTable[instID]
		hide = data[1]
		sound = data[2]
		color = data[3]
		bell = '';
		if sound == 1 then
			currTime = time();
			diff = currTime - lastCall;
			bell = '|cffff0000♫';

			if diff > 5 then
				PlaySound(678, "Master");
				--PlaySound(808, "Master")
				lastCall = currTime;
			end
		end 
		
		message = string.gsub(message, '(.+)([(а-я|А-Я|Ёё|0-9|\.)]\]) ([(а-я|А-Я|Ёё|0-9)])(.+)', '%1%2\['..color..instID..bell..'|r\]%3%4');
			
	end
   	
    return hooks[frame](frame, message, ...);
end

function LFGSortSlash(msg)
	local tag = string.lower(msg);
	local firsti, lasti, command, comand_arg = string.find (tag, "(%w+) (.*)");
	-- if there weren't 2, then command will be nil - check for one arg    
    if (command == nil) then
        firsti, lasti, command = string.find(tag, "(%w+)");
	else
		comand_arg = string.upper(comand_arg)
    end    

-- respond to commands
	if (command == nil) then
		LFGSort_Help(); 
	elseif (command == 'sound') then
		currentSettings = CustomTable[comand_arg]
		if currentSettings ~= nil then
			SetSound(comand_arg);
		else
			DEFAULT_CHAT_FRAME:AddMessage('Не найдена настройка '..comand_arg);
		end
	elseif (command == 'hide') then
		currentSettings = CustomTable[comand_arg]
		if currentSettings ~= nil then
			SetHiding(comand_arg);
		else
			DEFAULT_CHAT_FRAME:AddMessage('Не найдена настройка '..comand_arg);
		end		
		
	elseif (command == 'settings') then
			for k, v in pairs(CustomTable) do
				hide = v[1]
				sound = v[2]
				color = v[3]
				DEFAULT_CHAT_FRAME:AddMessage('inst : '..color..k..'|r sound: '..sound..' hide '..hide);
			end
	elseif (command == 'test') then
		for k,v in pairs(LFGSort_Inst) do
			DEFAULT_CHAT_FRAME:AddMessage('проверка идентификации по шаблону: '..k);
			if string.find(''..comand_arg, k) then
				color = CustomTable[v][3]
				DEFAULT_CHAT_FRAME:AddMessage('найдено : '..color..v)
				
			end
		end
	elseif (command == 'testfirst') then
		for k,v in pairs(LFGSort_Inst) do
			DEFAULT_CHAT_FRAME:AddMessage('проверка идентификации по шаблону: '..k);
			if string.find(''..comand_arg, k) then
				color = CustomTable[v][3]
				DEFAULT_CHAT_FRAME:AddMessage('найдено : '..color..v)
				break;
			end
		end
	elseif (command == 'reset') then
		CustomTable = NewCustomTable();
		DEFAULT_CHAT_FRAME:AddMessage('Настройки сброшены: ');
	elseif (command == 'debug') then
		if l_debug == false then
			l_debug = true;
			DEFAULT_CHAT_FRAME:AddMessage('Отладка включена');
		else
			l_debug = false;
			DEFAULT_CHAT_FRAME:AddMessage('Отладка выключена');
		end
	else
		LFGSort_Help(); 
	end
end

function LFGSort_Message(msg)
	DEFAULT_CHAT_FRAME:AddMessage(msg, info.r, info.g, info.b, info.id);
end

function LFGSort_Debug_Message(msg)
	if l_debug then
		DEFAULT_CHAT_FRAME:AddMessage(msg, info.r, info.g, info.b, info.id);
	end
end

function LFGSort_Help()
	LFGSort_Message("Use /LFGSort test <string> - для проверки поиска"); 
	LFGSort_Message("    /LFGSort settings - для показа текущих настроек");
	LFGSort_Message("    /LFGSort sound <аббр. подземелья> - для включения выключения звука при появлении сообщения");
	LFGSort_Message("    /LFGSort hide <аббр. подземелья> - для исключения таких строк из чата");
	LFGSort_Message("    /LFGSort reset - для сброса настроек");
end

function CreateMMB()
	IMM_LDB = LibStub("LibDataBroker-1.1"):NewDataObject("LFGsort", {
		type = "data source",
		text = "LFG sorter",
		icon = "Interface\\Icons\\inv_misc_horn_03",
		OnClick = function() 
			LFGSort_Debug_Message(tostring(mmap_pos));
			CreateSettingsFrame();
			end,
		OnTooltipShow = function(tt)
                tt:AddLine("LFG sorter")
                tt:AddLine("|cffffff00Click|r to open the settings window.")
            end,
	})	
    icon:Register("LFGsort", IMM_LDB, LFG_sorter_settings.profile.minimap);

end

function CreateSettingsFrame()
	
	local frame = AceGUI:Create("Frame");
	frame:SetTitle("LFG sorter");
	frame:SetStatusText("Настройки LFG sorter");
	frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
	frame:SetLayout("Fill");

	scrollcontainer = AceGUI:Create("SimpleGroup"); -- "InlineGroup" is also good
	scrollcontainer:SetFullWidth(true);
	scrollcontainer:SetFullHeight(true); -- probably?
	scrollcontainer:SetLayout("Fill") ;-- important!

	frame:AddChild(scrollcontainer);
	
	scroll = AceGUI:Create("ScrollFrame")
	scroll:SetLayout("Flow") -- probably?
	scrollcontainer:AddChild(scroll)
	
	for i, j in pairs(LFG_Settings_Table) do
	
		group = AceGUI:Create("InlineGroup"); --InlineGroup
		--group.SetTitle(j.name);
		DEFAULT_CHAT_FRAME:AddMessage(j.name);
		group:SetLayout("List")
		group:SetRelativeWidth(0.33);
		for m,n in pairs(j.data) do
			
			elem = AceGUI:Create("SimpleGroup"); 
			elem:SetLayout("Flow")
			--k = n;
			v = CustomTable[n];
		
			local desc = AceGUI:Create("Label")
			desc:SetText(''..v[3]..n..'|r');
			desc:SetRelativeWidth(0.20);
			elem:AddChild(desc)
			
			local hideCheck = AceGUI:Create("CheckBox")
			hideCheck:SetLabel("скрыть");
			hideCheck:SetValue(CustomTable[n][1] == 1);
			hideCheck:SetCallback("OnValueChanged", function(value)
				SetHiding(n);
			end);
			hideCheck:SetRelativeWidth(0.25);
			elem:AddChild(hideCheck)
			
			local soundCheck = AceGUI:Create("CheckBox");
			soundCheck:SetLabel("звук");
			soundCheck:SetValue(CustomTable[n][2] == 1);
			soundCheck:SetCallback("OnValueChanged", function(value)
				SetSound(n);
			end);
			soundCheck:SetRelativeWidth(0.25);
			elem:AddChild(soundCheck);	
		
			group:AddChild(elem);
			
		end
		
		scroll:AddChild(group);
	end
end

function SetSound(inst, ...)
		
	if CustomTable[inst][2] == 0 then
		LFGSort_Debug_Message(CustomTable[inst][3]..inst.."|r - Звук включен");
		CustomTable[inst][2] = 1;
	else
		LFGSort_Debug_Message(CustomTable[inst][3]..inst.."|r - Звук выключен");
		CustomTable[inst][2] = 0;
	end
end

function SetHiding(inst, ...)
	
	if CustomTable[inst][1] == 0 then
		CustomTable[inst][1] = 1;
		LFGSort_Debug_Message(CustomTable[inst][3]..inst.."|r - будут показаны в чате");
	else
		CustomTable[inst][1] = 0;
		LFGSort_Debug_Message(CustomTable[inst][3]..inst.."|r - будут скрыты из чата");
	end
end

--local IconMiniMap = CreateMMB();
--local SettingsFrame = CreateSettingsFrame();



