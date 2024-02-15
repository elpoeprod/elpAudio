#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
alarm[0]=30
drawstr=''
mystr='WELCOME ! '
stri=0
xx=0
sprite_index=global.__floatbg
oldsurf=surface_create(oldfloatw,40)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.oldfloat==1 and global.play {
        str=ds_list_find_value(global.list,global.current)
        if floatdrawtime1 { // Draw with time
            if file_is_tracker(str) drawstr=string_repeat(filter(global.trackname)+'   ***   ',6)
            else drawstr=string_repeat(global.trackname+' ('+current_time_format2(global.songlength)+')   ***   ',6)
        } else { // Draw without time
            drawstr=string_repeat(global.trackname+'   ***   ',6)
        }
mystr=string_copy(drawstr,1+stri,30)//floor(oldfloatw/(string_width('a')-2)))
stri+=1
if stri>string_length(drawstr)/2 stri=0
}
alarm[0]=(15/__speed)*20

/*
if global.play {
    if global.oldfloat {
        if file_is_tracker(ds_list_find_value(global.list,global.current))
            mystr=string_repeat(string_repeat('     ',ceil(sprite_width/global.__fon_vis_size))+filter(global.trackname),2)
        else
            mystr=string_repeat(string_repeat('     ',ceil(sprite_width/global.__fon_vis_size))+filter(ds_list_find_value(global.list,global.current)),2)
        str=string_copy(mystr,1+stri,sprite_width)
        stri+=1
        if stri>string_length(mystr)
            stri=0
        drawstr=str
}
}
alarm[0]=__speed*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !surface_exists(oldsurf) oldsurf=surface_create(oldfloatw,40)
draw_set_font(global.__fon_vis)
surface_set_target(oldsurf)
draw_clear_alpha(0,0)
draw_set_color(global.floatcolor)
draw_set_halign(fa_left)

if global.oldfloat draw_text(0,6,mystr)
surface_reset_target()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_font(global.__fon_vis)

if usebgimg and sprite_exists(global.__floatbg) and global.__floatbg>0 {
draw_set_color(c_white)
draw_sprite_stretched_ext(global.__floatbg,0,x,y,width,height,__floatbgcol,1)
}/* else {
draw_set_color(global.floatbgcol)
draw_rectangle(x,y,x+width,y+height,0)
}*/
draw_set_color(global.floatcolor)
draw_set_halign(fa_left)
if global.oldfloat==0 and global.play {
if instance_exists(visualiser) and ontop==0 visualiser.depth=depth-1
str=global.thesong//ds_list_find_value(global.list,global.current)

if floatdrawtime1 { // Draw with time
if file_is_tracker(str) mystr=global.trackname
else mystr=global.trackname+' ('+current_time_format2(global.songlength)+')'
}
else { // Draw without the time
mystr=global.trackname
}

if floatiertext {if textx+string_width(mystr)>width xx-=__speed/15}
if xx<-string_width(mystr)-textx xx=width+10
//draw_text(x+xx,y+6,mystr)
}

if global.oldfloat==0 draw_text(x+textx+xx,y+texty+6,mystr)
else
draw_surface_ext(oldsurf,textx,texty,1,1,0,c_white,1)

if drawfloattime2 {
draw_set_font(time2font)
draw_set_color(floattime2col1)
draw_text(x+time2x,y+time2y,"88:88")
draw_set_color(floattime2col2)
if global.play {
if file_is_tracker(global.thesong) draw_text(x+time2x,y+time2y,"00:00")
else draw_text(x+time2x,y+time2y,current_time_format2(global.songlength*FMODInstanceGetPosition(global.playing)))
} else {draw_text(x+time2x,y+time2y,"00:00")}
}

if drawqueue {
draw_set_font(queuefont)
draw_set_color(queuecol1)
draw_text(x+queuex,y+queuey,'88/88')
draw_set_color(queuecol2)
draw_text(x+queuex,y+queuey,string(string_pad(global.current+1,2))+'/'+string(string_pad(ds_list_size(global.list),2)))
}

if usefgimg and sprite_exists(global.__floatfg) and global.__floatfg>0 draw_sprite_stretched_ext(global.__floatfg,1,x,y,width,height,__floatfgcol,1)
draw_set_color(c_white)
