local info = ChatTypeInfo["SYSTEM"];
local SName = GetCVar( "realmName" );
local PName = UnitName("player");
local version = "LFGSorter 2.0.9.4";
local classic = false;
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
local activeChannels = {};
local soundType
local lfgsChatFrame
local buttonsFrame = nil
local currentFrameTab = 0

--LFGSortFirstUse = 0;
LFGSortEnabled = 0;

LFGSort_Insts = {};
LFGSort_Inst_ect = {};

bc_release = { year  = 2021,
             month = 06,
             day   = 02,
             hour  = 01,
             min   = 0,
             sec   = 0
           }

--if GetServerTime() < time(bc_release) then
--	version = 'LFGSorter 2.0.4'
--	classic = true
--end

local LFG_Settings_Table = {};
local LFG_Settings_Pages = {};

function LFGSort_OnEvent(self, event, ...)
	
	if (event == "VARIABLES_LOADED") then
	
		if (LFGSortFirstUse ~= version) then
			LFGSort_Message(L["LFG sorter loading default"]);
			LFGNum = 4;
		    LFGSortFirstUse = version;
			
			LFG_channels = {
			true,
			true,
			true,
			true,
			false,
			false
			}
			
			--LFG_sorter_opt = LibStub("AceDB-3.0"):New("LFG_sorter_opt", { profile = { minimap = { hide = false, }, }, })
			if mmap_pos == nil then
				mmap_pos = {
					["minimapPos"] = 206.3376812873,
					["hide"] = false,
				};
			end
			
			if UserTable == nil then
			
				UserTable = {}
				num_user_fields = 0
				
			end
			
			if num_user_fields == nil then
				num_user_fields = 0
			end
		
			if CustomTable == nil then
				CustomTable = NewCustomTable();
			else
			--CustomTable = NewCustomTable();
				UpdateCustomTable(CustomTable);
			end
			
			LFG_sorter_settings = LibStub("AceDB-3.0"):New("LFG_sorter", {
				profile = {
					minimap = {
						["hide"] = false,
						["minimapPos"] = 206.3376812873,
					},
				},
			})	
		end
		
		if LFG_channels == nil then
			LFG_channels = {
			true,
			true,
			true,
			true,
			false,
			false
			}
		end
		
		if DingSound == nil then
			DingSound = 678;
		end
		
		for i,j in pairs(LFG_channels) do
			if j == true then
				activeChannels[ChatTypeInfo["CHANNEL"..i].id] = true;
				LFGSort_Debug_Message('searching in: '..i..' channel, id: '..ChatTypeInfo["CHANNEL"..i].id);
			end
		end
		
		if SavedTables == nil then
			SavedTables = {}
		end
		
		if CurrentTableName == nil then
			CurrentTableName = ''
		end
		
		if UserTable == nil then
		
			UserTable = {}
			num_user_fields = 0
			
		end
		
		if num_user_fields == nil then
			num_user_fields = 0
		end
		
		for index = 1, FCF_GetNumActiveChatFrames() + 1 do -- NUM_CHAT_WINDOWS
			local chatFrame = _G["ChatFrame" .. index]
			
			local f_name = GetChatWindowInfo(index)
			--LFGSort_Message('0'..f_name)
			if f_name == "LFGS" then
				lfgsChatFrame = chatFrame
				--LFGSort_Message('2 found lfgs chat frame #'..tostring(index)..' shown '..tostring(chatFrame.Show))
				
			end
		end
		
		messageReceived = 0;
		SlashCmdList["LFGSortCOMMAND"] = LFGSortSlash;
		SLASH_LFGSortCOMMAND1 = "/lfgsorter"; 
		GetInstTable();
		SettingsTable();
		
		ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", filterAddonChatMsg);

		-- todo ?????????????????????? ???????????? ???? ??????????????, ?? ?????????????? ???????? ?????????????????????????? ?????????????
		for index = 1, NUM_CHAT_WINDOWS  do -- NUM_CHAT_WINDOWS
			local chatFrame = _G["ChatFrame" .. index]
			--LFGSort_Message(chatFrame)
			local f_name = GetChatWindowInfo(index)
			--LFGSort_Message('1'..f_name)
			if chatFrame ~= _G.COMBATLOG then
				hooks[chatFrame] = chatFrame.AddMessage
				chatFrame.AddMessage = AddMessage
			end
		end
			
		LFGSetSound(DingSound)

		
		CreateMMB();
		
	elseif (event == "PLAYER_ENTERING_WORLD") then
	
		--for index = 1, FCF_GetNumActiveChatFrames()  do -- NUM_CHAT_WINDOWS
		--	local chatFrame = _G["ChatFrame" .. index]
		--	--LFGSort_Message(chatFrame)
		--	local f_name = GetChatWindowInfo(index)
		--	if f_name == "LFGS" then
		--		lfgsChatFrame = chatFrame
		--		--LFGSort_Message('2 found lfgs chat frame #'..tostring(index)..' shown '..tostring(chatFrame.Show))
		--		
		--	end
		--end
		
	end

end

function filterAddonChatMsg(chat_frame, event, msg, author, ...)
	if (event == "CHAT_MSG_CHANNEL") then
		
		lfg_instID = IdentifyInst(' '..msg, false)
		if lfg_instID == '????????' or lfg_instID == '??????' or lfg_instID == '??????' or lfg_instID == '????' then
			--LFGSort_Message('found : '..lfg_instID..' ')
		end
		if chat_frame == lfgsChatFrame then
			--LFGSort_Message('found: '..lfg_instID..' in lfgs tab');
			if lfg_instID == '' then
				
				return true;
			else
				v = CustomTable[lfg_instID];
			
				if v~= nil and v[2] == 1 then
					--LFGSort_Message('showing msg in lfgs tab');
					return false, msg, author, ...;
				else
					--LFGSort_Message('ignoring because data: '..tostring(v)..' show: '..tostring(v[2]));
					return true;
				end
				
			end
		
		else
			if lfg_instID == '' then
				
				return false, msg, author, ...;
			else
				--LFGSort_Message('filtering msg: '..lfg_instID);
				v = CustomTable[lfg_instID];
			
				if v~= nil and v[1] == 1 then
					if lfg_instID == '????????' or lfg_instID == '??????' or lfg_instID == '??????' or lfg_instID == '????' then
						--LFGSort_Message('filtering msg: '..lfg_instID..' yes'..msg);
					end
					return true;
				else
					if lfg_instID == '????????' or lfg_instID == '??????' or lfg_instID == '??????' or lfg_instID == '????' then
						--LFGSort_Message('filtering msg: '..lfg_instID..' no filtr'..msg);
					end
					return false, msg, author, ...;
				end
				
			end
		end
    end
	
	
end

function SettingsTable()
	-- inst abbr + hide + sound + color

	if classic == false then
		LFG_Settings_Pages = {
		{4,5,{value = 1, text = "BC insts", disabled = false} },
		{6,8,{value = 2, text = "BC heroics & raids", disabled = false} },
		{9,9,{value = 3, text = "PvP", disabled = false} },
		{10,10,{value = 4, text = "User search", disabled = false} },
		{1,3,{value = 5, text = "Classic", disabled = false} }
		};
	else
		LFG_Settings_Pages = {
		{1,3,{value = 1, text = "Classic", disabled = false} },
		{4,5,{value = 2, text = "BC insts", disabled = false} },
		{6,8,{value = 3, text = "BC heroics & raids", disabled = false} }
		};
	end
	
	LFG_Settings_Table = {};
	LFG_Settings_Table[1] = {name = L['Raids & other'], data = {
	'??????', 
	'????????',
	'????',
	'????20',
	'??????',
	'????',
	'????40',
	'??????',
	'????????'
	},
	total_check = 3};
	
	LFG_Settings_Table[2] = {name = L['5 ppl 1'], data = {
	'????',
	'????',
	'????',
	'??????',
	'????',	
	'????',
	'????????',	
	'????',	
	'??????',
	'????'
	},
	total_check = 1}
	
	LFG_Settings_Table[3] = {name = L['5 ppl 2'], data = {
	'????????',
	'????',
	'??????????',
	'????????',
	'??????',
	'????',
	'????????',
	'??????????',
	'????????',
	'????????'
	},
	total_check = 2}

	LFG_Settings_Table[4] = {name = L['5 ppl bk'], data = {
	'????????',
	'????',
	'??????',
	'????????',
	'????',
	'????????',
	'????1',
	'????'
	},
	total_check = 6}	
	
	LFG_Settings_Table[5] = {name = L['5 ppl bk2'], data = {
	'????',
	'????',
	'????',
	'??????',
	'??????',
	'????',
	'????????',
	'????'
	}
	,
	total_check = 0}
	
	LFG_Settings_Table[6] = {name = L['hero bk'], data = {
	'??-????????',
	'??-????',
	'??-??????',
	'??-????????',
	'??-????',
	'??-????????',
	'??-????1',
	'??-????'
	},
	total_check = 0}	
	
	LFG_Settings_Table[7] = {name = L['hero bk2'], data = {
	'??-????',
	'??-????',
	'??-????',
	'??-??????',
	'??-??????',
	'??-????',
	'??-????????',
	'??-????',
	'??????'
	},
	total_check = 0}
	
	LFG_Settings_Table[8] = {name = L['raid bk'], data = {
	'????????',
	'??????????',
	'????????',
	'????',
	'??????',
	'????',
	'????????',
	'????',
	'??????????'
	},
	total_check = 4}

	LFG_Settings_Table[9] = {name = L['arena'], data = {
	'2x2',
	'3x3',
	'5x5'
	},
	total_check = 0}
	
	i = 1
	self_data = {}
	for k,v in pairs(UserTable)  do

		self_data[i] = k
		i = i + 1
	end
	LFG_Settings_Table[10] = {name = L['self'], data = self_data, total_check = 0}
	
