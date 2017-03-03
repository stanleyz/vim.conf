local function keyCode(key)
  return function() hs.eventtap.keyStroke({}, key) end
end
hs.hotkey.bind({"alt"}, 'h', keyCode('left') ,  nil,   keyCode('left'))
hs.hotkey.bind({"alt"}, 'j', keyCode('down') ,  nil,   keyCode('down'))
hs.hotkey.bind({"alt"}, 'k', keyCode('up')   ,  nil,   keyCode('up'))
hs.hotkey.bind({"alt"}, 'l', keyCode('right'),  nil,   keyCode('right'))
hs.hotkey.bind({"alt"}, 'i', keyCode('pageup'),  nil,   keyCode('pageup'))
hs.hotkey.bind({"alt"}, 'o', keyCode('pagedown'),  nil,   keyCode('pagedown'))
hs.hotkey.bind({"alt"}, 'u', keyCode('home'))
hs.hotkey.bind({"alt"}, 'p', keyCode('end'))
