#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
enter=1
image_speed=0
sprite_index=global.__ico_prev
image_blend=__butprevcol
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
MainMenu.stri=0
visualname.stri=0
visualname.alarm[0]=1
visualname.xx=0
image_index=0
enter=0
if ds_list_size(global.list)<1 exit
v=global.current
if global.current=v and global.current>0 global.current-=1 else global.current=ds_list_size(global.list)-1
if global.play mus_stop()
mus_play(ds_list_find_value(global.list,global.current))
#define Mouse_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
enter=1
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
enter=0
