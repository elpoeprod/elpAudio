#include "../include/buttons.hpp"

#define button(a) GBObject *a;

button(btPlay)
button(btStop)
button(btPause)
button(btNext)
button(btPrev)
button(btAddMusic)
button(objFloatText)
button(objVisualiser)
button(btChangeVis)
button(sldPosition)
button(sldVolume)
button(objTopMenu)

#undef button


void initButton() {
    btPlay=			object::add(eaTheme->bt[BUTTON_PLAY].spr		,nullptr);
    btStop=			object::add(eaTheme->bt[BUTTON_STOP].spr		,nullptr);
    btPause=		object::add(eaTheme->bt[BUTTON_PAUSE].spr		,nullptr);
    btPrev=			object::add(eaTheme->bt[BUTTON_PREV].spr		,nullptr);
    btNext=			object::add(eaTheme->bt[BUTTON_NEXT].spr		,nullptr);
    btAddMusic=		object::add(eaTheme->bt[BUTTON_ADDMUS].spr		,nullptr);
	objFloatText=	object::add(eaTheme->bt[FLOAT_BACKGROUND].spr	,eaTheme->bt[FLOAT_FOREGROUND].spr);
	objVisualiser=	object::add(eaTheme->bt[VISUALISER_BG].spr		,eaTheme->bt[VISUALISER_FG].spr);
	btChangeVis=	object::add(eaTheme->bt[BUTTON_CHANGE_VIS].spr	,nullptr);
	sldPosition=	object::add(eaTheme->bt[SLIDER_POSITION_BG].spr	,eaTheme->bt[SLIDER_POSITION_FG].spr);
	sldVolume=		object::add(eaTheme->bt[SLIDER_VOLUME_BG].spr	,eaTheme->bt[SLIDER_VOLUME_FG].spr);
	objTopMenu=		object::add(eaTheme->bt[TOPMENU].spr,nullptr);
    return;
}
