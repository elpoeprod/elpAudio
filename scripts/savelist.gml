var file,fname,i;
fname=argument0
if file_exists(fname) file_delete(fname)
if !string_ends_with(string_lower(fname),'.elf') fname+='.elf'
file=file_text_open_write(fname)
i=0
repeat(ds_list_size(global.list))
{
file_text_write_string(file,string(ds_list_find_value(global.list,i)))
file_text_writeln(file)
i+=1
}
file_text_close(file)
