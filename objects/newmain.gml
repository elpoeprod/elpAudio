#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !registry_exists_ext('elpAudio','work_dir') registry_write_string_ext('elpAudio','work_dir',working_directory)
set_working_directory(registry_read_string_ext('elpAudio','work_dir'))
globalvar __enablefloat,__stopsongafter,__speed,__visualiser;
__enablefloat=0
__stopsongafter=0
__visualiser=0
__speed=15 // Default is 15
settings_load()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
view_stabilize()
