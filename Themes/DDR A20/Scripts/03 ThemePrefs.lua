-- sm-ssc Default Theme Preferences Handler

-- Example usage of new system (not really implemented yet)
local Prefs =
{
	AutoSetStyle =
	{
		Default = false,
		Choices = { "ON", "OFF" },
		Values = { true, false }
	},
	Language = 
	{
		Default = "jp",
		Choices = {"Japanese","English", "Korean"},
		Values = {"jp","en","kor"}
	},
	Game = 
	{
		Default = "GOLD",
		Choices = { "GOLD", "BLUE", },
		Values 	= { "GOLD", "BLUE", },
	},
	Version =
	{
		Default = "A20",
		Choices = { "A20", "A20 PLUS", },
		Values = { "A20", "A20 PLUS",  }
	},
	BoomType =
	{
		Default = "A",
		Choices = { "2014", "A", },
		Values = { "2014", "A",  }
	},
	Cutin =
	{
		Default = "OFF",
		Choices = { "OFF", "ON", },
		Values = { "OFF", "ON",  }
	},
}

ThemePrefs.InitAll(Prefs)

lang = "jp_"
function ChangeLanguage()
	if ThemePrefs.Get("Language") == "jp" then
		lang = "jp"
	elseif ThemePrefs.Get("Language") == "kor" then
		lang = "kor"
	else
		lang="en"
	end
end

ddrgame = "gold_"
function ChangeGame()
		if ThemePrefs.Get("Game") == "GOLD" then
		ddrgame = "gold_"
		else
		ddrgame = "blue_"
	end
end

version = "A20_"
function ChangeVersion()
		if ThemePrefs.Get("Version") == "A20" then
		version = "A20_"
		else
		version = "A20+_"
	end
end

boom = "(2014)"
function ChangeBoom()
		if ThemePrefs.Get("BoomType") == "2014" then
		boom = "(2014)"
		else
		boom = "(A)"
	end
end

cutin = "OFF"
function ChangeCutin()
		if ThemePrefs.Get("Cutin") == "OFF" then
		cutin = "OFF"
		else
		cutin = "ON"
	end
end


function InitUserPrefs()
	local Prefs = {
		UserPrefGameplayShowStepsDisplay = true,
		UserPrefGameplayShowStepsDisplay = true,
		UserPrefGameplayShowScore = false,
		UserPrefScoringMode = 'DDR Extreme',
		UserPrefShowLotsaOptions = true,
		UserPrefAutoSetStyle = false,
		UserPrefLongFail = false,
		UserPrefNotePosition = true,
		UserPrefComboOnRolls = false,
		UserPrefProtimingP1 = false,
		UserPrefProtimingP2 = false,
		UserPrefGameplayShowCalories=true,
		UserPrefGameplayShowFastSlow=true,
		FlashyCombos = false,
		UserPrefComboUnderField = true,
		UserPrefFancyUIBG = true,
		UserPrefTimingDisplay = true
	}
	for k, v in pairs(Prefs) do
		-- kind of xxx
		local GetPref = type(v) == "boolean" and GetUserPrefB or GetUserPref
		if GetPref(k) == nil then
			SetUserPref(k, v)
		end
	end
	-- screen filter
	setenv("ScreenFilterP1",0)
	setenv("ScreenFilterP2",0)
end

--ScreenFilter from DDR 2013 By Strider
-- Screen Filter
function FirstReMIX_ScreenFilter()
	local t = {
		Name = "FirstReMIX_ScreenFilter";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = false;
		ExportOnChange = true;
		Choices = {"OFF", "DARK", "DARKER", "DARKEST"};
		LoadSelections = function(self, list, pn)
			local pname = ToEnumShortString(pn);
			local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
			if PROFILEMAN:IsPersistentProfile(pn) then
				if ReadPrefFromFile("FirstReMIX_ScreenFilter_"..profileGUID) ~= nil then
					if GetUserPref("FirstReMIX_ScreenFilter_"..profileGUID)=='OFF' then
						list[1] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..profileGUID)=='DARK' then
						list[2] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..profileGUID)=='DARKER' then
						list[3] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..profileGUID)=='DARKEST' then
						list[4] = true
					end
				else
					WritePrefToFile("FirstReMIX_ScreenFilter_"..profileGUID, 'OFF');
					list[1] = true
				end;
			else
				if ReadPrefFromFile("FirstReMIX_ScreenFilter_"..pname) ~= nil then
					if GetUserPref("FirstReMIX_ScreenFilter_"..pname)=='OFF' then
						list[1] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..pname)=='DARK' then
						list[2] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..pname)=='DARKER' then
						list[3] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..pname)=='DARKEST' then
						list[4] = true
					end
				else
					WritePrefToFile("FirstReMIX_ScreenFilter_"..pname, 'OFF');
					list[1] = true
				end;
			end;
		end;
		SaveSelections = function(self, list, pn)
			local val;
			local pname = ToEnumShortString(pn);
			local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
			if list[1] then
				val='OFF';
			elseif list[2] then
				val='DARK';
			elseif list[3] then
				val='DARKER';
			elseif list[4] then
				val='DARKEST';
			end;
			if PROFILEMAN:IsPersistentProfile(pn) then
				WritePrefToFile("FirstReMIX_ScreenFilter_"..profileGUID, val);
			else
				WritePrefToFile("FirstReMIX_ScreenFilter_"..pname, val);
			end;
		end
	}
	setmetatable(t, t)
	return t
