noDelayKeyStroke = function(modifiers, character)
	local event = require("hs.eventtap").event
	event.newKeyEvent(modifiers, string.lower(character), true):post()
	event.newKeyEvent(modifiers, string.lower(character), false):post()
end
local function keyCode(key)
	return function() noDelayKeyStroke({}, key) end
end
local function keyCodeWithCommand(key)
	return function() noDelayKeyStroke({'command'}, key) end
end
local function keyCodeWithOption(key)
	return function() noDelayKeyStroke({'option'}, key) end
end
local function keyCodeWithCtrl(key)
	return function() noDelayKeyStroke({'ctrl'}, key) end
end

hs.hotkey.bind({"alt"}, 'h', keyCode('left') ,  nil,   keyCode('left'))
hs.hotkey.bind({"alt"}, 'j', keyCode('down') ,  nil,   keyCode('down'))
hs.hotkey.bind({"alt"}, 'k', keyCode('up')   ,  nil,   keyCode('up'))
hs.hotkey.bind({"alt"}, 'l', keyCode('right'),  nil,   keyCode('right'))
hs.hotkey.bind({"alt"}, 'o', keyCode('pagedown'),  nil,   keyCode('pagedown'))
hs.hotkey.bind({"alt"}, 'u', keyCode('home'))
hs.hotkey.bind({"alt"}, 'p', keyCode('end'))

-- Define Ctrl+U and Ctrl+W for them to be enabled in Terminal only
ctrlU = hs.hotkey.new({"ctrl"}, 'u', keyCodeWithCommand('delete'))
ctrlW = hs.hotkey.new({"ctrl"}, 'w', keyCodeWithOption('delete'))
local function ctrlUWEnable() 
	ctrlU:enable()
	ctrlW:enable()
end
local function ctrlUWDisable() 
	hs.hotkey.disableAll({'ctrl'}, 'u')
	hs.hotkey.disableAll({'ctrl'}, 'w')
end

terminalWindowfilter = hs.window.filter.new('Terminal')
terminalWindowfilter:subscribe(hs.window.filter.windowFocused, function() ctrlUWDisable() end)
terminalWindowfilter:subscribe(hs.window.filter.windowUnfocused, function() ctrlUWEnable() end)

local focusedWindow = hs.window.focusedWindow()
if focusedWindow and focusedWindow:application():name() ~= "Terminal" then
	hs.hotkey.bind({"ctrl"}, 'u', keyCodeWithCommand('delete'))
	hs.hotkey.bind({"ctrl"}, 'w', keyCodeWithOption('delete'))
end

-- Define Ctrl+A and Ctrl+E for them to be enabled in Terminal only
ctrlA = hs.hotkey.new({"ctrl"}, 'a', keyCode('home'))
ctrlE = hs.hotkey.new({"ctrl"}, 'e', keyCode('end'))
local function ctrlAEEnable() 
	ctrlA:enable()
	ctrlE:enable()
end
local function ctrlAEDisable() 
	hs.hotkey.disableAll({'ctrl'}, 'a')
	hs.hotkey.disableAll({'ctrl'}, 'e')
end

terminalWindowfilter = hs.window.filter.new('Microsoft Outlook')
terminalWindowfilter:subscribe(hs.window.filter.windowFocused, function() ctrlAEEnable() end)
terminalWindowfilter:subscribe(hs.window.filter.windowUnfocused, function() ctrlAEDisable() end)

local focusedWindow = hs.window.focusedWindow()
if focusedWindow and focusedWindow:application():name() ~= "Microsoft Outlook" then
	hs.hotkey.bind({"ctrl"}, 'a', keyCode('home'))
	hs.hotkey.bind({"ctrl"}, 'e', keyCode('end'))
end
