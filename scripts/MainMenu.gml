#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if !variable_global_exists('list') global.list=ds_list_create()

did=0
fade=1
hh=0
stri=0
alarm[0]=10
alarm[1]=10

if variable_global_exists('__init') {
if global.__init=1 {
LoadFMOD()
FMODinit(100,1)
}
} else {
LoadFMOD()
FMODinit(100,1)
global.__init=0

global.current=0
room_caption='elpAudio '+get_version()
global.play=0
global.songlength=0
global.pos=0
global.paused=0
global.stopped=0
global.trackname=''
global.playing=-1
global.themepath='themes\default\theme.ini'
global.current=0
global.thesong=''
global.played_from_arg=0

}

randomize()

window_set_chromakey(1,hex_to_col($014426))
message_position(window_get_x(),window_get_y()+window_get_height())
message_size(clamp(view_wview[0],400,900),clamp(view_hview[0],200,900))
global.changeview=1

pressed=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if parameter_count()>0 and global.played_from_arg==0 {mus_play(parameter_string(1)) global.played_from_arg=1}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
message_position(window_get_x(),window_get_y()+window_get_height())
alarm[1]=15
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !__enablefloat {
if global.play=0 room_caption='elpAudio '+get_version() else {
if file_is_tracker(global.thesong)
room_caption='elpAudio '+get_version()+' - PLAYING ('+string(global.current+1)+'/'+string(ds_list_size(global.list))+')'
else room_caption='['+current_time_format(FMODInstanceGetPosition(global.playing)*global.songlength)+' / '+current_time_format(global.songlength)+'] elpAudio '+get_version()+' - PLAYING ('+string(global.current+1)+'/'+string(ds_list_size(global.list))+')'
}
}
if window_get_taskbar_caption()!=room_caption
window_set_taskbar_caption(room_caption)
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if point_in_rectangle(
display_mouse_get_x(),display_mouse_get_y(),
window_get_x()+x-1000*pressed,window_get_y()+y-1000*pressed
,
window_get_x()+x+w-w/6+1000*pressed,window_get_y()+y+h+1000*pressed
)
{
if mouse_check_button(mb_left) {
if hh=0 {
mx=mouse_x
my=mouse_y
hh=1
}
window_set_position(display_mouse_get_x()-mx,
display_mouse_get_y()-my
)
pressed=1
} else {pressed=0 hh=0}
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//FMODUpdate()
#define Keyboard_17
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
exit
if keyboard_check_pressed(ord('N'))
{
global.dirr=get_string('Type n the new directory wherre to find music.','')

}
#define Keyboard_18
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keyboard_check_pressed(vk_f4) {
if global.play mus_stop()
FMODfree()
settings_save()
game_end()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Draw TOP MENU

view_stabilize()
if global.play {
if FMODInstanceIsPlaying(global.playing)=0 or FMODInstanceGetPosition(global.playing)=0.999 {
if __stopsongafter mus_stop() else {
if global.current<ds_list_size(global.list)-1 global.current+=1 else global.current=0
if global.play mus_stop()
MainMenu.stri=0
visualname.stri=0
visualname.xx=0
mus_play(ds_list_find_value(global.list,global.current))
}
}
}


if useimgforfront=0 {
draw_set_color(global.frontcol)
draw_rectangle(x,y,x+w,y+h,0)
} else if sprite_exists(global.__img_front) and global.__img_front>-1 {draw_set_color(c_white) draw_sprite_stretched_ext(global.__img_front,0,x,y,w,h,c_white,1)}
draw_set_alpha(1)
draw_set_color(global.captioncol)
draw_set_font(global.__fon_cap)
if drawcaption draw_text(x+4,y,room_caption)
draw_set_color(c_white)
#define KeyPress_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keyboard_check_pressed(vk_f7) and global.play {
if global.paused mus_unpause() else mus_pause()
}

if keyboard_check_pressed(vk_f5) and global.play mus_stop()
if keyboard_check_pressed(vk_f8) {
if global.current<ds_list_size(global.list)-1 global.current+=1 else global.current=0
if global.play mus_stop()
MainMenu.stri=0
visualname.stri=0
mus_play(ds_list_find_value(global.list,global.current))
}
if keyboard_check_pressed(vk_f6) {
if global.current>0 global.current-=1 else global.current=ds_list_size(global.list)-1
if global.play mus_stop()
MainMenu.stri=0
visualname.stri=0
mus_play(ds_list_find_value(global.list,global.current))
}
draw_set_color(c_white)
if keyboard_check_pressed(vk_f1) {
show_message(string_ext("Now playing: {0}#Song length:{1}#Frequency:{2}",global.trackname,current_time_format(FMODSoundGetLength(global.musicsound)),string(FMODInstanceGetFrequency(global.playing)/1000)+"KHz"))
}
