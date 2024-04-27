if !window_get_active() exit
if point_in_rectangle(
display_mouse_get_x(),display_mouse_get_y(),
window_get_x()+x-1000*pressed,window_get_y()+y-1000*pressed
,
window_get_x()+x+w-w/6+1000*pressed,window_get_y()+y+h+1000*pressed
)
{
if mouse_check_direct(mb_left) {
if hh=0 {
mx=mouse_x
my=mouse_y
hh=1
}
window_set_position(display_mouse_get_x()-mx,
display_mouse_get_y()-my
)
pressed=1
} else {pressed=0 hh=0}
}

if __stick_to_edges {
///WINDOW STICKS TO EDGES
if window_get_x()<16 window_set_position(0,window_get_y())
if window_get_x()+window_get_width()>display_get_width()-16 window_set_position(display_get_width()-window_get_width(),window_get_y())

if window_get_y()<16 window_set_position(window_get_x(),0)
if window_get_y()+window_get_height()>display_get_height()-16 window_set_position(window_get_x(),display_get_height()-window_get_height())
}
