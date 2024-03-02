/*    var snd,name;
    name=string(argument0)

    if (is_real(argument0)) if (argument0) {
        snd=__gm82snd_call("FMODGetSnapshotEntry",argument0)
        return __gm82snd_map(__gm82snd_map(snd)+"__kind")
    }
    if (sound_exists(argument0)) {
        return __gm82snd_map(name+"__kind")
    }

    show_error("Sound does not exist: "+name,0)
    return 0
