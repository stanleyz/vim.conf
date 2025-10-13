local function noDelayKeyStroke(modifiers, character)
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

local altH = hs.hotkey.new({'alt'}, 'h', keyCode('left') ,  nil,   keyCode('left'))
local altJ = hs.hotkey.new({'alt'}, 'j', keyCode('down') ,  nil,   keyCode('down'))
local altK = hs.hotkey.new({'alt'}, 'k', keyCode('up')   ,  nil,   keyCode('up'))
local altL = hs.hotkey.new({'alt'}, 'l', keyCode('right'),  nil,   keyCode('right'))
local altI = hs.hotkey.new({'alt'}, 'i', keyCode('pageup'),  nil,   keyCode('pageup'))
local altO = hs.hotkey.new({'alt'}, 'o', keyCode('pagedown'),  nil,   keyCode('pagedown'))
local altU = hs.hotkey.new({'alt'}, 'u', keyCode('home'))
local altP = hs.hotkey.new({'alt'}, 'p', keyCode('end'))
local altQ = hs.hotkey.bind({'alt'}, 'q', function() hs.caffeinate.lockScreen() end)

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
local ctrlU = hs.hotkey.new({'ctrl'}, 'u', keyCodeWithCommand('delete'))
local ctrlW = hs.hotkey.new({'ctrl'}, 'w', keyCodeWithOption('delete'))
local function ctrlUWEnable() 
	ctrlU:enable()
	ctrlW:enable()
end
local function ctrlUWDisable() 
	ctrlU:disable()
	ctrlW:disable()
end

local wf = hs.window.filter
local term_wf = wf.new('Terminal', 'Chromium')
term_wf:subscribe(wf.windowFocused, ctrlUWDisable):subscribe(wf.windowUnfocused, ctrlUWEnable)

local utm_wf = wf.new('UTM')
utm_wf:subscribe(wf.windowFocused, function() toggleGlobalDirectionKeys(false); ctrlUWDisable() end)
utm_wf:subscribe(wf.windowUnfocused, function() toggleGlobalDirectionKeys(true); ctrlUWEnable() end)

-- Define Ctrl+A and Ctrl+E for them to be enabled in MS Outlook
local ctrlA = hs.hotkey.new({"ctrl"}, 'a', keyCode('home'))
local ctrlB = hs.hotkey.new({"ctrl"}, 'b', keyCode('left'))
local ctrlE = hs.hotkey.new({"ctrl"}, 'e', keyCode('end'))
local ctrlF = hs.hotkey.new({"ctrl"}, 'f', keyCode('right'))
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

local outlook_wf = wf.new('Microsoft Outlook')
outlook_wf:subscribe(wf.windowFocused, ctrlAEEnable):subscribe(wf.windowUnfocused, ctrlAEDisable)

local logger = hs.logger.new("hello", "info")

-- The following code turns ctrl to esc when tap but ctrl when holding ctrl
-- And also fire ctrl when holding esc but esc when tap esc
local otherKeyDown = false
local escapeViaCtrl = false
local escapeDown = false

-- Function to handle keyboard events
local function handleKeyboardEvent(event)
	local keyCode = event:getKeyCode()
	local eventType = event:getType()
	
	-- Only cares about keyUp event on esc really to reset escapeDown to false
	if keyCode == hs.keycodes.map.escape and eventType == hs.eventtap.event.types.keyUp then
		escapeDown = false
		return false
	end

	if keyCode == hs.keycodes.map.ctrl or keyCode == hs.keycodes.map.rightctrl then
		-- Only check when Ctrl is released
		if not event:getFlags().ctrl then
			if otherKeyDown then
				-- reset otherKeyDown back to no since ctrl is released, back to start
				-- This is chosen when ctrl is released after it was used as modifier
				otherKeyDown = false
			else
				-- Ctrl is released without any key down, so fire escape
				hs.eventtap.event.newKeyEvent({}, hs.keycodes.map.escape, true):post()
				hs.eventtap.event.newKeyEvent({}, hs.keycodes.map.escape, false):post()
				-- Signal to tell this escape is fake from Ctrl
				escapeViaCtrl = true
				-- Continue the normal event handling
				return false
			end
		end
		-- Reset status in all other situations
		escapeViaCtrl = false
	elseif keyCode == hs.keycodes.map.escape then
		-- If escape is fired from ctrl, stop processing the rest
		if escapeViaCtrl then return false end
		if eventType == hs.eventtap.event.types.keyDown then escapeDown = true end
	else
		if event:getFlags().ctrl then
			-- Other keys down while holding ctrl
			otherKeyDown = true
		else
			-- other keys down without holding ctrl
			-- This is chosen when ctrl is released as a modifer before keys, very rare, however need to capture in case both ctrl is release nano seconds before other keys
			-- Also is chosen when ctrl is not in the picture, just to reset the state to its original
			otherKeyDown = false
			if escapeDown then
				hs.eventtap.event.newKeyEvent({'ctrl'}, keyCode, true):post()
				hs.eventtap.event.newKeyEvent({'ctrl'}, keyCode, false):post()
				return true
			end
		end
	end

    -- Continue with normal event handling
    return false
end

-- Create and start the event tap
ctrlEscModTap = hs.eventtap.new(
    { hs.eventtap.event.types.flagsChanged, hs.eventtap.event.types.keyDown, hs.eventtap.event.types.keyUp },
    handleKeyboardEvent
)

ctrlEscModTap:start()
