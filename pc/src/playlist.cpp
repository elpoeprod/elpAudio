#include "../include/main.hpp"

std::vector<str> eaPlaylist;
std::vector<str> eaFileFilter={".mp3",".ogg",".flac",".wav",".m4a"};

void eaPlaylistAddFile(str file) {
    if(file::exists(file)) eaPlaylist.push_back(file);
    return;
}
void eaPlaylistAddFolder(str folder) {
    ds_list mydslist;
    if(file::exists(folder)) mydslist=file::find::list_ext(folder,eaFileFilter,file::fa::fullpath);
    for(long unsigned int i=0;i<mydslist.size();i++) eaPlaylist.push_back(mydslist[i].data);
    return;
}

void initPlaylist() {
    if(!file::exists("playlists/temp.epl")) eaPlaylistAddFolder("music_examples/");
    else eaPlaylistLoad("playlists/temp.epl");
    return;
}

void eaPlaylistSave(str name) {
    var myfolder=gstr::copy(name,0,gstr::pos("/",name));
    if(!file::exists(myfolder)) file::create_folder(myfolder);
    var myfile=file::text::open(name, file::fmode::write);
    file::text::write(myfile,"0"); //playlist version
    file::text::ln(myfile);
    int i=0; repeat(eaPlaylist.size()) {
        file::text::write(myfile,eaPlaylist[i]);
        file::text::ln(myfile);
        i++;
    }
    file::text::close(myfile);
    return;
}

void eaPlaylistLoad(str name) {
    if(!file::exists(name)) return;
    var myfile=file::text::open(name,file::fmode::read);
    var plVersion=file::text::read(myfile); //playlist version
    file::text::ln(myfile);
    while(!file::text::eof(myfile)) {
        eaPlaylist.push_back(file::text::read(myfile));
    }
    file::text::close(myfile);
    return;
}
