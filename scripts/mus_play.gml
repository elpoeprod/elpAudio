var song;
if variable_global_exists('musicsound') {FMODSoundFree(global.musicsound) global.musicsound=FMODSoundAdd(argument0,0,1)}
else global.musicsound=FMODSoundAdd(argument0,0,1)
song=global.musicsound
if file_is_tracker(argument0) global.trackname=tracker_get_name(argument0)//ds_list_find_value(global.list,global.current))
else global.trackname=id3_get_all(argument0)
global.playing=FMODSoundLoop(song,0)
FMODInstanceSetVolume(global.playing,global.volume/100)
FMODInstanceSetLoopCount(global.playing,loopbutton.on*1024)
global.play=1
global.thesong=argument0
did=0
global.stopped=0
global.songlength=get_song_length(song)
