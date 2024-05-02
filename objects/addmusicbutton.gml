#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
sprite_index=global.__ico_admus
draw=0

button[0]='Add file...'
button[1]='Add folder...'
button[2]='Add from internet...'
button[3]='Clear playlist'
buttons=4

add=0
click=0

showagain=1
image_blend=__butaddmuscol

globalvar __pl_window;__pl_window=-1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if click>1 {
file=get_open_filename('All supported files|*.mp3;*.ogg;*.wav;*.m4v;*.mp3;*.opus;*.mp2;*.3gp;*.mod;*.xm;*.etm;*.stm;*.s3m;*.it;*.mus;*.wasd;*.flac','')
if file='' nothing=1 else ds_list_add(global.list,file)}
else draw=1
click=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///FILE DRAGGING
if file_drag_count()<=0 exit
i=0
repeat(file_drag_count()) {
ds_list_add(global.list,file_drag_name(i))
i+=1
}
if global.list_size>file_drag_count()
global.current=global.list_size-file_drag_count()+1
else global.current=0

if global.play mus_stop()
mus_play(ds_list_find_value(global.list,global.current))
file_drag_clear()
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !window_get_active() exit
image_index=1
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !window_get_active() exit
image_index=0
if click=0 alarm[0]=60
click+=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
addx=sprite_width
maxx=max(string_width(button[0]),string_width(button[1]),string_width(button[2]),string_width(button[3]))+4
addy=60

if click=1 and alarm[0]<30 alarm[0]=1

if draw=1 {
select=show_menu('Add file|Add folder|Add URL|Show files|Clear playlist|Show Playlist',-1)
if select=0 {
file=get_open_filename('All supported files|*.mp3;*.ogg;*.wav;*.m4v;*.mp3;*.opus;*.mp2;*.3gp;*.mod;*.xm;*.etm;*.stm;*.s3m;*.it;*.mus;*.wasd;*.flac','')
if file='' nothing=1 else ds_list_add(global.list,file)
}
if select=1 {
folder=get_directory_alt('Add folder to your playlist!','')
//show_message(folder)
if folder='' nothing=1 else {
get_music_from(folder+'\')
}
}
if select=2 {
myurl=get_string('Type in the URL to add music from','https://elpoepgames.site/elpAudio/music/welcome.mp3')
if myurl='' nothing=1 else ds_list_add(global.list,myurl)
}
if select=3 {
execute_program('explorer.exe','/root,"'+global.dirr+'"',0)
}
if select=4 {
ds_list_clear(global.list)
}
if select=5 {
//execute_program(global.__progdir+'data\elpAudioList.exe','',0)
__pl_window=gmSDL_windowCreate(window_get_x(),window_get_y()+window_get_height(),global.plrwidth,global.plrheight,0)
gmSDL_windowTitleSet(__pl_window,"Playlist Manager")
spr=gmSDL_spriteLoad(__pl_window,"themes\winamp_modern\playlist\pl_front.png",0)
}
draw=0
}
if __pl_window!=-1 {
gmSDL_windowUpdate(__pl_window)
gmSDL_spriteDraw(__pl_window,spr,0,0)
}
