var mydir,i,findfile,txt;
txt=''
mydir=argument0
global.dirr=argument0
findfile=fa_directory+fa_hidden+fa_readonly
if directory_exists(mydir) {
h=''
ii=0

i=1

// MP3 FILES
mus[0]=file_find_first(global.dirr+'*.mp3',findfile)
if mus[0]='' nothing=1 else {
ds_list_add(global.list,global.dirr+mus[0])
repeat(1024) {
mus[i]=file_find_next()
if mus[i]='' nothing=1 else {
ds_list_add(global.list,global.dirr+mus[i])
i+=1
}
}
}
file_find_close()
i=1

// OGG
mus[0]=file_find_first(global.dirr+'*.ogg',findfile)
if mus[0]='' nothing=1 else {
ds_list_add(global.list,global.dirr+mus[0])
repeat(1024) {
mus[i]=file_find_next()
if mus[i]='' nothing=1 else {
ds_list_add(global.list,global.dirr+mus[i])
i+=1
}
}
}
file_find_close()
i=1

//WAV
mus[0]=file_find_first(global.dirr+'*.wav',findfile)
if mus[0]='' nothing=1 else {
ds_list_add(global.list,global.dirr+mus[0])
repeat(1024) {
mus[i]=file_find_next()
if mus[i]='' nothing=1 else {
ds_list_add(global.list,global.dirr+mus[i])
i+=1
}
}
}
file_find_close()
i=1

/*
//m4a
mus[0]=file_find_first(global.dirr+'*.m4a',fa_directory)
if mus[0]='' nothing=1 else {
ds_list_add(global.list,global.dirr+mus[0])
repeat(1000) {
mus[i]=file_find_next()
if mus[i]='' nothing=1 else {
ds_list_add(global.list,global.dirr+mus[i])
i+=1
}
}
}
file_find_close()
i=1
*/

//MOD
mus[0]=file_find_first(global.dirr+'*.mod',findfile)
if mus[0]='' nothing=1 else {
ds_list_add(global.list,global.dirr+mus[0])
repeat(1024) {
mus[i]=file_find_next()
if mus[i]='' nothing=1 else {
ds_list_add(global.list,global.dirr+mus[i])
i+=1
}
}
}
file_find_close()
i=1

//XM
mus[0]=file_find_first(global.dirr+'*.xm',findfile)
if mus[0]='' nothing=1 else {
ds_list_add(global.list,global.dirr+mus[0])
repeat(1024) {
mus[i]=file_find_next()
if mus[i]='' nothing=1 else {
ds_list_add(global.list,global.dirr+mus[i])
i+=1
}
}
}
file_find_close()
i=1

//SCREAM TRACKER
mus[0]=file_find_first(global.dirr+'*.s3m',findfile)
if mus[0]='' nothing=1 else {
ds_list_add(global.list,global.dirr+mus[0])
repeat(1024) {
mus[i]=file_find_next()
if mus[i]='' nothing=1 else {
ds_list_add(global.list,global.dirr+mus[i])
i+=1
}
}
}
file_find_close()
i=1

//SCREAM TRACKER 2
mus[0]=file_find_first(global.dirr+'*.s2m',findfile)
if mus[0]='' nothing=1 else {
ds_list_add(global.list,global.dirr+mus[0])
repeat(1000) {
mus[i]=file_find_next()
if mus[i]='' nothing=1 else {
ds_list_add(global.list,global.dirr+mus[i])
i+=1
}
}
}
file_find_close()
i=1

//IMPULSE (SCHIZM) TRACKER
mus[0]=file_find_first(global.dirr+'*.it',findfile)
if mus[0]='' nothing=1 else {
ds_list_add(global.list,global.dirr+mus[0])
repeat(1000) {
mus[i]=file_find_next()
if mus[i]='' nothing=1 else {
ds_list_add(global.list,global.dirr+mus[i])
i+=1
}
}
}
file_find_close()
i=1
}

global.thesong=ds_list_find_value(global.list,0)
if argument_count>1 {if argument[1] sort(1,0)}


/*
myi=0
repeat(ds_list_size(global.list)) {
txt+=string(ds_list_find_value(global.list,myi))+"#"
myi+=1
}
show_message(txt)*/
