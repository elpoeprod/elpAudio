#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
sprite_index=global.__ico_admus
draw=0

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

if click=1 and alarm[0]<30 alarm[0]=1

if draw=1 {
select=show_menu('Add file|Add folder|Add URL|Show files',-1)
if select=0 {
file=get_open_filename('All supported files|*.aiff;*.asf;*.asx;*.dls;*.flca;*.fsb;*.it;*.m3u;*.midi;*.mpd;*.mp3;*.mp3;*.ogg;*.opus;*.pls;*.s3m;*.vag;*.wav;*.wax;*.wma;*.xm;*.raw;*.iff','')
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
if myurl='' nothing=1 else {
_connect=httprequest_create()
httprequest_connect(_connect,httprequest_urlencode(myurl,0),0)
mfile=buffer_create()
while true {
    httprequest_update(_connect);
    st = httprequest_get_state(_connect);
    if st=4 or st=5 {
        break;
    }
    sleep(10);
}
if st=5 {
    show_message("Internet-download failed.#Your url: "+myurl);
} else {
    //show_message("Downloading succeeded.");
    httprequest_get_message_body_buffer(_connect,mfile)
    var f;f=working_directory+'\music_examples\http_'+string(irandom_range(10000,100000))+filename_ext(myurl)
    buffer_save(mfile,f)
    ds_list_add(global.list,f)
}
buffer_destroy(mfile)
httprequest_destroy(_connect)
}
}
if select=3 {
execute_program('explorer.exe','/root,"'+global.dirr+'"',0)
}
/*if select=4 {
ds_list_clear(global.list)
}*/
draw=0
}
