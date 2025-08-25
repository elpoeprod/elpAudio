#pragma once
#include "main.hpp"

#define button(a) GBObject *a;

extern button(btPlay)
extern button(btStop)
extern button(btPause)
extern button(btNext)
extern button(btPrev)

#undef button

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