end

--[[ option rows ]]
function ReadOrCreateAppearancePlusValueForPlayer(PlayerUID, MyValue)
	local AppearancePlusFile = RageFileUtil:CreateRageFile()
	if AppearancePlusFile:Open("Save/AppearancePlus/"..PlayerUID..".txt",1) then 
		local str = AppearancePlusFile:Read();
		MyValue =str;
	else
		AppearancePlusFile:Open("Save/AppearancePlus/"..PlayerUID..".txt",2);
		AppearancePlusFile:Write("Visible");
		MyValue="Visible";
	end
	AppearancePlusFile:Close();
	return MyValue;
end

function SaveAppearancePlusValueForPlayer( PlayerUID, MyValue)

	
	local AppearancePlusFile2 = RageFileUtil:CreateRageFile();
	AppearancePlusFile2:Open("Save/AppearancePlus/"..PlayerUID..".txt",2);
	AppearancePlusFile2:Write(tostring(MyValue));
	AppearancePlusFile2:Close();
end
--AppearancePlus
function OptionRowAppearancePlusUseFile()
	local t = {
		Name="AppearancePlus",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = false,
		ExportOnChange = false,
		Choices = { "Visible", 'Hidden', 'Sudden', 'Stealth', 'Hidden+', 'Sudden+', 'Hidden+&Sudden+', },
		LoadSelections = function(self, list, pn)
			local AppearancePlusValue = "Visible";
			local pf = PROFILEMAN:GetProfile(pn);
			local PlayerUID = "";
			
			if pf then 
				PlayerUID = pf:GetGUID()  
				AppearancePlusValue = ReadOrCreateAppearancePlusValueForPlayer(PlayerUID,AppearancePlusValue);
			else
				PlayerUID = "UnknownPlayerUID"
				AppearancePlusValue = "Visible";
			end
			
			if AppearancePlusValue ~= nil then
				if AppearancePlusValue == "Hidden" then
					list[2] = true
				elseif AppearancePlusValue == "Sudden" then
					list[3] = true
				elseif AppearancePlusValue == "Stealth" then
					list[4] = true
				elseif AppearancePlusValue == "Hidden+" then
					list[5] = true
				elseif AppearancePlusValue == "Sudden+" then
					list[6] = true
				elseif AppearancePlusValue == "Hidden+&Sudden+" then
					list[7] = true
				else
					list[1] = true
				end
			else
				SaveAppearancePlusValueForPlayer(PlayerUID,"Visible")
				list[1] = true
			end
			
		end,
		SaveSelections = function(self, list, pn)
			local pName = ToEnumShortString(pn)
			local found = false
			local PlayerUID = "";
			local pf = PROFILEMAN:GetProfile(pn);
			
			if pf then 
				PlayerUID = pf:GetGUID()  
			else
				PlayerUID = "UnknownPlayerUID"
			end
			
			for i=1,#list do
				if not found then
					if list[i] == true then
						local val = "Visible";
						if i==2 then
							val = "Hidden";
						elseif i==3 then
							val = "Sudden";
						elseif i==4 then
							val = "Stealth";
						elseif i==5 then
							val = "Hidden+";
						elseif i==6 then
							val = "Sudden+";
						elseif i==7 then
							val = "Hidden+&Sudden+";
						else
							val = "Visible";
						end
						setenv("AppearancePlus"..pName,val)
						SaveAppearancePlusValueForPlayer(PlayerUID,val)
						found = true
						break;
					end
				end
			end
		end,
	};
	setmetatable(t, t)
	return t
end

--GameplayShowFastSlow
function UserPrefGameplayShowFastSlow()
	local t = {
		Name = "UserPrefGameplayShowFastSlow",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = true,
		ExportOnChange = false,
		Choices = {
			THEME:GetString('OptionNames','Off'),
			THEME:GetString('OptionNames','On')
		},
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("UserPrefGameplayShowFastSlow") ~= nil then
				if GetUserPrefB("UserPrefGameplayShowFastSlow") then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("UserPrefGameplayShowFastSlow", true)
				list[2] = true
			end
		end,
		SaveSelections = function(self, list, pn)
			local val = list[2] and true or false
			WritePrefToFile("UserPrefGameplayShowFastSlow", val)
			MESSAGEMAN:Broadcast("PreferenceSet", { Message == "Set Preference" })
			THEME:ReloadMetrics()
		end
	}
	setmetatable(t, t)
	return t
end

--[[ end option rows ]]
