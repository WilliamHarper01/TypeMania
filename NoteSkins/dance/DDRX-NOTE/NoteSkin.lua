-- Haggen Daze

local ret = ... or {};

ret.RedirTable =
{
	Up = "Down",
	Down = "Down",
	Left = "Down",
	Right = "Down",
	UpLeft = "Down",
	UpRight = "Down",
};

local OldRedir = ret.Redir;
ret.Redir = function(sButton, sElement)
	-- To redirect files for Up to Down:
	-- if sButton == "Up" then sButton = "Down"; end

	if not (sElement == "Hold Body Active") and
	   not (sElement == "Hold Body Inactive") and
	   not (sElement == "Hold Bottomcap Active") and
	   not (sElement == "Hold Bottomcap Inactive")  and
	   not (sElement == "Roll Body Active") and
	   not (sElement == "Roll Body Inactive") and
	   not (sElement == "Roll Bottomcap Active") and
	   not (sElement == "Roll Bottomcap Inactive") and
	   not (sElement == "Tap Mine") 	   
	then
	--[[	sButton, sElement = OldRedir(sButton, sElement);
		sButton = ret.RedirTable[sButton];]]

		if sButton == "Up" or
		   sButton == "Left" or
		   sButton == "Right"
		then
		   sButton = "Down"; 
		end 
		if sButton == "UpRight"
		then
		   sButton = "UpLeft"
		end
	end

	return sButton, sElement;
end



--[[
local OldFunc = ret.Load;
function ret.Load()
	local t = OldFunc();

	-- The main "Explosion" part just loads other actors; don't rotate
	-- it.  The "Hold Explosion" part should not be rotated.
	if Var "Element" == "Explosion" or
	   Var "Element" == "Roll Explosion" then
		t.BaseRotationZ = nil;
	end
	return t;
end
]]

local OldFunc = ret.Load;
function ret.Load()
	local t = OldFunc();

	--Explosion should not be rotated; it calls other actors.
	if Var "Element" == "Explosion"	then
		t.BaseRotationZ = nil;
	end
	return t;
end

ret.PartsToRotate =
{
	["Tap Explosion Bright W1"] = true,
	["Tap Explosion Dim W1"] = true,
	["Tap Explosion_Bright W2"] = true,
	["Tap Explosion_Dim W2"] = true,
	["Tap Explosion_Bright W3"] = true,
	["Tap Explosion_Dim W3"] = true,


	["Receptor"] = true,
	["Go Receptor"] = true,
	["Ready Receptor"] = true,
	["Tap Explosion Bright"] = true,
	["Tap Explosion Dim"] = true,
	["Tap Note"] = true,
	["Tap Fake"] = true,
	["Tap Lift"] = true,
	["Hold Head Active"] = true,
	["Hold Head Inactive"] = true,
	["Roll Head Active"] = true,
	["Roll Head Inactive"] = true,
	["Hold Explosion"] = true,
	["Roll Explosion"] = true,
};
ret.Rotate =
{
	Up = 180,
	Down = 0,
	Left = 90,
	Right = -90,
	UpLeft = 135,
	UpRight = 225,
};

--
-- If a derived skin wants to have separate UpLeft graphics,
-- use this:
--
-- ret.RedirTable.UpLeft = "UpLeft";
-- ret.RedirTable.UpRight = "UpLeft";
-- ret.Rotate.UpLeft = 0;
-- ret.Rotate.UpRight = 90;
--
ret.Blank =
{

	["Tap Explosion Bright W4"] = true,
	["Tap Explosion Dim W4"] = true,
	["Tap Explosion Bright W5"] = true,
	["Tap Explosion Dim W5"] = true,

	["Hold Topcap Active"] = true,
	["Hold Topcap Inactive"] = true,
	["Roll Topcap Active"] = true,
	["Roll Topcap Inactive"] = true,
	["Hold Tail Active"] = true,
	["Hold Tail Inactive"] = true,
	["Roll Tail Active"] = true,
	["Roll Tail Inactive"] = true,
	["Roll Explosion"] = true,
};

return ret;
