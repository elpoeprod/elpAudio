///DrawSnapshot(instance,x,y,w,h)
//See original faster string based method below
//See faster balaced method in DrawSnapshotgroup using GetBuffer and normalization

//New more precise but slower fetchin using Snapshot2
var wavel,waver,specl,specr,maxs,maxw;
maxs =128// 256;
maxw=256;
var i,xx,yy,w,h;
w = argument3;
h=argument4
xx = argument1;
yy = argument2+h
//draw_set_blend_mode(bm_add);
//draw_set_alpha(.5);
//specl = FMODInstanceGetSpectrumSnapshot(argument0,0,maxs*2);
/*FMODNormalizeSpectrumData(0,maxs);
draw_set_color(global.visfgcol);
draw_set_alpha(0.2)
i = 0;
repeat(maxs-2)
{
    draw_line(xx,yy-FMODGetSnapshotEntry(i)*h,xx+w/maxs,yy-FMODGetSnapshotEntry(i+1)*h)
    i+=1;
    xx+=w/maxs;
}*/

//specr = FMODInstanceGetSpectrumSnapshot(argument0,1,maxs*2);
/*FMODNormalizeSpectrumData(0,maxs);
draw_set_color(global.visfgcol);
draw_set_alpha(0.4)
i = 0;
xx=argument1;
repeat(maxs-2)
{
    draw_line(xx,yy-FMODGetSnapshotEntry(i)*h,xx+w/maxs,yy-FMODGetSnapshotEntry(i+1)*h)
    i+=1;
    xx+=w/maxs;
}
*/
h = h/2;
wavel = FMODInstanceGetWaveSnapshot(argument0,0,maxw);
FMODNormalizeWaveData(0,maxw);
draw_set_color(global.visfgcol);
draw_set_alpha(0.6)
i = 0;
xx=argument1;
repeat(maxw-2)
{
    draw_line(xx,yy-FMODGetSnapshotEntry(i)*h-h,xx+w/maxw,yy-FMODGetSnapshotEntry(i+1)*h-h)
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












/*


exit;

//Old faster method using string
var wavel,waver,specl,specr,maxs,maxw;
maxs = 256;
maxw=256;
wavel = FMODInstanceGetWaveSnapshot(argument0,0,maxw);
waver = FMODInstanceGetWaveSnapshot(argument0,1,maxw);
specl = FMODInstanceGetSpectrumSnapshot(argument0,0,maxs*2);
specr = FMODInstanceGetSpectrumSnapshot(argument0,1,maxs*2);

var i,xx,yy,w,h;
w = argument3;
h=argument4
xx = argument1;
yy = argument2+h
//draw_set_blend_mode(bm_add);
//draw_set_alpha(.5);
draw_set_color(global.visfgcol);
i = 1;
repeat(maxs-1)
{
    draw_line(xx,yy-(ord(string_char_at(specl,i))/255)*h,xx+w/maxs,yy-(ord(string_char_at(specl,i+1))/255)*h)
    i+=1;
    xx+=w/maxs;
}
draw_set_color(global.visfgcol);
i = 1;
xx=argument1;
repeat(maxs-1)
{
    draw_line(xx,yy-(ord(string_char_at(specr,i))/255)*h,xx+w/maxs,yy-(ord(string_char_at(specr,i+1))/255)*h)
    i+=1;
    xx+=w/maxs;
}

draw_set_color(global.visfgcol);
i = 1;
xx=argument1;
repeat(maxw-1)
{
    draw_line(xx,yy-(ord(string_char_at(wavel,i))/255)*h,xx+w/maxw,yy-(ord(string_char_at(wavel,i+1))/255)*h)
    i+=1;
    xx+=w/maxw;
}
draw_set_color(global.visfgcol);
i = 1;
xx=argument1;
repeat(maxw-1)
{
    draw_line(xx,yy-(ord(string_char_at(waver,i))/255)*h,xx+w/maxw,yy-(ord(string_char_at(waver,i+1))/255)*h)
    i+=1;
    xx+=w/maxw;
}
//draw_set_alpha(1);
//draw_set_blend_mode(bm_normal);
draw_set_color(c_white);
