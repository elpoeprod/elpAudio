#include "../include/main.hpp"
#include <gamebreaker/gamebreaker.hpp>

GBSound *eaCurrentSound=nullptr;
var eaPlayerState=ea_state::none;

void eaPlayCurrentSong(int song) {
    if(eaCurrentSound!=nullptr) {
        audio::destroy(eaCurrentSound);
    }
    eaCurrentSound=audio::add(eaPlaylist[song],gb::GB_MUSIC);
    audio::loop(eaCurrentSound,eaSettings->loop);
    eaPlayerState=ea_state::playing;
    return;
}

void btPlay_Create(GBObject *self) {
    self->image_index=0;
    self->image_speed=0;

    return;
}

void btPlay_Step(GBObject *self) {

    return;
}

void btPlay_Draw(GBObject *self) {
    var state=draw::button(self->x,self->y,self->spr->w,self->spr->h,self->spr,0);
    if(state.released) {
        switch(eaPlayerState) {
            case ea_state::none: {
                eaPlayCurrentSong(eaSettings->current);
            } break;
            case ea_state::paused: {
                audio::resume(eaCurrentSound);
                eaPlayerState=ea_state::playing;
            }
            case ea_state::stopped: {
                audio::resume(eaCurrentSound);
                eaPlayerState=ea_state::playing;
            }
            default:
            case ea_state::playing: {} break;
        }

    }

    return;
}


void btStop_Create(GBObject *self) {
    self->image_index=0;
    self->image_speed=0;

    return;
}

void btStop_Step(GBObject *self) {

    return;
}

void btStop_Draw(GBObject *self) {
    var state=draw::button(self->x,self->y,self->spr->w,self->spr->h,self->spr,0);
    if(state.released) {
        if(eaPlayerState==ea_state::playing) {
            eaPlayerState=ea_state::stopped;
            audio::pause(eaCurrentSound);
            audio::set_pos(eaCurrentSound,0);
        }
    }
    return;
}

void btPause_Create(GBObject *self) {

    return;
}

void btPause_Step(GBObject *self) {

    return;
}

void btPause_Draw(GBObject *self) {
    var state=draw::button(self->x,self->y,self->spr->w,self->spr->h,self->spr,0);
    if(state.released) {
        if(eaPlayerState==ea_state::playing) {
            eaPlayerState=ea_state::paused;
            audio::pause(eaCurrentSound);
        }
    }
    return;
}

void btPrev_Create(GBObject *self) {

    return;
}

void btPrev_Step(GBObject *self) {

    return;
}

void btPrev_Draw(GBObject *self) {
    var state=draw::button(self->x,self->y,self->spr->w,self->spr->h,self->spr,0);
    if(state.released) {
        if(eaSettings->current>0) eaSettings->current--; else eaSettings->current=eaPlaylist.size()-1;
        puts(("Previous "+stringify(eaSettings->current)).c_str());
        eaPlayCurrentSong(eaSettings->current);
    }
    return;
}

void btNext_Create(GBObject *self) {

    return;
}

void btNext_Step(GBObject *self) {

    return;
}

void btNext_Draw(GBObject *self) {
    var state=draw::button(self->x,self->y,self->spr->w,self->spr->h,self->spr,0);
    int pressed=0;
    if(state.released&&!pressed) {
        pressed=1;
        if(eaSettings->current<eaPlaylist.size()-1) eaSettings->current++; else eaSettings->current=0;
        puts(("Next "+stringify(eaSettings->current)).c_str());
        eaPlayCurrentSong(eaSettings->current);
    }
    return;
}
