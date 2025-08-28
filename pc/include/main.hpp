#pragma once
#define GB_USE_SMALL_FUNCNAMES
#define GB_DEFAULT_SAMPLESIZE 2048
#define GB_INIT_WIN_FLAGS SDL_WINDOW_SHOWN
#define GB_INIT_REN_FLAGS SDL_RENDERER_ACCELERATED
#include <gamebreaker/gamebreaker.hpp>
namespace gb=GameBreaker;

extern gb::GBRoom *rmPlayerMain;

#include "playlist.hpp"
#include "settings.hpp"
#include "buttons.hpp"

extern void eaInit();
extern void eaDeinit();

extern const std::string elpAudio_version;

#define BUTTON_PLAY			0
#define BUTTON_STOP			1
#define BUTTON_PAUSE		2
#define BUTTON_PREV			3
#define BUTTON_NEXT			4
#define BUTTON_ADDMUS		5
#define OBJECT_FLOAT_TEXT	6
#define FLOAT_BACKGROUND	6
#define FLOAT_FOREGROUND	7
#define OBJECT_VISUALISER	8
#define VISUALISER_BG		8
#define VISUALISER_FG		9
#define BUTTON_CHANGE_VIS	10
#define SLIDER_POSITION		11
#define SLIDER_POSITION_BG	11
#define SLIDER_POSITION_FG	12
#define SLIDER_VOLUME		13
#define SLIDER_VOLUME_BG	13
#define SLIDER_VOLUME_FG	14
#define TOPMENU				15
#define BUTTON_SHUFFLE		16
#define BUTTON_LOOP			17
#define BUTTON_SETTINGS		18
#define BUTTON_ONTOP		19

enum class ea_state {
    none=-1,
    playing,
    stopped,
    paused,
};
