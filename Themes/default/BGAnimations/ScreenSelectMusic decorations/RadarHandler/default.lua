/*

local pn = ({...})[1] --only argument to file
local GR = {
    {0,-80, "Stream"}, --STREAM
    {-82,-34, "Voltage"}, --VOLTAGE
    {-68,32, "Air"}, --AIR
    {68,32, "Freeze"}, --FREEZE
    {82,-34, "Chaos"}, --CHAOS
};

local label = Def.ActorFrame{};

for i,v in ipairs(GR) do
    label[#label+1] = Def.ActorFrame{
        OnCommand=function(s)
            s:xy(v[1],v[2])
            :diffusealpha(0):sleep(0.2):linear(0.1):diffusealpha(0.75):linear(0.1):diffusealpha(0):linear(0.1):diffusealpha(1)
        end;
        Def.ActorFrame{
            Def.Sprite{
                Texture=ddrgame.."base",
            };
            Def.Sprite{
                Texture=v[3],
            };
        };
        Def.BitmapText{
            Font="_russell square 16px";
            InitCommand=function(s) s:strokecolor(color("#1f1f1f")):xy(18,22):halign(1) end,
            SetCommand=function(s)
                local song = GAMESTATE:GetCurrentSong();
                if song then
                    local steps = GAMESTATE:GetCurrentSteps(pn)
                    local Value = steps:GetRadarValues(pn):GetValue('RadarCategory_'..v[3])
                    local RadarDDRNum = math.floor(Value*100)
                    s:settext(RadarDDRNum)
				else
				s:settext("0")
                end
            end,
            CurrentSongChangedMessageCommand=function(s) s:queuecommand("Set") end,
            ["CurrentSteps"..ToEnumShortString(pn).."ChangedMessageCommand"]=function(s) s:queuecommand("Set") end,
            ["CurrentTrail"..ToEnumShortString(pn).."ChangedMessageCommand"]=function(s) s:queuecommand("Set") end,
        };
    };
end

return Def.ActorFrame{
    OnCommand=function(s) s:diffusealpha(0):sleep(0.4):linear(0.05):diffusealpha(0.75):linear(0.1):diffusealpha(0.25):linear(0.1):diffusealpha(1) end,
    Def.ActorFrame{
        LoadActor("GrooveRadar base")..{
            OnCommand=function(s) s:zoom(0):sleep(0.4):linear(0.3):zoom(1) end,
        };
		create_ddr_groove_radar("radar",0,0,pn,60,color("#ffcf00"),{color("#ffcf00"),color("#ffcf00"),color("#ffcf00"),color("#ffcf00"),color("#ffcf00")})..{
            OnCommand=function(s) s:diffusealpha(0.75):zoom(0):sleep(0.4):linear(0.3):zoom(1) end,
        };
    };
    label;
};
