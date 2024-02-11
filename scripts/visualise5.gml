var wavel,waver,specl,specr,maxs,maxw;
maxs = 128;
maxw=256;
var i,xx,yy,w,h;
w = argument3;
h=argument4
xx = argument1;
yy = argument2;
specl = FMODInstanceGetSpectrumSnapshot(argument0,0,maxs*2);
FMODNormalizeSpectrumData(0,maxs);
i=0
ii=0
repeats=maxs-2
repeat(repeats)
{
draw_set_color(merge_color_normal(global.color1,global.color2,0.5+lengthdir_x(0.25,current_time*0.05+i*0.5)))
draw_point_width(xx+ii,yy+h*0.5-FMODGetSnapshotEntry(i)*(h*0.5),(w/maxw))
i+=1
ii+=(w/maxw)*(maxw/repeats)
}
//right
i=0
ii=0
specr = FMODInstanceGetSpectrumSnapshot(argument0,1,maxs*2);
FMODNormalizeSpectrumData(1,maxs);
repeat(repeats)
{
draw_set_color(merge_color_normal(global.color1,global.color2,0.5+lengthdir_x(0.25,current_time*0.05+i*0.5)))
draw_point_width(xx+ii,yy+h*0.5+FMODGetSnapshotEntry(i)*(h*0.5),clamp(w/maxw,1,100))
i+=1
ii+=(w/maxw)*(maxw/repeats)
}

draw_set_color(c_white)
