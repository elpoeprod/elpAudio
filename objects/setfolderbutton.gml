#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
enter=0
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=1
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//abandoned and broken

/*image_index=0
enter=0
mydir=get_directory_alt('Select folder to get music from.','')
if mydir='' nothing=1 else {
//show_message(filename_path(mydir))
if global.play mus_stop()
global.dirr=mydir
global.current=0
get_music_from(global.dirr)
}
