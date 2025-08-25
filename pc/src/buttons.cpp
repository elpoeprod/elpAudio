#include "../include/buttons.hpp"

#define button(a) GBObject *a;

button(btPlay)
button(btStop)
button(btPause)
button(btNext)
button(btPrev)
button(btAddMusic)

#undef button


void initButton() {
    btPlay=     object::add(eaTheme->bt[BUTTON_PLAY].spr   ,nullptr);
    btStop=     object::add(eaTheme->bt[BUTTON_STOP].spr   ,nullptr);
    btPause=    object::add(eaTheme->bt[BUTTON_PAUSE].spr  ,nullptr);
    btPrev=     object::add(eaTheme->bt[BUTTON_PREV].spr   ,nullptr);
    btNext=     object::add(eaTheme->bt[BUTTON_NEXT].spr   ,nullptr);
    btAddMusic= object::add(eaTheme->bt[BUTTON_ADDMUS].spr ,nullptr);
    return;
}
