#include "../include/main.hpp"

eaSettings_t *eaSettings;

eaTheme_t *eaTheme;

void settingsImport();

void initSettings() {
    eaSettings=new eaSettings_t;
    eaSettings->current=0;
    eaSettings->loop=-1;
	eaSettings->lastVisualiser=0;

    eaTheme=new eaTheme_t;
    eaTheme->path=      "themes/default/theme.ini";
    eaTheme->pathf=  "themes/default/";
    eaTheme->w=480;
    eaTheme->h=80;
    eaTheme->bt[BUTTON_PLAY].spr=		sprite::add(eaTheme->pathf+"butplay.png",	2,0,0);
    eaTheme->bt[BUTTON_STOP].spr=		sprite::add(eaTheme->pathf+"butstop.png",	2,0,0);
    eaTheme->bt[BUTTON_PAUSE].spr=		sprite::add(eaTheme->pathf+"butpause.png",	2,0,0);
    eaTheme->bt[BUTTON_PREV].spr=		sprite::add(eaTheme->pathf+"butprev.png",	2,0,0);
    eaTheme->bt[BUTTON_NEXT].spr=		sprite::add(eaTheme->pathf+"butnext.png",	2,0,0);
    eaTheme->bt[BUTTON_ADDMUS].spr=		sprite::add(eaTheme->pathf+"butaddmus.png",	2,0,0);
	eaTheme->bt[FLOAT_BACKGROUND].spr=	sprite::add(eaTheme->pathf+"empty.png",		1,0,0);
	eaTheme->bt[FLOAT_FOREGROUND].spr=	sprite::add(eaTheme->pathf+"floatfg.png",	1,0,0);
	eaTheme->bt[VISUALISER_BG].spr=		sprite::add(eaTheme->pathf+"vis_bg.png",	1,0,0);
	eaTheme->bt[VISUALISER_FG].spr=		sprite::add(eaTheme->pathf+"empty.png",		1,0,0);
	eaTheme->bt[BUTTON_CHANGE_VIS].spr=	sprite::add(eaTheme->pathf+"butvisual.png",	2,0,0);

	settingsImport();
	return;
}

