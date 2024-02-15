#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !registry_exists_ext('elpAudio','work_dir') {
if parameter_count()>0 {
show_message('elpAudio ERROR:#Open elpAudio first! The prgram will close.')
ngame_end()
exit
} else
registry_write_string_ext('elpAudio','work_dir',working_directory)
}
set_working_directory(registry_read_string_ext('elpAudio','work_dir'))
global.is_stereo=0
settings_load()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
view_stabilize()
