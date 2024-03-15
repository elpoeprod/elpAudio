//ini_open(argument0)
//with thebutton {if object_index=play_button nothing=1 else instance_destroy()}
//with visualname instance_destroy()
with settingsobj instance_destroy()

if directory_exists(filename_path(argument0)+'visualisers\') {
var iii;iii=0
repeat(15) {
if file_exists(filename_path(argument0)+'visualisers\'+string(iii)+'.gml') {
visualiser.vis[iii]=file_text_read_all(filename_path(argument0)+'visualisers\'+string(iii)+'.gml')
global.customvisuals+=1
}
iii+=1
}
}


mybutton=visualiser//instance_create(0,0,visualiser)
global.visualx=ini_read_real('Interface','visX',336)
global.visualy=ini_read_real('Interface','visY',16)
global.visualw=ini_read_real('Interface','visW',144)
if global.visualw==0 global.visualw=display_get_width()
global.visualh=ini_read_real('Interface','visH',64)
if global.visualh==0 global.visualh=display_get_height()
mybutton.x=global.visualx
mybutton.y=global.visualy
mybutton.width=global.visualw
mybutton.height=global.visualh
mybutton.surf1=surface_create(global.visualw,global.visualh)
mybutton.surf2=surface_create(global.visualw,global.visualh)
mybutton.usefgvisimg=ini_read_real('Interface','usefgvisimg',0)
mybutton.visfgimg=sprite_add(filename_path(argument0)+ini_read_string('Interface','visfgimg','vis_fg.png'),1,0,0,0,0)
mybutton.visfgx=ini_read_real('Interface','visfgx',0)
mybutton.visfgy=ini_read_real('Interface','visfgy',0)
mybutton.visfgw=ini_read_real('Interface','visfgw',0)
mybutton.visfgh=ini_read_real('Interface','visfgh',0)
mybutton.usebgvisimg=ini_read_real('Interface','usebgvisimg',0)
mybutton.visbgimg=sprite_add(filename_path(argument0)+ini_read_string('Interface','visbgimg','vis_bg.png'),1,0,0,0,0)
mybutton.visbgx=ini_read_real('Interface','visbgx',0)
mybutton.visbgy=ini_read_real('Interface','visbgy',0)
mybutton.visbgw=ini_read_real('Interface','visbgw',0)
mybutton.visbgh=ini_read_real('Interface','visbgh',0)

if ini_read_real('Default','drawVisualiser',1) {
if !instance_exists(visualiser) instance_create(global.visualx,global.visualy,visualiser)
if !instance_exists(visualiser) instance_create(global.visualx,global.visualy,visualiserbutton)
} else {
with visualiser instance_destroy()
with visualiserbutton instance_destroy()
}



mybutton=loopbutton
mybutton.x=ini_read_real('Interface','butloopx',64)
mybutton.y=ini_read_real('Interface','butloopy',64)

mybutton=play_button//=instance_create(0,0,play_button)
mybutton.x=ini_read_real('Interface','butplayx',64)
mybutton.y=ini_read_real('Interface','butplayy',16)

mybutton=playrandombutton//instance_create(0,0,playrandombutton)
mybutton.x=ini_read_real('Interface','butrandx',64)
mybutton.y=ini_read_real('Interface','butrandy',16)

mybutton=addmusicbutton//instance_create(0,0,addmusicbutton)
mybutton.x=ini_read_real('Interface','butmusaddx',64)
mybutton.y=ini_read_real('Interface','butmusaddy',16)

mybutton=visualiserbutton//instance_create(0,0,visualiserbutton)
mybutton.x=ini_read_real('Interface','butchngvisx',64)
mybutton.y=ini_read_real('Interface','butchngvisy',16)

mybutton=sortplaylist//instance_create(0,0,sortplaylist)
mybutton.x=ini_read_real('Interface','butsortx',64)
mybutton.y=ini_read_real('Interface','butsorty',16)

mybutton=alwontopbutton//instance_create(0,0,alwontopbutton)
mybutton.x=ini_read_real('Interface','butontopx',64)
mybutton.y=ini_read_real('Interface','butontopy',16)

/*mybutton=setfolderbutton//instance_create(0,0,setfolderbutton)
mybutton.x=ini_read_real('Interface','butsetfx',64)
mybutton.y=ini_read_real('Interface','butsetfy',16)
*/
mybutton=savelistbutton//instance_create(0,0,savelistbutton)
mybutton.x=ini_read_real('Interface','butsaplx',64)
mybutton.y=ini_read_real('Interface','butsaply',16)

mybutton=loadlistbutton//instance_create(0,0,loadlistbutton)
mybutton.x=ini_read_real('Interface','butloplx',64)
mybutton.y=ini_read_real('Interface','butloply',16)

mybutton=stopbutton//instance_create(0,0,stopbutton)
mybutton.x=ini_read_real('Interface','butstopx',64)
mybutton.y=ini_read_real('Interface','butstopy',16)

mybutton=pause//instance_create(0,0,pause)
mybutton.x=ini_read_real('Interface','butpausex',64)
mybutton.y=ini_read_real('Interface','butpausey',16)

mybutton=next_button//instance_create(0,0,next_button)
mybutton.x=ini_read_real('Interface','butnextx',64)
mybutton.y=ini_read_real('Interface','butnexty',16)

mybutton=prev_button//instance_create(0,0,prev_button)
mybutton.x=ini_read_real('Interface','butprevx',64)
mybutton.y=ini_read_real('Interface','butprevy',16)

mybutton=visualname//instance_create(0,0,visualname)
mybutton.x=ini_read_real('Interface','floaterx',64)
mybutton.y=ini_read_real('Interface','floatery',16)
mybutton.width=ini_read_real('Interface','floaterw',128)
mybutton.height=ini_read_real('Interface','floaterh',32)
mybutton.textx=ini_read_real('Interface','floattextx',4)
mybutton.texty=ini_read_real('Interface','floattexty',1)
mybutton.floatdrawtime1=ini_read_real('Interface','floatdrawtime1',0)
mybutton.drawfloattime2=ini_read_real('Interface','floatdrawtime2',0)
mybutton.time2x=ini_read_real('Interface','floattime2x',0)
mybutton.time2y=ini_read_real('Interface','floattime2y',0)
mybutton.time2font=font_add_file(filename_path(argument0)+ini_read_string('Interface','floattime2ffile','tahoma.ttf'),ini_read_string('Interface','floattime2font',0),
ini_read_real('Interface','floattime2Size',0),ini_read_real('Interface','floattime2IsBold',0),
ini_read_real('Interface','floattime2IsItalic',0),0,255)
mybutton.drawqueue=ini_read_real('Interface','floatdrawqueue',0)
mybutton.queuefont=font_add_file(filename_path(argument0)+ini_read_string('Interface','floatqueueffile','tahoma.ttf'),ini_read_string('Interface','floatqueuefont',0),
ini_read_real('Interface','floatqueueSize',0),ini_read_real('Interface','floatqueueIsBold',0),
ini_read_real('Interface','floatqueueIsItalic',0),0,255)
mybutton.queuex=ini_read_real('Interface','floatqueuex',0)
mybutton.queuey=ini_read_real('Interface','floatqueuey',0)
mybutton.queuecol1=hex_to_col(real_hex(ini_read_string('Interface','floatqueuecol1','$000000')))
mybutton.queuecol2=hex_to_col(real_hex(ini_read_string('Interface','floatqueuecol2','$FFFFFF')))
mybutton.floatiertext=ini_read_real('Interface','floatTextFloat',1)
mybutton.oldfloatw=ini_read_real('Interface','floattextw',128)

mybutton.ontop=ini_read_real('Default','floatontop',1)

mybutton.usefgimg=ini_read_real('Interface','floatusefgimg',1)
mybutton.usebgimg=ini_read_real('Interface','floatusebgimg',1)

mybutton.floattime2col1=hex_to_col(real_hex(ini_read_string('Interface','floattime2col1','$000000')))
mybutton.floattime2col2=hex_to_col(real_hex(ini_read_string('Interface','floattime2col2','$FFFFFF')))


mybutton=volumebutton//instance_create(0,0,volumebutton)
mybutton.x=ini_read_real('Interface','butvolx',64)
mybutton.y=ini_read_real('Interface','butvoly',16)

mybutton=sliderbutton//instance_create(0,0,sliderbutton)
mybutton.x=ini_read_real('Interface','sliderx',64)
mybutton.y=ini_read_real('Interface','slidery',16)

//if instance_exists(MainMenu) {
MainMenu.x=ini_read_real('Interface','frontmenux',64)
MainMenu.y=ini_read_real('Interface','frontmenuy',16)
MainMenu.w=ini_read_real('Interface','frontmenuw',480)
MainMenu.h=ini_read_real('Interface','frontmenuh',16)
MainMenu.useimgforfront=ini_read_real('Interface','useimgforfront',0)
global.__img_front=sprite_add(filename_path(argument0)+ini_read_string('Default','imgfront','front.png'),1,0,0,0,0)
MainMenu.useimgforback=ini_read_real('Interface','useimgforback',0)

with backobj instance_destroy()
mybutton=instance_create(0,0,backobj)

global.__img_back=sprite_add(filename_path(argument0)+ini_read_string('Default','imgback','back.png'),1,0,0,0,0)
mybutton.useimgforback=ini_read_real('Interface','useimgforback',0)
mybutton.backx=ini_read_real('Interface','backx',0)
mybutton.backy=ini_read_real('Interface','backy',0)
mybutton.backw=ini_read_real('Interface','backw',480)
mybutton.backh=ini_read_real('Interface','backh',80)
mybutton.usemonoster=ini_read_real('Interface','usemonoster',0)
mybutton.monosterimg=sprite_add(filename_path(argument0)+ini_read_string('Interface','monosterimg','monoster.png'),2,0,0,0,0)
mybutton.monosterx=ini_read_real('Interface','monosterx',0)
mybutton.monostery=ini_read_real('Interface','monostery',0)

MainMenu.drawcaption=ini_read_real('Interface','drawcaption',1)
//}

with(gui_button) instance_destroy()
i=0
repeat 3 {
me=instance_create(ini_read_real("Interface","miniguix"+string(i+1),64),ini_read_real("Interface","miniguix"+string(i+1),64),gui_button)
me.button=i
me.image_index=3*me.button
me.x=ini_read_real('Interface','miniguix'+string(i+1),64)
me.y=ini_read_real('Interface','miniguiy'+string(i+1),16)
sprite_collision_mask(global.__ico_migui,1,0,0,0,0,0,0,0)
i+=1
}

mybutton=instance_create(0,0,settingsobj)
mybutton.x=ini_read_real('Interface','butsetx',336)
mybutton.y=ini_read_real('Interface','butsety',336)
/*mybutton.custom=ini_read_real('Interface','usecustomsettings',0)
mybutton.custombgimg=sprite_add(filename_path(argument0)+ini_read_string('Interface','customstngbg','settings_tabs_bg.png'),1,0,0,0,0)
mybutton.customimg=sprite_add(filename_path(argument0)+ini_read_string('Interface','customstngfg','settings_tabs.png'),1,0,0,0,0)
mybutton.customx=ini_read_real('Interface','setcustomx',80)
mybutton.customy=ini_read_real('Interface','setcustomy',144)
mybutton.customw=ini_read_real('Interface','setcustomw',206)
mybutton.customh=ini_read_real('Interface','setcustomh',132)
mybutton.custombgx=ini_read_real('Interface','setcustombgx',10)
mybutton.custombgy=ini_read_real('Interface','setcustombgy',144)
mybutton.custombgw=ini_read_real('Interface','setcustombgw',460)
mybutton.custombgh=ini_read_real('Interface','setcustombgh',156)
*/
global.plrwidth=ini_read_real('Interface','playerW',480)
if global.plrwidth=0 global.plrwidth=display_get_width()
global.plrheight=ini_read_real('Interface','playerH',80)
if global.plrheight=0 global.plrheight=display_get_height()
