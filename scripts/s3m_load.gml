var b;
b=buffer_create()
buffer_load(b,argument0)
buffer_set_pos(b,0)
s3mname=string_copy(buffer_read_string(b),0,28)
buffer_destroy(b)
return s3mname
