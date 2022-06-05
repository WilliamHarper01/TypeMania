-- Screen Filter
-- Based on moonlight by AJ 187
-- and default_plus_5 by Dreamwoods, Default Extended by A.C and DDR 2013 By Strider.

local t = Def.ActorFrame {}
local Player = ...;
assert(...);

local st = GAMESTATE:GetCurrentStyle():GetStepsType();
local IsUsingCenter1Player = PREFSMAN:GetPreference('Center1Player');
local NumPlayers = GAMESTATE:GetNumPlayersEnabled();
local NumSides = GAMESTATE:GetNumSidesJoined();
local pname = ToEnumShortString(Player);

-- Filter x position load from metrics.ini
local function FilterPosition()
	if IsUsingCenter1Player and NumPlayers == 1 and NumSides == 1 then return SCREEN_CENTER_X; end;
	local strPlayer = (NumPlayers == 1) and "OnePlayer" or "TwoPlayers";
	local strSide = (NumSides == 1) and "OneSide" or "TwoSides";
	return THEME:GetMetric("ScreenGameplay","Player".. pname .. strPlayer .. strSide .."X");
end;

local bScreenFilter = ScreenFilter(Player);

local function Update(self)
	local song = GAMESTATE:GetCurrentSong();
	local start = song:GetFirstBeat();
	local last = song:GetLastBeat();
	if (GAMESTATE:GetSongBeat() >= last) then
		self:visible(false);
	elseif (GAMESTATE:GetSongBeat() >= start-8) then
		self:visible(true);
	else
		self:visible(false);
	end;
end;


return Def.Sprite {
		InitCommand=function(self)
			self:y(_screen.cy):zoom(1); --:SetUpdateFunction(Update)
			if st=='StepsType_Dance_Double' then
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/dance_filter0000_filter_double.png"));
					self:x(_screen.cx);
				else
					self:Load(THEME:GetPathB("ScreenGameplay","underlay/ScreenFilter/dance_filter0000_filter.png"));
					self:x(FilterPosition());
				end;
			if bScreenFilter == "OFF" then
				self:diffusealpha(0);
			elseif bScreenFilter == "DARK" then
				self:diffusealpha(0.5);
			elseif bScreenFilter == "DARKER" then
				self:diffusealpha(0.7);
			elseif bScreenFilter == "DARKEST" then
				self:diffusealpha(0.9);
			end;
		end;
};