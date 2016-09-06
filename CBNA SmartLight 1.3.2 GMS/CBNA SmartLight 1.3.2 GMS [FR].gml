#define SL_ToD_default
/* ToD (Time of Day): couleurs, luminosités et ombres des différentes heures du jour et de la nuit */

sl_tod[1,0] = 0;    // Heure
sl_tod[1,1] = 0;    // Taux de rouge
sl_tod[1,2] = 32;   // Taux de vert
sl_tod[1,3] = 255;  // Taux de bleu
sl_tod[1,4] = 0.16; // Facteur de luminosité ambiante
sl_tod[1,5] = 550;  // Direction des ombres du soleil
sl_tod[1,6] = 300;  // Longueur des ombres du soleil

sl_tod[2,0] = 1;
sl_tod[2,1] = 28;
sl_tod[2,2] = 56;
sl_tod[2,3] = 255;
sl_tod[2,4] = 0.16;
sl_tod[2,5] = 558.75;
sl_tod[2,6] = 300;

sl_tod[3,0] = 3;
sl_tod[3,1] = 47;
sl_tod[3,2] = 47;
sl_tod[3,3] = 236;
sl_tod[3,4] = 0.17;
sl_tod[3,5] = 576.25;
sl_tod[3,6] = 300;

sl_tod[4,0] = 4;
sl_tod[4,1] = 90;
sl_tod[4,2] = 56;
sl_tod[4,3] = 192;
sl_tod[4,4] = 0.2;
sl_tod[4,5] = 585;
sl_tod[4,6] = 300;

sl_tod[5,0] = 6;
sl_tod[5,1] = 255;
sl_tod[5,2] = 143;
sl_tod[5,3] = 0;
sl_tod[5,4] = 0.93;
sl_tod[5,5] = 602.5;
sl_tod[5,6] = 200;

sl_tod[6,0] = 8;
sl_tod[6,1] = 255;
sl_tod[6,2] = 219;
sl_tod[6,3] = 74;
sl_tod[6,4] = 0.96;
sl_tod[6,5] = 620;
sl_tod[6,6] = 115;

sl_tod[7,0] = 9;
sl_tod[7,1] = 255;
sl_tod[7,2] = 255;
sl_tod[7,3] = 202;
sl_tod[7,4] = 0.98;
sl_tod[7,5] = 628.75;
sl_tod[7,6] = 82;

sl_tod[8,0] = 11;
sl_tod[8,1] = 255;
sl_tod[8,2] = 255;
sl_tod[8,3] = 222;
sl_tod[8,4] = 1;
sl_tod[8,5] = 646.25;
sl_tod[8,6] = 58;

sl_tod[9,0] = 12;
sl_tod[9,1] = 255;
sl_tod[9,2] = 255;
sl_tod[9,3] = 223;
sl_tod[9,4] = 1;
sl_tod[9,5] = 655;
sl_tod[9,6] = 54;

sl_tod[10,0] = 13;
sl_tod[10,1] = 255;
sl_tod[10,2] = 255;
sl_tod[10,3] = 222;
sl_tod[10,4] = 1;
sl_tod[10,5] = 663.75;
sl_tod[10,6] = 58;

sl_tod[11,0] = 16;
sl_tod[11,1] = 255;
sl_tod[11,2] = 244;
sl_tod[11,3] = 183;
sl_tod[11,4] = 0.98;
sl_tod[11,5] = 690;
sl_tod[11,6] = 100;

sl_tod[12,0] = 17;
sl_tod[12,1] = 255;
sl_tod[12,2] = 204;
sl_tod[12,3] = 65;
sl_tod[12,4] = 0.96;
sl_tod[12,5] = 698.75;
sl_tod[12,6] = 140;

sl_tod[13,0] = 19;
sl_tod[13,1] = 255;
sl_tod[13,2] = 143;
sl_tod[13,3] = 0;
sl_tod[13,4] = 0.93;
sl_tod[13,5] = 716.25;
sl_tod[13,6] = 200;

sl_tod[14,0] = 21;
sl_tod[14,1] = 77;
sl_tod[14,2] = 67;
sl_tod[14,3] = 194;
sl_tod[14,4] = 0.2;
sl_tod[14,5] = 733.75;
sl_tod[14,6] = 300;

sl_tod[15,0] = 22;
sl_tod[15,1] = 28;
sl_tod[15,2] = 56;
sl_tod[15,3] = 255;
sl_tod[15,4] = 0.17;
sl_tod[15,5] = 742.5;
sl_tod[15,6] = 300;

sl_tod[16,0] = 23;
sl_tod[16,1] = 28;
sl_tod[16,2] = 56;
sl_tod[16,3] = 255;
sl_tod[16,4] = 0.16;
sl_tod[16,5] = 751.25;
sl_tod[16,6] = 300;

sl_tod[17,0] = 24;
sl_tod[17,1] = 0;
sl_tod[17,2] = 32;
sl_tod[17,3] = 255;
sl_tod[17,4] = 0.16;
sl_tod[17,5] = 760;
sl_tod[17,6] = 300;

#define SL_engine_ini_begin
/* SL_engine_ini_begin();               */
/* Commence l'initialisation du système */

var i;

global.sl_viewid      = view_current; // Index de la view dans laquelle afficher les effets
sl_tod_active         = true;         // Active/désactive la gestion des éclairages et ombres par le système de cycle jour/nuit
sl_timespeed          = 0;            // Vitesse d'avancement de l'heure
sl_buffer_texturesize = 1;            // Facteur de taille du buffer (entre 0 et 1)
sl_maxexposure        = 0.5;          // Facteur maximal de saturation des lumières

sl_ambient_color        = -1; // Couleur de la lumière ambiante
global.sl_ambient_light = -1; // Puissance de la lumière ambiante
global.sl_lightlist[0]  = -1; // Liste les objets light

// Variables relatives à la synchronisation affichage/buffer
sl_buffer_sync    = true;
sl_buffer_xmargin = -1;
sl_buffer_ymargin = -1;

// Layers
sl_layers_count = 0; // Nombre de layers

// Variables relatives aux ombres solaires
sl_sunshadows_active        = false; // Détermine si le rendu des ombres solaires doit être effectué ou non
sl_sunshadows_texturesize   = 0.6;   // Facteur de taille des ombres solaires (entre 0 et 1)
sl_sunshadows_quality       = 0.4;   // Facteur déterminant le nombre de samples composant les ombres solaires (entre 0 et 1)
sl_sunshadows_alpha         = 0.8;   // Facteur de transparence des ombres solaires (entre 0 et 1)
sl_sunshadows_alphalimit    = 0.6;   // Taux de luminosité ambiante minimum pour lequel les ombres solaires sont visibles
sl_sunshadows_margin        = 150;   // Dimension de la marge des ombres solaires, en pixels
sl_sunshadows_refresh       = true;  // Détermine si les ombres solaires sont rafraîchies ou non
sl_sunshadows_refreshrate   = 0;     // Fréquence de rafraîchissement des ombres solaires, en steps (<=0 pour un rafraîchissement continu) 
sl_sunshadows_layerscale[0] = -1;    // Facteurs d'étirement des ombres solaires pour les différents layers
sl_sunshadows_list[0,1]     = -1;    // Liste les objets projetant une ombre solaire
sl_sunshadows_texlist[0,1]  = -1;    // Liste les objets projetant une ombre solaire avec une texture

