ini_open('settings.ini')
ini_write_string('','themePath',global.themepath)
ini_write_real('','textSpeed',__speed)
ini_write_real('','volume',global.volume)
ini_write_real('','lastSong',global.current)
ini_write_real('','lastVisualiser',__visualiser)
//ini_write_string('','lastSong',global.thesong)
ini_close()
i=0
savelist('temp.elf')