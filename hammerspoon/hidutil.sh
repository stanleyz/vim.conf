# To change key amppings
# 1. Left Ctrl to ESC
# 2. Right Option to Esc
# 3. Caps Lock to Left Ctrl
# 4. Right Command to Right Ctrl
# Please check doc:
# https://developer.apple.com/library/archive/technotes/tn2450/_index.html
# https://github.com/hetima/hammerspoon-foundation_remapping/blob/master/foundation_remapping.lua
# https://rakhesh.com/mac/using-hidutil-to-map-macos-keyboard-keys/
# https://hidutil-generator.netlify.app/
#
# To find product ID and Vendor ID of Apple built-in keyboard, go to:
# System Information -> SPI or USB
hidutil property --matching '{"ProductID":0x0281,"VendorID":0x5ac}' --get 'UserKeyMapping'

hidutil property --set '{
    "UserKeyMapping":[]
    }'

hidutil property --matching '{"ProductID":0x0281,"VendorID":0x5ac}' --set '{
    "UserKeyMapping":[
        {"HIDKeyboardModifierMappingSrc":0x7000000E0,"HIDKeyboardModifierMappingDst":0x700000029},
        {"HIDKeyboardModifierMappingSrc":0x7000000E6,"HIDKeyboardModifierMappingDst":0x700000029},
        {"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x7000000E0},
        {"HIDKeyboardModifierMappingSrc":0x7000000E7,"HIDKeyboardModifierMappingDst":0x7000000E4}
        ]
    }'

