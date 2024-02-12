#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if useimgforback {
if sprite_exists(global.__img_back) and global.__img_back>-1
draw_sprite_stretched_ext(global.__img_back,0,backx,backy,backw,backh,__bgcol,1)
}
if global.play {
if usemonoster {
if monosterimg>-1 and sprite_exists(monosterimg) {
draw_sprite_ext(monosterimg,1-is_stereo_sound(global.musicsound),monosterx,monostery,1,1,0,c_white,1)
}
}
}
