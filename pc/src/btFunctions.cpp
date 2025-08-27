#include "../include/main.hpp"
#include <gamebreaker/gamebreaker.hpp>

GBSound *eaCurrentSound=nullptr;
var eaPlayerState=ea_state::none;

void eaPlayCurrentSong(int song) {
    if(eaPlaylist.size()==0) return;
    if(eaCurrentSound!=nullptr) {
        audio::destroy(eaCurrentSound);
    }
    eaCurrentSound=audio::add(eaPlaylist[song],gb::GB_MUSIC);
    audio::loop(eaCurrentSound,eaSettings->loop);
	audio::set_vol(eaCurrentSound,eaSettings->volume/128.f);
    audio::get_tags(eaCurrentSound);
    eaPlayerState=ea_state::playing;
    return;
}

void btPlay_Create(GBObject *self) {
    self->image_index=0;
    self->image_speed=0;

    return;
}

void btPlay_Step(GBObject *self) {

    return;
}

void btPlay_Draw(GBObject *self) {
    var state=draw::button(self->x,self->y,self->spr->w,self->spr->h,self->spr,0);
    if(state.released) {
        switch(eaPlayerState) {
            case ea_state::none: {
                eaPlayCurrentSong(eaSettings->current);
            } break;
            case ea_state::paused: {
                audio::resume(eaCurrentSound);
                eaPlayerState=ea_state::playing;
            }
            case ea_state::stopped: {
                audio::resume(eaCurrentSound);
                eaPlayerState=ea_state::playing;
            }
            default:
            case ea_state::playing: {} break;
        }

    }

    return;
}


void btStop_Create(GBObject *self) {
    self->image_index=0;
    self->image_speed=0;

    return;
}

void btStop_Step(GBObject *self) {
    return;
}

void btStop_Draw(GBObject *self) {
    var state=draw::button(self->x,self->y,self->spr->w,self->spr->h,self->spr,0);
    if(state.released) {
        if(eaPlayerState==ea_state::playing||eaPlayerState==ea_state::paused) {
            eaPlayerState=ea_state::stopped;
            audio::pause(eaCurrentSound);
            audio::set_pos(eaCurrentSound,0);
        }
    }
    return;
}

void btPause_Create(GBObject *self) {
    self->image_index=0;
    self->image_speed=0;

    return;
}

void btPause_Step(GBObject *self) {

    return;
}

void btPause_Draw(GBObject *self) {
    var state=draw::button(self->x,self->y,self->spr->w,self->spr->h,self->spr,0);
    if(state.released) {
        if(eaPlayerState==ea_state::playing) {
            eaPlayerState=ea_state::paused;
            audio::pause(eaCurrentSound);
        }
    }
    return;
}

void btPrev_Create(GBObject *self) {
    self->image_index=0;
    self->image_speed=0;

    return;
}

void btPrev_Step(GBObject *self) {

    return;
}

void btPrev_Draw(GBObject *self) {
    var state=draw::button(self->x,self->y,self->spr->w,self->spr->h,self->spr,0);
    if(state.released) {
        if(eaSettings->current>0) eaSettings->current--; else eaSettings->current=eaPlaylist.size()-1;
        //puts(("Previous "+stringify(eaSettings->current)).c_str());
        eaPlayCurrentSong(eaSettings->current);
    }
    return;
}

void btNext_Create(GBObject *self) {
    self->image_index=0;
    self->image_speed=0;

    return;
}

void btNext_Step(GBObject *self) {

    return;
}

void btNext_Draw(GBObject *self) {
    var state=draw::button(self->x,self->y,self->spr->w,self->spr->h,self->spr,0);
    int pressed=0;
    if(state.released&&!pressed) {
        pressed=1;
        if(eaSettings->current<eaPlaylist.size()-1) eaSettings->current++; else eaSettings->current=0;
        //puts(("Next "+stringify(eaSettings->current)).c_str());
        eaPlayCurrentSong(eaSettings->current);
    }
    return;
}

#include <gamebreaker/nfd/nfd.hpp>

void btAddMusic_Create(GBObject *self) {
    self->image_index=0;
    self->image_speed=0;

    return;
}

void btAddMusic_Step(GBObject *self) {

    return;
}

void eaCallbackAddFile() {
	eaPlaylistAddFile(file::get_fname(eaFilenameFilter,"Add music to the playlist..."));
}

void eaCallbackAddFolder() {
	eaPlaylistAddFolder(file::get_folder("Add a folder to the playlist..."));
}

void btAddMusic_Draw(GBObject *self) {
    var state=draw::button(self->x,self->y,self->spr->w,self->spr->h,self->spr,0);
    if(state.released) {
        switch(state.button) {
            case mb::left: {
                eaCallbackAddFile();
            } break;
            case mb::right: {
                gb::GBPOMItems myitems={{"Add a file...",1000,eaCallbackAddFile},{"Add a folder...",1001,eaCallbackAddFolder}};
				show::popover_menu(myitems);
            } break;
            default: break;
        }
    }
}