end

function UpdateCustomTable(NewTable)

	CustomTable = NewCustomTable();
	
	for k, v in pairs(NewTable) do
		CustomTable[k][1] = v[1]
		CustomTable[k][2] = v[2]
	end
	
end

function NewCustomTable()

	-- http://www.ac-web.org/forums/showthread.php?50732-Tutorial-How-to-have-colors-on-your-menu-(LUA)
	-- inst abbr + hide + sound + color
	if classic == true then
		return NewCustomTableClassic();
	end
	
	newTable = {};
	newTable['??????'] = {0, 0, '|cFFA9A9A9'}; -- Darkgray"|cFFA9A9A9" ++
	newTable['????????'] = {0, 0, '|cFFDEB887'}; -- Burlywood"|cFFDEB887" 
	
	-- ???????????? ????
	newTable['Inst1'] = {1, 0, '|cFF483D8B'}; -- ?????????????? ?????? ?????? ????????
	newTable['????'] = {0, 0, '|cFF483D8B'};--darkslateblue"|cFF483D8B"//--cyan"|cFF00FFFF" ++ --CADETBLUE"|cFF5F9EA0"
	newTable['????'] = {0, 0, '|cFF483D8B'};--slateblue"|cFF6A5ACD"//-- PALEGREEN"|cFF98FB98" ++ --CORNFLOWERBLUE "|cFF6495ED" 
	newTable['????'] = {0, 0, '|cFF483D8B'};--slateblue"|cFF6A5ACD"//--PALEGREEN"|cFF98FB98" ++ --DODGERBLUE  "|cFF1E90FF"
	newTable['??????'] = {0, 0, '|cFF483D8B'};--mediumblue"|cFF0000CD"//-- mediumseagreen "|cFF3CB371" ++  --LIGHTBLUE"|cFFADD8E6"
	newTable['????'] = {0, 0, '|cFF483D8B'};--mediumpurple"|cFF9370DB"//-- darkolivegreen "|cFF556B2F ++ --LIGHTSEAGREEN  "|cFF20B2AA"
	newTable['????'] = {0, 0, '|cFF483D8B'};--mediumorchid"|cFFBA55D3"//--darkgreen"|cFF006400" ++ --MEDIUMSPRINGGREEN "|cFF00FA9A"
	newTable['????????'] = {0, 0, '|cFF483D8B'};--DODGERBLUE  "|cFF1E90FF"//--limegreen"|cFF32CD32" ++ --AQUAMARINE
	newTable['????'] = {0, 0, '|cFF483D8B'};----steelblue"|cFF4682B4"//-- darkkhaki"|cFFBDB76B" ++--LIGHTSKYBLUE"|cFF87CEFA"
	newTable['??????'] = {0, 0, '|cFF483D8B'};--lightblue"|cFFADD8E6"//-- coral"|cFFFF7F50" ++ --TEAL  "|cFF008080"
	-- ???????????? ????
	newTable['????'] = {0, 0, '|cFF6A5ACD'};--cyan"|cFF00FFFF"//-- darkorange"|cFFFF8C00" ++ --STEELBLUE"|cFF4682B4"	
	newTable['Inst2'] = {1, 0, '|cFF483D8B'}; -- ?????????????? ?????? ?????? ????????
	newTable['????????'] = {0, 0, '|cFF6A5ACD'};--DARKTURQUOISE"|cFF00CED1 //--tomato"|cFFFF6347" ++ --SLATEBLUE"|cFF6A5ACD"
	newTable['????'] = {0, 0, '|cFF6A5ACD'};--PALEGREEN"|cFF98FB98" //--chocolate"|cFFD2691E" ++ --DARKSLATEBLUE  "|cFF483D8B"
	newTable['??????????'] = {0, 0, '|cFF6A5ACD'};--mediumseagreen "|cFF3CB371" //--sienna"|cFFA0522D" ++ --CORNFLOWERBLUE "|cFF6495ED"
	newTable['????????'] = {0, 0, '|cFF6A5ACD'};--darkolivegreen "|cFF556B2F //--mediumorchid"|cFFBA55D3" ++ --ROYALBLUE"|cFF4169E1"
	-- ???????????? ????????????
	newTable['??????'] = {0, 0, '|cFFBA55D3'};--limegreen"|cFF32CD32" //--mediumpurple"|cFF9370DB" ++--ROYALBLUE"|cFF4169E1"
	newTable['????????'] = {0, 0, '|cFFBA55D3'};--darkkhaki"|cFFBDB76B"//-- slateblue"|cFF6A5ACD" ++--MEDIUMBLUE  "|cFF0000CD"	
	newTable['??????????'] = {0, 0, '|cFFBA55D3'};-- coral"|cFFFF7F50"//--lightblue"|cFFADD8E6"++ --MEDIUMPURPLE"|cFF9370DB"
	newTable['????????'] = {0, 0, '|cFFBA55D3'};--darkorange"|cFFFF8C00"//--darkslateblue"|cFF483D8B" ++ mediumblue"|cFF0000CD"++ --DARKORCHID  "|cFF9932CC"!!!!
	newTable['????'] = {0, 0, '|cFFBA55D3'};--chocolate"|cFFD2691E" //--steelblue"|cFF4682B4" ++ --MEDIUMORCHID"|cFFBA55D3"	
	newTable['????????'] = {0, 0, '|cFFBA55D3'};--tomato"|cFFFF6347"//--mediumblue"|cFF0000CD"++ darkslateblue"|cFF483D8B" ++ --DARKMAGENTA "|cFF8B008B"!!!!
	-- ???????????? ??????
	newTable['Inst3'] = {1, 0, '|cFF0000CD'}; -- ?????????????? ??????????
	newTable['????'] = {0, 0, '|cFF0000CD'}; -- Yellowgreen/lawngreen YELLOWGREEN "|cFF9ACD32"
	newTable['????20'] = {0, 0, '|cFF0000CD'};--Mediumvioletred"|cFFC71585" ++  --LIGHTRED "|cFFFF6060"
	newTable['??????'] = {0, 0, '|cFF0000CD'}; -- Orangered"|cFFFF4500" ++
	newTable['????'] = {0, 0, '|cFF0000CD'}; -- Crimson  "|cFFDC143C"++
	newTable['????40'] = {0, 0, '|cFF0000CD'};-- purple "|cFF800080" / blueviolet  "|cFF8A2BE2" ++ --GOLDENROD"|cFFDAA520"  -- cFF800080
	newTable['??????'] = {0, 0, '|cFF0000CD'}; -- darkred  "|cFF8B0000"++
	newTable['????????'] = {0, 0, '|cFF0000CD'}; -- Goldenrod"|cFFDAA520"++
	
	-- tbc
	-- ???????????? ?????? --lightblue"|cFFADD8E6"
	newTable['Inst4'] = {1, 0, '|cFFADD8E6'}; -- ???? ????????--"
	newTable['????????'] = {0, 0, '|cFFADD8E6'}; -- ???????????????? ?????????????? ??????????????
	newTable['????'] = {0, 0, '|cFFADD8E6'}; -- ?????????? ??????????-
	newTable['??????'] = {0, 0, '|cFFADD8E6'}; -- ??????????????--
	newTable['????????'] = {0, 0, '|cFFADD8E6'}; -- ??????????????????
	newTable['????'] = {0, 0, '|cFFADD8E6'}; -- ???????????????? ????????
	newTable['????????'] = {0, 0, '|cFFADD8E6'}; -- ?????????????????????? ????????????????
	newTable['????1'] = {0, 0, '|cFFADD8E6'}; -- ?????????????????? ??????????????????
	newTable['????'] = {0, 0, '|cFFADD8E6'}; -- ???????????????????? ????????
	-- ???????????? ???????? --DARKTURQUOISE"|cFF00CED1
	newTable['????'] = {0, 0, '|cFF00CED1'}; -- ?????????????? ????????????????????
	newTable['????'] = {0, 0, '|cFF00CED1'}; -- ???????????? ????????????????
	newTable['????'] = {0, 0, '|cFF00CED1'}; -- ?????????????????????? ????????
	newTable['??????'] = {0, 0, '|cFF00CED1'}; -- ??????????????
	newTable['??????'] = {0, 0, '|cFF00CED1'}; -- ????????????????
	newTable['????'] = {0, 0, '|cFF00CED1'}; -- ???????????? ????????
	newTable['????????'] = {0, 0, '|cFF00CED1'}; -- ????????????????
	newTable['????'] = {0, 0, '|cFF00CED1'}; -- ???????????????? ??????????????????

	--???????????? ?????? --limegreen"|cFF32CD32"
	newTable['Inst5'] = {1, 0, '|cFF32CD32'}; -- ???? ??-????????
	newTable['??????'] = {0, 0, '|cFF32CD32'}; -- ???? ???????????? ?????????? 
	newTable['??-????????'] = {0, 0, '|cFF32CD32'}; -- ???????????????? ?????????????? ??????????????
	newTable['??-????'] = {0, 0, '|cFF32CD32'}; -- ?????????? ??????????
	newTable['??-??????'] = {0, 0, '|cFF32CD32'}; -- ??????????????
	newTable['??-????????'] = {0, 0, '|cFF32CD32'}; -- ??????????????????
	newTable['??-????'] = {0, 0, '|cFF32CD32'}; -- ???????????????? ????????
	newTable['??-????????'] = {0, 0, '|cFF32CD32'}; -- ?????????????????????? ????????????????
	newTable['??-????1'] = {0, 0, '|cFF32CD32'}; -- ?????????????????? ??????????????????
	newTable['??-????'] = {0, 0, '|cFF32CD32'}; -- ???????????????????? ????????
	newTable['??-????'] = {0, 0, '|cFF32CD32'}; -- ?????????????? ????????????????????
	newTable['??-????'] = {0, 0, '|cFF32CD32'}; -- ???????????? ????????????????
	newTable['??-????'] = {0, 0, '|cFF32CD32'}; -- ?????????????????????? ????????
	newTable['??-??????'] = {0, 0, '|cFF32CD32'}; -- ??????????????
	newTable['??-??????'] = {0, 0, '|cFF32CD32'}; -- ????????????????
	newTable['??-????'] = {0, 0, '|cFF32CD32'}; -- ???????????? ????????
	newTable['??-????????'] = {0, 0, '|cFF32CD32'}; -- ????????????????
	newTable['??-????'] = {0, 0, '|cFF32CD32'}; -- ???????????????? ??????????????????

	-- 
	newTable['Inst6'] = {1, 0, '|cFF483D8B'}; -- ???? ????????
	newTable['????????'] = {0, 0, '|cFFD2691E'}; -- ?????????????? -- ???????????? ???? --chocolate"|cFFD2691E" 
	newTable['??????????'] = {0, 0, '|cFFBDB76B'}; -- ?????????? -- ???????????? ???????? --darkkhaki"|cFFBDB76B"
	newTable['????????'] = {0, 0, '|cFFFF6347'}; -- ???????????????????? -- ???????????? ???????? tomato"|cFFFF6347"
	newTable['????'] = {0, 0, '|cFFC71585'}; -- ?????? ???????? -- ???????????? ????20 --Mediumvioletred"|cFFC71585"
	newTable['??????'] = {0, 0, '|cFFFF4500'}; -- ?????????????? ?????????????????? - ???????????? ?????? -- Orangered"|cFFFF4500"
	newTable['????'] = {0, 0, '|cFFDC143C'}; -- ?????? ???????? -- ???????????? ???? -  Crimson  "|cFFDC143C"
	newTable['????????'] = {0, 0, '|cFF800080'}; -- ?????????????? ?????????????? -- ???????????? ???? 40 -- purple "|cFF800080"
	newTable['????'] = {0, 0, '|cFF8B0000'}; -- ???????????? ???????? - ???????????? ?????? --darkred  "|cFF8B0000"
	newTable['??????????'] = {0, 0, '|cFFDAA520'}; --?????????? ???????????????????? ?????????????? -- ???????? Goldenrod"|cFFDAA520
	
	newTable['Inst7'] = {1, 0, '|cFF008080'}; -- ???? ????????
	newTable['2x2'] = {0, 0, '|cFF008080'}; --  
	newTable['3x3'] = {0, 0, '|cFF008080'}; --  
	newTable['5x5'] = {0, 0, '|cFF008080'}; -- 
	
	for k,v in pairs(UserTable) do
		
		newTable[k] = {0, 0, '|cFFFFFACD'} -- cFFFFFACD LEMONCHIFFON
		
	end
	
	return newTable;

