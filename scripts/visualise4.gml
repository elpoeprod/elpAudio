var wavel,waver,specl,specr,maxs,maxw;
maxs = __visual_freq//256;
maxw=256;
var i,ii,xx,yy,w,h;
w = argument3;
h=argument4
xx = argument1;
yy = argument2//+h
//draw_set_blend_mode(bm_add);
//draw_set_alpha(.5);
specl = FMODInstanceGetSpectrumSnapshot(argument0,0,maxs*2);
FMODNormalizeSpectrumData(0,maxs);

i=0
ii=0
repeat(maxs-2)
{
draw_set_color(merge_color_normal(global.color1,global.color2,0.5+lengthdir_x(0.25,current_time*0.05+i*0.5)))
draw_line_width(xx+ii,yy+h,xx+ii,yy+h-FMODGetSnapshotEntry(i+1)*h,w/maxs)
i+=1
ii+=w/maxs
}

draw_set_color(c_white)
