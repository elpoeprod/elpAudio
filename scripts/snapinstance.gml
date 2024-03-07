///DrawSnapshot(instance,x,y,w,h)
//See original faster string based method below
//See faster balaced method in DrawSnapshotgroup using GetBuffer and normalization

//New more precise but slower fetchin using Snapshot2
var wavel,waver,specl,specr,maxs,maxw;
maxs =__visual_freq// 256;
maxw=256;
var i,xx,yy,w,h;
w = argument3;
h=argument4
xx = argument1;
yy = argument2+h
h = h/2;
wavel = FMODInstanceGetWaveSnapshot2(argument0,0,maxw)
FMODNormalizeWaveData(0,maxw)
FMODGetWaveBuffer(0,maxw)
draw_set_color(global.visfgcol);
draw_set_alpha(0.8)
i = 0;
xx=argument1;
repeat(maxs)
{
    draw_line(xx,yy-SNAPWAVEENTRY(i)*h-h,xx+w/maxs,yy-SNAPWAVEENTRY(i+1)*h-h)
    i+=1;
    xx+=w/maxs;
}

waver = FMODInstanceGetWaveSnapshot2(argument0,1,maxw)
FMODNormalizeWaveData(0,maxw)
FMODGetWaveBuffer(0,maxw)
draw_set_color(global.visfgcol);
draw_set_alpha(0.6)
i = 0;
xx=argument1;
repeat(maxs)
{
    draw_line(xx,yy-SNAPWAVEENTRY(i)*h-h,xx+w/maxs,yy-SNAPWAVEENTRY(i+1)*h-h)
    i+=1;
    xx+=w/maxs;
}

draw_set_color(c_white);
draw_set_alpha(1)