end

function CustomTable_hide_all()

	for k, v in pairs(CustomTable) do
		CustomTable[k][1] = 1
		CustomTable[k][2] = 0
	end

end

function GetInstTable()

	LFGSort_Inst_ect = L['LFGSort_Inst_ect'];
	
	LFGSort_Insts = {}
	LFGSort_Insts[1] = L['LFGSort_Inst1']
	LFGSort_Insts[2] = L['LFGSort_Inst2']	
	LFGSort_Insts[3] = L['LFGSort_Inst3']	
	LFGSort_Insts[4] = L['LFGSort_Inst4']	
	LFGSort_Insts[5] = L['LFGSort_Inst5']
	LFGSort_Insts[6] = L['LFGSort_Inst6']
	LFGSort_Insts[7] = L['LFGSort_Inst7']
	
end

function AddMessage(frame, message, ...)
	r,g,b,MID, sticky = ...;
	
	local lfg_instID = '';
	local showInLFGS = false
	local isLFGS = frame == lfgsChatFrame;
	
	if MID == info.id then
		return hooks[frame](frame, message, ...);
	end
	if MID == info.id or MID == nil or not activeChannels[MID] == true then
		LFGSort_Debug_Message('not searching in: '..tostring(MID)..' channel '..message);
		return hooks[frame](frame, message, ...);	
	end
		
	lfg_instID = ''
	templ1 = '(%b[])(.-)(%b[])(.*)';
	res1, res2, res3, msgText  = string.match(message, templ1)
		
	if msgText == nil or msgText == '' then
		msgText = message
	
	end
	
	lfg_instID = IdentifyInst(' '..msgText,true)
	
	if lfg_instID ~= '' then

		lfg_data = CustomTable[lfg_instID]
		
		if lfg_data == nil then
			LFGSort_Debug_Message('no data in custom table for ('..lfg_instID..')');
			--LFGSort_Message(' data type '..type(lfg_data2)..'('..lfg_data2[1]..')'..'('..lfg_data2[2]..')'..'('..lfg_data2[3]..')');
			return hooks[frame](frame, message, ...);
		end
			
		hide = lfg_data[1]
		sound = lfg_data[2]
		color = lfg_data[3]
		bell = '';
		if sound == 1 then
			currTime = time();
			diff = currTime - lastCall;
			bell = '|r|cffff0000???';
			showInLFGS = true;
			
			if diff > 5 then
				LFGPlaySound(DingSound, "Master");
				--PlaySound(808, "Master")
				lastCall = currTime;
			end
		end 

		--message = string.gsub(message, '(.+)([(??-??|??-??|????|0-9|\.|\w)]\]) ([(\w|??-??|??-??|????|0-9)])(.+)', '%1%2\['..color..L[lfg_instID]..bell..'|r\]%3%4');
		-- ???????????????????? ?????????? ?????????? - ?????????????????? ???????????????? - 1;
		
		--LFGSort_Debug_Message(string.gsub(message,'(%b[])%s*(%b[])(:.+)','2 - %1\['..color..L[lfg_instID]..bell..'\]%2%3'));
		--LFGSort_Debug_Message('best test '..string.gsub(message,'(.+)([??-??|??-??|????|0-9|%.|%w]%])%s*(%[[%w|??-??|??-??|????|0-9])(.+)','45 - %1%2\['..color..L[lfg_instID]..bell..'\]%3%4'));
		--LFGSort_Debug_Message('best test '..string.gsub(message,'(.+)([??-??|??-??|????|0-9|%.|%w]%])%s*(%[[%w|??-??|??-??|????|0-9])(.+)'))??
		--LFGSort_Debug_Message(string.gsub(message,'(%b[]).-(%b[])(:.+)','2 - %1\['..color..L[lfg_instID]..bell..'\]%2%3'));
		--LFGSort_Debug_Message(string.gsub(message,'(%b[])(%b[])(:.+)','3 - %1\['..color..L[lfg_instID]..bell..'\]%2%3'));
		--LFGSort_Debug_Message(string.gsub('[4. LookingForGroup] [Ssol]:wanna go ZG', '(%b[]).*(%b[])(:.+)','%1\['..color..L[lfg_instID]..bell..'\]%2%3'))
		--LFGSort_Debug_Message(string.gsub('[4. LookingForGroup]<DND>[Ssol]:wanna go ZG', '(%b[]).*(%b[])(:.+)','%1\['..color..L[lfg_instID]..bell..'\]%2%3'))
		--LFGSort_Debug_Message(L[lfg_instID]..' - '..lfg_instID);
		--LFGSort_Debug_Message(''..color..L[lfg_instID]..bell);
		--LFGSort_Debug_Message('2nd '..string.gsub(message,'(%b[]).*(%b[])(:.+)','%1\['..color..L[lfg_instID]..bell..'\]%2%3'));
		--LFGSort_Debug_Message('4nd '..string.gsub(message,'(.*)',''..color..L[lfg_instID]..bell..'\]%1'));
		--LFGSort_Debug_Message('3rd '..string.gsub(message,'(\b[])\s*(\b[])(:.+)','%1\['..color..L[lfg_instID]..bell..'\]%2%3'));

		--LFGSort_Debug_Message(string.gsub(message,'(.+)([??-??|??-??|????|0-9|\.|\w]|h)(|c.*|r)(.*)','%1%2'..color..L[lfg_instID]..bell..'|r\]\[%3%4'));

		--full_str = '';
		--new_str = "";
		--for c in message:gmatch"." do
		--	full_str = full_str..'['..tostring(c:byte(1))..'] ';
		--	new_str = new_str..' '..string.char(c:byte(1));
		--end
		--print(new_str);
		
		--message = string.gsub(message,'(.+)([??-??|??-??|????|0-9|\.|\w]|h)(|c.*|r)(.*)','%1%2'..color..L[lfg_instID]..bell..'|r\]\[%3%4', 1);
		--message = string.gsub(message,'(%b[])(.-)(%b[])(.-)','%1%2['..color..L[lfg_instID]..bell..'|r]%3%4', 1);
		if isLFGS == true then
			bell = '';
		end
		
		if string.sub(lfg_instID, 1, 4) == 'self' then
			inst_name = '#'..string.sub(lfg_instID, 5);
		else
			inst_name = L[lfg_instID]
		end
		message = string.gsub(message,'(%b[])(.-)(%b[])(.-)','%1%2['..color..inst_name..bell..'|r]%3%4', 1);
		--'(%b[])(.-)(%b[])(.-)','%1%2['..'TEST'..']%3%4')
	

	end
	--DEFAULT_CHAT_FRAME:AddMessage('is lfgs channel '..tostring(isLFGS)..', if selected '..tostring(showInLFGS));
	--DEFAULT_CHAT_FRAME:AddMessage('is lfgs frame '..tostring(isLFGS)..', if selected '..tostring(showInLFGS)..' lfgs frame '..tostring(type(lfgsChatFrame))..', current frame '..tostring(type(frame)));
   	--if not isLFGS or showInLFGS then
		return hooks[frame](frame, message, ...);
	--end
