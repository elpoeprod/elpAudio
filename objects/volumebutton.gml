#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
can=0
sprite_index=global.__ico_volbt
image_blend=__butvolcol
#define Mouse_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
can=1
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//can=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
slw=sprite_get_width(global.__ico_slide2)
if
point_in_rectangle(mouse_x,mouse_y,//display_mouse_get_x(),display_mouse_get_y(),
x-can*100,y-can*100,x+sprite_width+can*100,y+sprite_height+can*100)
{
if mouse_check_button(mb_left) {
global.volume=clamp(mouse_x-x,0,sprite_width)*(100/sprite_width)
FMODMasterSetVolume((global.volume)/100)
} else can=0
}

draw_self()
draw_sprite_ext(global.__ico_slide2,0,x+clamp(global.volume*(sprite_width/100),slw/2,sprite_width-slw/2),y+sprite_height/2,1,1,0,__butslidercol,1)
