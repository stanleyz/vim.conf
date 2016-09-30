# This is a remap of some my favorite keys.
#
# Useful command in Linux are showkeys dumpkeys loadkeys
#
# You can also use console-setup to permanent this setting by appending 
# the following keymap to /etc/console-setup/remap.inc
keycode  1 = Caps_Lock        Caps_Lock        Caps_Lock       
	control	keycode  1 = Caps_Lock       
	shift	control	keycode  1 = Caps_Lock       
	alt	keycode  1 = Caps_Lock       
	control	alt	keycode  1 = Caps_Lock       
keycode  22 = +u               +U               +u              
	control	keycode  22 = Control_u       
	shift	control	keycode  22 = Control_u       
	alt	keycode  22 = Meta_u          
	control	alt	keycode  22 = Meta_Control_u  
	altgr keycode  22 = Home
keycode  23 = +i               +I               +i              
	control	keycode  23 = Tab             
	shift	control	keycode  23 = Tab             
	alt	keycode  23 = Meta_i          
	control	alt	keycode  23 = Meta_Tab        
	altgr keycode  23 = Prior
keycode  24 = +o               +O               +o              
	control	keycode  24 = Control_o       
	shift	control	keycode  24 = Control_o       
	alt	keycode  24 = Meta_o          
	control	alt	keycode  24 = Meta_Control_o  
	altgr keycode  24 = Next
keycode  25 = +p               +P               +p              
	control	keycode  25 = Control_p       
	shift	control	keycode  25 = Control_p       
	alt	keycode  25 = Meta_p          
	control	alt	keycode  25 = Meta_Control_p  
	altgr keycode  25 = End
keycode  35 = +h               +H               +h              
	control	keycode  35 = BackSpace       
	shift	control	keycode  35 = BackSpace       
	alt	keycode  35 = Meta_h          
	control	alt	keycode  35 = Meta_BackSpace  
	altgr keycode  35 = Left
keycode  36 = +j               +J               +j              
	control	keycode  36 = Linefeed        
	shift	control	keycode  36 = Linefeed        
	alt	keycode  36 = Meta_j          
	control	alt	keycode  36 = Meta_Linefeed   
	altgr keycode  36 = Down
keycode  37 = +k               +K               +k              
	control	keycode  37 = Control_k       
	shift	control	keycode  37 = Control_k       
	alt	keycode  37 = Meta_k          
	control	alt	keycode  37 = Meta_Control_k  
	altgr keycode  37 = Up
keycode  38 = +l               +L               +l              
	control	keycode  38 = Control_l       
	shift	control	keycode  38 = Control_l       
	alt	keycode  38 = Meta_l          
	control	alt	keycode  38 = Meta_Control_l
	altgr keycode  38 = Right
keycode   58 = Escape           Escape          
	alt	keycode   58 = Meta_Escape     
# Please use showkeys to find the keycode of your AltGr
keycode   125 = AltGr
