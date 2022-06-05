--Here you can change your region (country, town, world, etc.)
local t = Def.ActorFrame {};

if lang == "en" or lang == "kor" then
--English and Korean language
t[#t+1] = LoadFont("region 20px")..{
	InitCommand=function(s) 
	--The only thing that you have to do, is change the region in English on this part:
	s:settext("CHANGE ME!")
	-- Now you have your exactly region!.
	s:zoom(1):y(1):maxwidth(70) end,
};
elseif lang == "jp" then
--Japanese language
t[#t+1] = LoadFont("region 20px")..{
	InitCommand=function(s)
	--The only thing that you have to do, is change the region in Japanese on this part:
	s:settext("CHANGE ME!")
	-- Now you have your exactly region in Japanese!.
	s:zoomy(0.7):zoomx(1):y(2):maxwidth(70) end,
};
end;

return t;