// Variables relatives aux ombres ambiantes
sl_ambientshadows_active    = false; // Détermine si le rendu des ombres ambiantes doit être effectué ou non
sl_ambientshadows_alpha     = 1;    // Facteur de transparence des ombres ambiantes (entre 0 et 1)
sl_ambientshadows_mapscale  = 0.5;  // Facteur de taille des ambient maps
sl_ambientshadows_map[0]    = -1;   // Liste des ambient maps
sl_ambientshadows_list[0,1] = -1;   // Liste des objets projetant une ombre ambiante
sl_ambientshadows_lock      = true; // Empêche l'affichage des ambient-maps avant que celles-ci soient calculées

// Liste des objets composant les masks des layers
sl_global_list[0,1] = -1;

#define SL_engine_ini_end
/* SL_engine_ini_end();                */
/* Termine l'initialisation du système */

var i;

if sl_ambient_color        = -1  sl_ambient_color        = make_color_rgb(sl_tod[sl_tod_index,1],sl_tod[sl_tod_index,2],sl_tod[sl_tod_index,3]); // Couleur de la lumière ambiante
if global.sl_ambient_light = -1  global.sl_ambient_light = sl_tod[sl_tod_index,4]; // Puissance de la lumière ambiante

global.sl_light_gbuffer       = -1; // Surface du buffer global pour le rendu des lumières
//global.sl_lightlist[0]      = -1; // Liste les objets light
global.sl_castlist[0,0]       = -1; // Liste les valeurs des draw effectués avec SL_cast_sprite
global.sl_castlist_index      = 0;  // Gestion de la liste sl_castlist
global.sl_texlist_light[0,0]  = -1; // Liste les valeurs des draw effectués avec SL_draw_sprite_light
global.sl_texlist_light_index = 0;  // Gestion de la liste sl_texlist_light
global.sl_texlist_shad[0,0]   = -1; // Liste les valeurs des draw éffectués avec SL_draw_sprite_shadow
global.sl_texlist_shad_index  = 0;  // Gestion de la liste sl_texlist_shad

// Variables relatives à la synchronisation affichage/buffer
if sl_buffer_sync
{if sl_buffer_xmargin = -1 { if view_hspeed[global.sl_viewid]>=0 sl_buffer_xmargin=view_hspeed[global.sl_viewid]+5 else sl_buffer_xmargin=10 }; // Marges du buffer
 if sl_buffer_ymargin = -1 { if view_vspeed[global.sl_viewid]>=0 sl_buffer_ymargin=view_vspeed[global.sl_viewid]+5 else sl_buffer_ymargin=10 }};
else { sl_buffer_xmargin = 0 sl_buffer_ymargin = 0 };
sl_view_xprevious = view_xview[global.sl_viewid]; // Coordonnées de la view au step précédent
sl_view_yprevious = view_yview[global.sl_viewid];
sl_view_xspeed    = 0; // Vitesse de déplacement de la view
sl_view_yspeed    = 0;

// Surfaces des layers
for (i=0; i<sl_layers_count; i+=1) sl_layers_surface[i] = -1;

// Variables relatives aux ombres solaires
if sl_sunshadows_layerscale[0] = -1 for (i=0; i<sl_layers_count; i+=1) sl_sunshadows_layerscale[i] = (i+1)*(1/(sl_layers_count+1)); // Facteurs d'étirement des ombres solaires pour les différents layers
sl_sunshadows_refreshcounter   = sl_sunshadows_refreshrate; // Gestion de la fréquence de rafraîchissement des ombres solaires
sl_sunshadows_light            = 1; // Gestion de la luminosité des ombres solaires
sl_sunshadows_margin           = max(sl_sunshadows_margin,sl_buffer_xmargin,sl_buffer_ymargin);

// Surfaces des ombres solaires
sl_sunshadows_surface1[0] = -1;
sl_sunshadows_surface1[1] = -1;
sl_sunshadows_surface2    = -1;

// Surface des ombres ambiantes
sl_ambientshadows_surface = -1;

// Surfaces du buffer
sl_buffer_surface1 = -1;
sl_buffer_surface2 = -1;
sl_buffer_width    = 0;
sl_buffer_height   = 0;

#define SL_engine_render
/* SL_engine_render();                       */
/* Calcule l'ensemble des ombres et lumières */

var i, i1, r, g, b, j, sl, rl;

if !surface_exists(sl_buffer_surface1)
{
    sl_buffer_surface1 = surface_create((view_wview[global.sl_viewid]+sl_buffer_xmargin*2)*sl_buffer_texturesize,(view_hview[global.sl_viewid]+sl_buffer_ymargin*2)*sl_buffer_texturesize);
    sl_buffer_surface2 = surface_create((view_wview[global.sl_viewid]+sl_buffer_xmargin*2)*sl_buffer_texturesize,(view_hview[global.sl_viewid]+sl_buffer_ymargin*2)*sl_buffer_texturesize);
    sl_buffer_width    = surface_get_width (sl_buffer_surface1);
    sl_buffer_height   = surface_get_height(sl_buffer_surface1);
}

/// - GESTION DU TOD/HEURE

// Gestion de l'avancement de l'heure
global.sl_time += sl_timespeed;
if global.sl_time >= 24 { global.sl_time=0 sl_tod_index=1 };
if global.sl_time >= sl_tod[sl_tod_index+1,0] sl_tod_index += 1;

// Calcul de la puissance de l'éclairage ambiant
if sl_tod_active global.sl_ambient_light = ((global.sl_time-sl_tod[sl_tod_index,0])/(sl_tod[sl_tod_index+1,0]-sl_tod[sl_tod_index,0]))*(sl_tod[sl_tod_index+1,4]-sl_tod[sl_tod_index,4])+sl_tod[sl_tod_index,4];

/// - MASKS

draw_set_alpha(1);
draw_set_blend_mode(bm_normal);

