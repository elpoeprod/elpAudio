#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
message_caption(1,'elpAudio Message')
message_text_font('Open Sans',10,c_white,0)
message_input_font('Open Sans',10,c_white,0)
message_button_font('Open Sans',12,c_white,0)
if !registry_exists_ext('elpAudio','FIRST_TIME_DISABLE') {
registry_write_real_ext('elpAudio','FIRST_TIME_DISABLE',1)
show_message('Welcome to elpAudio!#elpAudio is a simple audio-player using#FMOD Sound System.#Linux build can work incorrect!')
}
if os_type==os_win32 or os_type==os_win64 {
if !registry_exists_ext('elpAudio','work_dir') {
if parameter_count()>0 {
show_message('elpAudio ERROR:#Open elpAudio first!##elpAudio will now close.')
ngame_end()
exit
} else
registry_write_string_ext('elpAudio','work_dir',working_directory)
} else {
if registry_read_string_ext('elpAudio','work_dir')!=working_directory and parameter_count()<1
registry_write_string_ext('elpAudio','work_dir',working_directory)
}
set_working_directory(registry_read_string_ext('elpAudio','work_dir'))
}
//else if os_type==os_linux set_working_directory('/usr/bin/share/elpaudio-data')
global.is_stereo=0
settings_load()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
view_stabilize()
