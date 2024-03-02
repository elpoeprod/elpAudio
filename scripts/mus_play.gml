var song,mylastsong;
mylastsong=''
if variable_global_exists('musicsound') {
mylastsong=global.musicsound
global.musicsound=sound_add_ext(argument0,0,1,filename_name(filename_remove_ext(argument0)))
} else global.musicsound=sound_add_ext(argument0,0,1,filename_name(filename_remove_ext(argument0)))
song=global.musicsound
if file_is_tracker(argument0) global.trackname=tracker_get_name(argument0)//ds_list_find_value(global.list,global.current))
else global.trackname=id3_get_all(argument0)
global.playing=sound_loop(song)
//sound_volume(global.playing,global.volume/100)
sound_set_loop_count(global.playing,loopbutton.on*1024)
global.play=1
global.thesong=argument0
did=0
global.stopped=0
global.songlength=get_song_length(song)
if mylastsong!='' sound_delete(mylastsong)
