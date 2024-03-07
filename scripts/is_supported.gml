var f;f=argument0
//if string_lower(filename_ext(f))=='' return true
if string_lower(filename_ext(f))=='.mp3' return true
if string_lower(filename_ext(f))=='.ogg' return true
if string_lower(filename_ext(f))=='.wav' return true
if string_lower(filename_ext(f))=='.flac' return true
if string_lower(filename_ext(f))=='.mod' return true
if string_lower(filename_ext(f))=='.xm' return true
if string_lower(filename_ext(f))=='.stm' return true
if string_lower(filename_ext(f))=='.it' return true
if string_lower(filename_ext(f))=='.s3m' return true
if string_lower(filename_ext(f))=='.etm' return true
if string_lower(filename_ext(f))=='.m3u' return true
if string_lower(filename_ext(f))=='.m3u8' return true
if string_lower(filename_ext(f))=='.ogv' return true
if string_lower(filename_ext(f))=='.mp2' return true

/*
if string_lower(string_copy(f,1,string_pos('.',f)))=='mod.' return true
if string_lower(string_copy(f,1,string_pos('.',f)))=='xm.' return true
if string_lower(string_copy(f,1,string_pos('.',f)))=='it.' return true
if string_lower(string_copy(f,1,string_pos('.',f)))=='s3m.' return true
if string_lower(string_copy(f,1,string_pos('.',f)))=='stm.' return true
if string_lower(string_copy(f,1,string_pos('.',f)))=='etm.' return true
if string_lower(string_copy(f,1,string_pos('.',f)))=='mod.' return true
if string_lower(string_copy(f,1,string_pos('.',f)))=='mod.' return true
if string_lower(string_copy(f,1,string_pos('.',f)))=='mod.' return true
if string_lower(string_copy(f,1,string_pos('.',f)))=='mod.' return true
if string_lower(string_copy(f,1,string_pos('.',f)))=='mod.' return true
*/
return false
