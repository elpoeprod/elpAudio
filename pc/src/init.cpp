#include "../include/main.hpp"
#include <gamebreaker/gamebreaker.hpp>
#define InitObject(a,x,y) room::add_instance(rmPlayerMain,a,x,y,nullptr); \
                            a->event_create=a##_Create; \
                            a->event_step=a##_Step; \
                            a->event_draw=a##_Draw;

GBRoom *rmPlayerMain;
GBFont *fntMain;

void eaInit() {
    initSettings();
    rmPlayerMain=room::add(eaSettings->w,eaSettings->h);
    room::camera_setup(rmPlayerMain,0,1,
                       (GB_CamSetup){0,0,eaSettings->w,eaSettings->h,0},
                       (GB_CamSetup){0,0,eaSettings->w,eaSettings->h,0},
                       -1,(GB_CamTarget){0,0,0,0});
    window::set_size(eaSettings->w,eaSettings->h);

    fntMain=font::add("themes/sourcesans.ttf",12);

    draw::set_font(fntMain);

    room::current(rmPlayerMain);
    initButton();
    InitObject(btPrev,      0,  16)
    InitObject(btStop,      32, 16)
    InitObject(btPlay,      64, 16)
    InitObject(btPause,     96, 16)
    InitObject(btNext,      128,16)
    InitObject(btAddMusic,  288,32)
    initPlaylist();

}



void eaDeinit() {
    if(eaCurrentSound!=nullptr) audio::stop(eaCurrentSound);
    eaPlaylistSave("playlists/temp.epl");
}
