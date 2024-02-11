//You can use this file for making your own visualiser.

//Read Game Maker Manual before making your own visualiser!


//Do not change these variables.
var wavel,waver,specl,specr,maxs,maxw;
maxs =128// 256;
maxw=256;
var i,xx,yy,w,h;
w = argument3;
h=argument4
xx = argument1;
yy = argument2+h

h = h/2;
wavel = FMODInstanceGetWaveSnapshot(argument0,0,maxw); //GetWaveSnapshot used for getting a snapshot of the current millisecond of the song
FMODNormalizeWaveData(0,maxw); //normalizes data to make visualisers more cool
draw_set_color(global.visfgcol);
draw_set_alpha(0.6)
i = 0;
xx=argument1;
repeat(maxw-2)
{
    draw_line(xx,yy-FMODGetSnapshotEntry(i)*h-h,xx+w/maxw,yy-FMODGetSnapshotEntry(i+1)*h-h) //GetSnapshotEntry returns a byte of the wave snapshot
    i+=1;
    xx+=w/maxw;
}

waver = FMODInstanceGetWaveSnapshot(argument0,1,maxw);
FMODNormalizeWaveData(0,maxw); 
draw_set_color(global.visfgcol);
draw_set_alpha(0.8)
i = 0;
xx=argument1;
repeat(maxw-2)
{
    draw_line(xx,yy-FMODGetSnapshotEntry(i)*h-h,xx+w/maxw,yy-FMODGetSnapshotEntry(i+1)*h-h)
    i+=1;
    xx+=w/maxw;
}
//draw_set_alpha(1);
//draw_set_blend_mode(bm_normal);

draw_set_color(c_white);
draw_set_alpha(1)