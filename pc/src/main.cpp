#include "../include/main.hpp"

const str elpAudio_version="0.1";


int main() {
	gb::init(GB_WINPOS_CENTER,GB_WINPOS_CENTER,"elpAudio "+elpAudio_version);

	eaInit();
	gb::run();
	eaDeinit();
	gb::shutdown();

	return 0;
}
