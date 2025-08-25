#pragma once
#include "main.hpp"

extern std::vector<str> eaPlaylist;
extern std::vector<str> eaFileFilter;
extern fname_list eaFilenameFilter;

extern void eaPlaylistAddFile(str file);
extern void eaPlaylistAddFolder(str folder);
extern void initPlaylist();

extern void eaPlaylistSave(str name);
extern void eaPlaylistLoad(str name);
