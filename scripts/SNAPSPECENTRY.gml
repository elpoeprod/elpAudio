var v;v=argument0
if global.paused or global.stopped {
return 0.5+lengthdir_x(0.5,current_time*0.05+v)
}
else {
return ord(string_char_at(global.FMODbuf,argument0*floor(256/__visual_freq)))/240
}
