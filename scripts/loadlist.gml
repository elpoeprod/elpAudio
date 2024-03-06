var file,fname,i,disknames,myfile,origfile,letter;
disknames="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
fname=argument0
if !file_exists(fname) {show_message('The playlist "'+argument0+'" doesnt seem to exist.') exit}

file=file_text_open_read(fname)
while !file_text_eof(file)
{
    i=1
    myfile=file_text_read_string(file)
    if file_exists(myfile) ds_list_add(global.list,myfile)
    else {
        /*letter=string_copy(disknames,1+i,1)
        myfile=string_replace(myfile,string_copy(myfile,1,1),letter)
        if file_exists(myfile) ds_list_add(global.list,myfile) else i+=1
        if i>=string_length(disknames)*/ show_message("File doesn't exists: "+string(myfile))
        }

file_text_readln(file)

}
file_text_close(file)
if argument_count>1 {
if argument[1] {
if global.play mus_stop()
mus_play(ds_list_find_value(global.list,0))
}
}
