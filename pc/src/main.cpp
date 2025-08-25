#include "../include/main.hpp"

const str elpAudio_version="0.1";

GBObject *objTest;
GBSprite *sprTest;

void mydraw(GBObject *self) {
	//draw::button(self->x,self->y,32,32,sprTest,0);
}

int main() {
	gb::init(GB_WINPOS_CENTER,GB_WINPOS_CENTER,"elpAudio "+elpAudio_version);

	eaInit();
	objTest=object::add(nullptr,nullptr);
	sprTest=sprite::add("themes/default/butplay.png",2,0,0);
	objTest->event_draw=mydraw;


	gb::run();
	eaDeinit();

	gb::shutdown();

	return 0;
}
