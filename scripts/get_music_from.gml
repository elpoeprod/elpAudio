var mydir,i,findfile,txt;
txt=''
global.dirr=argument0
if !string_ends_with(global.dirr,'\') global.dirr+='\'
findfile=0
if directory_exists(global.dirr) {
i=1

// ALL FILES
mus=file_find_first(global.dirr+'*.*',findfile);
if(is_supported(mus)){
ds_list_add(global.list,global.dirr+mus);
repeat(1024) {
mus=file_find_next();
if is_supported(mus){
ds_list_add(global.list,global.dirr+mus);i+=1;}
}
}
file_find_close()
global.thesong=ds_list_find_value(global.list,0)
if argument_count>1 {if argument[1] sort(1,0)}

}

/*
myi=0
repeat(ds_list_size(global.list)) {
txt+=string(ds_list_find_value(global.list,myi))+"#"
myi+=1
}
show_message(txt)*/
