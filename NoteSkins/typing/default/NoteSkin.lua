local ret = ... or {};

ret.RedirTable =
{
	Q = "Alt",
	A = "Home",
	Z = "Alt",
	W = "AltIndex",
	S = "Index",
	X = "AltIndex",
	E = "Alt",
	D = "Home",
	C = "Alt",
	R = "AltIndex",
	F = "Index",
	V = "AltIndex",
	T = "Alt",
	G = "Home",
	B = "Alt",
	Y = "Alt",
	H = "Home",
	N = "Alt",
	U = "AltIndex",
	J = "Index",
	M = "AltIndex",
	I = "Alt",
	K = "Home",
	O = "AltIndex",
	L = "Index",
	P = "Alt",
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
	Z = 180,
	W = 0,
	S = 0,
	X = 180,
	E = 0,
	D = 0,
	C = 180,
	R = 0,
	F = 0,
	V = 180,
	T = 0,
	G = 0,
	B = 180,
	Y = 0,
	H = 0,
	N = 180,
	U = 0,
	J = 0,
	M = 180,
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
