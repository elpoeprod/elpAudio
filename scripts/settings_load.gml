if !variable_global_exists('list') global.list=ds_list_create()
else ds_list_clear(global.list)

room_caption='elpAudio '+get_version()
global.play=0
global.paused=0
global.stopped=0
global.trackname=''
global.playing=-1
global.themepath='themes\default\theme.ini'
global.current=0
global.thesong=''
__speed=15
global.volume=100
if file_exists('settings.ini') {
ini_open('settings.ini')
global.themepath=ini_read_string('','themePath','themes\default\theme.ini')
__speed=ini_read_real('','textSpeed',15)
global.volume=ini_read_real('','volume',100)
global.current=ini_read_real('','lastSong',0)
__visualiser=ini_read_real('','lastVisualiser',0)
ini_close()
} else {
ini_open('settings.ini')
ini_write_string('','themePath','themes\default\theme.ini')
ini_write_real('','textSpeed',15)
ini_write_real('','lastSong',0)
ini_write_real('','lastVisualiser',0)
//ini_write_string('','lastSong','')
ini_close()
}
if file_exists('temp.elf') loadlist('temp.elf',0)
else get_music_from('music_examples\')

get_theme(global.themepath)