GBSurface *floatsurf;
GBText *floattext;
int mycurrent=-1;
float floatx=0;
int waittime=0;

void objFloatText_Create(GBObject *self) {
	self->image_index=0;
	self->image_speed=0;
	draw::set_font(fntVisual);
	draw::color_sdl(col::lime);
	floatsurf=surface::add(128,32);
	floattext=new GBText("WELCOME!");
	draw::set_font(fntMain);
}

void objFloatText_Step(GBObject *self) {
	if(eaPlayerState==ea_state::none) {
		//nothing
	} else {
		if(mycurrent!=eaSettings->current) {
			mycurrent=eaSettings->current;
			var mystr=eaCurrentSound->tag["artist"]+" - "+eaCurrentSound->tag["title"];
			if(mystr==" - ") mystr=file::fname(eaCurrentSound->fname);
			draw::set_font(fntVisual);
			*floattext=mystr;
			draw::set_font(fntMain);
			floatx=-6;
			waittime=0;
		}
	}
	if(floattext->surf->w>floatsurf->w) {
		if(waittime<30) waittime++; else {
			if(floatx<floattext->surf->w+10) floatx++;
			else floatx=-floatsurf->w-10;
		}
	}
	return;
}

void objFloatText_Draw(GBObject *self) {
	surface::target_set(floatsurf);
		draw::color_sdl(col::black);
		draw::rect(0,0,floatsurf->w,floatsurf->h,0);
		draw::set_text_align(0,0.5);
		draw::color_sdl(col::lime);
		draw::text(-floatx,floatsurf->h/2.f,floattext);
		draw::color_sdl(col::white);
	surface::target_reset();

	draw::sprite(self->spr,0,self->x,self->y,1,1,0);
	draw::surface(floatsurf,self->x,self->y,1,1,0,col::white);
	draw::sprite(self->mask,0,self->x,self->y,1,1,0);
}

GBSurface *vissurf;
GBSurface *addsurf;

void objVisualiser_Create(GBObject *self) {
	vissurf=surface::add(eaTheme->visW,eaTheme->visH);
	addsurf=surface::add(eaTheme->visW,eaTheme->visH);
	surface::target_set(vissurf);
	draw::color_sdl(col::black);
	draw::rect(0,0,vissurf->w,vissurf->h,0);
	draw::color_sdl(col::white);
	surface::target_reset();
	surface::target_set(addsurf);
	draw::color_sdl(col::black);
	draw::rect(0,0,vissurf->w,vissurf->h,0);
	draw::color_sdl(col::white);
	surface::target_reset();
	return;
}

void objVisualiser_Step(GBObject *self) {

	return;
}

void vis1() {
	surface::target_set(vissurf);
	draw::color_sdl(col::black);
	draw::rect(0,0,vissurf->w,vissurf->h,0);
	draw::color_sdl(col::white);
	int i=0;
	var repeats=50;
	float mymul=float(vissurf->w)/repeats;
	repeat(repeats) {
		draw::line(i*mymul,vissurf->h-(audio::get_fft(eaCurrentSound,math::floor(i*2))/256)*vissurf->h,(i+1)*mymul,
				   vissurf->h-(audio::get_fft(eaCurrentSound,(i+1)*2)/256)*vissurf->h);
		i++;
	}
	surface::target_reset();
}

void vis2() {
	surface::target_set(vissurf);
	draw::color_sdl(col::black);
	draw::rect(0,0,vissurf->w,vissurf->h,0);
	draw::color_sdl(col::white);
	int i=0;
	int repeats=50;
	repeat(repeats) {
		float mymul=float(vissurf->w)/repeats;
		draw::line(i*mymul,vissurf->h/2.f-audio::get_wave(eaCurrentSound,i*2)*32,(i+1)*mymul,
				   vissurf->h-audio::get_wave(eaCurrentSound,(i+1)*2)*32);
		i++;
	}
	surface::target_reset();
}

void vis3(GBObject *self) {
	draw::color_sdl(col::black);
	draw::rect(self->x,self->y,vissurf->w,vissurf->h,0);
	draw::color_sdl(col::white);

	//surface::clone(vissurf,addsurf,0,0);
	surface::target_set(vissurf);

	draw::color_sdl((SDL_Color){0,0,0,50});
	draw::alpha(0.1);
	draw::rect(0,0,vissurf->w,vissurf->h,0);

	draw::alpha(1);


	//draw::surface(addsurf,0,0,1,1,0,(SDL_Color){255,255,255,50});

	draw::color_sdl(col::white);
	real i=0;
	var repeats=50;
	float mymul=float(vissurf->w)/repeats;
	repeat(repeats) {
		draw::line(i*mymul,vissurf->h/2.f+audio::get_wave(eaCurrentSound,i*2) * 32,
				   (i+1)*mymul,vissurf->h/2.f+audio::get_wave(eaCurrentSound,(i+1)*2) * 32);
		draw::line(i*mymul,-5+vissurf->h/2.f+audio::get_wave(eaCurrentSound,(i+1)*2) * 32,
				   (i+1)*mymul,-5+vissurf->h/2.f+audio::get_wave(eaCurrentSound,(i+2)*2) * 32);
		i++;
	}
	surface::target_reset();
}

