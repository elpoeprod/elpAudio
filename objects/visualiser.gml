#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dir=random(1000)
xx=0
myh=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.play myinst=global.playing
else myinst=noone
if !surface_exists(surf1) {
surf1=surface_create(width,height)
}
if !surface_exists(surf2) {
surf2=surface_create(width,height)
}
if global.play {
if __visualiser=0 {
surface_copy(surf2,0,0,surf1)
surface_set_target(surf1)
//draw_clear_alpha(global.visbgcol,0.8)
draw_surface_ext(surf2,0,0,1,1,0,c_white,0.97)
snapinstance(myinst,0,0,width,height)
surface_reset_target()
}
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=global.visualx
y=global.visualy
width=global.visualw
height=global.visualh

draw_set_color(global.visbgcol)
draw_set_alpha(1)

if usebgvisimg==0 {
draw_rectangle(x,y,x+width,y+height,0)
} else {
if sprite_exists(visbgimg) and visbgimg>-1 {
draw_sprite_stretched_ext(visbgimg,0,x+visbgx,y+visbgy,visbgw,visbgh,c_white,1)
}
}

draw_set_color(c_white)

if !surface_exists(surf1) {
surf1=surface_create(width,height)
}
if !surface_exists(surf2) {
surf2=surface_create(width,height)
}
var hhh;hhh=5
if global.play {
switch (__visualiser) {
    case 0: draw_surface_ext(surf1,x,y,1,1,0,c_white,1);break;
    case 1: visualise2(myinst,x+width/2,y+height/2,width,height);break;
    case 2: visualise3(myinst,x,y,width,height);break;
    case 3: visualise4(myinst,x,y,width,height);break;
    case 4: visualise5(myinst,x,y,width,height);break;
    case 5: visualise6(myinst,x,y,width,height);break;
//    case 5: visualise6(x,y);break;
    default: break;
    }
}
if usefgvisimg {
if sprite_exists(visfgimg) and visfgimg>-1 {
draw_sprite_stretched_ext(visfgimg,0,x+visfgx,y+visfgy,visfgw,visfgh,c_white,1)
}
}
//draw_circle(abs(lengthdir_x(display_get_width(),current_time*0.075)),140,50,0)
