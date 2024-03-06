var v;v=argument0
if global.paused or global.stopped {
return lengthdir_x(1,current_time*0.05+v)
}
else {
var formula;formula = (ord(string_char_at(global.FMODbuf,argument0*(128/__visual_freq)))/127) - 1
//if floor(formula*2) = -1 then return 0
return formula
// if n <= 0 then wave is negative
//otherwise its positive
}
