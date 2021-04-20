local info = ChatTypeInfo["SYSTEM"];
local SName = GetCVar( "realmName" );
local PName = UnitName("player");
local version = "LFGSorter 1.0.4";
local clear_saves = false;
local AceGUI = LibStub("AceGUI-3.0");
local addon = LibStub("AceAddon-3.0"):NewAddon("LFGSorter", "AceConsole-3.0");
--local AceDB = LibStub("AceDB-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("LFGSorter");

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
			print(L["LFG sorter loading default"]);
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

		for index = 1, NUM_CHAT_WINDOWS do
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
		for i,j in pairs(LFGSort_Inst_ect) do
			if string.find(msg, i) then
				--LFGSort_Debug_Message('filtering msg: '..instID);
				instID = j;

				break;
			end
		end
		if instID == '' then
			for k,v in pairs(LFGSort_Inst) do
				if string.find(msg, k) then
					--LFGSort_Debug_Message('filtering msg: '..instID);
					instID = v;

					break;
				end
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

function SettingsTable()
	-- inst abbr + hide + sound + color
	LFG_Settings_Table = {};
	LFG_Settings_Table[1] = {name = L['Raids & other'], data = 
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
	
	LFG_Settings_Table[2] = {name = L['5 ppl 1'], data = {
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
	
	LFG_Settings_Table[3] = {name = L['5 ppl 2'], data = {
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

	LFGSort_Inst_ect = L['LFGSort_Inst_ect'];
	
	LFGSort_Inst = L['LFGSort_Inst'];
	
end

function AddMessage(frame, message, ...)
	r,g,b,MID, sticky = ...;
	
	instID = '';
	if MID == info.id then
		return hooks[frame](frame, message, ...);
	end
	
	--LFGSort_Debug_Message('MID '..MID);
	for i,j in pairs(LFGSort_Inst_ect) do
		if string.find(message, i) then
			instID = j;
			--LFGSort_Debug_Message('found: '..L[j]..' template '..i);
			break;
		end
	end
	--LFGSort_Debug_Message('ok');
	if instID == '' then
		--LFGSort_Debug_Message('looking more');
		for k,v in pairs(LFGSort_Inst) do
			if string.find(message, k) then
				instID = v;
				--LFGSort_Debug_Message('found: '..L[v]..' template '..k);
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
		
		--message = string.gsub(message, '(.+)([(а-я|А-Я|Ёё|0-9|\.|\w)]\]) ([(\w|а-я|А-Я|Ёё|0-9)])(.+)', '%1%2\['..color..L[instID]..bell..'|r\]%3%4');
		-- ограничить число замен - последний аргумент - 1;
		
		--LFGSort_Debug_Message(string.gsub(message,'(%b[])%s*(%b[])(:.+)','2 - %1\['..color..L[instID]..bell..'\]%2%3'));
		--LFGSort_Debug_Message('best test '..string.gsub(message,'(.+)([а-я|А-Я|Ёё|0-9|%.|%w]%])%s*(%[[%w|а-я|А-Я|Ёё|0-9])(.+)','45 - %1%2\['..color..L[instID]..bell..'\]%3%4'));
		--LFGSort_Debug_Message('best test '..string.gsub(message,'(.+)([а-я|А-Я|Ёё|0-9|%.|%w]%])%s*(%[[%w|а-я|А-Я|Ёё|0-9])(.+)'))ж
		--LFGSort_Debug_Message(string.gsub(message,'(%b[]).-(%b[])(:.+)','2 - %1\['..color..L[instID]..bell..'\]%2%3'));
		--LFGSort_Debug_Message(string.gsub(message,'(%b[])(%b[])(:.+)','3 - %1\['..color..L[instID]..bell..'\]%2%3'));
		--LFGSort_Debug_Message(string.gsub('[4. LookingForGroup] [Ssol]:wanna go ZG', '(%b[]).*(%b[])(:.+)','%1\['..color..L[instID]..bell..'\]%2%3'))
		--LFGSort_Debug_Message(string.gsub('[4. LookingForGroup]<DND>[Ssol]:wanna go ZG', '(%b[]).*(%b[])(:.+)','%1\['..color..L[instID]..bell..'\]%2%3'))
		--LFGSort_Debug_Message(L[instID]..' - '..instID);
		--LFGSort_Debug_Message(''..color..L[instID]..bell);
		--LFGSort_Debug_Message('2nd '..string.gsub(message,'(%b[]).*(%b[])(:.+)','%1\['..color..L[instID]..bell..'\]%2%3'));
		--LFGSort_Debug_Message('4nd '..string.gsub(message,'(.*)',''..color..L[instID]..bell..'\]%1'));
		--LFGSort_Debug_Message('3rd '..string.gsub(message,'(\b[])\s*(\b[])(:.+)','%1\['..color..L[instID]..bell..'\]%2%3'));
		--print(message);
		--LFGSort_Debug_Message(string.gsub(message,'(.+)([а-я|А-Я|Ёё|0-9|\.|\w]|h)(|c.*|r)(.*)','%1%2'..color..L[instID]..bell..'|r\]\[%3%4'));

		--full_str = '';
		--new_str = "";
		--for c in message:gmatch"." do
		--	full_str = full_str..'['..tostring(c:byte(1))..'] ';
		--	new_str = new_str..' '..string.char(c:byte(1));
		--end
		--print(new_str);
		
		message = string.gsub(message,'(.+)([а-я|А-Я|Ёё|0-9|\.|\w]|h)(|c.*|r)(.*)','%1%2'..color..L[instID]..bell..'|r\]\[%3%4', 1);
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
		--icon = "Interface\\Icons\\inv_misc_horn_03",
		icon = "Interface\\Icons\\Spell_arcane_portalthunderbluff",
		--icon = "Interface\\AddOns\\LFGSort\\res\\LFGSorter.png",
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
	frame:SetStatusText(L["Настройки LFG sorter"]);
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
		--DEFAULT_CHAT_FRAME:AddMessage(j.name);
		group:SetLayout("List")
		group:SetRelativeWidth(0.33);
		for m,n in pairs(j.data) do
			
			elem = AceGUI:Create("SimpleGroup"); 
			elem:SetLayout("Flow")
			--k = n;
			v = CustomTable[n];
		
			local desc = AceGUI:Create("Label")
			desc:SetText(''..v[3]..L[n]..'|r');
			desc:SetRelativeWidth(0.20);
			elem:AddChild(desc)
			
			local hideCheck = AceGUI:Create("CheckBox")
			hideCheck:SetLabel(L["скрыть"]);
			hideCheck:SetValue(CustomTable[n][1] == 1);
			hideCheck:SetCallback("OnValueChanged", function(value)
				SetHiding(n);
			end);
			hideCheck:SetRelativeWidth(0.25);
			elem:AddChild(hideCheck)
			
			local soundCheck = AceGUI:Create("CheckBox");
			soundCheck:SetLabel(L["звук"]);
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
		LFGSort_Debug_Message(CustomTable[inst][3]..L[inst].."|r - "..L["Звук включен"]);
		CustomTable[inst][2] = 1;
	else
		LFGSort_Debug_Message(CustomTable[inst][3]..L[inst].."|r - "..L["Звук выключен"]);
		CustomTable[inst][2] = 0;
	end
end

function SetHiding(inst, ...)
	
	if CustomTable[inst][1] == 0 then
		CustomTable[inst][1] = 1;
		LFGSort_Debug_Message(CustomTable[inst][3]..L[inst].."|r - "..L["будут показаны в чате"]);
	else
		CustomTable[inst][1] = 0;
		LFGSort_Debug_Message(CustomTable[inst][3]..L[inst].."|r - "..L["будут скрыты из чата"]);
	end
end

--local IconMiniMap = CreateMMB();
--local SettingsFrame = CreateSettingsFrame();