for (i1=0; i1<sl_layers_count; i1+=1)
{
    if !surface_exists(sl_layers_surface[i1]) sl_layers_surface[i1] = surface_create((view_wview[global.sl_viewid]+sl_buffer_xmargin*2)*sl_buffer_texturesize,(view_hview[global.sl_viewid]+sl_buffer_ymargin*2)*sl_buffer_texturesize);
    
    surface_set_target(sl_layers_surface[i1]); // Création des masks pour le rendu des layers
    draw_clear(c_white);
    
    for (i2=0; sl_global_list[i2,1]!=-1; i2+=1) if sl_global_list[i2,0]=i1 with sl_global_list[i2,1] if visible
     draw_sprite_ext(sprite_index,floor(image_index),(x-view_xview[global.sl_viewid]+other.sl_buffer_xmargin)*other.sl_buffer_texturesize,(y-view_yview[global.sl_viewid]+other.sl_buffer_ymargin)*other.sl_buffer_texturesize,image_xscale*other.sl_buffer_texturesize,image_yscale*other.sl_buffer_texturesize,image_angle,c_black,image_alpha);
    for (i2=0; global.sl_castlist[i2,0]!=-1; i2+=1) if global.sl_castlist[i2,0]=i1
     draw_sprite_ext(global.sl_castlist[i2,4],global.sl_castlist[i2,5],(global.sl_castlist[i2,6]-view_xview[global.sl_viewid]+sl_buffer_xmargin)*sl_buffer_texturesize,(global.sl_castlist[i2,7]-view_yview[global.sl_viewid]+sl_buffer_ymargin)*sl_buffer_texturesize,global.sl_castlist[i2,9]*sl_buffer_texturesize,global.sl_castlist[i2,10]*sl_buffer_texturesize,global.sl_castlist[i2,11],c_black,global.sl_castlist[i2,12]);
    
    draw_set_blend_mode_ext(bm_inv_dest_color,bm_inv_src_color);
    draw_set_color(c_white);
    draw_rectangle(0,0,(view_wview[global.sl_viewid]+sl_buffer_xmargin*2)*sl_buffer_texturesize,(view_hview[global.sl_viewid]+sl_buffer_ymargin*2)*sl_buffer_texturesize,0);
    
    draw_set_blend_mode_ext(bm_src_color,bm_one);
    draw_set_color(c_black);
    draw_rectangle(0,0,(view_wview[global.sl_viewid]+sl_buffer_xmargin*2)*sl_buffer_texturesize,(view_hview[global.sl_viewid]+sl_buffer_ymargin*2)*sl_buffer_texturesize,0);
    draw_set_color(c_white);
    draw_set_blend_mode(bm_normal);
    surface_reset_target();
}

/// - OMBRES SOLAIRES

if sl_sunshadows_active{

sl_sunshadows_refreshcounter-=1;

if sl_sunshadows_refresh && sl_sunshadows_refreshcounter<=0
{
    // Calcul des composantes des ombres solaires
    if sl_tod_active
    {sl_sunshadows_direction = ((global.sl_time-sl_tod[sl_tod_index,0])/(sl_tod[sl_tod_index+1,0]-sl_tod[sl_tod_index,0]))*(sl_tod[sl_tod_index+1,5]-sl_tod[sl_tod_index,5])+sl_tod[sl_tod_index,5];
     sl_sunshadows_length    = ((global.sl_time-sl_tod[sl_tod_index,0])/(sl_tod[sl_tod_index+1,0]-sl_tod[sl_tod_index,0]))*(sl_tod[sl_tod_index+1,6]-sl_tod[sl_tod_index,6])+sl_tod[sl_tod_index,6]};
    sl_sunshadows_light      = -(sl_sunshadows_alpha/(1-sl_sunshadows_alphalimit)*(global.sl_ambient_light-sl_sunshadows_alphalimit))+1;
    
    if sl_sunshadows_light < 1
    {
        if !surface_exists(sl_sunshadows_surface2)
        {
            sl_sunshadows_surface1[0] = surface_create((view_wview[global.sl_viewid]+sl_sunshadows_margin*2)*sl_sunshadows_texturesize,(view_hview[global.sl_viewid]+sl_sunshadows_margin*2)*sl_sunshadows_texturesize);
            sl_sunshadows_surface1[1] = surface_create((view_wview[global.sl_viewid]+sl_sunshadows_margin*2)*sl_sunshadows_texturesize,(view_hview[global.sl_viewid]+sl_sunshadows_margin*2)*sl_sunshadows_texturesize);
            sl_sunshadows_surface2    = surface_create((view_wview[global.sl_viewid]+sl_buffer_xmargin*2)*sl_buffer_texturesize,(view_hview[global.sl_viewid]+sl_buffer_ymargin*2)*sl_buffer_texturesize);
        }
        
        for (i1=0; i1<sl_layers_count; i1+=1)
        {
            surface_set_target(sl_sunshadows_surface1[0]); // Création du sample
            draw_clear(c_white);
            
            sl_r = 0;
            
            for (i2=0; sl_sunshadows_list[i2,1]!=-1; i2+=1) if sl_sunshadows_list[i2,0] = i1
            {
                sl_xx = lengthdir_x(1+global.sl_z[sl_sunshadows_list[i2,1]]*sl_sunshadows_length,sl_sunshadows_direction)-view_xview[global.sl_viewid]+sl_sunshadows_margin;
                sl_yy = lengthdir_y(1+global.sl_z[sl_sunshadows_list[i2,1]]*sl_sunshadows_length,sl_sunshadows_direction)-view_yview[global.sl_viewid]+sl_sunshadows_margin;
                
                with sl_sunshadows_list[i2,1] if visible
                {
                    other.sl_r = 1;
                    var shspr;
                    if other.sl_sunshadows_list[other.i2,2]>-1 shspr = other.sl_sunshadows_list[other.i2,2] else shspr = sprite_index;
                    
                    draw_sprite_ext(shspr,floor(image_index),(x+other.sl_xx)*other.sl_sunshadows_texturesize,(y+other.sl_yy)*other.sl_sunshadows_texturesize,image_xscale*other.sl_sunshadows_texturesize,image_yscale*other.sl_sunshadows_texturesize,image_angle,c_black,image_alpha);
                }
            }
            
            for (i2=0; global.sl_castlist[i2,0]!=-1; i2+=1) if global.sl_castlist[i2,0]=i1 && global.sl_castlist[i2,1]=true
            {
                sl_r  = 1;
                sl_xx = lengthdir_x(1+global.sl_castlist[i2,8]*sl_sunshadows_length,sl_sunshadows_direction)-view_xview[global.sl_viewid]+sl_sunshadows_margin;
                sl_yy = lengthdir_y(1+global.sl_castlist[i2,8]*sl_sunshadows_length,sl_sunshadows_direction)-view_yview[global.sl_viewid]+sl_sunshadows_margin;
                
                draw_sprite_ext(global.sl_castlist[i2,4],global.sl_castlist[i2,5],(global.sl_castlist[i2,6]+sl_xx)*sl_sunshadows_texturesize,(global.sl_castlist[i2,7]+sl_yy)*sl_sunshadows_texturesize,global.sl_castlist[i2,9]*sl_sunshadows_texturesize,global.sl_castlist[i2,10]*sl_sunshadows_texturesize,global.sl_castlist[i2,11],c_black,global.sl_castlist[i2,12]);
            }
            
            surface_reset_target();
            
            surface_set_target(sl_sunshadows_surface1[1]); // Projection des ombres
            draw_clear(c_white);
            draw_set_blend_mode_ext(bm_dest_color,bm_zero);
            
            i = 1;
            
            if sl_r && sl_sunshadows_length != 0
            {
                j  = ((sl_sunshadows_length*sl_sunshadows_layerscale[i1]) / (sl_sunshadows_length*sl_sunshadows_layerscale[i1]*sl_sunshadows_quality)) * sl_sunshadows_texturesize;
                sl = sl_sunshadows_length * sl_sunshadows_layerscale[i1] * sl_sunshadows_texturesize;
                rl = j / 2;
                b  = 0;

                repeat (ceil(sqr(sl/j)))
                {
                    surface_reset_target();
                    surface_set_target(sl_sunshadows_surface1[i]);
                    rl *= 2;  if rl*2-j >= sl {rl = sl-rl+j  b = 1};
                    draw_clear(c_white);
                    draw_surface(sl_sunshadows_surface1[!i],0,0);
                    if b break;
                    draw_surface(sl_sunshadows_surface1[!i],lengthdir_x(rl,sl_sunshadows_direction),lengthdir_y(rl,sl_sunshadows_direction)); 
                    i = !i;
                }
            }
            surface_reset_target();
            
            surface_set_target(sl_sunshadows_surface2); // Composition finale des ombres
            if i1 = 0 draw_clear(c_white);
            
            if sl_r && sl_sunshadows_length != 0
            {
                sl_xx = lengthdir_x(rl/sl_sunshadows_texturesize,sl_sunshadows_direction);
                sl_yy = lengthdir_y(rl/sl_sunshadows_texturesize,sl_sunshadows_direction);
                
                draw_surface_ext(sl_sunshadows_surface1[i],(-sl_sunshadows_margin+sl_buffer_xmargin)*sl_buffer_texturesize,(-sl_sunshadows_margin+sl_buffer_ymargin)*sl_buffer_texturesize,1/sl_sunshadows_texturesize*sl_buffer_texturesize,1/sl_sunshadows_texturesize*sl_buffer_texturesize,0,c_white,1);
                draw_surface_ext(sl_sunshadows_surface1[i],(-sl_sunshadows_margin+sl_buffer_xmargin+sl_xx)*sl_buffer_texturesize,(-sl_sunshadows_margin+sl_buffer_ymargin+sl_yy)*sl_buffer_texturesize,1/sl_sunshadows_texturesize*sl_buffer_texturesize,1/sl_sunshadows_texturesize*sl_buffer_texturesize,0,c_white,1);
            }
            
            draw_set_blend_mode(bm_normal);
            for (i2=0; sl_sunshadows_texlist[i2,1]!=-1; i2+=1) if sl_sunshadows_texlist[i2,0] = i1
            {
                sl_xx = lengthdir_x(global.sl_z[sl_sunshadows_texlist[i2,1]]*sl_sunshadows_length,sl_sunshadows_direction)-view_xview[global.sl_viewid]+sl_buffer_xmargin;
                sl_yy = lengthdir_y(global.sl_z[sl_sunshadows_texlist[i2,1]]*sl_sunshadows_length,sl_sunshadows_direction)-view_yview[global.sl_viewid]+sl_buffer_ymargin;
                sl_xs = (1+(sl_sunshadows_length*sl_sunshadows_layerscale[sl_sunshadows_texlist[i2,0]])/sl_sunshadows_texlist[i2,3])*sl_buffer_texturesize;
                
                with sl_sunshadows_texlist[i2,1] draw_sprite_ext(other.sl_sunshadows_texlist[other.i2,2],0,(x+other.sl_xx)*other.sl_buffer_texturesize,(y+other.sl_yy)*other.sl_buffer_texturesize,image_xscale*other.sl_xs,image_yscale*other.sl_buffer_texturesize,other.sl_sunshadows_direction,c_black,image_alpha);
            }
            for (i2=0; global.sl_texlist_shad[i2,0]!=-1; i2+=1) if global.sl_texlist_shad[i2,0] = i1
            draw_sprite_ext(global.sl_texlist_shad[i2,1],global.sl_texlist_shad[i2,2],(global.sl_texlist_shad[i2,3]-view_xview[global.sl_viewid]+sl_buffer_xmargin)*sl_buffer_texturesize,(global.sl_texlist_shad[i2,4]-view_yview[global.sl_viewid]+sl_buffer_ymargin)*sl_buffer_texturesize,global.sl_texlist_shad[i2,5]*sl_buffer_texturesize,global.sl_texlist_shad[i2,6]*sl_buffer_texturesize,global.sl_texlist_shad[i2,7],c_black,global.sl_texlist_shad[i2,8]);
            
            draw_set_blend_mode(bm_one);
            draw_surface(sl_layers_surface[i1],0,0);
            draw_set_blend_mode(bm_normal);
            
            if i1+1 = sl_layers_count
            {
                draw_set_alpha(sl_sunshadows_light);
                draw_rectangle_color(0,0,(view_wview[global.sl_viewid]+sl_buffer_xmargin*2)*sl_buffer_texturesize,(view_hview[global.sl_viewid]+sl_buffer_ymargin*2)*sl_buffer_texturesize,c_white,c_white,c_white,c_white,0);
                draw_set_alpha(1);
            }
            surface_reset_target();
        }
    }
}

if sl_sunshadows_refreshcounter<=0 sl_sunshadows_refreshcounter = sl_sunshadows_refreshrate;
global.sl_texlist_shad[0,0]  = -1;
global.sl_texlist_shad_index = 0};

