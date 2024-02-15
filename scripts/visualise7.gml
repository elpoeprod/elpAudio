if width<320 or height<240 {
draw_text(x+1,y+1,'Visualiser should be#at least 320x240px#to use this#visualiser.')
exit
}

var wavel,waver,specl,specr,maxs,maxw;
maxs = 128//256;
maxw=256;
var i,ii,xx,yy,w,h;
w = argument3;
h=argument4
xx = argument1;
yy = argument2

if !variable_local_exists('vissurf') vissurf=surface_create(w,h)
if !variable_local_exists('vissurf2') vissurf2=surface_create(w,h)

surface_copy(vissurf2,0,0,vissurf)
surface_set_target(vissurf)

surface_reset_target()
draw_set_color(c_white)
