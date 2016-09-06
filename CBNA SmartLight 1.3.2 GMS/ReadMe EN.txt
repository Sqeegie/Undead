CBNA SmartLight - Lighting and shadowing engine for GameMaker 7, GameMaker 8, and GameMaker: Studio

  http://www.lecbna.org
  http://www.gamemaker.fr

Concepts, code, documentation and examples: Bastien Wild aka Bast

This engine is free to use for any kind of project created with GameMaker, whether freeware or commercial.
The only reward I ask for is for my name and the engine's to be mentioned in the credits of your creation.

If you wish to share or distribute this package, please do not modify its contents in any way (whether it be by adding, deleting or editing files).

You can reach me at:
le.bast@gmail.com
bast@lecbna.org

As well as on the project thread (in French):
http://cbna.forumactif.com/t10023-cbna-smartlight-moteur-de-lumiere

_________
Changelog

1.3.2 GMS - May 5, 2014
- New surface creation system allowing missing surfaces to be automatically created on the fly when needed.
- Fixed "Unbalanced surface stack" error occurring in GMS versions 1.3.x.
- Fixed "Execution Error - Variable Get -7.rl" error occuring when trying to render an empty layer.
- Fixed error occuring when switching between full screen/windowed modes. It is recommended to execute SL_engine_free() before switching screen modes.
- Fixed script SL_engine_free().

1.3.1 GMS - August 16, 2013
- Full compatibility with GameMaker: Studio.
- Improved light samples calculations.
- Fixed sun shadows scaling not working properly with sl_buffer_texturesize.

1.3 - March 18, 2011
- Faster sun shadows rendering (reduced CPU usage).
- Improved sun shadows texture resolution.
- GameMaker saves system is now properly supported.
- Clearer code layout.
- Fixed some argument glitches in SL_cast_sprite().
- Fixed sun shadows margin system.

1.2.5 - February 19, 2011
- Added variable sl_tod_active, allowing the modification of global lighting variables without a 'ToD' array.
- Created a new editor program, allowing to preview and edit lights and ToDs in real time before importing them in GameMaker.

1.2 - February 3, 2011
- Optimization of the number of surfaces required for rendering lights (reduced VRAM usage).
- Faster light rendering (reduced CPU usage).
- Optimized VRAM usage: only visible lights are stored in memory.
- Removed variable sl_light_forcerender (its function is now controled automatically).
- Variable sl_light_shadowscale replaced by sl_light_shadowlength.
- Internal variables xx, yy, w, h renamed with the prefix sl_ to avoid potential naming conflicts.

1.1 - June 24, 2010
- Added function SL_cast_sprite().
- Fixed non-visible objects casting shadows.

1.0.1 - June 9, 2010
- Fixed an error that could occur when executing the script SL_global_cast_obj().
- Renamed some internal vars of SL_engine_render to avoid potential naming conflicts.

1.0 - June 3, 2010
- First released version.
