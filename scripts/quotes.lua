--[[
	Famous and Inspiring quote script by Colin J.D. Stewart
	Compatability: Nemesis DC Hub

	# Changes:
		# 22.03.2017: Official Release v.1.0.0.0
		# 06.11.2015: Creation.
]]

dofile("./scripts/quotes_data/config.lua");
dofile("./scripts/quotes_data/q.dat");

sendRandomQuoteToAll = function()
	local byWho = math.random(#keys);
	local tb = quotes[keys[byWho]].text; 
	local q = tb[math.random(#tb)];

	Hub.SendToAll(Hub.BotName, '"'..q..'" - '..keys[byWho]);

	return false; --// returning true will turn off timer
end;

function getAbout()
	return "Famous and Inspiring quote script by Colin J.D. Stewart";
end;

function onTimer()
	sk = sk +1; --// simpler and faster than comparing time difference.
	if sk == 60*timer then
		sk = 0;
		sendRandomQuoteToAll();
	end;
end;

function onLoad()
	keys = {};
	quote_count = 0;
	sk = 0;
	i = 1;

	for k,_ in pairs(quotes) do
		keys[i] = k;
		quote_count = quote_count + #quotes[k].text;
		i = i + 1;
	end;

	Hub.SendToAll(Hub.BotName, 'Quote bot loaded '..quote_count..' quotes from '..i..' people!');

	return 0;
end;

function onUnload()
	--if tmr ~= nil then
	--	tmr.Stop();
	--end;
end;

function onTextCommand(user, cmd, text)
	--// todo...
end;
