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
image_index=1
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
enter=0
//global.settings=!global.settings
/*if custom=0 {if global.settings instance_deactivate_object(thebutton)
else {instance_activate_object(thebutton)}
}
with aboutbutton instance_destroy()
with checkbox instance_destroy()
nope=1*/
execute_program('data\settings.exe','',0)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.settings {
if custom=0 {
draw_set_color(global.frontcol)//merge_color_normal(c_white,merge_color(c_fuchsia,c_aqua,0.5+lengthdir_x(0.35,current_time*0.05+90)),0.25))
draw_rectangle(-1,16,x-1,room_height,0)
draw_set_color(c_white)
if nope {instance_create(x-100,room_height-32,aboutbutton)
me=instance_create(10,20,checkbox)
me.text='Text speed: '+string(__speed)
me.opt=-1
me.on=0

/*me=instance_create(10,32,checkbox)
me.text='Press here to restart program'
me.opt=0
me.on=0*/

me=instance_create(10,44,checkbox)
me.text='Select custom theme...'
me.opt=1
me.on=0

nope=0}
}
else {
draw_set_color(c_white)
if sprite_exists(custombgimg) and custombgimg>-1 draw_sprite_stretched_ext(custombgimg,0,custombgx,custombgy,custombgw,custombgh,c_white,1)
if sprite_exists(customimg) and customimg>-1 draw_sprite_stretched_ext(customimg,0,customx,customy,customw,customh,c_white,1)

if nope {instance_create(customx+100,customy+64,aboutbutton)
me=instance_create(customx+10,customy+20,checkbox)
me.text='Text speed: '+string(__speed)
me.opt=-1
me.on=0

/*me=instance_create(10,32,checkbox)
me.text='Press here to restart program'
me.opt=0
me.on=0*/

me=instance_create(customx+10,customy+32,checkbox)
me.text='Select custom theme...'
me.opt=1
me.on=0

nope=0}

}

}
draw_self()
