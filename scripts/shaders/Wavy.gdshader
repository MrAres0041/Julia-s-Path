shader_type canvas_item;

// NUEVA VARIABLE: Controla el fade (0.0 = normal, 1.0 = distorsión máxima)
uniform float effect_intensity : hint_range(0.0, 1.0) = 0.0;

// Parámetros de animación y fuerza
uniform float time_factor : hint_range(0.0, 5.0) = 1.0;
uniform float wave_strength : hint_range(0.0, 0.5) = 0.05;
uniform float ripple_speed : hint_range(0.0, 5.0) = 1.0;

// Parámetros de distorsión
uniform sampler2D noise_tex : repeat_enable;
uniform float noise_scale : hint_range(0.0, 5.0) = 1.0;
uniform float swirl_strength : hint_range(-2.0, 2.0) = 0.5;

vec2 get_swirl_uv(vec2 uv, float strength, float time) {
    vec2 center = vec2(0.5);
    vec2 diff = uv - center;
    float dist = length(diff);
    float angle = atan(diff.y, diff.x) + strength * (0.5 - dist) * sin(time * 0.5);
    return center + vec2(cos(angle), sin(angle)) * dist;
}

void fragment() {
    vec2 uv = UV;
    float t = TIME * time_factor;

    float noise_val = texture(noise_tex, uv * noise_scale + t * 0.05).r;

    // Guardamos las UV deseadas con distorsión en una variable temporal
    vec2 distorted_uv = uv;

    // Aplicamos las distorsiones a la variable temporal
    distorted_uv.y += sin(distorted_uv.x * 10.0 + t) * wave_strength * noise_val;
    distorted_uv.x += cos(distorted_uv.y * 10.0 + t * 0.5) * wave_strength * noise_val;

    float dist_center = distance(distorted_uv, vec2(0.5));
    distorted_uv += sin(dist_center * 20.0 - t * ripple_speed) * (wave_strength * 0.5 * noise_val);
    distorted_uv = get_swirl_uv(distorted_uv, swirl_strength, t);

    // TRANSICIÓN SUAVE: Mezclamos las UV originales con las distorsionadas usando nuestra intensidad
    uv = mix(uv, distorted_uv, effect_intensity);

    vec4 tex = texture(TEXTURE, uv);
    COLOR = tex;
}