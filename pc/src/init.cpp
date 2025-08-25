#include "../include/main.hpp"
#include <gamebreaker/gamebreaker.hpp>
#define InitObject(a,x,y) room::add_instance(rmPlayerMain,a,x,y,nullptr); \
                            a->event_create=a##_Create; \
                            a->event_step=a##_Step; \
                            a->event_draw=a##_Draw;

GBRoom *rmPlayerMain;

void eaInit() {
    initSettings();
    rmPlayerMain=room::add(eaSettings->w,eaSettings->h);
    room::camera_setup(rmPlayerMain,0,1,
                       (GB_CamSetup){0,0,eaSettings->w,eaSettings->h,0},
                       (GB_CamSetup){0,0,eaSettings->w,eaSettings->h,0},
                       -1,(GB_CamTarget){0,0,0,0});
    room::current(rmPlayerMain);
    initButton();
    InitObject(btPrev,  0,  16)
    InitObject(btStop,  32, 16)
    InitObject(btPlay,  64, 16)
    InitObject(btPause, 96, 16)
    InitObject(btNext,  128,16)

    initPlaylist();

}



void eaDeinit() {
    if(eaCurrentSound!=nullptr) audio::stop(eaCurrentSound);
    eaPlaylistSave("playlists/temp.epl");
}
