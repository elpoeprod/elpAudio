#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.dirr=working_directory
global.FMODbuf = string_repeat(chr(0), 256)
message_caption(1,'elpAudio Message')
//message_text_font('@ADMUI3Lg',10,c_white,0)
message_input_font('Open Sans',10,c_white,0)
message_button_font('MS UI Gothic',10,c_white,0)
if !registry_exists_ext('elpAudio','FIRST_TIME_DISABLE') {
registry_write_real_ext('elpAudio','FIRST_TIME_DISABLE',1)
show_message('Welcome to elpAudio!#elpAudio is a simple audio-player using#FMOD Sound System.#Linux build will be (very) soon.#Check out "elpoepgames.site" or git page "elpoeprod/elpAudio" for more info.')
}
message_caption(0,'')
//if debug_mode progdir=global.__progdir
if os_type=os_linux global.__progdir=string_replace_all(program_directory,'\','/')+'/elpAudio/'
set_working_directory(global.__progdir)
global.is_stereo=0
global.list_size=0
settings_load()
get_theme(global.themepath)
draw_set_circle_precision(64)
window_set_icon(icon_add(global.__progdir+'data\ico.ico'))
window_set_taskbar_icon(icon_add(global.__progdir+'data\ico.ico'))
file_drag_enable(1)
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//view_stabilize()
global.list_size=ds_list_size(global.list)
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if variable_global_exists('__sdl_init') gmSDL_close()
FMODfree()
UnloadFMOD()
