shader_type spatial;

uniform float grassres = 1;
uniform float rockres = 1;
uniform float dirtres = 1;

uniform sampler2D grass : hint_albedo;
uniform sampler2D rock : hint_albedo;
uniform sampler2D dirt : hint_albedo;
uniform sampler2D splatmap;

void fragment(){
 float grassval = texture(splatmap, UV).g;
 float rockval = texture(splatmap, UV).b;
 float dirtval = texture(splatmap, UV).r;
 
 vec3 grasstex = texture(grass, UV*grassres).rgb * grassval;
 vec3 rocktex = texture(rock, UV*rockres).rgb * rockval;
 vec3 dirttex = texture(dirt, UV*dirtres).rgb * dirtval;
 vec3 result = grasstex+rocktex+dirttex;
 
 ALBEDO = result;
 }