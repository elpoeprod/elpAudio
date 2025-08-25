#include "../include/buttons.hpp"

#define button(a) GBObject *a;

button(btPlay)
button(btStop)
button(btPause)
button(btNext)
button(btPrev)

#undef button


void initButton() {
    btPlay=     object::add(eaSettings->btSprite[BUTTON_PLAY]   ,nullptr);
    btStop=     object::add(eaSettings->btSprite[BUTTON_STOP]   ,nullptr);
    btPause=    object::add(eaSettings->btSprite[BUTTON_PAUSE]  ,nullptr);
    btPrev=     object::add(eaSettings->btSprite[BUTTON_PREV]   ,nullptr);
    btNext=     object::add(eaSettings->btSprite[BUTTON_NEXT]   ,nullptr);
    return;
}
