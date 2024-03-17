local ret = ... or {};

ret.RedirTable =
{
	Q = "Down",
	A = "Down",
	Z = "Down",
	W = "Down",
	S = "Down",
	X = "Down",
	E = "Down",
	D = "Down",
	C = "Down",
	R = "Down",
	F = "Down",
	V = "Down",
	T = "Down",
	G = "Down",
	B = "Down",
	Y = "Down",
	H = "Down",
	N = "Down",
	U = "Down",
	J = "Down",
	M = "Down",
	I = "Down",
	K = "Down",
	O = "Down",
	L = "Down",
	P = "Down",
};

local OldRedir = ret.Redir;

ret.Redir = function(sButton, sElement)
	sButton, sElement = OldRedir(sButton, sElement);

	--Point the head files back to the tap note
	if string.find(sElement, "Head") or sElement == "Tap Fake" then
		sElement = "Tap Note";
	end

	sButton = ret.RedirTable[sButton];

	return sButton, sElement;
end

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

ret.PartsToRotate =
{
	["Receptor"] = true,
	["Tap Note"] = true,
	["Tap Lift"] = true,
	["Tap Fake"] = true,
	["Ready Receptor"] = true,
	["Tap Explosion Bright"] = true,
	["Tap Explosion Dim"] = true,
	["Hold Head Active"] = true,
	["Hold Head Inactive"] = true,
	["Roll Head Active"] = true,
	["Roll Head Inactive"] = true
};
ret.Rotate =
{
	Q = 0,
	A = 0,
	Z = 0,
	W = 0,
	S = 0,
	X = 0,
	E = 0,
	D = 0,
	C = 0,
	R = 0,
	F = 0,
	V = 0,
	T = 0,
	G = 0,
	B = 0,
	Y = 0,
	H = 0,
	N = 0,
	U = 0,
	J = 0,
	M = 0,
	I = 0,
	K = 0,
	O = 0,
	L = 0,
	P = 0,
};

ret.Blank =
{
	["Hold Explosion"] = true,
	["Roll Explosion"] = true,
	["Hold Topcap Active"] = true,
	["Hold Topcap Inactive"] = true,
	["Roll Topcap Active"] = true,
	["Roll Topcap Inactive"] = true,
	["Hold Tail Active"] = true,
	["Hold Tail Inactive"] = true,
	["Roll Tail Active"] = true,
	["Roll Tail Inactive"] = true,
};

return ret;
