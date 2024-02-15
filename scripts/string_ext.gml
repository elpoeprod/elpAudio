var hello;hello=0
if argument_count==1 return string(argument0)
else {
var h;h=string(argument0)
repeat(argument_count-1) {
h=string_replace_all(h,"{"+string(hello)+"}",string(argument[hello+1]))
hello+=1
}
return h;
}
