CBNA SmartLight - Moteur de lumi�res et d'ombres pour GameMaker 7, GameMaker 8, et GameMaker: Studio

  http://www.lecbna.org
  http://www.gamemaker.fr

Concepts, code, documentation et exemples: Bastien Wild alias Bast

Ce moteur est libre d'utilisation pour toute forme de projet sous GameMaker, qu'il soit freeware ou commercial.
La seule r�tribution que je demande soit que mon nom ainsi que celui du moteur apparaissent dans les cr�dits de votre production.

Si vous d�sirez partager ou diffuser cette archive, merci de ne pas en modifier le contenu (que ce soit par ajout, suppression ou �dition de fichiers).

Vous pouvez me joindre aux adresses suivantes:
le.bast@gmail.com
bast@lecbna.org

Ainsi que sur le sujet du projet:
http://cbna.forumactif.com/t10023-cbna-smartlight-moteur-de-lumiere

_________
Changelog

1.3.2 GMS - 5 Mai 2014
- Nouveau syst�me de cr�ation de surfaces permettant aux surfaces manquantes d'�tre cr��es automatiquement quand n�cessaire.
- Correction de l'erreur "Unbalanced surface stack" survenant avec les versions 1.3.x de GMS.
- Correction de l'erreur "Execution Error - Variable Get -7.rl" survenant lors du rendu de layers vides.
- Correction de l'erreur survenant lors du passage entre plein �cran/fen�tr�. Il est recommand� d'ex�cuter SL_engine_free() avant de passer d'un mode � l'autre.
- Correction du script SL_engine_free().

1.3.1 GMS - 16 Ao�t 2013
- Compatibilit� compl�te avec GameMaker: Studio.
- Am�lioration du calcul des coordonn�es des objets dans la conception des samples des lumi�res.
- Correction du scaling des ombres solaires relatif � sl_buffer_texturesize.

1.3 - 18 Mars 2011
- Optimisation du rendu des ombres solaires (r�duction de la charge processeur).
- Am�lioration de la r�solution des sprites affich�es dans le buffer d'ombre.
- Le syst�me de sauvegardes de GameMaker est maintenant correctement support�.
- R�vision et optimisation de la mise en page des scripts.
- Correction de la gestion des arguments de SL_cast_sprite().
- Correction de la gestion des marges du rendu des ombres solaires.

1.2.5 - 19 F�vrier 2011
- Ajout de la variable sl_tod_active, permettant de configurer les variables de lumi�re globale sans avoir � passer par un tableau 'ToD'.
- Cr�ation d'un nouvel utilitaire d'�dition, permettant de con�evoir des ToDs et lumi�res puis de les importer dans GameMaker.

1.2 - 3 F�vrier 2011
- Optimisation du nombre de surfaces n�cessaires au rendu des lumi�res (r�duction du volume de VRAM requis).
- Optimisation du rendu des lumi�res (r�duction de la charge processeur).
- Optimisation de la gestion de la m�moire vid�o (VRAM): � pr�sent, seules les lumi�res directement visibles � l'�cran sont stock�es en m�moire.
- Suppression de la variable sl_light_forcerender (sa fonction �tant maintenant assur�e automatiquement).
- Variable sl_light_shadowscale remplac�e par sl_light_shadowlength.
- Variables internes xx, yy, w, h renomm�es avec le pr�fixe sl_ afin d'�viter d'�ventuels conflits de noms.

1.1 - 24 Juin 2010
- Ajout de la fonction SL_cast_sprite().
- A pr�sent, une instance d�finie comme non visible ne projette plus d'ombre.

1.0.1 - 9 Juin 2010
- Correction d'une erreur pouvant survenir lors de l'�x�cution du script SL_global_cast_obj().
- Modification des noms de certaines vars internes de SL_engine_render afin d'�viter d'�ventuels conflits de noms.

1.0 - 3 Juin 2010
- Premi�re publication.