end

function IdentifyInst(msgString, is_adding_message)

	
	lfg_instID = ''
	--probs = (string.find(msgString, '??????????????') ~= nil) or (string.find(msgString, '??????????????') ~= nil);
	
	--if probs then
	--	LFGSort_Message('here: '..msgString);
	--	LFGSort_Message('after: '.. tostring(msgText));
	--	l_debug = true;
	--end

	
	msgText = ClearMessage(msgString)
	
	for i,j in pairs(UserTable) do
		if string.find(msgText, j) then
			lfg_instID = i;
			LFGSort_Debug_Message('found user str: '..i..' this is messsage adding '..tostring(is_adding_message));
			break;
		end
	end
	
	for i,j in pairs(LFGSort_Inst_ect) do
		if string.find(msgText, i) then
			lfg_instID = j;
			LFGSort_Debug_Message('found: '..L[j]..' template '..i);
			break;
		end
	end
	--LFGSort_Debug_Message('ok');
	if lfg_instID == '' then
		--LFGSort_De
		LFGSort_Debug_Message('looking more');

		for l,LFGSort_Inst in pairs(LFGSort_Insts) do
			
			if CustomTable['Inst'..l][1] == 1 then
				--LFGSort_Debug_Message('looking table '..l..' - '..L['Inst'..l]);
				for x,y in pairs(LFGSort_Inst) do
					if string.find(msgText..'.', x) then
						if lfg_instID == '??????' then
							lfg_instID = '??-'..y
							LFGSort_Debug_Message('found - ??-'..y..' with '..x);
							break;
						else
							lfg_instID = y;
							LFGSort_Debug_Message('found - '..y..' with '..x);
							break;
						end
					end
				end
			else
				LFGSort_Debug_Message('not looking table '..l..' - '..L['Inst'..l]..' - false settings');
			end
			if lfg_instID ~= '' and lfg_instID ~= '??????' then
				LFGSort_Debug_Message('stop looking');
				break;
			else
				LFGSort_Debug_Message('keep looking, lfg_instID = '..lfg_instID);
			end
		end
	end
	    
	if lfg_instID == '??????' and CustomTable['Inst6'][1] == 0 then
		lfg_instID = ''
	end
	
	if probs then

		l_debug = false;
	end
	
	return lfg_instID

end

function ClearMessage(message)

	templ1 = '([{}<>%s%-%/])([%z\1-\127\194-\244][\128-\191]*)([{}<>%s%-%/])';
	
	msgText = message
	
	SubTable = {}
	SubTableCleared = {}
	count = 1
	strStart = 0
	strEnd = 0
	for i = 1, 100 do
		a,b = string.find(message, templ1, b)
		if a == 0 or a == nil then
			break;
		end
		if a > strEnd and strEnd ~= 0 then
			if strEnd - strStart > 6 then
				word = string.sub(message, strStart + 1, strEnd - 1)
				SubTable[count] = word
				wordCleared = string.gsub(word,'[%s%-%/]','')
				SubTableCleared[count] = wordCleared
				count = count + 1
				strStart = a
				strEnd = b
			else
				strStart = 0
				strEnd = 0
			end
		elseif strStart == 0 then
			strStart = a
			strEnd = b
		else 
			strEnd = b
		end
	end

	message2 = message
	for k,v in pairs(SubTable) do
	-- " ?? ?? ?? ?? ?? ?? ?? [ - ?????????????????????? - ]" - ??????????
		v2 = string.gsub(v,'%/','%%/')
		v2 = string.gsub(v2,'%-','%%-')
		v2 = string.gsub(v2,'%[','%%[')
		assert(string.gsub(message2,v2,SubTableCleared[k]), 'Error:'..message2)
		message2 = string.gsub(message2,v2,SubTableCleared[k])
	end

	if msgText~= message2 and l_debug then
	
		PlaySoundFile("Interface\\AddOns\\LFGSort\\res\\Xylo.mp3", 'Master')
		LFGSort_Message('DIFF 1:'..msgText);
		LFGSort_Message('DIFF 2:'..message2);
	end
	
	message2 = string.gsub(message2,'[^??-??????-??%a]??[^??-??????-??%a]',' ?????? ')
	message2 = string.gsub(message2,'[^??-??????-??%a][H][^??-??????-??%a]',' hero ')
	
	message2 = string.lower(message2)
	
	return message2

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
			DEFAULT_CHAT_FRAME:AddMessage('???? ?????????????? ?????????????????? '..comand_arg);
		end
	elseif (command == 'hide') then
		currentSettings = CustomTable[comand_arg]
		if currentSettings ~= nil then
			SetHiding(comand_arg);
		else
			DEFAULT_CHAT_FRAME:AddMessage('???? ?????????????? ?????????????????? '..comand_arg);
		end		
		
	elseif (command == 'settings') then
		CreateSettingsFrame();
			for k, v in pairs(CustomTable) do
				hide = v[1]
				sound = v[2]
				color = v[3]
				DEFAULT_CHAT_FRAME:AddMessage('inst : '..color..k..'|r sound: '..sound..' hide '..hide);
			end
	elseif (command == 'test') then
		
		for k,v in pairs(LFGSort_Inst_ect) do
			DEFAULT_CHAT_FRAME:AddMessage('???????????????? ?????????????????????????? ???? ??????????????: '..k);
			if string.find(''..comand_arg, k) then
				color = CustomTable[v][3]
				DEFAULT_CHAT_FRAME:AddMessage('?????????????? : '..color..v)
				
			end
		end
		for l,m in pairs(LFGSort_Insts) do
			for k,v in pairs(m) do
				DEFAULT_CHAT_FRAME:AddMessage('???????????????? ?????????????????????????? ???? ??????????????: '..k);
				if string.find(''..comand_arg, k) then
					color = CustomTable[v][3]
					DEFAULT_CHAT_FRAME:AddMessage('?????????????? : '..color..v)
					
				end
			end
		end
	elseif (command == 'testfirst') then
		for l,m in pairs(LFGSort_Insts) do
			for k,v in pairs(m) do
				DEFAULT_CHAT_FRAME:AddMessage('???????????????? ?????????????????????????? ???? ??????????????: '..k);
				if string.find(''..comand_arg, k) then
					color = CustomTable[v][3]
					DEFAULT_CHAT_FRAME:AddMessage('?????????????? : '..color..v)
					break;
				end
			end
		end
	elseif (command == 'reset') then
		CustomTable = NewCustomTable();
		DEFAULT_CHAT_FRAME:AddMessage('?????????????????? ????????????????');
	elseif (command == 'colors') then	
		testColors()
	elseif (command == 'debug') then
		if l_debug == false then
			l_debug = true;
			DEFAULT_CHAT_FRAME:AddMessage('?????????????? ????????????????');
		else
			l_debug = false;
			DEFAULT_CHAT_FRAME:AddMessage('?????????????? ??????????????????');
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
	LFGSort_Message("Use /LFGSort test <string> - ?????? ???????????????? ????????????"); 
	LFGSort_Message("    /LFGSort settings - ?????? ???????????????? ???????? ????????????????");
	LFGSort_Message("    /LFGSort sound <????????. ????????????????????> - ?????? ?????????????????? ???????????????????? ?????????? ?????? ?????????????????? ??????????????????");
	LFGSort_Message("    /LFGSort hide <????????. ????????????????????> - ?????? ???????????????????? ?????????? ?????????? ???? ????????");
	LFGSort_Message("    /LFGSort reset - ?????? ???????????? ????????????????");
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
    --icon:Register("LFGsort", IMM_LDB, LFG_sorter_settings.profile.minimap);
	icon:Register("LFGsort", IMM_LDB, mmap_pos);
end

