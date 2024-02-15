var b;
b=buffer_create()
buffer_load(b,argument0)
buffer_set_pos(b,0)
itname=string_replace_all(string_copy(buffer_read_string(b),0,28),'IMPM','')
buffer_destroy(b)
return itname
