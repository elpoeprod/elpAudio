var wavel,waver,specl,specr,maxs,maxw;
maxs = 128//256;
maxw=256;
var i,xx,yy,w,h;
w = argument3/2;
h=argument4/2
xx = argument1;
yy = argument2//+h
//draw_set_blend_mode(bm_add);
//draw_set_alpha(.5);
specl = FMODInstanceGetSpectrumSnapshot(argument0,0,maxs*2);
FMODNormalizeSpectrumData(0,maxs);
//draw_set_color(merge_color_normal(global.color1,global.color2,0.5+lengthdir_x(0.25,current_time*0.05)))
dir+=1
if dir>359 dir=0
i=1
angle=0
repeat(maxs-2)
{
draw_line_width_color(xx,yy,
xx+lengthdir_x(FMODGetSnapshotEntry(i+1)*w/2,dir+angle)
+lengthdir_x(FMODGetSnapshotEntry(i+1)*w/2,dir+angle+90),
yy+lengthdir_y(FMODGetSnapshotEntry(i+1)*h/2,dir+angle)
+lengthdir_y(FMODGetSnapshotEntry(i+1)*h/2,dir+angle+90),clamp((max(FMODGetSnapshotEntry(i),FMODGetSnapshotEntry(i+1)-min(FMODGetSnapshotEntry(i),FMODGetSnapshotEntry(i+1))))*5,1,2)
,merge_color_normal(global.color1,global.color2,0.5+lengthdir_x(0.25,current_time*0.05+i*0.5))
,merge_color_normal(global.color1,global.color2,0.5+lengthdir_x(0.25,current_time*0.05-65+i*0.5))
)
i+=1
angle+=(360/maxs)*(10*1.125)
}

draw_set_color(c_white)