int visCount=3;

void objVisualiser_Draw(GBObject *self) {
	switch(eaSettings->lastVisualiser) {
		case 0: vis1(); break;
		case 1: vis2(); break;
		case 2: vis3(self); break;
		default: break;
	}

	draw::surface(vissurf,self->x,self->y,1,1,0,col::white);

	return;
}

void btChangeVis_Create(GBObject *self) {
	self->image_speed=0;
	self->image_index=0;
	return;
}

void btChangeVis_Step(GBObject *self) {

	return;
}

void btChangeVis_Draw(GBObject *self) {
	var state=draw::button(self->x,self->y,self->spr->w,self->spr->h,self->spr,0);
	if(state.released) {
		if(eaSettings->lastVisualiser<visCount-1) eaSettings->lastVisualiser++;
		else eaSettings->lastVisualiser=0;
	}
	return;
}

float mytemppos=0;

void sldPosition_Create(GBObject *self) {
	return;
}

void sldPosition_Step(GBObject *self) {
	return;
}

str eaCompileTime(double time) {
	return stringify(std::div(std::div(int(time),60).quot,24).quot)+":"+stringify(std::div(int(time),60).quot%60)+":"+stringify(int(time)%60);
	//return stringify(time);
}

void sldPosition_Draw(GBObject *self) {
	draw::sprite(self->spr,0,self->x,self->y,1,1,0);

	if(math::point_in_rect(mouse::x,mouse::y,self->x,self->y,self->x+self->spr->w,self->y+self->spr->h)) {
		if(mouse::holding(mb::left)) {
			mytemppos=math::clamp(mouse::x-self->x,0,self->spr->w);
			draw::text_rt(1,1,eaCompileTime((mytemppos/self->spr->w)*audio::get_len(eaCurrentSound)));
		}

		if(mouse::released(mb::left)) {
			audio::set_pos(eaCurrentSound,(mytemppos/self->spr->w)*audio::get_len(eaCurrentSound));
		}
	} else
		mytemppos=(audio::get_pos(eaCurrentSound)/audio::get_len(eaCurrentSound))*self->spr->w;

	var clampedpos=math::clamp(mytemppos,self->mask->w/2.f,self->spr->w-self->mask->w/2.f);
	draw::sprite_part(self->spr,1,self->x,self->y,clampedpos,self->spr->h,1,1,0);
	draw::sprite(self->mask,0,self->x+clampedpos,self->y+self->spr->h/2.f,1,1,0);
	return;
}

void sldVolume_Create(GBObject *self) {
	return;
}

void sldVolume_Step(GBObject *self) {

	return;
}

void sldVolume_Draw(GBObject *self) {
	draw::sprite(self->spr,0,self->x,self->y,1,1,0);

	if(math::point_in_rect(mouse::x,mouse::y,self->x,self->y,self->x+self->spr->w,self->y+self->spr->h)&&mouse::holding(mb::left)) {
		eaSettings->volume=math::clamp(mouse::x-self->x,0,128*(self->spr->w/128.f));
		audio::set_vol(eaCurrentSound,eaSettings->volume/128.f);
	}
	var myfloat=math::clamp(eaSettings->volume,self->mask->w/2.f,self->spr->w-self->mask->w/2.f);

	draw::sprite_part(self->spr,1,self->x,self->y,myfloat,self->spr->h,1,1,0);
	draw::sprite(self->mask,0,self->x+myfloat,self->y+self->mask->h/2.f,1,1,0);

	return;
}




GBText *myTopText;
int topChanged=0;
str myTopStr,
	myLastTopStr;

void objTopMenu_Create(GBObject *self) {
	myTopStr="elpAudio "+elpAudio_version;
	myLastTopStr="";
	myTopText=new GBText(myTopStr);
	return;
}

void objTopMenu_Step(GBObject *self) {
	if(eaPlayerState!=ea_state::none) {
		myTopStr="("+eaCompileTime(audio::get_pos(eaCurrentSound))+"/"+eaCompileTime(audio::get_len(eaCurrentSound))
				+") "+eaCurrentSound->tag["artist"]+" - "+eaCurrentSound->tag["title"]+" | elpAudio "+elpAudio_version;
		if(myLastTopStr!=myTopStr) {
			myLastTopStr=myTopStr;
			*myTopText=myTopStr;
		}
	}
	return;
}

void objTopMenu_Draw(GBObject *self) {
	if(eaTheme->drawTopMenuImg) {
		//nothing
	} else {
		draw::color_sdl(col::dk_gray);
		draw::rect(eaTheme->bt[TOPMENU].x,eaTheme->bt[TOPMENU].y,eaTheme->topMenuW,eaTheme->topMenuH,0);
		draw::color_sdl(col::white);
		draw::set_font(fntMain);
		draw::set_text_align(0, 0);
		draw::text(4,0,myTopText);
	}
	return;
}
