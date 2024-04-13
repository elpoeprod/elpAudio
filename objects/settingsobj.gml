#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
enter=0
global.settings=0
nope=1
sprite_index=global.__ico_stngs
image_blend=__butsettcol
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
enter=0
execute_program_silent(global.__progdir+'data\settings.exe')
