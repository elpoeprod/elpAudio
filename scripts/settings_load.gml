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
global.__progdir=registry_read_string_ext('elpAudio','work_dir')+'\'
if os_type==os_linux global.__progdir=program_directory+'\'

globalvar __enablefloat,__stopsongafter,__speed,__visualiser,__visual_freq,__stick_to_edges;
__enablefloat=0
__stopsongafter=0
__visualiser=0
__speed=15 // Default is 15
__visual_freq=32
__stick_to_edges=1

global.volume=100
if file_exists(global.__progdir+'settings.ini') {
ini_open(global.__progdir+'settings.ini')
global.themepath=global.__progdir+string_copy(ini_read_string('','themePath','themes\default\theme.ini'),string_pos('themes\',ini_read_string('','themePath','themes\default\theme.ini')),1024)
__speed=ini_read_real('','textSpeed',15)
global.volume=ini_read_real('','volume',100)
global.current=ini_read_real('','lastSong',0)
__visualiser=ini_read_real('','lastVisualiser',0)
__visual_freq=ini_read_real('','visualiserBars',16)
ini_close()
} else {
ini_open(global.__progdir+'settings.ini')
ini_write_string('','themePath',global.__progdir+'themes\default\theme.ini')
ini_write_real('','textSpeed',15)
ini_write_real('','lastSong',0)
ini_write_real('','lastVisualiser',0)
ini_write_real('','visualiserBars',16)
//ini_write_string('','lastSong','')
ini_close()
}
if file_exists(global.__progdir+'temp.elf') loadlist(global.__progdir+'temp.elf',0)
else get_music_from(global.__progdir+'music_examples\')

//get_theme(global.themepath)
