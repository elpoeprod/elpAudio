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

showagain=1
image_blend=__butaddmuscol
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*file_drag_enable(1)
if file_drag_count()=0 exit

show_message(file_drag_name(0))
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
image_index=0
draw=!draw
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

if draw=1 {
select=show_menu('Add file|Add folder|Add URL|Show files|Clear playlist',-1)
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
myurl=get_string('Type in the URL to add music from','https://elpoepgames.site/elp-audio/music/welcome.mp3')
if myurl='' nothing=1 else ds_list_add(global.list,myurl)
}
if select=3 {
execute_program_silent('explorer.exe /select,"'+global.dirr+'"')
}
if select=4 {
if showagain result=show_message_ext('Are you really want to clear playlist?#(Recommending to save playlist before clear)','YES','DoNotShowAgain','Cancel')
else result=1
if result=1 {
ds_list_clear(global.list)
}
if result=2 {
ds_list_clear(global.list)
showagain=0
}
}
draw=0
}




/*if draw {
draw_set_color(c_white)
if x>view_wview[0]-sprite_width {
addx=-sprite_width
maxx=-max(string_width(button[0]),string_width(button[1]),string_width(button[2]),string_width(button[3]))-4
}
if y>view_hview[0]-60 addy=-60

//instance_deactivate_region(x+addx,y+addy,maxx,addy,1,1)

//draw_set_font(global.__fon_cap)

//draw_rectangle(x+addx,y+addy,x+addx+maxx,y,0)
//draw_set_color(c_black)
//i=0
//col=c_gray
/*repeat(buttons) {
if point_in_rectangle(mouse_x,mouse_y,x+addx,y+addy+i*14,x+addx+maxx,y+addy+(i+1)*14) {
select=clamp(floor((mouse_y-(y+addy))/14),0,buttons-1)
if mouse_check_direct(mb_left) col=c_dkgray
if mouse_check_button_released(mb_left) {draw=0
if select=-1 nothing=1
if select=0 {
file=get_open_filename('All files|*.*','')
if file='' nothing=1 else ds_list_add(global.list,file)
}
if select=1 {
folder=get_directory_alt('Add folder to your playlist','')
if folder='' nothing=1 else {
get_music_from(folder+'\')
}
}
if select=2 {
myurl=get_string('Type in the URL to add music from','https://soundcloud.com/gbsr/')
if myurl='' nothing=1 else ds_list_add(global.list,myurl)
}
if select=3 {
if showagain result=show_message_ext('Are you really want to clear playlist?#(Recommending to save playlist before clear)','YES','do not show again','Cancel')
else result=1
if result=1 {
ds_list_clear(global.list)
}
if result=2 {
ds_list_clear(global.list)
showagain=0
}
}
}
//} else select=-1

if i=select {
draw_set_color(col)
draw_rectangle(x+addx,y+addy+i*14,x+addx+maxx,y+addy+(i+1)*14,0)
}
draw_set_color(c_black)
draw_text(x+addx+2-maxx*is_negative(addx),y+addy+i*14,button[i])
i+=1
}
draw_set_color(c_white)
} else instance_activate_region(x+addx,y+addy,maxx,addy,1)*/