/// - OMBRES AMBIANTES

if sl_ambientshadows_active if !sl_ambientshadows_lock
{
    if !surface_exists(sl_ambientshadows_surface) sl_ambientshadows_surface = surface_create((view_wview[global.sl_viewid]+sl_buffer_xmargin*2)*sl_buffer_texturesize,(view_hview[global.sl_viewid]+sl_buffer_ymargin*2)*sl_buffer_texturesize);
    
    surface_set_target(sl_ambientshadows_surface);
    draw_clear(c_white);
    
    for (i1=0; i1<sl_layers_count; i1+=1)
    {
        draw_set_blend_mode(bm_normal);
        
        for (i2=0; sl_ambientshadows_list[i2,1]!=-1; i2+=1) if sl_ambientshadows_list[i2,0]=i1 with sl_ambientshadows_list[i2,1] if visible
         draw_sprite_ext(other.sl_ambientshadows_map[sprite_index],floor(image_index),(x-view_xview[global.sl_viewid]+other.sl_buffer_xmargin)*other.sl_buffer_texturesize,(y-view_yview[global.sl_viewid]+other.sl_buffer_ymargin)*other.sl_buffer_texturesize,(image_xscale/other.sl_ambientshadows_mapscale)*other.sl_buffer_texturesize,(image_yscale/other.sl_ambientshadows_mapscale)*other.sl_buffer_texturesize,image_angle,c_white,1);  
        for (i2=0; global.sl_castlist[i2,0]!=-1; i2+=1) if global.sl_castlist[i2,0]=i1  && global.sl_castlist[i2,2]=true
         draw_sprite_ext(sl_ambientshadows_map[global.sl_castlist[i2,4]],global.sl_castlist[i2,5],(global.sl_castlist[i2,6]-view_xview[global.sl_viewid]+sl_buffer_xmargin)*sl_buffer_texturesize,(global.sl_castlist[i2,7]-view_yview[global.sl_viewid]+sl_buffer_xmargin)*sl_buffer_texturesize,(global.sl_castlist[i2,9]/sl_ambientshadows_mapscale)*sl_buffer_texturesize,(global.sl_castlist[i2,9]/sl_ambientshadows_mapscale)*sl_buffer_texturesize,global.sl_castlist[i2,11],c_white,1);
        
        draw_set_blend_mode(bm_one);
        draw_surface(sl_layers_surface[i1],0,0); 
    }
    draw_set_blend_mode(bm_normal);
    
    draw_set_alpha(-sl_ambientshadows_alpha+1);
    draw_rectangle_color(0,0,(view_wview[global.sl_viewid]+sl_buffer_xmargin*2)*sl_buffer_texturesize,(view_hview[global.sl_viewid]+sl_buffer_ymargin*2)*sl_buffer_texturesize,c_white,c_white,c_white,c_white,0);
    draw_set_alpha(1);
    
    surface_reset_target();
}

