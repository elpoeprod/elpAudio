var v;v=argument0
if global.paused or global.stopped {
return lengthdir_x(1,current_time*0.05+v)-0.015
}
else {
//this is fucked up may god have a mercy on this
//oh god this works
var i,myres;i=0;myres=0;
repeat(floor(256/__visual_freq)) {
myres+=string_ord_at(global.FMODbuf,(argument0*floor(256/__visual_freq))+i)
i+=1
}
return lengthdir_y(1,2*(myres*2.8125)) //fine pitch
}
