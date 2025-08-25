#pragma once
#include "main.hpp"

const int EA_BUTTONS_MAX=6;

typedef struct eaSettings_t {
    int w,h;
    int current;
    int loop;
    GBSprite *btSprite[EA_BUTTONS_MAX];
} eaSettings_t;

extern eaSettings_t *eaSettings;

extern void initSettings();