/// - LUMIERES

for (i1=0; global.sl_lightlist[i1]!=-1; i1+=1) with global.sl_lightlist[i1]
{
    if !surface_exists(global.sl_light_gbuffer) global.sl_light_gbuffer = surface_create(global.sl_light_txsize,global.sl_light_txsize);
    sl_light_refreshcounter -= 1;
    
    sl_sz = global.sl_light_txsize * 0.5;
    
    if sl_light_active
    && sl_light_x < view_xview[global.sl_viewid]+view_wview[global.sl_viewid]+sl_sz*sl_light_xscale && sl_light_x > view_xview[global.sl_viewid]-sl_sz*sl_light_xscale
    && sl_light_y < view_yview[global.sl_viewid]+view_hview[global.sl_viewid]+sl_sz*sl_light_yscale && sl_light_y > view_yview[global.sl_viewid]-sl_sz*sl_light_yscale
    { 
        sl_light_visible = true;
        
        if sl_light_refresh && sl_light_refreshcounter<=0 refresh=true else refresh=false;
        
        if refresh or !surface_exists(sl_light_surface)
        {
            if !surface_exists(sl_light_surface)
            {
                instance_activate_region(sl_light_x-sl_sz*sl_light_xscale,sl_light_y-sl_sz*sl_light_yscale,global.sl_light_txsize*sl_light_xscale,global.sl_light_txsize*sl_light_yscale,true);
                sl_light_surface = surface_create(global.sl_light_txsize,global.sl_light_txsize);
            }
            
            if sl_light_castshadow // Conception du sample
            {
                sl_xs = min(1,other.sl_buffer_width  / (global.sl_light_txsize * sl_light_xscale));
                sl_ys = min(1,other.sl_buffer_height / (global.sl_light_txsize * sl_light_yscale));
                sl_ss = min(sl_xs,sl_ys);
                
                sl_xs = global.sl_light_txsize / (global.sl_light_txsize * sl_light_xscale * sl_ss);
                sl_ys = global.sl_light_txsize / (global.sl_light_txsize * sl_light_yscale * sl_ss);
                
                sl_xx = sl_sz * sl_light_xscale;
                sl_yy = sl_sz * sl_light_yscale;
                sl_w1 = sl_light_x + sl_xx  sl_w2 = sl_light_x - sl_xx;
                sl_h1 = sl_light_y + sl_yy  sl_h2 = sl_light_y - sl_yy;
                
                surface_set_target(other.sl_buffer_surface1);
                draw_clear(c_white);
                
                for (i2=0; sl_light_shadowlist[i2,0]!=-1; i2+=1) with sl_light_shadowlist[i2,0] if visible && x<other.sl_w1+sprite_width && x>other.sl_w2-sprite_width && y<other.sl_h1+sprite_height && y>other.sl_h2-sprite_height
                {var shspr if other.sl_light_shadowlist[other.i2,1]>-1 shspr=other.sl_light_shadowlist[other.i2,1] else shspr=sprite_index;
                 draw_sprite_ext(shspr,floor(image_index),(x-other.sl_light_x+other.sl_xx)*other.sl_ss,(y-other.sl_light_y+other.sl_yy)*other.sl_ss,image_xscale*other.sl_ss,image_yscale*other.sl_ss,image_angle,c_black,image_alpha*other.sl_light_shadowsharpness)};
            
                for (i2=0; global.sl_castlist[i2,0]!=-1; i2+=1) if global.sl_castlist[i2,3] = true
                draw_sprite_ext(global.sl_castlist[i2,4],global.sl_castlist[i2,5],(global.sl_castlist[i2,6]-sl_light_x+sl_xx)*sl_ss,(global.sl_castlist[i2,7]-sl_light_y+sl_yy)*sl_ss,global.sl_castlist[i2,9]*sl_ss,global.sl_castlist[i2,10]*sl_ss,global.sl_castlist[i2,11],c_black,global.sl_castlist[i2,12]*sl_light_shadowsharpness);
                
                surface_reset_target();
                
                surface_set_target(global.sl_light_gbuffer);
                draw_clear(c_white);
                
                draw_set_blend_mode_ext(bm_dest_color,bm_zero);
                draw_surface_ext(other.sl_buffer_surface1,0,0,sl_xs,sl_ys,0,c_white,1);
                
                surface_reset_target();
            }
            
            draw_set_blend_mode_ext(bm_dest_color,bm_zero);
            
            sl_spi = 1  sl_sps = 0; 
            for (i2=1; i2<=sl_light_shadowlength; i2+=1) // Projection des ombres
            {
                surface_set_target(sl_light_surface);
                draw_clear(c_white);
                sl_sps = power(sl_light_shadowfactor,sl_spi);
                texture_set_interpolation(0);
                draw_surface(global.sl_light_gbuffer,0,0);
                texture_set_interpolation(1);
                draw_surface_ext(global.sl_light_gbuffer,sl_sz-sl_sz*sl_sps,sl_sz-sl_sz*sl_sps,sl_sps,sl_sps,0,c_white,1);
                sl_spi *= 2;
                surface_reset_target();
                
                surface_set_target(global.sl_light_gbuffer);
                draw_clear(c_white);
                sl_sps = power(sl_light_shadowfactor,sl_spi);
                texture_set_interpolation(0);
                draw_surface(sl_light_surface,0,0);
                texture_set_interpolation(1);
                draw_surface_ext(sl_light_surface,sl_sz-sl_sz*sl_sps,sl_sz-sl_sz*sl_sps,sl_sps,sl_sps,0,c_white,1);
                sl_spi *= 2;
                surface_reset_target();
            }
            
            surface_set_target(sl_light_surface); // Composition finale
            draw_clear(c_black);
            
            draw_set_blend_mode(bm_normal);
             draw_sprite_ext(sl_light_texture,0,sl_sz,sl_sz,1,1,sl_light_angle,c_white,-sl_light_ambientpower+1);
            draw_set_blend_mode_ext(bm_dest_color,bm_zero);
             if sl_light_castshadow draw_surface(global.sl_light_gbuffer,0,0);
            draw_set_blend_mode(bm_add);
             draw_sprite_ext(sl_light_texture,0,sl_sz,sl_sz,1,1,sl_light_angle,c_white,sl_light_ambientpower);
            
            draw_set_blend_mode_ext(bm_src_color,bm_one);
            draw_set_color(c_black);
            draw_rectangle(0,0,global.sl_light_txsize,global.sl_light_txsize,0);
            draw_set_color(c_white);
            
            draw_set_blend_mode(bm_normal);
            surface_reset_target();
        }
    }
    else
    {
        sl_light_visible = false;
        
        if surface_exists(sl_light_surface)
        {
            surface_free(sl_light_surface);
            sl_light_surface = -1;
        }
    }
    
    if sl_light_refreshcounter <= 0 sl_light_refreshcounter = sl_light_refreshrate;
}

