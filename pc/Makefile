CXX_COMPILER=g++
CXX_ARGS=-O2
CXX_LIBS=-lgb -lSDL2 -lSDL2_ttf
CXX_CMDLINE=$(CXX_COMPILER) $(CXX_LIBS) $(CXX_ARGS)
CXX_COMPILE=$(CXX_COMPILER) -c

all:
	mkdir -p ./build/
	$(CXX_COMPILE) src/buttons.cpp 		-o build/btn.o
	$(CXX_COMPILE) src/init.cpp 		-o build/init.o
	$(CXX_COMPILE) src/main.cpp 		-o build/main.o
	$(CXX_COMPILE) src/settings.cpp 	-o build/stng.o
	$(CXX_COMPILE) src/playlist.cpp 	-o build/plst.o
	$(CXX_COMPILE) src/btFunctions.cpp 	-o build/funcs.o
	$(CXX_CMDLINE) build/*.o 		-o elpAudio
