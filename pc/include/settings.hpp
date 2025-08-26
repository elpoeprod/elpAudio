#pragma once
#include "main.hpp"

const int EA_BUTTONS_MAX=20;

typedef struct eaSettings_t {
    int current;
    int loop;
	int lastVisualiser;
} eaSettings_t;

typedef struct _eaButton_t {
    GBSprite *spr;
    int x,y;
} _eaButton_t;

typedef struct eaTheme_t {
    std::string path, pathf,
                name,
                author,
                desiredVersion;

    int w,h;

	int visW,visH,
		visfgX,visfgY,
		visfgW,visfgH,
		visUseBg,visUseFg
	;

    _eaButton_t bt[EA_BUTTONS_MAX];

} eaTheme_t;

extern eaTheme_t *eaTheme;

extern eaSettings_t *eaSettings;

extern void initSettings();
