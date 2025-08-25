#pragma once
#define GB_USE_SMALL_FUNCNAMES
#define GB_DEFAULT_SAMPLESIZE 2048
#define GB_INIT_WIN_FLAGS SDL_WINDOW_SHOWN
#define GB_INIT_REN_FLAGS SDL_RENDERER_ACCELERATED
#include <gamebreaker/gamebreaker.hpp>
namespace gb=GameBreaker;

extern GBRoom *rmPlayerMain;

#include "playlist.hpp"
#include "settings.hpp"
#include "buttons.hpp"

extern void eaInit();
extern void eaDeinit();

#define BUTTON_PLAY     0
#define BUTTON_STOP     1
#define BUTTON_PAUSE    2
#define BUTTON_PREV     3
#define BUTTON_NEXT     4
#define BUTTON_ADDMUS   5

enum class ea_state {
    none=-1,
    playing,
    stopped,
    paused,
};
