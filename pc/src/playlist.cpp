#include "../include/main.hpp"

std::vector<str>        eaPlaylist;
std::vector<str>        eaFileFilter=       {".mp3",".ogg",".flac",".wav",".m4a"};
fname_list              eaFilenameFilter=   {{"MPEG-Layer 3",".mp3"},{"OGG",".ogg"},{"OGG FLAC",".flac"},{"WAVE",".wav"},{"M4A",".m4a"}};

void eaPlaylistCheck();

void eaPlaylistAddFile(str file) {
    if(file::exists(file)) eaPlaylist.push_back(file);
    eaPlaylistCheck();
    return;
}
void eaPlaylistAddFolder(str folder) {
    ds_list mydslist;
    if(file::exists(folder)) mydslist=file::find::list_ext(folder,eaFileFilter,file::fa::fullpath);
    for(long unsigned int i=0;i<mydslist.size();i++) eaPlaylist.push_back(mydslist[i].data);
    eaPlaylistCheck();
    return;
}

void initPlaylist() {
    if(!file::exists("playlists/temp.epl")) eaPlaylistAddFolder("music_examples/");
    else eaPlaylistLoad("playlists/temp.epl");
	if(eaSettings->current>eaPlaylist.size()-1) eaSettings->current=0;
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
    eaPlaylistCheck();
    return;
}

void eaPlaylistLoad(str name) {
    if(!file::exists(name)) return;
    var myfile=file::text::open(name,file::fmode::read);
    var plVersion=file::text::read(myfile); //playlist version
	str myaddfile;
	str myerrorstr="";
    while(!file::text::eof(myfile)) {
		myaddfile=file::text::read(myfile);
		if(file::exists(myaddfile))
			eaPlaylist.push_back(myaddfile);
		else
			myerrorstr+=myaddfile+"\n";
    }
    if(myerrorstr!="") {
		if(eaPlaylist.size()==0) {
			myerrorstr+="Because of that, files from `music_examples` folder are loaded.";
			eaPlaylistAddFolder("music_examples/");
		}
		show::message("An error occured...","Could not add these files to playlist: \n"+myerrorstr);
	}
    file::text::close(myfile);
    eaPlaylistCheck();
    return;
}
/**
 * erases empty strings
*/
void eaPlaylistCheck() {
    for(long unsigned int i=0;i<eaPlaylist.size();i++) {
        if(eaPlaylist[i]=="" or !file::exists(eaPlaylist[i])) eaPlaylist.erase(eaPlaylist.cbegin()+i);
    }
}
