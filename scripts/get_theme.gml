var where;where=argument0
global.themepath=argument0

// Icons.

global.__ico_play=buttonplay
global.__ico_pause=buttonpause
global.__ico_stop=buttonstop
global.__ico_next=buttonnext
global.__ico_prev=buttonprev
global.__ico_playr=buttonplayrandom
global.__ico_about=buttonabout
global.__ico_float=sprFloatBG
global.__ico_stngs=buttonsettings
global.__ico_migui=minigui
global.__ico_alont=buttonalwontop
global.__ico_admus=buttonaddmusicfile
global.__ico_volbt=buttonvolume
global.__ico_slide=volumeslide
global.__ico_sortb=buttonsort
global.__ico_slid2=buttonslider
global.__ico_visua=buttonvisualize
global.__ico_savel=buttonsavelist
global.__ico_loadl=buttonloadlist
global.__ico_setfl=buttonsetfolder
global.__ico_slide2=volslide2
global.__ico_loop=buttonloop
global.__ico_visfg=-1
global.__ico_front=-1
global.__ico_back=-1
global.__fon_vis=fntVisual
global.__fon_cap=fntCaption
global.__floatbg=-123123
global.__floatfg=sprFloatBG
global.__floatw=128
global.__floath=32
global.__drawfloattime2=0
global.__floattime2x=0
global.__floattime2y=0
global.__floattime2size=16
global.oldfloat=1
global.themename='elpAudio Default'
global.visualx=336
global.visualy=16
global.visualw=144
global.visualh=64
global.floatalpha=1
global.customvisuals=0
global.plrwidth=480
global.plrheight=80
//with all {visible=1}// depth-=1}
with all image_speed=0

// Colors .

global.color1=c_fuchsia
global.color2=c_aqua
global.visbgcol=c_black
global.visfgcol=c_white
global.floatcolor=c_lime
global.frontcol=$606060
global.captioncol=$FFFFFF
global.floatbgcol=$101010

//do not change this globals
globalvar __visbgcol,__visfgcol,__butplaycol,__butstopcol,__butplayrandcol,__butnextcol,__butprevcol
,__butaboutcol,__butsettcol
,__butpausecol,__butalontcol,__butaddmuscol,__butvolcol
,__butslidecol,__butslidercol,__butvisualcol
,__butsavelistcol,__butloadlistcol,__butloopcol
,__minibutton1col,__minibutton2col,__minibutton3col
,__floatfgcol,__floatbgcol,__frontmenucol
,__butsortcol,__bgcol
;

// External icons.