function CreateSettingsFrame()
	
	if not LFG_frame == nil then
		AceGUI:Release(LFG_frame)
	end
	LFG_frame = AceGUI:Create("Frame");
	--local buttonAdded = false;
	
	LFG_frame:SetTitle("LFG sorter");
	LFG_frame:SetStatusText(L["?????????????????? LFG sorter"]);
	LFG_frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
	LFG_frame:SetLayout("List"); 
	LFG_frame:SetHeight(690)
	LFG_frame:SetWidth(800)
	
	---
	--------------------------------------------------

	settingsFrame = AceGUI:Create("SimpleGroup");
	settingsFrame:SetLayout("Flow")
	settingsFrame:SetFullWidth(true);
	
	settingsFrameFiller = AceGUI:Create("SimpleGroup");
	settingsFrameFiller:SetLayout("Flow")
	--settingsFrame:SetFullWidth(true);
	--settingsFrameFiller:SetRelativeWidth(0.40)
	
	local strFiller = AceGUI:Create("Label")
	strFiller:SetText('                  ');
	settingsFrameFiller:AddChild(strFiller);
	
	settingsFrame:AddChild(settingsFrameFiller);
		

	--settingsFrame:SetRelativeWidth(0.50)
	SettingsList = {}
	local NoSettings = true
	for q,a in pairs(SavedTables) do
		--LFGSort_Message(' settings '..q);
		SettingsList[q] = q	
		NoSettings = false
	end
	
	local SettingsDropDown = AceGUI:Create("Dropdown")
 	    SettingsDropDown:SetList(SettingsList)
	    SettingsDropDown:SetRelativeWidth(0.20)
	    --SettingsDropDown:SetWidth(20)
		if NoSettings then
			SettingsDropDown:SetHeight(20)
		end
        SettingsDropDown:SetLabel(L["SavedProfiles"])
        SettingsDropDown:SetText(CurrentTableName)
		SettingsDropDown:SetCallback("OnValueChanged", function(wig, event_name, value)
				--LFGSort_Message('new val:'..value);
				CurrentTableName = value;
				--LFGSort_Message(' settings name '..value);
				UpdateCustomTable(SavedTables[value])
				Tabs:SelectTab(currentFrameTab)
				wig:SetValue(nil)
				wig:SetText(value)
			end)
	
	local NewSettingsName = AceGUI:Create("EditBox")
		NewSettingsName:SetRelativeWidth(0.20)
		--NewSettingsName:SetWidth(15)
        --NewSettingsName:SetText('New settings')
		NewSettingsName:SetLabel(L['NewSettings'])

        NewSettingsName:SetCallback("OnEnterPressed", function(wig, event_name, new_text)
		if new_text == '' then
			return
		end
		--LFGSort_Message('new text:'..new_text);
		SavedTables[new_text] = CustomTable
		SettingsList[new_text] = new_text	
		
		SettingsDropDown:SetList(SettingsList)
		CurrentTableName = new_text
		--LFGSort_Message('CurrentTableName:'..CurrentTableName);
		SettingsDropDown:SetText(CurrentTableName)
		
		
			end)
			
		settingsFrame:AddChild(NewSettingsName)
        
		settingsFrame:AddChild(SettingsDropDown)
	
		
	local btn = AceGUI:Create("Button")
	btn:SetRelativeWidth(0.10)
	--btn:SetWidth(10)
	btn:SetText(L["Save"])
	btn:SetCallback("OnClick", function() 
		SaveCustomTable(CurrentTableName)
		end)
	
	settingsFrame:AddChild(btn);
	
	local btn = AceGUI:Create("Button")
	btn:SetRelativeWidth(0.10)
	--btn:SetWidth(10)
	btn:SetText(L["Remove"])
	btn:SetCallback("OnClick", function() 
			--table.remove(SavedTables, CurrentTableName)
			--table.remove(SettingsList, CurrentTableName)
			SavedTables[CurrentTableName] = nil
			SettingsList[CurrentTableName] = nil
			SettingsDropDown:SetList(SettingsList)
			CurrentTableName = ''
			SettingsDropDown:SetValue('')
		end)
	--group:AddChild(btn);
	
	settingsFrame:AddChild(btn);

	LFG_frame:AddChild(settingsFrame);

	-----------------------------------------------------
	
	Tabs = AceGUI:Create("TabGroup");
	
	Tab_list = {}
	for l,m in pairs(LFG_Settings_Pages) do
		Tab_list[l] = m[3];
	end
	Tabs:SetLayout("Flow")
	Tabs:SetTabs(Tab_list);
	Tabs:SetFullWidth(true)
	
	Tabs:SetCallback('OnGroupSelected', fill_page)
	Tabs:SelectTab(1)
	LFG_frame:AddChild(Tabs);
	
------ settings reset
---------------------------------------
	middleFrame = AceGUI:Create("SimpleGroup");
	middleFrame:SetLayout("Flow")
	middleFrame:SetFullWidth(true);
	
	local btn = AceGUI:Create("Button")
	btn:SetRelativeWidth(0.5)
	btn:SetText(L["Reset"])
	btn:SetCallback("OnClick", function() 
		AceGUI:Release(LFG_frame)
		CustomTable = NewCustomTable();
		CreateSettingsFrame();
		end)
	--group:AddChild(btn);
	
	middleFrame:AddChild(btn);
		
	local btn_hide = AceGUI:Create("Button")
	btn_hide:SetRelativeWidth(0.5)
	btn_hide:SetText(L["HideAll"])
	btn_hide:SetCallback("OnClick", function() 
		AceGUI:Release(LFG_frame)
		CustomTable_hide_all();
		CreateSettingsFrame();
		end)
	--group:AddChild(btn_hide);
	
	middleFrame:AddChild(btn_hide);
	
	LFG_frame:AddChild(middleFrame);
	
	
----------------------------------------
	--bottomFrame = AceGUI:Create("InlineGroup");
	bottomFrame = AceGUI:Create("SimpleGroup");
	bottomFrame:SetLayout("Flow")
	bottomFrame:SetFullWidth(true);
	
	--LFGSort_Debug_Message(' channels settings ');
	for i,j in pairs(LFG_channels) do
		--LFGSort_Debug_Message(i..' - '..tostring(j))
		local chan = AceGUI:Create("CheckBox")
			chan:SetLabel(L['channel '..i]);
			chan:SetValue(j);
			chan:SetCallback("OnValueChanged", function(value)
				SetChannel(i);
			end);
			chan:SetRelativeWidth(0.15);
			bottomFrame:AddChild(chan)
	
	end
	
	sounds_list = {}
	sounds_list[0] = "No sound"
	sounds_list[678] = "Money ding"
	sounds_list[12188] = "GUILD_VAULT_OPEN "
	sounds_list[12867] = "ALARM 2 "
	sounds_list[5274] = "AUCTION OPEN"
	sounds_list[8458] = "PVP ENTER QUEUE"
	sounds_list[18871] = "ALARM 1"
	sounds_list[8959] = "RAID WARNING"
	sounds_list[416] = "Murloc Aggro"
	sounds_list["Interface\\AddOns\\LFGSort\\res\\Ding.mp3"] = "Ding"
	sounds_list["Interface\\AddOns\\LFGSort\\res\\gunshot.mp3"] = "Gunshot"
	sounds_list["Interface\\AddOns\\LFGSort\\res\\mew.mp3"] = "Mew"
	sounds_list["Interface\\AddOns\\LFGSort\\res\\owl.mp3"] = "Owl"
	sounds_list["Interface\\AddOns\\LFGSort\\res\\Rooster.mp3"] = "Rooster"
	sounds_list["Interface\\AddOns\\LFGSort\\res\\train.mp3"] = "Train"
	sounds_list["Interface\\AddOns\\LFGSort\\res\\waterdrop.mp3"] = "Waterdrop"
	sounds_list["Interface\\AddOns\\LFGSort\\res\\Woohoo.mp3"] = "Woohoo";
	sounds_list["Interface\\AddOns\\LFGSort\\res\\Xylo.mp3"] = "Xylo";
	sounds_list["Interface\\AddOns\\LFGSort\\res\\aoogah.mp3"] = "aoogah";
	
	local trackDropDown = AceGUI:Create("Dropdown")
       --trackDropDown:SetFullWidth(true)
	   trackDropDown:SetList(sounds_list)
        trackDropDown:SetLabel(L["Select ding sound"])
        trackDropDown:SetValue(DingSound)
		trackDropDown:SetCallback("OnValueChanged", function(wig, event_name, value)
				--LFGSort_Message('new val:'..value);
				DingSound = value
				LFGSetSound(value)
				LFGPlaySound(value, "Master")
			end)
        bottomFrame:AddChild(trackDropDown)
	
	
	chatFrame = AceGUI:Create("InlineGroup");
	chatFrame:SetLayout("Flow")
	chatFrame:SetRelativeWidth(0.6)
	--chatFrame:SetFullWidth(true);
	
	fillChatGrp(chatFrame)
	bottomFrame:AddChild(chatFrame);
	 
	LFG_frame:AddChild(bottomFrame);
	
	Tabs:SetFullHeight(true);
	LFG_frame:SetFullHeight(true);
	_G["LFGFrame_ala"] = LFG_frame.frame
	tinsert(UISpecialFrames, "LFGFrame_ala")
end

function SaveCustomTable(TableName)

	SavedTables[TableName] = CustomTable;

end

function fillChatGrp(parent_group)
		

	for index = 1, FCF_GetNumActiveChatFrames() + 1  do -- NUM_CHAT_WINDOWS
		local f_name = GetChatWindowInfo(index)
		if f_name == "LFGS" then
			lfgsChatFrame = _G["ChatFrame" .. index]
		end
	end	
	
	local chatDesc1 = AceGUI:Create("Label")
	chatDesc1:SetText(L['AboutNewFrame']);
	chatDesc1:SetRelativeWidth(1)
	parent_group:AddChild(chatDesc1)
	
	buttonsFrame = AceGUI:Create("SimpleGroup");
	buttonsFrame:SetLayout("Flow")
	buttonsFrame:SetFullWidth(true)	
	local btn_chat = AceGUI:Create("Button")
	btn_chat:SetRelativeWidth(0.5)
	btn_chat:SetText(L["CreateChatFrame"])
	btn_chat:SetCallback("OnClick", function()
			if lfgsChatFrame == nil then
		
				lfgsChatFrame = FCF_OpenNewWindow("LFGS", true)
				ChatFrame_AddChannel(lfgsChatFrame, L['GENERAL'])
				ChatFrame_AddChannel(lfgsChatFrame, L['TRADE'])
				ChatFrame_AddChannel(lfgsChatFrame, L['LookingForGroup'])
				
				FCF_SetLocked( lfgsChatFrame, nil );
				lfgsChatFrame:ClearAllPoints()
				FCF_UnDockFrame( lfgsChatFrame );
				--lfgsChatFrame:SetPoint("BOTTOMLEFT", _G["ChatFrame" .. 1], "TOPLEFT");

				lfgsChatFrame:SetUserPlaced( true );	
				
				ReloadUI()

			end
		end)
	
	buttonsFrame:AddChild(btn_chat);
	
	local btn_chat_del = AceGUI:Create("Button")
	btn_chat_del:SetText(L["DeleteChatFrame"])
	btn_chat_del:SetRelativeWidth(0.5)
	btn_chat_del:SetCallback("OnClick", function()
				ChatFrame_RemoveAllChannels(lfgsChatFrame);	
				FCF_Close(lfgsChatFrame);
				lfgsChatFrame = nil	
		end)
	buttonsFrame:AddChild(btn_chat_del);
	
	parent_group:AddChild(buttonsFrame);
		
	local chatDesc2 = AceGUI:Create("Label")
	if lfgsChatFrame == nil then
		chatDesc2:SetText(L['ReloadRequired']);
	else
		chatDesc2:SetText(L['FrameExists']);
	end
	chatDesc2:SetRelativeWidth(1)
	parent_group:AddChild(chatDesc2)
		