/// - BUFFER

// Calcul des composantes de la lumière ambiante
if sl_tod_active
{
    r = ((global.sl_time-sl_tod[sl_tod_index,0])/(sl_tod[sl_tod_index+1,0]-sl_tod[sl_tod_index,0]))*(sl_tod[sl_tod_index+1,1]-sl_tod[sl_tod_index,1])+sl_tod[sl_tod_index,1];
    g = ((global.sl_time-sl_tod[sl_tod_index,0])/(sl_tod[sl_tod_index+1,0]-sl_tod[sl_tod_index,0]))*(sl_tod[sl_tod_index+1,2]-sl_tod[sl_tod_index,2])+sl_tod[sl_tod_index,2];
    b = ((global.sl_time-sl_tod[sl_tod_index,0])/(sl_tod[sl_tod_index+1,0]-sl_tod[sl_tod_index,0]))*(sl_tod[sl_tod_index+1,3]-sl_tod[sl_tod_index,3])+sl_tod[sl_tod_index,3];
    sl_ambient_color = make_color_rgb(r,g,b);
}

surface_set_target(sl_buffer_surface1); // Buffer global
draw_clear(c_black);

draw_set_alpha(global.sl_ambient_light);
draw_rectangle_color(0,0,(view_wview[global.sl_viewid]+sl_buffer_xmargin*2)*sl_buffer_texturesize,(view_hview[global.sl_viewid]+sl_buffer_ymargin*2)*sl_buffer_texturesize,sl_ambient_color,sl_ambient_color,sl_ambient_color,sl_ambient_color,0);
draw_set_alpha(1);

if sl_sunshadows_active && sl_layers_count > 0 if sl_sunshadows_light < 1
{
    draw_set_blend_mode_ext(bm_dest_color,bm_zero);
    draw_surface(sl_sunshadows_surface2,0,0);
}

draw_set_blend_mode(bm_add);
for (i=0; global.sl_lightlist[i]!=-1; i+=1) with global.sl_lightlist[i] if sl_light_visible && surface_exists(sl_light_surface)
 draw_surface_ext(sl_light_surface,(sl_light_x-(global.sl_light_txsize*sl_light_xscale)/2-view_xview[global.sl_viewid]+other.sl_buffer_xmargin)*other.sl_buffer_texturesize,(sl_light_y-(global.sl_light_txsize*sl_light_yscale)/2-view_yview[global.sl_viewid]+other.sl_buffer_ymargin)*other.sl_buffer_texturesize,sl_light_xscale*other.sl_buffer_texturesize,sl_light_yscale*other.sl_buffer_texturesize,0,sl_light_color,sl_light_power);
for (i=0; global.sl_texlist_light[i,0]!=-1; i+=1)
 draw_sprite_ext(global.sl_texlist_light[i,0],global.sl_texlist_light[i,1],(global.sl_texlist_light[i,2]-view_xview[global.sl_viewid]+other.sl_buffer_xmargin)*sl_buffer_texturesize,(global.sl_texlist_light[i,3]-view_yview[global.sl_viewid]+other.sl_buffer_ymargin)*sl_buffer_texturesize,global.sl_texlist_light[i,4]*sl_buffer_texturesize,global.sl_texlist_light[i,5]*sl_buffer_texturesize,global.sl_texlist_light[i,6],global.sl_texlist_light[i,7],global.sl_texlist_light[i,8]);

if sl_ambientshadows_active && sl_layers_count > 0 if !sl_ambientshadows_lock
{
    draw_set_blend_mode_ext(bm_dest_color,bm_zero);
    draw_surface(sl_ambientshadows_surface,0,0);
}

surface_reset_target();

surface_set_target(sl_buffer_surface2); // Buffer de surexposition
draw_clear(c_black);
 
draw_set_blend_mode(bm_add);
for (i=0; global.sl_lightlist[i]!=-1; i+=1) with global.sl_lightlist[i] if sl_light_visible && surface_exists(sl_light_surface)
 draw_surface_ext(sl_light_surface,(sl_light_x-(global.sl_light_txsize*sl_light_xscale)/2-view_xview[global.sl_viewid]+other.sl_buffer_xmargin)*other.sl_buffer_texturesize,(sl_light_y-(global.sl_light_txsize*sl_light_yscale)/2-view_yview[global.sl_viewid]+other.sl_buffer_ymargin)*other.sl_buffer_texturesize,sl_light_xscale*other.sl_buffer_texturesize,sl_light_yscale*other.sl_buffer_texturesize,0,sl_light_color,sl_light_power);
for (i=0; global.sl_texlist_light[i,0]!=-1; i+=1)
 draw_sprite_ext(global.sl_texlist_light[i,0],global.sl_texlist_light[i,1],(global.sl_texlist_light[i,2]-view_xview[global.sl_viewid]+other.sl_buffer_xmargin)*sl_buffer_texturesize,(global.sl_texlist_light[i,3]-view_yview[global.sl_viewid]+other.sl_buffer_ymargin)*sl_buffer_texturesize,global.sl_texlist_light[i,4]*sl_buffer_texturesize,global.sl_texlist_light[i,5]*sl_buffer_texturesize,global.sl_texlist_light[i,6],global.sl_texlist_light[i,7],global.sl_texlist_light[i,8]);
 
if sl_sunshadows_active && sl_layers_count > 0 if sl_sunshadows_light < 1
{
    draw_set_blend_mode_ext(bm_dest_color,bm_zero);
    draw_surface(sl_sunshadows_surface2,0,0);
}

draw_set_blend_mode(bm_normal);
draw_set_alpha(-min(global.sl_ambient_light,sl_maxexposure)+1);
draw_rectangle_color(0,0,(view_wview[global.sl_viewid]+sl_buffer_xmargin*2)*sl_buffer_texturesize,(view_hview[global.sl_viewid]+sl_buffer_ymargin*2)*sl_buffer_texturesize,c_black,c_black,c_black,c_black,0);
draw_set_alpha(1);

draw_set_blend_mode(bm_normal);
surface_reset_target();

// Réinitialisation des listes des sprites affichées dans le buffer
global.sl_castlist[0,0]       = -1;
global.sl_castlist_index      = 0;
global.sl_texlist_light[0,0]  = -1;
global.sl_texlist_light_index = 0;

#define SL_engine_draw
/* SL_engine_draw();                         */
/* Affiche l'ensemble des ombres et lumières */

// Gestion de la synchronisation affichage/view
if sl_buffer_sync
{sl_view_xspeed = view_xview[global.sl_viewid]-sl_view_xprevious;
 sl_view_yspeed = view_yview[global.sl_viewid]-sl_view_yprevious};
else { sl_view_xspeed=0 sl_view_yspeed=0 };

