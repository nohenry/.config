// vim: set ft=glsl:
// blue light filter shader
// values from https://reshade.me/forum/shader-discussion/3673-blue-light-filter-similar-to-f-lux

precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

uniform vec2 screenSize;
uniform vec2 fullSize;
// float textureSize;

void main() {
    //ivec2 textureSize2D = textureSize(tex, 0);
    // ivec2 pixel = ivec2(v_texcoord * fullSize);

    vec2 pixel = v_texcoord * 1680;
    // if (pixel.x < 400.0) {
        vec4 pixColor = texture2D(tex, v_texcoord);

        gl_FragColor = pixColor; 
    // }
}
