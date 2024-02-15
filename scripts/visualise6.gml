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
draw_surface_ext(vissurf2,0,0,1,1,0,make_color_hsv(128+lengthdir_x(127,current_time*0.075),100,100),0.99)
draw_set_color(make_color_hsv(128+lengthdir_x(127,current_time*0.075+90),100,100))
draw_rectangle(0,0,w,h,0)
draw_set_color(make_color_hsv(128+lengthdir_x(127,current_time*0.075+45),100,100))
draw_triangle(15-random(7),15-random(7),30+random(7),30+random(7),random(45),random(45),0)
draw_triangle(40-random(7),40-random(7),60+random(7),60+random(7),random(120),random(120),0)
draw_triangle(120-random(7),120-random(7),240+random(7),240+random(7),random(320),random(320),0)
draw_triangle(0,0,random(w),random(h),0,h,0)
draw_triangle(w,0,w-random(w),random(h),w,h,0)

surface_reset_target()
draw_surface_ext(vissurf,xx,yy,1,1,0,c_white,1)
draw_set_color(c_white)
