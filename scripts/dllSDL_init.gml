/*************************************************************

                        gmSDL
                    build of 05.01.2024

                    by elpoep

                    SDL support for GameMaker.

**************************************************************/

var _calltype;_calltype=dll_cdecl;
globalvar _sdl_dll;_sdl_dll='D:\tes\testing\bin\Release\gmSDL.dll';
//init functions

global._sdl_init=               external_define(_sdl_dll,'gmSDL_init',_calltype,ty_real,1,ty_real)
global._sdl_mus_load=           external_define(_sdl_dll,'gmSDL_loadMUS',                  _calltype,ty_real,1,ty_string)
global._sdl_mus_play=           external_define(_sdl_dll,'gmSDL_playMUS',                  _calltype,ty_real,1,ty_real)
global._sdl_close=              external_define(_sdl_dll,'gmSDL_close',                 _calltype,ty_real,0)

//window functions
global._sdl_wincreate=          external_define(_sdl_dll,'gmSDL_window_create',         _calltype,ty_real,5,ty_real,ty_real,ty_real,ty_real,ty_real)
global._sdl_wintitle=           external_define(_sdl_dll,'gmSDL_window_title',          _calltype,ty_real,2,ty_real,ty_string)
global._sdl_wintitleget=        external_define(_sdl_dll,'gmSDL_window_title_get',      _calltype,ty_string,1,ty_real)
global._sdl_winclose=           external_define(_sdl_dll,'gmSDL_window_close',          _calltype,ty_real,1,ty_real)
global._sdl_winborderset=       external_define(_sdl_dll,'gmSDL_window_borders_set',    _calltype,ty_real,2,ty_real,ty_real)
global._sdl_winborderget=       external_define(_sdl_dll,'gmSDL_window_borders_get',    _calltype,ty_real,1,ty_real)
global._sdl_winupdate=          external_define(_sdl_dll,'gmSDL_window_update',         _calltype,ty_real,1,ty_real)

global._sdl_win_get_x=external_define(_sdl_dll,'gmSDL_window_get_x',_calltype,ty_real,1,ty_real)
global._sdl_win_get_y=external_define(_sdl_dll,'gmSDL_window_get_y',_calltype,ty_real,1,ty_real)

global._sdl_win_set_pos=external_define(_sdl_dll,'gmSDL_window_set_pos',_calltype,ty_real,3,ty_real,ty_real,ty_real)

global._sdl_sprload=            external_define(_sdl_dll,'gmSDL_sprite_load',           _calltype,ty_real,4,ty_real,ty_string,ty_real,ty_real)
global._sdl_sprdraw=            external_define(_sdl_dll,'gmSDL_draw_sprite',           _calltype,ty_real,4,ty_real,ty_real,ty_real,ty_real)