end

function LFGSetSound(sound)

	if type(sound) == 'number' then
		soundType = 1
	else
		soundType = 2
	end

end

function LFGPlaySound(sound, stype)
	if sound == 0 then
		-- nothing
	elseif soundType == 1 then
		PlaySound(sound, stype)
	else
		PlaySoundFile(sound, stype)
	end
end

function fill_page(parent_group, event, page_number)

	if page_number == 4 then
		fill_page_user_table(parent_group, event, page_number)
		return;
	end
	
	currentFrameTab = page_number
	parent_group:ReleaseChildren()

	local page_settings = LFG_Settings_Pages[page_number] 
			
	for i = page_settings[1],page_settings[2] do

		j = LFG_Settings_Table[i]
		group = AceGUI:Create("InlineGroup"); --InlineGroup
		--group.SetTitle(j.name);
		group:SetLayout("List")
		group:SetRelativeWidth(0.33);
	
		if j.total_check > 0 then 

			capture = AceGUI:Create("InlineGroup"); 
			capture:SetLayout("Flow")
			
			total_check = AceGUI:Create("CheckBox")
			total_check:SetLabel(L['Inst'..j.total_check]);
			total_check:SetValue(CustomTable['Inst'..j.total_check][1] == 1);
			total_check:SetCallback("OnValueChanged", function(value)
				local a = LFG_Settings_Table[i].total_check;
				SetHiding('Inst'..a);
			end);
			
			total_check:SetRelativeWidth(1);
			capture:AddChild(total_check)
			capture:SetRelativeWidth(1);
			group:AddChild(capture);
		end
		
		for m,n in pairs(j.data) do

			elem = AceGUI:Create("SimpleGroup"); 
			elem:SetLayout("Flow")
			--k = n;
			v = CustomTable[n];
			
			local desc = AceGUI:Create("Label")
			
			desc:SetText(''..v[3]..L[n]..'|r');
			desc:SetRelativeWidth(0.15);
			elem:AddChild(desc)
			
			local hideCheck = AceGUI:Create("CheckBox")
			hideCheck:SetLabel(L["????????????"]);
			hideCheck:SetValue(CustomTable[n][1] == 1);
			hideCheck:SetCallback("OnValueChanged", function(value)
				SetHiding(n);
			end);
			hideCheck:SetRelativeWidth(0.25);
			elem:AddChild(hideCheck)
			
			local soundCheck = AceGUI:Create("CheckBox");
			soundCheck:SetLabel(L["????????"]);
			soundCheck:SetValue(CustomTable[n][2] == 1);
			soundCheck:SetCallback("OnValueChanged", function(value)
				SetSound(n);
			end);
			soundCheck:SetRelativeWidth(0.30);
			elem:AddChild(soundCheck);	
		
			group:AddChild(elem);
			
		end
		parent_group:AddChild(group);
	end
	parent_group:SetFullHeight(true);
end

function fill_page_user_table(parent_group, event, page_number)
	
	currentFrameTab = page_number
	parent_group:ReleaseChildren()

	local page_settings = LFG_Settings_Pages[page_number] 
	
	local NewUserSearch = AceGUI:Create("EditBox")
		NewUserSearch:SetRelativeWidth(0.70)

		NewUserSearch:SetLabel(L['New custom search'])

        NewUserSearch:SetCallback("OnEnterPressed", function(wig, event_name, new_text)
			if new_text == '' then
				return
			end
			--LFGSort_Message('new text:'..new_text);
			num_user_fields = num_user_fields + 1
			UserTable['self'..num_user_fields] = string.lower(new_text)
			CustomTable['self'..num_user_fields] = {0, 1, '|cFFFFFACD'}
			SettingsTable()			
			fill_page_user_table(parent_group, 'change', page_number)
			end)
			
		parent_group:AddChild(NewUserSearch)
	
	for i = page_settings[1],page_settings[2] do

		j = LFG_Settings_Table[i]
		group = AceGUI:Create("InlineGroup"); --InlineGroup
		--group.SetTitle(j.name);
		group:SetLayout("List")
		group:SetRelativeWidth(0.5);

		no_user_searches = true
		
		for m,n in pairs(j.data) do
			no_user_searches = false
			elem = AceGUI:Create("SimpleGroup"); 
			elem:SetLayout("Flow")
			--k = n;
			v = CustomTable[n];
			
			local desc = AceGUI:Create("Label")
			
			
			inst_name = '#'..string.sub(n, 5);
			
			desc:SetText(''..v[3]..'['..inst_name..']'..UserTable[n]..'|r');
			desc:SetRelativeWidth(0.55);
			elem:AddChild(desc)
			
			-- local hideCheck = AceGUI:Create("CheckBox")
			-- hideCheck:SetLabel(L["????????????"]);
			-- hideCheck:SetValue(CustomTable[n][1] == 1);
			-- hideCheck:SetCallback("OnValueChanged", function(value)
				-- SetHiding(n);
			-- end);
			-- hideCheck:SetRelativeWidth(0.25);
			-- elem:AddChild(hideCheck)
			
			local soundCheck = AceGUI:Create("CheckBox");
			soundCheck:SetLabel(L["????????"]);
			soundCheck:SetValue(CustomTable[n][2] == 1);
			soundCheck:SetCallback("OnValueChanged", function(value)
				SetSound(n);
			end);
			soundCheck:SetRelativeWidth(0.25);
			elem:AddChild(soundCheck);	
		
			local btn = AceGUI:Create("Button")
				btn:SetRelativeWidth(0.15)
				--btn:SetWidth(10)
				btn:SetText("X")
				btn:SetCallback("OnClick", function() 
					UserTable[n] = nil
					CustomTable[n] = nil
					SettingsTable()	
					for t,m in pairs(SavedTables) do
						m[n] = nil
					end
					
					fill_page_user_table(parent_group, 'change', page_number)
					end)
	
			elem:AddChild(btn);
		
			group:AddChild(elem);
			
		end

		
		parent_group:AddChild(group);
	end
	--if no_user_searches then
			local new_desc = AceGUI:Create("Label")
			
			new_desc:SetText(L['User search']);
			new_desc:SetRelativeWidth(0.4);
			parent_group:AddChild(new_desc)
		--end
	parent_group:SetFullHeight(true);
end


function fill_page_works(parent_group, event, page_number)
	
	parent_group:ReleaseChildren()

	local page_settings = LFG_Settings_Pages[page_number] 
			
	scrollcontainer = AceGUI:Create("SimpleGroup"); -- "InlineGroup" is also good
	scrollcontainer:SetFullWidth(true);
	scrollcontainer:SetFullHeight(true); 
	scrollcontainer:SetLayout("Fill");-- important! --Fill

	parent_group:AddChild(scrollcontainer);
	
	scroll = AceGUI:Create("ScrollFrame") -- old ScrollFrame/SimpleGroup
	scroll:SetLayout("Flow") 
	scrollcontainer:AddChild(scroll)
	
	topFrame = AceGUI:Create("InlineGroup");
	topFrame:SetLayout("Flow")
	topFrame:SetFullWidth(true);
	
	scroll:AddChild(topFrame);
	
	for i = page_settings[1],page_settings[2] do

		j = LFG_Settings_Table[i]
		group = AceGUI:Create("InlineGroup"); --InlineGroup
		--group.SetTitle(j.name);
		--DEFAULT_CHAT_FRAME:AddMessage(j.name);
		group:SetLayout("List")
		group:SetRelativeWidth(0.33);

		if j.total_check > 0 then 

			capture = AceGUI:Create("InlineGroup"); 
			capture:SetLayout("Flow")
			
			total_check = AceGUI:Create("CheckBox")
			total_check:SetLabel(L['Inst'..j.total_check]);
			total_check:SetValue(CustomTable['Inst'..j.total_check][1] == 1);
			total_check:SetCallback("OnValueChanged", function(value)
				local a = LFG_Settings_Table[i].total_check;
				SetHiding('Inst'..a);
			end);
			
			total_check:SetRelativeWidth(1);
			capture:AddChild(total_check)
			capture:SetRelativeWidth(1);
			group:AddChild(capture);
		end
		
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
			hideCheck:SetLabel(L["????????????"]);
			hideCheck:SetValue(CustomTable[n][1] == 1);
			hideCheck:SetCallback("OnValueChanged", function(value)
				SetHiding(n);
			end);
			hideCheck:SetRelativeWidth(0.25);
			elem:AddChild(hideCheck)
			
			local soundCheck = AceGUI:Create("CheckBox");
			soundCheck:SetLabel(L["????????"]);
			soundCheck:SetValue(CustomTable[n][2] == 1);
			soundCheck:SetCallback("OnValueChanged", function(value)
				SetSound(n);
			end);
			soundCheck:SetRelativeWidth(0.25);
			elem:AddChild(soundCheck);	
		
			group:AddChild(elem);
			
		end
		topFrame:AddChild(group);
	end
	
	topFrame:SetFullHeight(true);
	
end

