var b;
b=buffer_create()
buffer_load(b,argument0)
buffer_set_pos(b,0)
var h;
h=buffer_read_string(b)
xmname=string_copy(h,18,20)
repeat 20 {if string_ends_with(xmname,' ') string_delete(xmname,20,1)}
buffer_set_pos(b,38)
xmfrom=string_copy(buffer_read_string(b),1,20)
buffer_set_pos(b,58)
xmver=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,60)
xmheadsize=hex_to_real(buffer_read_u32(b))
buffer_set_pos(b,64)
xmlen=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,66)
xmrespos=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,68)
xmchannelnum=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,70)
xmpatternnum=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,72)
xminstrumentnum=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,74)
xmamigaflag=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,76)
xmdefaulttempo=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,78)
xmdefaultbpm=hex_to_real(buffer_read_u16(b))
buffer_set_pos(b,80)
xmpatternorder=''

i=0
do {
mystr=hex_to_real(buffer_read_u8(b))
xmpattern[i]=mystr
xmpatternorder+="#"+hex_to_real(i)+" "+mystr
i+=1
} until (hex_to_real(buffer_read_u8(b))='00' and i>30) or i=256

xmpatterns=0

ii=0
repeat(i-1) {
xmpatterns+=sign(real(real_hex(xmpattern[ii])))
ii+=1
}

hh=0
buffer_set_pos(b,336)
repeat(xmpatterns) {
pattern[hh]=buffer_read_u32(b)
patternpacktype[hh]=buffer_read_u16(b)
patternrownum[hh]=buffer_read_u16(b)
patternpacksize[hh]=buffer_read_u16(b)
//show_message(string(pattern[hh])+"#"+string(patternpacktype[hh])+"#"+string(patternrownum[hh])+"#"+string(patternpacksize[hh]))
hh+=1
}
buffer_destroy(b)
