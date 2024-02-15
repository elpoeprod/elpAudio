if string_ends_with(string_lower(argument0),'.xm') {xm_load(argument0)
return string_replace_all(xmname,"#",'//');}
if string_ends_with(string_lower(argument0),'.mod') {mod_load(argument0)
return string_replace_all(modname,"#",'//');}
if string_ends_with(string_lower(argument0),'.s3m') {s3m_load(argument0)
return string_replace_all(s3mname,"#",'//');}
if string_ends_with(string_lower(argument0),'.it') {it_load(argument0)
return string_replace_all(itname,"#",'//');}