function SetChannel(chan, show, ...)
		
	LFG_channels[chan] = not LFG_channels[chan];
	activeChannels[ChatTypeInfo["CHANNEL"..chan].id] = not activeChannels[ChatTypeInfo["CHANNEL"..chan].id];
	LFGSort_Debug_Message(L['?????????????????? ?? ']..L['channel '..chan].." - "..L[" ???????????????????????????? ?????????????? - "]..tostring(LFG_channels[chan]));

end

function SetSound(inst, ...)
		
	if CustomTable[inst][2] == 0 then
		--LFGSort_Debug_Message(CustomTable[inst][3]..L[inst].."|r - "..L["???????? ??????????????"]);
		CustomTable[inst][2] = 1;
	else
		--LFGSort_Debug_Message(CustomTable[inst][3]..L[inst].."|r - "..L["???????? ????????????????"]);
		CustomTable[inst][2] = 0;
	end
end

function SetHiding(inst, ...)
	
	if CustomTable[inst][1] == 0 then
		CustomTable[inst][1] = 1;
		--LFGSort_Debug_Message(CustomTable[inst][3]..L[inst].."|r - "..L["?????????? ???????????????? ?? ????????"]);
	else
		CustomTable[inst][1] = 0;
		--LFGSort_Debug_Message(CustomTable[inst][3]..L[inst].."|r - "..L["?????????? ???????????? ???? ????????"]);
	end
end

function testColors()

DEFAULT_CHAT_FRAME:AddMessage('|cff888888GREY|cffffffffWHITE|cffbbbbbbSUBWHITE|cffff00ffMAGENTA');
  DEFAULT_CHAT_FRAME:AddMessage('|cffffff00YELLOW|cff00ffffCYAN|cffff6060LIGHTRED|cff00ccffLIGHTBLUE');
  DEFAULT_CHAT_FRAME:AddMessage('|cff0000ffBLUE|cff00ff00GREEN|cffff0000RED|cffffcc00GOLD');
DEFAULT_CHAT_FRAME:AddMessage('|cFFF0F8FFALICEBLUE|cFFFAEBD7ANTIQUEWHITE|cFF00FFFFAQUA|cFF7FFFD4AQUAMARINE');
DEFAULT_CHAT_FRAME:AddMessage( '|cFFF0FFFFAZURE|cFFF5F5DCBEIGE|cFFFFE4C4BISQUE|cFF000000BLACK');
DEFAULT_CHAT_FRAME:AddMessage( '|cFFFFEBCDBLANCHEDALMOND|cFF0000FFBLUE|cFF8A2BE2BLUEVIOLET|cFFA52A2ABROWN');
DEFAULT_CHAT_FRAME:AddMessage('|cFFDEB887BURLYWOOD|cFF5F9EA0CADETBLUE|cFF7FFF00CHARTREUSE|cFFD2691ECHOCOLATE');
DEFAULT_CHAT_FRAME:AddMessage( '|cFFFF7F50CORAL|cFF6495EDCORNFLOWERBLUE|cFFFFF8DCCORNSILK|cFFDC143CCRIMSON');
 DEFAULT_CHAT_FRAME:AddMessage( '|cFF00FFFFCYAN|cFF00008BDARKBLUE|cFF008B8BDARKCYAN|cFFB8860BDARKGOLDENROD');
 DEFAULT_CHAT_FRAME:AddMessage('|cFFA9A9A9DARKGRAY|cFF006400DARKGREEN|cFFBDB76BDARKKHAKI|cFF8B008BDARKMAGENTA');
 DEFAULT_CHAT_FRAME:AddMessage('|cFF556B2FDARKOLIVEGREEN|cFFFF8C00DARKORANGE|cFF9932CCDARKORCHID|cFF8B0000DARKRED');
 DEFAULT_CHAT_FRAME:AddMessage( '|cFFE9967ADARKSALMON|cFF8FBC8BDARKSEAGREEN|cFF483D8BDARKSLATEBLUE|cFF2F4F4FDARKSLATEGRAY');
 DEFAULT_CHAT_FRAME:AddMessage('|cFF00CED1DARKTURQUOISE|cFF9400D3DARKVIOLET|cFFFF1493DEEPPINK|cFF00BFFFDEEPSKYBLUE');
 DEFAULT_CHAT_FRAME:AddMessage( '|cFF696969DIMGRAY|cFF1E90FFDODGERBLUE|cFFB22222FIREBRICK|cFFFFFAF0FLORALWHITE');
DEFAULT_CHAT_FRAME:AddMessage('|cFF228B22FORESTGREEN|cFFFF00FFFUCHSIA|cFFDCDCDCGAINSBORO|cFFF8F8FFGHOSTWHITE');
DEFAULT_CHAT_FRAME:AddMessage(  '|cFFFFD700GOLD|cFFDAA520GOLDENROD|cFF808080GRAY|cFF008000GREEN');
 DEFAULT_CHAT_FRAME:AddMessage('|cFFADFF2FGREENYELLOW|cFFF0FFF0HONEYDEW|cFFFF69B4HOTPINK|cFFCD5C5CINDIANRED');
DEFAULT_CHAT_FRAME:AddMessage('|cFF4B0082INDIGO|cFFFFFFF0IVORY|cFFF0E68CKHAKI|cFFE6E6FALAVENDER');
 DEFAULT_CHAT_FRAME:AddMessage( '|cFFFFF0F5LAVENDERBLUSH|cFF7CFC00LAWNGREEN|cFFFFFACDLEMONCHIFFON|cFFADD8E6LIGHTBLUE');
DEFAULT_CHAT_FRAME:AddMessage(  '|cFFF08080LIGHTCORAL|cFFE0FFFFLIGHTCYAN|cFFD3D3D3LIGHTGRAY|cFF90EE90LIGHTGREEN');
DEFAULT_CHAT_FRAME:AddMessage('|cFFFFB6C1LIGHTPINK|cFFFF6060LIGHTRED|cFFFFA07ALIGHTSALMON|cFF20B2AALIGHTSEAGREEN');
DEFAULT_CHAT_FRAME:AddMessage('|cFF87CEFALIGHTSEAGREEN|cFF778899LIGHTSLATEGRAY|cFFB0C4DELIGHTSTEELBLUE|cFFFFFFE0LIGHTYELLOW');
 DEFAULT_CHAT_FRAME:AddMessage( '|cFF00FF00LIME|cFF32CD32LIMEGREENcFFFAF0E6LINEN|cFFFF00FFMAGENTA');
DEFAULT_CHAT_FRAME:AddMessage('|cFF800000MAROON|cFF66CDAAMEDIUMAQUAMARINE|cFF0000CDMEDIUMBLUE|cFFBA55D3MEDIUMORCHID');
DEFAULT_CHAT_FRAME:AddMessage('|cFF9370DBMEDIUMPURPLE|cFF3CB371MEDIUMSEAGREEN|cFF7B68EEMEDIUMSLATEBLUE|cFF00FA9AMEDIUMSPRINGGREEN');
DEFAULT_CHAT_FRAME:AddMessage('|cFF48D1CCMEDIUMTURQUOISE|cFFC71585MEDIUMVIOLETRED|cFF191970MIDNIGHTBLUE|cFFF5FFFAMINTCREAM');
DEFAULT_CHAT_FRAME:AddMessage('|cFFFFE4E1MISTYROSE|cFFFFE4B5MOCCASIN|cFFFFDEADNAVAJOWHITE|cFF000080NAVY');
 DEFAULT_CHAT_FRAME:AddMessage( '|cFFFDF5E6OLDLACE|cFF808000OLIVE|cFF6B8E23OLIVEDRAB|cFFFFA500ORANGE');
DEFAULT_CHAT_FRAME:AddMessage('|cFFFF4500ORANGERED|cFFDA70D6ORCHID|cFFEEE8AAPALEGOLDENROD|cFF98FB98PALEGREEN');
DEFAULT_CHAT_FRAME:AddMessage(  '|cFFAFEEEEPALETURQUOISE|cFFDB7093PALEVIOLETRED|cFFFFEFD5PAPAYAWHIP|cFFFFDAB9PEACHPUFF');
DEFAULT_CHAT_FRAME:AddMessage(  '|cFFCD853FPERU|cFFFFC0CBPINK|cFFDDA0DDPLUM|cFFB0E0E6POWDERBLUE');
DEFAULT_CHAT_FRAME:AddMessage('|cFF800080PURPLE|cFFFF0000RED|cFFBC8F8FROSYBROWN|cFF4169E1ROYALBLUE');
DEFAULT_CHAT_FRAME:AddMessage( '|cFF8B4513SADDLEBROWN|cFFFA8072SALMON|cFFF4A460SANDYBROWN|cFF2E8B57SEAGREEN');
DEFAULT_CHAT_FRAME:AddMessage( '|cFFFFF5EESEASHELL|cFFA0522DSIENNA|cFFC0C0C0SILVER|cFF87CEEBSKYBLUE');
DEFAULT_CHAT_FRAME:AddMessage('|cFF6A5ACDSLATEBLUE|cFF708090SLATEGRAY|cFFFFFAFASNOW|cFF00FF7FSPRINGGREEN');
DEFAULT_CHAT_FRAME:AddMessage('|cFF4682B4STEELBLUE|cFFD2B48CTAN|cFF008080TEAL|cFFD8BFD8THISTLE');
DEFAULT_CHAT_FRAME:AddMessage('|cFFFF6347TOMATO|c00FFFFFFTRANSPARENT|cFF40E0D0TURQUOISE|cFFEE82EEVIOLET');
 DEFAULT_CHAT_FRAME:AddMessage('|cFFF5DEB3WHEAT|cFFFFFFFFWHITE|cFFF5F5F5WHITESMOKE|cFFFFFF00YELLOW');
DEFAULT_CHAT_FRAME:AddMessage( '|cFF9ACD32YELLOWGREEN');