// Affichage des buffers
if surface_exists(sl_buffer_surface1)
{
    draw_set_blend_mode_ext(bm_dest_color,bm_zero);
    draw_surface_ext(sl_buffer_surface1,view_xview[global.sl_viewid]-sl_buffer_xmargin-sl_view_xspeed,view_yview[global.sl_viewid]-sl_buffer_ymargin-sl_view_yspeed,1/sl_buffer_texturesize,1/sl_buffer_texturesize,0,c_white,1);
    draw_set_blend_mode(bm_add);
    draw_surface_ext(sl_buffer_surface2,view_xview[global.sl_viewid]-sl_buffer_xmargin-sl_view_xspeed,view_yview[global.sl_viewid]-sl_buffer_ymargin-sl_view_yspeed,1/sl_buffer_texturesize,1/sl_buffer_texturesize,0,c_white,sqr(global.sl_ambient_light));
    draw_set_blend_mode(bm_normal);
}

if sl_buffer_sync
{sl_view_xprevious = view_xview[global.sl_viewid];
 sl_view_yprevious = view_yview[global.sl_viewid]};

#define SL_engine_free
/* SL_engine_free();                                                */
/* Libère la mémoire occupée par l'ensemble des surfaces du système */

for (i=0; i<sl_layers_count; i+=1)
{
    surface_free(sl_layers_surface[i]);
    sl_layers_surface[i] = -1;
}

surface_free(sl_sunshadows_surface1[0]);
surface_free(sl_sunshadows_surface1[1]);
surface_free(sl_sunshadows_surface2);
sl_sunshadows_surface1[0] = -1;
sl_sunshadows_surface1[1] = -1;
sl_sunshadows_surface2    = -1;

surface_free(sl_ambientshadows_surface);
sl_ambientshadows_surface = -1;

surface_free(global.sl_light_gbuffer);
global.sl_light_gbuffer = -1;

for (i=0; global.sl_lightlist[i]!=-1; i+=1) with global.sl_lightlist[i]
{
    surface_free(sl_light_surface);
    sl_light_surface = -1;
}

surface_free(sl_buffer_surface1);
surface_free(sl_buffer_surface2);
sl_buffer_surface1 = -1;
sl_buffer_surface2 = -1;

#define SL_light_ini_begin
/* SL_light_ini_begin();                        */
/* Commence l'initialisation de l'objet lumière */

// Variables modulables
sl_light_active          = true;    // Détermine si le rendu de la lumière doit être effectué ou non
sl_light_x               = x;       // Position de la lumière dans la room
sl_light_y               = y;
sl_light_xscale          = 1;       // Facteurs de scale de la lumière
sl_light_yscale          = 1;
sl_light_angle           = 0;       // Angle de la texture de lumière
sl_light_color           = c_white; // Couleur de la lumière
sl_light_power           = 1;       // Puissance de la lumière
sl_light_ambientpower    = 0;       // Puissance résiduelle de la lumière
sl_light_shadowlength    = 4;       // Longueur des ombres (détermine le nombre d'itérations)
sl_light_shadowfactor    = 1.03;    // Grossissement appliqué à chaque sample d'ombre lors du rendu (doit être obligatoirement supérieur à 1)
sl_light_shadowsharpness = 0.8;     // Facteur d'atténuation des ombres (entre 0 et 1)
sl_light_castshadow      = true;    // Détermine si la lumière projette des ombres ou non
sl_light_refresh         = true;    // Détermine si les ombres sont rafraîchies ou non
sl_light_refreshrate     = 0;       // Fréquence de rafraîchissement des ombres, en steps (<=0 pour un rafraîchissement continu)

// Variables automatiques
sl_light_shadowlist[0,0] = -1; // Liste les objets 'ombrés' par l'objet lumière

#define SL_light_ini_end
/* SL_light_ini_end();                         */
/* Termine l'initialisation de l'objet lumière */

// Variables automatiques
global.sl_light_txsize  = sprite_get_width(sl_light_texture); // Dimensions de la texture de lumière
sl_light_refreshcounter = sl_light_refreshrate; // Gestion de la fréquence de rafraîchissement
sl_light_visible        = true; // Détermine si la lumière est visible ou non

// Surface de la lumière
sl_light_surface = -1;

#define SL_light_free
/* SL_light_free();                                            */
/* Libère la mémoire occupée par la surface de l'objet lumière */

surface_free(sl_light_surface);
sl_light_surface = -1;

#define SL_light_cast_obj
/* SL_light_cast_obj(object,mask);                                                    */
/* Fonction permettant de définir le ou les objets occludeurs pour une lumière donnée */

for (i=0; i>=0; i+=1)
{
    if sl_light_shadowlist[i,0]=argument0 break; 
    else if sl_light_shadowlist[i,0]=-1
    {
        sl_light_shadowlist[i,0]   = argument0;
        sl_light_shadowlist[i,1]   = argument1;
        sl_light_shadowlist[i+1,0] = -1;
        break;
    }
}

#define SL_global_cast_obj
/* SL_global_cast_obj(layer,object,sprite,sun,ambient);                      */
/* Fonction permettant de définir un objet comme projetant une ombre globale */ 

// Actualise le compteur des layers
sl_layers_count = max(argument0+1,sl_layers_count);

// Liste globale
for (i=0; i>=0; i+=1)
{
    if sl_global_list[i,1]=argument1 break;
    else if sl_global_list[i,1]=-1
    { 
        sl_global_list[i,0]   = argument0;
        sl_global_list[i,1]   = argument1;
        sl_global_list[i+1,1] = -1;
        break;
    }
}

// Liste des ombres solaires "objets"
if argument3=1
{
    global.sl_z[argument1] = 0;
    
    for (i=0; i>=0; i+=1)
    {
        if sl_sunshadows_list[i,1]=argument1 break;
        else if sl_sunshadows_list[i,1]=-1
        {
            sl_sunshadows_list[i,0]   = argument0;
            sl_sunshadows_list[i,1]   = argument1;
            sl_sunshadows_list[i,2]   = argument2;
            sl_sunshadows_list[i+1,1] = -1;
            break;
        }
    }
}

// Liste des ombres solaires "textures"
if argument3=2
{
    global.sl_z[argument1] = 0;
    
    for (i=0; i>=0; i+=1)
    {
        if sl_sunshadows_texlist[i,1]=argument1 break;
        else if sl_sunshadows_texlist[i,1]=-1
        {
            sl_sunshadows_texlist[i,0]   = argument0;
            sl_sunshadows_texlist[i,1]   = argument1;
            sl_sunshadows_texlist[i,2]   = argument2;
            sl_sunshadows_texlist[i,3]   = sprite_get_width(argument2);
            sl_sunshadows_texlist[i+1,1] = -1;
            break;
        }
    }
}

// Liste des ombres ambiantes
if argument4=1
{
    for (i=0; i>=0; i+=1)
    {
        if sl_ambientshadows_list[i,1]=argument1 break;
        else if sl_ambientshadows_list[i,1]=-1
        {
            sl_ambientshadows_list[i,0]   = argument0;
            sl_ambientshadows_list[i,1]   = argument1;
            sl_ambientshadows_list[i+1,1] = -1;
            break;
        } 
    }
}

#define SL_cast_sprite
/* SL_cast_sprite(layer,cast_sun,cast_ambient,cast_lights,sprite,subimg,x,y,z,xscale,yxscale,rot,alpha); */
/* Fonction permettant d'afficher des ombres pour un sprite                                              */

