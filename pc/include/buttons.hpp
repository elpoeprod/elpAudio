#pragma once
#include "main.hpp"

#define button(a) GBObject *a;

extern button(btPlay)
extern button(btStop)
extern button(btPause)
extern button(btNext)
extern button(btPrev)
extern button(btAddMusic)
extern button(objFloatText)
extern button(objVisualiser)
extern button(btChangeVis)

#undef button

extern GBFont *fntMain;
extern GBFont *fntVisual;
extern GBSound *eaCurrentSound;

extern void initButton();

#define funcs(a) extern void  a##_Create(GBObject *self); \
                extern void   a##_Step(GBObject *self); \
                extern void   a##_Draw(GBObject *self);

funcs(btPlay)
funcs(btStop)
funcs(btPause)
funcs(btPrev)
funcs(btNext)
funcs(btAddMusic)
funcs(objFloatText)
funcs(objVisualiser)
funcs(btChangeVis)
