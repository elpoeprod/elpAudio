#include "../include/main.hpp"
#include <gamebreaker/gamebreaker.hpp>
#define InitObject(a,x,y) room::add_instance(rmPlayerMain,a,x,y,nullptr); \
                            a->event_create=a##_Create; \
                            a->event_step=a##_Step; \
                            a->event_draw=a##_Draw;

GBRoom *rmPlayerMain;
GBFont *fntMain, *fntVisual;

void eaInit() {
    initSettings();
    rmPlayerMain=room::add(eaTheme->w,eaTheme->h);
    room::camera_setup(rmPlayerMain,0,1,
                       (GB_CamSetup){0,0,eaTheme->w,eaTheme->h,0},
                       (GB_CamSetup){0,0,eaTheme->w,eaTheme->h,0},
                       -1,(GB_CamTarget){0,0,0,0});
    window::set_size(eaTheme->w,eaTheme->h);
	window::show_borders(0);
	math::randomize();

    fntMain=font::add("themes/sourcesans.ttf",12);
	fntVisual=font::add("themes/clacon2.ttf",16);

    draw::set_font(fntMain);

    room::current(rmPlayerMain);

    initButton();
    InitObject(btPrev,			eaTheme->bt[BUTTON_PREV].x,		eaTheme->bt[BUTTON_PREV].y)
    InitObject(btStop,			eaTheme->bt[BUTTON_STOP].x,		eaTheme->bt[BUTTON_STOP].y)
    InitObject(btPlay,			eaTheme->bt[BUTTON_PLAY].x,		eaTheme->bt[BUTTON_PLAY].y)
    InitObject(btPause,			eaTheme->bt[BUTTON_PAUSE].x,	eaTheme->bt[BUTTON_PAUSE].y)
    InitObject(btNext,			eaTheme->bt[BUTTON_NEXT].x,		eaTheme->bt[BUTTON_NEXT].y)
    InitObject(btAddMusic,		eaTheme->bt[BUTTON_ADDMUS].x,	eaTheme->bt[BUTTON_ADDMUS].y)
	InitObject(objFloatText,	eaTheme->bt[OBJECT_FLOAT_TEXT].x,	eaTheme->bt[OBJECT_FLOAT_TEXT].y)
	InitObject(objVisualiser,	eaTheme->bt[OBJECT_VISUALISER].x,	eaTheme->bt[OBJECT_VISUALISER].y)
	InitObject(btChangeVis,		eaTheme->bt[BUTTON_CHANGE_VIS].x,	eaTheme->bt[BUTTON_CHANGE_VIS].y)
	InitObject(sldPosition,		eaTheme->bt[SLIDER_POSITION].x,		eaTheme->bt[SLIDER_POSITION].y);
	InitObject(sldVolume,		eaTheme->bt[SLIDER_VOLUME].x,		eaTheme->bt[SLIDER_VOLUME].y);
	InitObject(objTopMenu,		eaTheme->bt[TOPMENU].x,				eaTheme->bt[TOPMENU].y);
	InitObject(btShuffle,		eaTheme->bt[BUTTON_SHUFFLE].x,		eaTheme->bt[BUTTON_SHUFFLE].y)
	InitObject(btLoop,			eaTheme->bt[BUTTON_LOOP].x,		eaTheme->bt[BUTTON_LOOP].y)
	InitObject(btSettings,		eaTheme->bt[BUTTON_SETTINGS].x,		eaTheme->bt[BUTTON_SETTINGS].y)
	InitObject(btOnTop,			eaTheme->bt[BUTTON_ONTOP].x,		eaTheme->bt[BUTTON_ONTOP].y)
    initPlaylist();

}



void eaDeinit() {
    if(eaCurrentSound!=nullptr) audio::stop(eaCurrentSound);
    eaPlaylistSave("playlists/temp.epl");
	settingsSave();
}
