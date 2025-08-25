#include "../include/main.hpp"

eaSettings_t *eaSettings;

void initSettings() {
    eaSettings=new eaSettings_t;
    eaSettings->w=480;
    eaSettings->h=80;
    eaSettings->current=0;
    eaSettings->loop=-1;
    eaSettings->btSprite[BUTTON_PLAY]=sprite::add("themes/default/butplay.png",2,0,0);
    eaSettings->btSprite[BUTTON_STOP]=sprite::add("themes/default/butstop.png",2,0,0);
    eaSettings->btSprite[BUTTON_PAUSE]=sprite::add("themes/default/butpause.png",2,0,0);
    eaSettings->btSprite[BUTTON_PREV]=sprite::add("themes/default/butprev.png",2,0,0);
    eaSettings->btSprite[BUTTON_NEXT]=sprite::add("themes/default/butnext.png",2,0,0);
}
