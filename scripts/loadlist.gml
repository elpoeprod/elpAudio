var file,fname,i;
fname=argument0
if !file_exists(fname) {show_message('The playlist "'+argument0+'" doesnt seem to exist.') exit}

file=file_text_open_read(fname)
i=0
while !file_text_eof(file)
{
    myfile=file_text_read_string(file)
    if file_exists(myfile) ds_list_add(global.list,myfile)
    else {
        letter=ord(string_copy(myfile,1,1))
        myfile=string_replace(myfile,chr(letter),chr(letter+1))
    if file_exists(myfile) ds_list_add(global.list,myfile)
    else
    {
        letter=ord(string_copy(myfile,1,1))
        myfile=string_replace(myfile,chr(letter),chr(letter+1))
    if file_exists(myfile) ds_list_add(global.list,myfile)
    else show_message("The file doesn't exists:#"+string(myfile))}
        }

file_text_readln(file)
i+=1
}
file_text_close(file)
if argument_count>1 {
if argument[1] {
if global.play mus_stop()
mus_play(ds_list_find_value(global.list,global.current))
}
}
