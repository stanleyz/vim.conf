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
ctrlU = hs.hotkey.new({"ctrl"}, 'u', keyCodeWithCommand('delete'))
ctrlW = hs.hotkey.new({"ctrl"}, 'w', keyCodeWithOption('delete'))

local function ctrlUWDelete() 
	ctrlU:enable()
	ctrlW:enable()
end
local function ctrlUW() 
	hs.hotkey.disableAll({'ctrl'}, 'u')
	hs.hotkey.disableAll({'ctrl'}, 'w')
end

hs.hotkey.bind({"alt"}, 'h', keyCode('left') ,  nil,   keyCode('left'))
hs.hotkey.bind({"alt"}, 'j' keyCode('down') ,  nil,   keyCode('down'))
hs.hotkey.bind({"alt"}, 'k', keyCode('up')   ,  nil,   keyCode('up'))
hs.hotkey.bind({"alt"}, 'l', keyCode('right'),  nil,   keyCode('right'))
hs.hotkey.bind({"alt"}, 'o', keyCode('pagedown'),  nil,   keyCode('pagedown'))
hs.hotkey.bind({"alt"}, 'u', keyCode('home'))
hs.hotkey.bind({"alt"}, 'p', keyCode('end'))

terminalWindowfilter = hs.window.filter.new('Terminal')
terminalWindowfilter:subscribe(hs.window.filter.windowFocused, function() ctrlUW() end)
terminalWindowfilter:subscribe(hs.window.filter.windowUnfocused, function() ctrlUWDelete() end)

local focusedWindow = hs.window.focusedWindow()
if focusedWindow and focusedWindow:application():name() ~= "Terminal" then
	hs.hotkey.bind({"ctrl"}, 'u', keyCodeWithCommand('delete'))
	hs.hotkey.bind({"ctrl"}, 'w', keyCodeWithOption('delete'))
end
