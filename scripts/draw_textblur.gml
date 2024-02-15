var myalpha,xx;
xx=2
myalpha=global.floatalpha
draw_set_alpha(myalpha*0.75)
draw_text(floor(argument0),floor(argument1),argument2)
/*draw_set_alpha(myalpha*0.5)
draw_text(argument0+xx/2,argument1,argument2)
draw_text(argument0-xx/2,argument1,argument2)
draw_text(argument0,argument1+xx/2,argument2)
draw_text(argument0,argument1-xx/2,argument2)*/
draw_set_alpha(myalpha*0.2)
draw_text(floor(argument0+xx),floor(argument1),argument2)
draw_text(floor(argument0-xx),floor(argument1),argument2)
draw_text(floor(argument0),floor(argument1+xx),argument2)
draw_text(floor(argument0),floor(argument1-xx),argument2)
draw_set_alpha(myalpha)
