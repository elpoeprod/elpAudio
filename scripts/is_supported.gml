var f;f=argument0
if is_real(f) return 0
if f='' return 0
if string_lower(filename_ext(f))=='.mp3' return true
if string_lower(filename_ext(f))=='.ogg' return true
if string_lower(filename_ext(f))=='.wav' return true
if string_lower(filename_ext(f))=='.flac' return true
if string_lower(filename_ext(f))=='.mod' return true
if string_lower(filename_ext(f))=='.xm' return true
if string_lower(filename_ext(f))=='.stm' return true
if string_lower(filename_ext(f))=='.s3m' return true
if string_lower(filename_ext(f))=='.etm' return true
if string_lower(filename_ext(f))=='.m3u' return true
if string_lower(filename_ext(f))=='.m3u8' return true
if string_lower(filename_ext(f))=='.ogv' return true
if string_lower(filename_ext(f))=='.mp2' return true
return 0
