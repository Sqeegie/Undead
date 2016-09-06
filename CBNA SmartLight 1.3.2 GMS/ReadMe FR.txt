CBNA SmartLight - Moteur de lumières et d'ombres pour GameMaker 7, GameMaker 8, et GameMaker: Studio

  http://www.lecbna.org
  http://www.gamemaker.fr

Concepts, code, documentation et exemples: Bastien Wild alias Bast

Ce moteur est libre d'utilisation pour toute forme de projet sous GameMaker, qu'il soit freeware ou commercial.
La seule rétribution que je demande soit que mon nom ainsi que celui du moteur apparaissent dans les crédits de votre production.

Si vous désirez partager ou diffuser cette archive, merci de ne pas en modifier le contenu (que ce soit par ajout, suppression ou édition de fichiers).

Vous pouvez me joindre aux adresses suivantes:
le.bast@gmail.com
bast@lecbna.org

Ainsi que sur le sujet du projet:
http://cbna.forumactif.com/t10023-cbna-smartlight-moteur-de-lumiere

_________
Changelog

1.3.2 GMS - 5 Mai 2014
- Nouveau système de création de surfaces permettant aux surfaces manquantes d'être créées automatiquement quand nécessaire.
- Correction de l'erreur "Unbalanced surface stack" survenant avec les versions 1.3.x de GMS.
- Correction de l'erreur "Execution Error - Variable Get -7.rl" survenant lors du rendu de layers vides.
- Correction de l'erreur survenant lors du passage entre plein écran/fenêtré. Il est recommandé d'exécuter SL_engine_free() avant de passer d'un mode à l'autre.
- Correction du script SL_engine_free().

1.3.1 GMS - 16 Août 2013
- Compatibilité complète avec GameMaker: Studio.
- Amélioration du calcul des coordonnées des objets dans la conception des samples des lumières.
- Correction du scaling des ombres solaires relatif à sl_buffer_texturesize.

1.3 - 18 Mars 2011
- Optimisation du rendu des ombres solaires (réduction de la charge processeur).
- Amélioration de la résolution des sprites affichées dans le buffer d'ombre.
- Le système de sauvegardes de GameMaker est maintenant correctement supporté.
- Révision et optimisation de la mise en page des scripts.
- Correction de la gestion des arguments de SL_cast_sprite().
- Correction de la gestion des marges du rendu des ombres solaires.

1.2.5 - 19 Février 2011
- Ajout de la variable sl_tod_active, permettant de configurer les variables de lumière globale sans avoir à passer par un tableau 'ToD'.
- Création d'un nouvel utilitaire d'édition, permettant de conçevoir des ToDs et lumières puis de les importer dans GameMaker.

1.2 - 3 Février 2011
- Optimisation du nombre de surfaces nécessaires au rendu des lumières (réduction du volume de VRAM requis).
- Optimisation du rendu des lumières (réduction de la charge processeur).
- Optimisation de la gestion de la mémoire vidéo (VRAM): à présent, seules les lumières directement visibles à l'écran sont stockées en mémoire.
- Suppression de la variable sl_light_forcerender (sa fonction étant maintenant assurée automatiquement).
- Variable sl_light_shadowscale remplacée par sl_light_shadowlength.
- Variables internes xx, yy, w, h renommées avec le préfixe sl_ afin d'éviter d'éventuels conflits de noms.

1.1 - 24 Juin 2010
- Ajout de la fonction SL_cast_sprite().
- A présent, une instance définie comme non visible ne projette plus d'ombre.

1.0.1 - 9 Juin 2010
- Correction d'une erreur pouvant survenir lors de l'éxécution du script SL_global_cast_obj().
- Modification des noms de certaines vars internes de SL_engine_render afin d'éviter d'éventuels conflits de noms.

1.0 - 3 Juin 2010
- Première publication.