global.sl_castlist[global.sl_castlist_index,0]  = argument0;
global.sl_castlist[global.sl_castlist_index,1]  = argument1;
global.sl_castlist[global.sl_castlist_index,2]  = argument2;
global.sl_castlist[global.sl_castlist_index,3]  = argument3;
global.sl_castlist[global.sl_castlist_index,4]  = argument4;
global.sl_castlist[global.sl_castlist_index,5]  = argument5;
global.sl_castlist[global.sl_castlist_index,6]  = argument6;
global.sl_castlist[global.sl_castlist_index,7]  = argument7;
global.sl_castlist[global.sl_castlist_index,8]  = argument8;
global.sl_castlist[global.sl_castlist_index,9]  = argument9;
global.sl_castlist[global.sl_castlist_index,10] = argument10;
global.sl_castlist[global.sl_castlist_index,11] = argument11;
global.sl_castlist[global.sl_castlist_index,12] = argument12;

global.sl_castlist[global.sl_castlist_index+1,0] = -1;
global.sl_castlist_index += 1;

#define SL_add_light
/* SL_add_light(object);                                           */
/* Fonction permettant de définir un objet comme étant une lumière */

for (i=0; i>=0; i+=1)
{
    if global.sl_lightlist[i] = argument0 break;
     
    if global.sl_lightlist[i]=-1
    {
        global.sl_lightlist[i]   = argument0;
        global.sl_lightlist[i+1] = -1;
        break;
    }
}

#define SL_draw_sprite_light
/* SL_draw_sprite_light(sprite,subimg,x,y,xscale,yxscale,rot,color,alpha); */
/* Fonction permettant d'afficher un sprite en tant que lumière            */

global.sl_texlist_light[global.sl_texlist_light_index,0] = argument0;
global.sl_texlist_light[global.sl_texlist_light_index,1] = argument1;
global.sl_texlist_light[global.sl_texlist_light_index,2] = argument2;
global.sl_texlist_light[global.sl_texlist_light_index,3] = argument3;
global.sl_texlist_light[global.sl_texlist_light_index,4] = argument4;
global.sl_texlist_light[global.sl_texlist_light_index,5] = argument5;
global.sl_texlist_light[global.sl_texlist_light_index,6] = argument6;
global.sl_texlist_light[global.sl_texlist_light_index,7] = argument7;
global.sl_texlist_light[global.sl_texlist_light_index,8] = argument8;

global.sl_texlist_light[global.sl_texlist_light_index+1,0] = -1;
global.sl_texlist_light_index += 1;

#define SL_draw_sprite_shadow
/* SL_draw_sprite_shadow(layer,sprite,subimg,x,y,xscale,yxscale,rot,alpha); */
/* Fonction permettant d'afficher un sprite en tant qu'ombre solaire        */

global.sl_texlist_shad[global.sl_texlist_shad_index,0] = argument0;
global.sl_texlist_shad[global.sl_texlist_shad_index,1] = argument1;
global.sl_texlist_shad[global.sl_texlist_shad_index,2] = argument2;
global.sl_texlist_shad[global.sl_texlist_shad_index,3] = argument3;
global.sl_texlist_shad[global.sl_texlist_shad_index,4] = argument4;
global.sl_texlist_shad[global.sl_texlist_shad_index,5] = argument5;
global.sl_texlist_shad[global.sl_texlist_shad_index,6] = argument6;
global.sl_texlist_shad[global.sl_texlist_shad_index,7] = argument7;
global.sl_texlist_shad[global.sl_texlist_shad_index,8] = argument8;

global.sl_texlist_shad[global.sl_texlist_shad_index+1,0] = -1;
global.sl_texlist_shad_index += 1;

#define SL_sprite_set_ambient
/* SL_sprite_set_ambient(sprite);                                   */
/* Fonction permettant de générer une ombre ambiante pour un sprite */

var j1, j2, rad, nbr, sl_w, sl_h, sl_xx, sl_yy, sl_spr, sl_alpha, s, a, surface_s, surface_a;

j1   = 5;  // Saut de rayon
j2   = 5;  // Saut d'angle
rad  = 30; // Radius
nbr  = sprite_get_number(argument0);
sl_w = (sprite_get_width (argument0)+rad*2) * sl_ambientshadows_mapscale;
sl_h = (sprite_get_height(argument0)+rad*2) * sl_ambientshadows_mapscale;

for (i=0; i<nbr; i+=1)
{
    surface_s[i] = surface_create(sl_w,sl_h);
    surface_set_target(surface_s[i]);
    draw_clear(c_black);
    surface_reset_target();

    surface_a[i] = surface_create(sl_w,sl_h);
    surface_set_target(surface_a[i]);
    draw_clear(c_white);
    
    sl_xx = (rad + sprite_get_xoffset(argument0)) * sl_ambientshadows_mapscale;
    sl_yy = (rad + sprite_get_yoffset(argument0)) * sl_ambientshadows_mapscale;
    
    for (len=j1; len<rad; len+=j1) for (dir=0; dir<360; dir+=j2)
    draw_sprite_ext(argument0,i,sl_xx+lengthdir_x(len,dir)*sl_ambientshadows_mapscale,sl_yy+lengthdir_y(len,dir)*sl_ambientshadows_mapscale,sl_ambientshadows_mapscale,sl_ambientshadows_mapscale,0,c_black,2/(floor((rad/j1)*(360/j2))));
    
    draw_set_blend_mode_ext(bm_inv_dest_color, bm_inv_src_color);
    draw_set_color(c_white);
    draw_rectangle(0,0,sl_w,sl_h,0);
    draw_set_blend_mode(bm_normal);
    
    surface_reset_target();
}

for (i=0; i<nbr; i+=1)
{
    if i=0
    {
        sl_spr   = sprite_create_from_surface(surface_s[i],0,0,sl_w,sl_h,false,false,sl_xx,sl_yy);
        sl_alpha = sprite_create_from_surface(surface_a[i],0,0,sl_w,sl_h,false,false,sl_xx,sl_yy);
    }
    else
    {
        sprite_add_from_surface(sl_spr  ,surface_s[i],0,0,sl_w,sl_h,false,false);
        sprite_add_from_surface(sl_alpha,surface_a[i],0,0,sl_w,sl_h,false,false);
    }
    
    surface_free(surface_s[i]);
    surface_free(surface_a[i]);
}

s = sprite_duplicate(sl_spr);
a = sprite_duplicate(sl_alpha);

sprite_set_alpha_from_sprite(s,a);
sl_ambientshadows_map[argument0] = s;

sprite_delete(sl_spr);
sprite_delete(sl_alpha);
sprite_delete(a);

sl_ambientshadows_lock = false;

#define SL_set_time
/* SL_set_time(time);                     */
/* Fonction permettant de changer l'heure */

if argument0>=0 && argument0<24 global.sl_time=argument0 else global.sl_time=0; // Actualise la variable d'heure
for (i=1; sl_tod[i,0]<=global.sl_time; i+=1) sl_tod_index=i; // Actualise la variable d'index du ToD