void settingsImport() {
	var myini=ini::open("settings.ini");
		eaSettings->current=		ini::read_int(myini,"General","lastSong",0);
		eaSettings->loop=			ini::read_int(myini,"General","repeatSong",0);
		eaSettings->lastVisualiser=	ini::read_int(myini,"General","lastVisualiser",0);
		eaTheme->path=				ini::read_str(myini,"General","themePath","themes/default");
	ini::close(myini);

	myini=ini::open(eaTheme->path);
		eaTheme->pathf=							file::path(eaTheme->path);
		eaTheme->name=							ini::read_str(myini,"Default","themeName","elpAudio default");
		eaTheme->author=						ini::read_str(myini,"Default","themeAuthor","noone");
		eaTheme->desiredVersion=				ini::read_str(myini,"Default","requiredVersion",elpAudio_version);
		sprite::replace(eaTheme->bt[BUTTON_PLAY]		.spr,eaTheme->pathf+ini::read_str(myini,"Default","btPlaySprite",	"butplay.png"),2,0,0);
		sprite::replace(eaTheme->bt[BUTTON_STOP]		.spr,eaTheme->pathf+ini::read_str(myini,"Default","btStopSprite",	"butstop.png"),2,0,0);
		sprite::replace(eaTheme->bt[BUTTON_PAUSE]		.spr,eaTheme->pathf+ini::read_str(myini,"Default","btPauseSprite",	"butpause.png"),2,0,0);
		sprite::replace(eaTheme->bt[BUTTON_PREV]		.spr,eaTheme->pathf+ini::read_str(myini,"Default","btPrevSprite",	"butprev.png"),2,0,0);
		sprite::replace(eaTheme->bt[BUTTON_NEXT]		.spr,eaTheme->pathf+ini::read_str(myini,"Default","btNextSprite",	"butnext.png"),2,0,0);
		sprite::replace(eaTheme->bt[BUTTON_ADDMUS]		.spr,eaTheme->pathf+ini::read_str(myini,"Default","btAddMusicSprite","butaddmus.png"),2,0,0);
		sprite::replace(eaTheme->bt[FLOAT_BACKGROUND]	.spr,eaTheme->pathf+ini::read_str(myini,"Default","floatbg",		"floatbg.png"),1,0,0);
		sprite::replace(eaTheme->bt[FLOAT_FOREGROUND]	.spr,eaTheme->pathf+ini::read_str(myini,"Default","floatfg",		"floatfg.png"),1,0,0);
		sprite::replace(eaTheme->bt[BUTTON_CHANGE_VIS]	.spr,eaTheme->pathf+ini::read_str(myini,"Default","btVisSprite",	"butvisual.png"),2,0,0);

		eaTheme->bt[BUTTON_PLAY].x		=ini::read_int(myini,"Interface","butplayx",64);
		eaTheme->bt[BUTTON_PLAY].y		=ini::read_int(myini,"Interface","butplayy",16);

		eaTheme->bt[BUTTON_STOP].x		=ini::read_int(myini,"Interface","butstopx",32);
		eaTheme->bt[BUTTON_STOP].y		=ini::read_int(myini,"Interface","butstopy",16);

		eaTheme->bt[BUTTON_PAUSE].x		=ini::read_int(myini,"Interface","butpausex",96);
		eaTheme->bt[BUTTON_PAUSE].y		=ini::read_int(myini,"Interface","butpausey",16);

		eaTheme->bt[BUTTON_PREV].x		=ini::read_int(myini,"Interface","butprevx",0);
		eaTheme->bt[BUTTON_PREV].y		=ini::read_int(myini,"Interface","butprevy",16);

		eaTheme->bt[BUTTON_NEXT].x		=ini::read_int(myini,"Interface","butnextx",128);
		eaTheme->bt[BUTTON_NEXT].y		=ini::read_int(myini,"Interface","butnexty",16);

		eaTheme->bt[BUTTON_ADDMUS].x	=ini::read_int(myini,"Interface","butmusaddx",288);
		eaTheme->bt[BUTTON_ADDMUS].y	=ini::read_int(myini,"Interface","butmusaddy",32);

		eaTheme->bt[OBJECT_FLOAT_TEXT].x=ini::read_int(myini,"Interface","floaterx",160);
		eaTheme->bt[OBJECT_FLOAT_TEXT].y=ini::read_int(myini,"Interface","floatery",16);

		eaTheme->bt[OBJECT_VISUALISER].x=ini::read_int(myini,"Interface","visX",320);
		eaTheme->bt[OBJECT_VISUALISER].y=ini::read_int(myini,"Interface","visY",16);

		eaTheme->bt[BUTTON_CHANGE_VIS].x=ini::read_int(myini,"Interface","butchngvisx",288);
		eaTheme->bt[BUTTON_CHANGE_VIS].y=ini::read_int(myini,"Interface","butchngvisy",48);

		eaTheme->visUseBg=ini::read_int(myini,"Interface","usebgvisimg",0);
		if(eaTheme->visUseBg)
			sprite::replace(eaTheme->bt[VISUALISER_BG]		.spr,eaTheme->pathf+ini::read_str(myini,"Interface","visbgimg",		"vis_bg.png"),1,0,0);

		eaTheme->visUseFg=ini::read_int(myini,"Interface","usefgvisimg",0);
		if(eaTheme->visUseFg)
			sprite::replace(eaTheme->bt[VISUALISER_FG]		.spr,eaTheme->pathf+ini::read_str(myini,"Interface","visfgimg",		"empty.png"),1,0,0);

		eaTheme->visW=ini::read_int(myini,"Interface","visW",160);
		eaTheme->visH=ini::read_int(myini,"Interface","visH",64);

		eaTheme->w=ini::read_int(myini,"Interface","playerW",480);
		eaTheme->h=ini::read_int(myini,"Interface","playerH",80);

	ini::close(myini);
	return;
}
