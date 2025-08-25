#include "../include/main.hpp"

eaSettings_t *eaSettings;

eaTheme_t *eaTheme;

void initSettings() {
    eaSettings=new eaSettings_t;
    eaSettings->w=480;
    eaSettings->h=80;
    eaSettings->current=0;
    eaSettings->loop=-1;

    eaTheme=new eaTheme_t;
    eaTheme->path="themes/default/";
    eaTheme->bt[BUTTON_PLAY].spr=  sprite::add(eaTheme->path+"butplay.png",   2,0,0);
    eaTheme->bt[BUTTON_STOP].spr=  sprite::add(eaTheme->path+"butstop.png",   2,0,0);
    eaTheme->bt[BUTTON_PAUSE].spr= sprite::add(eaTheme->path+"butpause.png",  2,0,0);
    eaTheme->bt[BUTTON_PREV].spr=  sprite::add(eaTheme->path+"butprev.png",   2,0,0);
    eaTheme->bt[BUTTON_NEXT].spr=  sprite::add(eaTheme->path+"butnext.png",   2,0,0);
    eaTheme->bt[BUTTON_ADDMUS].spr=sprite::add(eaTheme->path+"butaddmus.png", 2,0,0);
}
