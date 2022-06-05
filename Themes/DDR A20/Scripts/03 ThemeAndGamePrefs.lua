function Player_ComboUnderField()
	return GetUserPrefB("FirstReMIX_ComboUnderField")
end
function Player_JudgmentUnderField()
	return GetUserPrefB("FirstReMIX_JudgmentUnderField")
end
function Background_ShowDancingCharacters()
	return GetUserPrefB("FirstReMIX_ShowDancingCharacters")
end
function Game_BeatBars()
	return GetUserPrefB("FirstReMIX_BeatBars")
end
function Game_ShockArrows()
	return GetUserPrefB("FirstReMIX_ShockArrows")
end

function ScreenGameplay_P1X()
	local st = GAMESTATE:GetCurrentStyle():GetStepsType();
	if st == "StepsType_Dance_Solo" then
		return SCREEN_CENTER_X;
	elseif st == "StepsType_Dance_Couple" then
		return WideScale(SCREEN_CENTER_X-180,SCREEN_CENTER_X-160);
	else
		return WideScale(SCREEN_CENTER_X-180,SCREEN_CENTER_X-240);
	end
end
function ScreenGameplay_P2X()
	local st = GAMESTATE:GetCurrentStyle():GetStepsType();
	if st == "StepsType_Dance_Solo" then
		return SCREEN_CENTER_X;
	elseif st == "StepsType_Dance_Couple" then
		return WideScale(SCREEN_CENTER_X+180,SCREEN_CENTER_X+160);
	else
		return WideScale(SCREEN_CENTER_X+180,SCREEN_CENTER_X+240);
	end
end

function RollingNumbersJudgment_TextFormat()
	if GAMESTATE:IsCourseMode() or (Var "LoadingScreen") == "ScreenEvaluationSummary2" or (Var "LoadingScreen") == "ScreenEvaluationSummary2Rave" then
		return "%05.0f";
	else
		return "%04.0f";
	end;
end

-- from _fallback
-- ソングオプション用、タイトルが英語
function FirstReMIX_ComboJudgmentUnderField()
	local t = {
		Name = "FirstReMIX_ComboJudgmentUnderField";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {THEME:GetString("OptionNames","Background"),THEME:GetString("OptionNames","Foreground")};
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("FirstReMIX_ComboUnderField") ~= nil and ReadPrefFromFile("FirstReMIX_JudgmentUnderField") ~= nil then
				if GetUserPref("FirstReMIX_ComboUnderField")=='true' and GetUserPref("FirstReMIX_JudgmentUnderField")=='true' then
					list[1] = true
				elseif GetUserPref("FirstReMIX_ComboUnderField")=='false' and GetUserPref("FirstReMIX_JudgmentUnderField")=='false' then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("FirstReMIX_ComboUnderField",true);
				WritePrefToFile("FirstReMIX_JudgmentUnderField",true);
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("FirstReMIX_ComboUnderField",true);
				WritePrefToFile("FirstReMIX_JudgmentUnderField",true);
			elseif list[2] then
				WritePrefToFile("FirstReMIX_ComboUnderField",false);
				WritePrefToFile("FirstReMIX_JudgmentUnderField",false);
			else
				WritePrefToFile("FirstReMIX_ComboUnderField",true);
				WritePrefToFile("FirstReMIX_JudgmentUnderField",true);
			end;
			THEME:ReloadMetrics();
		end;
	};
	setmetatable( t, t );
	return t;
end

function FirstReMIX_BeatBars()
	local t = {
		Name = "BeatBars";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {THEME:GetString("OptionNames","BeatBarsOff"),THEME:GetString("OptionNames","BeatBarsOn")};
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("FirstReMIX_BeatBars") ~= nil then
				if GetUserPref("FirstReMIX_BeatBars")=='false' then
					list[1] = true
				elseif GetUserPref("FirstReMIX_BeatBars")=='true' then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("FirstReMIX_BeatBars",false);
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("FirstReMIX_BeatBars",false);
			elseif list[2] then
				WritePrefToFile("FirstReMIX_BeatBars",true);
			else
				WritePrefToFile("FirstReMIX_BeatBars",false);
			end;
			THEME:ReloadMetrics();
		end;
	};
	setmetatable( t, t );
	return t;
end

function FirstReMIX_ShockArrows()
	local t = {
		Name = "ShockArrows";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {THEME:GetString("OptionNames","ShockArrowsOff"),THEME:GetString("OptionNames","ShockArrowsOn")};
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("FirstReMIX_ShockArrows") ~= nil then
				if GetUserPref("FirstReMIX_ShockArrows")=='false' then
					list[1] = true
				elseif GetUserPref("FirstReMIX_ShockArrows")=='true' then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("FirstReMIX_ShockArrows",false);
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("FirstReMIX_ShockArrows",false);
			elseif list[2] then
				WritePrefToFile("FirstReMIX_ShockArrows",true);
			else
				WritePrefToFile("FirstReMIX_ShockArrows",false);
			end;
			THEME:ReloadMetrics();
		end;
	};
	setmetatable( t, t );
	return t;
end

function FirstReMIX_Cutin()
	local t = {
		Name = "Cutin";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {THEME:GetString("OptionNames","CutinOff"),THEME:GetString("OptionNames","CutinOn")};
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("FirstReMIX_Cutin") ~= nil then
				if GetUserPref("FirstReMIX_Cutin")=='false' then
					list[1] = true
				elseif GetUserPref("FirstReMIX_Cutin")=='true' then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("FirstReMIX_Cutin",false);
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("FirstReMIX_Cutin",false);
			elseif list[2] then
				WritePrefToFile("FirstReMIX_Cutin",true);
			else
				WritePrefToFile("FirstReMIX_Cutin",false);
			end;
			THEME:ReloadMetrics();
		end;
	};
	setmetatable( t, t );
	return t;
end

function FirstReMIX_Boom()
	local t = {
		Name = "BoomType";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = {THEME:GetString("OptionNames","BOOM1"),THEME:GetString("OptionNames","BOOM2")};
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("FirstReMIX_Boom") ~= nil then
				if GetUserPref("FirstReMIX_Boom")=='false' then
					list[1] = true
				elseif GetUserPref("FirstReMIX_Boom")=='true' then
					list[2] = true
				else
					list[1] = true
				end
			else
				WritePrefToFile("FirstReMIX_Boom",false);
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				WritePrefToFile("FirstReMIX_Boom",false);
			elseif list[2] then
				WritePrefToFile("FirstReMIX_Boom",true);
			else
				WritePrefToFile("FirstReMIX_Boom",false);
			end;
			THEME:ReloadMetrics();
		end;
	};
	setmetatable( t, t );
	return t;
end