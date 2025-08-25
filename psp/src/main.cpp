#define GB_USE_SMALL_FUNCNAMES
//#include "gb_1file.hpp"
//#include <gamebreaker/gamebreaker.hpp>
#define SDL_MAIN_HANDLED
#include "gamebreaker/gamebreaker.hpp"
namespace gb=GameBreaker;

GBRoom *mainroom;

int main(int argc, char **argv) {
    gb::init(0,0,"elpAudio");
    mainroom=room::add(480,272);
    
    room::camera_setup(mainroom,0,1,(GB_CamSetup){0,0,480,272,0},(GB_CamSetup){0,0,480,272,0},-1,(GB_CamTarget){0,0,0,0});
    room::current(mainroom);

    gb::run();
    gb::shutdown();
}
