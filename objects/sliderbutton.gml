#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
can=0
global.pos=0
sprite_index=global.__ico_slid2
image_blend=__butslidecol
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
/*if global.play {
if FMODInstanceGetPosition(global.playing)>=1 {if global.current<ds_list_size(global.list)-1
global.current+=1 else global.current=0
if global.play mus_stop()
mus_play(ds_list_find_value(global.list,global.current))
}
}*/
slw=sprite_get_width(global.__ico_slide)

if global.play {if !file_is_tracker(global.thesong) {
global.pos=(FMODInstanceGetPosition(global.playing)*(sprite_width))-slw/2
} else global.pos=50
}
draw_self()
myx=clamp(x+global.pos,x+slw/2,x+sprite_width-slw/2)
draw_sprite_ext(global.__ico_slide,1,myx,y+sprite_height/2,1,1,0,__butslidercol,1)

if
point_in_rectangle(mouse_x,mouse_y,//display_mouse_get_x(),display_mouse_get_y(),
x,y,x+sprite_width,y+sprite_height) and !file_is_tracker(global.thesong)
and global.play
{
mypos=clamp(mouse_x-x,3,sprite_width-3)-3
if mouse_check_button_pressed(mb_left) {
FMODInstanceSetPosition(global.playing,(mypos)/(sprite_width-6))
}
mx1=4
mx2=100
tx=10
if mouse_x+100>view_wview[0] {mx1=-4 mx2=-100 tx=-96}
draw_set_color(c_white)
draw_rectangle(mouse_x+mx1,mouse_y-24,mouse_x+mx2,mouse_y-4,0)
draw_set_color(c_black)
draw_rectangle(mouse_x+mx1,mouse_y-24,mouse_x+mx2,mouse_y-4,1)
draw_set_font(global.__fon_cap)
draw_text(mouse_x+tx,mouse_y-22,current_time_format2( ((mypos)/(sprite_width-6))*global.songlength) )
draw_set_color(c_white)
}
