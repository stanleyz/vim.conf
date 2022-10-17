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

altH = hs.hotkey.new({"alt"}, 'h', keyCode('left') ,  nil,   keyCode('left'))
altJ = hs.hotkey.new({"alt"}, 'j', keyCode('down') ,  nil,   keyCode('down'))
altK = hs.hotkey.new({"alt"}, 'k', keyCode('up')   ,  nil,   keyCode('up'))
altL = hs.hotkey.new({"alt"}, 'l', keyCode('right'),  nil,   keyCode('right'))
altI = hs.hotkey.new({"alt"}, 'i', keyCode('pageup'),  nil,   keyCode('pageup'))
altO = hs.hotkey.new({"alt"}, 'o', keyCode('pagedown'),  nil,   keyCode('pagedown'))
altU = hs.hotkey.new({"alt"}, 'u', keyCode('home'))
altP = hs.hotkey.new({"alt"}, 'p', keyCode('end'))

local function toggleGlobalDirectionKeys(enabled)
  if enabled then
    altH:enable()
    altJ:enable()
    altK:enable()
    altL:enable()
    altI:enable()
    altO:enable()
    altU:enable()
    altP:enable()
  else
    altH:disable()
    altJ:disable()
    altK:disable()
    altL:disable()
    altI:disable()
    altO:disable()
    altU:disable()
    altP:disable()
  end
end

toggleGlobalDirectionKeys(true)

-- Define Ctrl+U and Ctrl+W for them to be enabled in Terminal only
ctrlU = hs.hotkey.new({"ctrl"}, 'u', keyCodeWithCommand('delete'))
ctrlW = hs.hotkey.new({"ctrl"}, 'w', keyCodeWithOption('delete'))
local function ctrlUWEnable() 
	ctrlU:enable()
	ctrlW:enable()
end
local function ctrlUWDisable() 
	ctrlU:disable()
	ctrlW:disable()
end

terminalWindowfilter = hs.window.filter.new('Terminal', 'Chromium')
terminalWindowfilter:subscribe(hs.window.filter.windowFocused, function() ctrlUWDisable() end)
terminalWindowfilter:subscribe(hs.window.filter.windowUnfocused, function() ctrlUWEnable() end)

terminalWindowfilter = hs.window.filter.new('UTM')
terminalWindowfilter:subscribe(hs.window.filter.windowFocused, function() toggleGlobalDirectionKeys(false); ctrlUWDisable() end)
terminalWindowfilter:subscribe(hs.window.filter.windowUnfocused, function() toggleGlobalDirectionKeys(true); ctrlUWEnable() end)

-- Define Ctrl+A and Ctrl+E for them to be enabled in MS Outlook
ctrlA = hs.hotkey.new({"ctrl"}, 'a', keyCode('home'))
ctrlB = hs.hotkey.new({"ctrl"}, 'b', keyCode('left'))
ctrlE = hs.hotkey.new({"ctrl"}, 'e', keyCode('end'))
ctrlF = hs.hotkey.new({"ctrl"}, 'f', keyCode('right'))
local function ctrlAEEnable() 
	ctrlA:enable()
	ctrlB:enable()
	ctrlE:enable()
	ctrlF:enable()
end
local function ctrlAEDisable() 
	ctrlA:disable()
	ctrlB:disable()
	ctrlE:disable()
	ctrlF:disable()
end

terminalWindowfilter = hs.window.filter.new('Microsoft Outlook')
terminalWindowfilter:subscribe(hs.window.filter.windowFocused, function() ctrlAEEnable() end)
terminalWindowfilter:subscribe(hs.window.filter.windowUnfocused, function() ctrlAEDisable() end)

--[[
-- Comment out for now normally we don't need this since Hammerspoon is auto-started on boot
local focusedWindow = hs.window.focusedWindow()
if focusedWindow and focusedWindow:application():name() ~= "Microsoft Outlook" then
	ctrlA:enable()
	ctrlB:enable()
	ctrlE:enable()
	ctrlF:enable()
end
--]]
