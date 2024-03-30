var v;v=argument0
if global.paused or global.stopped {
return 0.5+lengthdir_x(0.5,current_time*0.05+v)
}
else {
var i,myres;i=0;myres=0;
repeat(floor(256/__visual_freq)) {
myres+=string_ord_at(global.FMODbuf,(argument0*floor(256/__visual_freq))+i)
i+=1
}
//myres/=floor(256/__visual_freq)//__visual_freq
return (myres/floor(256/__visual_freq))/240
}