if file_exists(argument0) {
ini_open(argument0)
if ini_key_exists('Default','themeName') {global.themename=ini_read_string('Default','themeName','Default')} else {ini_close() show_message('That .ini file is not a theme file.') exit}
if ini_key_exists('Default','plbt') sprite_replace(global.__ico_play,filename_path(argument0)+ini_read_string('Default','plbt','butplay.png')               ,2,0,0,0,0)
if ini_key_exists('Default','psbt') sprite_replace(global.__ico_pause,filename_path(argument0)+ini_read_string('Default','psbt','butpause.png')             ,2,0,0,0,0)
if ini_key_exists('Default','prbt') sprite_replace(global.__ico_prev,filename_path(argument0)+ini_read_string('Default','prbt','butprev.png')               ,2,0,0,0,0)
if ini_key_exists('Default','nxbt') sprite_replace(global.__ico_next,filename_path(argument0)+ini_read_string('Default','nxbt','butnext.png')               ,2,0,0,0,0)
if ini_key_exists('Default','stbt') sprite_replace(global.__ico_stop,filename_path(argument0)+ini_read_string('Default','stbt','butstop.png')               ,2,0,0,0,0)
if ini_key_exists('Default','snbt') sprite_replace(global.__ico_stngs,filename_path(argument0)+ini_read_string('Default','snbt','butstng.png')              ,2,0,0,0,0)
if ini_key_exists('Default','srbt') sprite_replace(global.__ico_sortb,filename_path(argument0)+ini_read_string('Default','srbt','butsort.png')              ,6,0,0,0,0)
if ini_key_exists('Default','abbt') sprite_replace(global.__ico_about,filename_path(argument0)+ini_read_string('Default','abbt','butabout.png')             ,2,0,0,0,0)
if ini_key_exists('Default','lpbt') sprite_replace(global.__ico_loop ,filename_path(argument0)+ini_read_string('Default','lpbt','butloop.png')              ,3,0,0,0,0)
if ini_key_exists('Default','ambt') sprite_replace(global.__ico_admus,filename_path(argument0)+ini_read_string('Default','ambt','butaddmus.png')            ,2,0,0,0,0)
if ini_key_exists('Default','atbt') sprite_replace(global.__ico_alont,filename_path(argument0)+ini_read_string('Default','atbt','butalont.png')             ,2,0,0,0,0)
if ini_key_exists('Default','llbt') sprite_replace(global.__ico_loadl,filename_path(argument0)+ini_read_string('Default','llbt','butloadlist.png')          ,2,0,0,0,0)
if ini_key_exists('Default','ppbt') sprite_replace(global.__ico_playr,filename_path(argument0)+ini_read_string('Default','ppbt','butplayrand.png')          ,2,0,0,0,0)
if ini_key_exists('Default','slbt') sprite_replace(global.__ico_savel,filename_path(argument0)+ini_read_string('Default','slbt','butsavelist.png')          ,2,0,0,0,0)
if ini_key_exists('Default','sfbt') sprite_replace(global.__ico_setfl,filename_path(argument0)+ini_read_string('Default','sfbt','butsetfolder.png')         ,2,0,0,0,0)
if ini_key_exists('Default','vibt') sprite_replace(global.__ico_visua,filename_path(argument0)+ini_read_string('Default','vibt','butvisual.png')            ,2,0,0,0,0)
if ini_key_exists('Default','flot') sprite_replace(global.__floatfg,filename_path(argument0)+ini_read_string('Default','flot','floatfg.png')                ,1,0,0,0,0)
if ini_key_exists('Default','mgui') sprite_replace(global.__ico_migui,filename_path(argument0)+ini_read_string('Default','mgui','minigui.png')              ,9,0,0,0,0)
if ini_key_exists('Default','poss') sprite_replace(global.__ico_slid2,filename_path(argument0)+ini_read_string('Default','poss','positionslide.png')        ,1,0,0,0,0)
if ini_key_exists('Default','slide') sprite_replace(global.__ico_slide,filename_path(argument0)+ini_read_string('Default','slide','slider.png')             ,1,0,0,0,0)
sprite_set_offset(global.__ico_slide,0 /*sprite_get_width(global.__ico_slide)/2*/ ,sprite_get_height(global.__ico_slide)/2)
if ini_key_exists('Default','slide2') sprite_replace(global.__ico_slide2,filename_path(argument0)+ini_read_string('Default','slide2','volslider.png')             ,1,0,0,0,0)
sprite_set_offset(global.__ico_slide2,sprite_get_width(global.__ico_slide2)/2,sprite_get_height(global.__ico_slide2)/2)
if ini_key_exists('Default','vols') sprite_replace(global.__ico_volbt,filename_path(argument0)+ini_read_string('Default','vols','volumeslide.png')          ,1,0,0,0,0)
if ini_key_exists('Default','useOldFloat') global.oldfloat=ini_read_real('Default','useOldFloat',0)
if ini_key_exists('Default','floatbg') {
if file_exists(filename_path(argument0)+ini_read_string('Default','floatbg','floatbg.png')) global.__floatbg=sprite_add(filename_path(argument0)+ini_read_string('Default','floatbg','floatbg.png')          ,1,0,0,0,0)
else global.__floatbg=-1
} else global.__floatbg=-1

if ini_key_exists('Default','visFont') {
global.__fon_vis_size=ini_read_real('Default','visSize',16)
global.__fon_vis=font_add_file(filename_path(argument0)+ini_read_string('Default','visFont','visual.ttf'),
ini_read_string('Default','visName','Terminal'),
global.__fon_vis_size,ini_read_real('Default','visIsBold',0),ini_read_real('Default','visIsItalic',0),32,255)
}

if ini_key_exists('Default','captionFont') {
global.__fon_cap_size=ini_read_real('Default','capSize',16)
global.__fon_cap=font_add_file(filename_path(argument0)+ini_read_string('Default','captionFont','tahoma.ttf'),
ini_read_string('Default','captionName','Tahoma'),
global.__fon_cap_size,ini_read_real('Default','capIsBold',0),ini_read_real('Default','capIsItalic',0),32,255)
}

//ini_close()
}
global.changeview=1
load_gui(argument0)
load_cols()

ini_close()