end
--local IconMiniMap = CreateMMB();
--local SettingsFrame = CreateSettingsFrame();


function CreateSettingsFrame_old()
	
	local frame = AceGUI:Create("Frame");
	--local buttonAdded = false;
	
	frame:SetTitle("LFG sorter");
	frame:SetStatusText(L["?????????????????? LFG sorter"]);
	frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
	--frame:SetLayout("List");
	frame:SetLayout("Fill");
	frame:SetWidth(1000)
	frame:SetHeight(550)
	
	TopFrame = AceGUI:Create("InlineGroup");
	TopFrame:SetLayout("Flow") 

	LeftFrame = AceGUI:Create("InlineGroup");
	LeftFrame:SetLayout("List")


	local btn = AceGUI:Create("Button")
	btn:SetRelativeWidth(1)
	btn:SetText(L["Reset"])
	btn:SetCallback("OnClick", function() 
		AceGUI:Release(frame)
		CustomTable = NewCustomTable();
		CreateSettingsFrame();
		end)
	--group:AddChild(btn);
	
	LeftFrame:AddChild(btn);
	
	--LFGSort_Debug_Message(' channels settings ');
	for i,j in pairs(LFG_channels) do
		--LFGSort_Debug_Message(i..' - '..tostring(j))
		local chan = AceGUI:Create("CheckBox")
			chan:SetLabel(L['channel '..i]);
			chan:SetValue(j);
			chan:SetCallback("OnValueChanged", function(value)
				SetChannel(i);
			end);
			chan:SetRelativeWidth(0.6);
			LeftFrame:AddChild(chan)
	
	end
	
	sounds_list = {}
	sounds_list[0] = "No sound"
	sounds_list[678] = "Money ding"
	sounds_list[12188] = "GUILD_VAULT_OPEN "
	sounds_list[12867] = "ALARM 2 "
	sounds_list[5274] = "AUCTION OPEN"
	sounds_list[8458] = "PVP ENTER QUEUE"
	sounds_list[18871] = "ALARM 1"
	sounds_list[8959] = "RAID WARNING"
	sounds_list[416] = "Murloc Aggro"
	sounds_list["Interface\\AddOns\\LFGSort\\res\\Ding.mp3"] = "Ding"
	sounds_list["Interface\\AddOns\\LFGSort\\res\\gunshot.mp3"] = "Gunshot"
	sounds_list["Interface\\AddOns\\LFGSort\\res\\mew.mp3"] = "Mew"
	sounds_list["Interface\\AddOns\\LFGSort\\res\\owl.mp3"] = "Owl"
	sounds_list["Interface\\AddOns\\LFGSort\\res\\Rooster.mp3"] = "Rooster"
	sounds_list["Interface\\AddOns\\LFGSort\\res\\train.mp3"] = "Train"
	sounds_list["Interface\\AddOns\\LFGSort\\res\\waterdrop.mp3"] = "Waterdrop"
	sounds_list["Interface\\AddOns\\LFGSort\\res\\Woohoo.mp3"] = "Woohoo";
	sounds_list["Interface\\AddOns\\LFGSort\\res\\Xylo.mp3"] = "Xylo";
	sounds_list["Interface\\AddOns\\LFGSort\\res\\aoogah.mp3"] = "aoogah";
	
	local dingSelection = AceGUI:Create("Dropdown")

		dingSelection:SetList(sounds_list)
        dingSelection:SetLabel(L["Select ding sound"])
        dingSelection:SetValue(DingSound)
		dingSelection:SetRelativeWidth(1)
		dingSelection:SetCallback("OnValueChanged", function(wig, event_name, value)

				DingSound = value
				LFGSetSound(value)
				LFGPlaySound(value, "Master")
			end)
        LeftFrame:AddChild(dingSelection)

	lfgsChatFrame = nil
	
	for index = 1, FCF_GetNumActiveChatFrames() + 1  do -- NUM_CHAT_WINDOWS
		local f_name = GetChatWindowInfo(index)

		if f_name == "LFGS" then
			lfgsChatFrame = _G["ChatFrame" .. index]
		end
	end	
	ChatGroup = AceGUI:Create("InlineGroup"); --InlineGroup
		ChatGroup:SetLayout("List")	
		ChatGroup:SetRelativeWidth(1)
	
	local chatDesc1 = AceGUI:Create("Label")
	chatDesc1:SetText(L['AboutNewFrame']);
	chatDesc1:SetRelativeWidth(1)
	ChatGroup:AddChild(chatDesc1)
	
		
	local btn_chat = AceGUI:Create("Button")
	btn_chat:SetRelativeWidth(1)
	btn_chat:SetText(L["CreateChatFrame"])
	btn_chat:SetCallback("OnClick", function()
			if lfgsChatFrame == nil then
		
				lfgsChatFrame = FCF_OpenNewWindow("LFGS", true)
				ChatFrame_AddChannel(lfgsChatFrame, L['GENERAL'])
				ChatFrame_AddChannel(lfgsChatFrame, L['TRADE'])
				ChatFrame_AddChannel(lfgsChatFrame, L['LookingForGroup'])
				
				FCF_SetLocked( lfgsChatFrame, nil );
				lfgsChatFrame:ClearAllPoints()
				FCF_UnDockFrame( lfgsChatFrame );
				lfgsChatFrame:SetPoint("BOTTOMLEFT", _G["ChatFrame" .. 1], "TOPLEFT");

				lfgsChatFrame:SetUserPlaced( true );	
				
				ReloadUI()

			end
		end)
	
	ChatGroup:AddChild(btn_chat);
	
	local btn_chat_del = AceGUI:Create("Button")
	btn_chat_del:SetText(L["DeleteChatFrame"])
	btn_chat_del:SetRelativeWidth(1)
	btn_chat_del:SetCallback("OnClick", function()
				ChatFrame_RemoveAllChannels(lfgsChatFrame);	
				FCF_Close(lfgsChatFrame);
				lfgsChatFrame = nil	
		end)
	
	ChatGroup:AddChild(btn_chat_del);
		
	local chatDesc2 = AceGUI:Create("Label")
	if lfgsChatFrame == nil then
		chatDesc2:SetText(L['ReloadRequired']);
	else
		chatDesc2:SetText(L['FrameExists']);
	end
	chatDesc2:SetRelativeWidth(1)
	ChatGroup:AddChild(chatDesc2)
	
	
	LeftFrame:AddChild(ChatGroup);
	RightFrame = AceGUI:Create("InlineGroup");	
	RightFrame:SetLayout("Fill")
	Tabs = AceGUI:Create("TabGroup");
	
	Tab_list = {}
	for l,m in pairs(LFG_Settings_Pages) do
		Tab_list[l] = m[3];
	end
	Tabs:SetLayout("Flow")
	Tabs:SetTabs(Tab_list);
	--Tabs:SetFullHeight(true);
	--Tabs:SetFullWidth(true)
	
	Tabs:SetCallback('OnGroupSelected', fill_page)
	Tabs:SelectTab(1)
		
	--Tabs:SetFullHeight(true);

	--frame:SetFullHeight(true);
	--TopFrame:SetFullHeight(true);
	--LeftFrame:SetFullHeight(true);
	--RightFrame:SetFullHeight(true);

	
	RightFrame:AddChild(Tabs);
	
	LeftFrame:SetRelativeWidth(0.22)
	RightFrame:SetRelativeWidth(0.78)
	
	TopFrame:AddChild(LeftFrame);
	TopFrame:AddChild(RightFrame);
	
	frame:AddChild(TopFrame);
	
	_G["LFGFrame_ala"] = frame.frame
	tinsert(UISpecialFrames, "LFGFrame_ala")
end

function CreateSettingsFrame_noting()
	
	local frame = AceGUI:Create("Frame");
	--local buttonAdded = false;
	
	frame:SetTitle("LFG sorter");
	frame:SetStatusText(L["?????????????????? LFG sorter"]);
	frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
	frame:SetLayout("Fill");
	frame:SetWidth(850)
	--frame:SetHeight(550)
	frame:SetFullHeight(true);
	
	MainFrame = AceGUI:Create("SimpleGroup");
	MainFrame:SetLayout("Flow") 

	LeftFrame = AceGUI:Create("SimpleGroup");
	LeftFrame:SetLayout("List")
	LeftFrame:SetRelativeWidth(0.15);
	
	RightFrame = AceGUI:Create("SimpleGroup");
	RightFrame:SetLayout("Flow")
	RightFrame:SetRelativeWidth(0.80);
	MainFrame:SetFullWidth(true);
	MainFrame:AddChild(LeftFrame)
	MainFrame:AddChild(RightFrame)
	
	fillLeftGrp(LeftFrame)
	
	Tabs = AceGUI:Create("TabGroup");
	
	Tab_list = {}
	for l,m in pairs(LFG_Settings_Pages) do
		Tab_list[l] = m[3];
	end
	Tabs:SetLayout("Flow")
	Tabs:SetTabs(Tab_list);
	--Tabs:SetFullHeight(true);
	Tabs:SetFullWidth(true)
	
	--Tabs:ClearAllPoints()
	--Tabs:SetPoint("TOPRIGHT", "UIParent", "TOPRIGHT");
	--Tabs:SetPoint("BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT");
	--RightFrame:ClearAllPoints()
	--RightFrame:SetPoint("TOPRIGHT", "UIParent", "TOPRIGHT");
	--RightFrame:SetPoint("BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT");
	
	Tabs:SetCallback('OnGroupSelected', fill_page)
	Tabs:SelectTab(1)
	RightFrame:AddChild(Tabs)
	frame:AddChild(MainFrame)
	_G["LFGFrame_ala"] = frame.frame
	tinsert(UISpecialFrames, "LFGFrame_ala")
end


