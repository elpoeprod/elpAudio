#pragma once
#include "main.hpp"

const int EA_BUTTONS_MAX=10;

typedef struct eaSettings_t {
    int w,h;
    int current;
    int loop;
} eaSettings_t;

typedef struct _eaButton_t {
    GBSprite *spr;
    int x,y;
} _eaButton_t;

typedef struct eaTheme_t {
    std::string path,
                name,
                author,
                desiredVersion;

    _eaButton_t bt[EA_BUTTONS_MAX];

} eaTheme_t;

extern eaTheme_t *eaTheme;

extern eaSettings_t *eaSettings;

extern std::string eaThemePath;

extern void initSettings();
