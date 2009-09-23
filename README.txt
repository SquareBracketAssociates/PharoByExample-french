État de la synchro avec PBE: cf. STATE

Pour les nouveaux arrivants, compiler avec latex ou pdflatex demo.tex
(c'est l'équivalent de commonDemo dans PBE pour tester le rendu via le
fichier common.tex)

TRES IMPORTANT: (martial)
- Tous les changements importants des parties I, II, III et IV de la
version Omnibus sont reportés en bleu via la balise \arelire{}. Je
vous invite à baliser les zones incertaines des nouveaux chapitres
ainsi les relecteurs auront plus de facilité à identifier certains
paragraphes (comme les commentaires '% REVOIR' et autre, il faut que
cela disparaisse pour les versions beta du document)
- En cas de problème dans le texte (désynchro avec la VO par exemple):
\tradalert{nom du traducteur}{message} (attention: contrairement à la
VO, cette commande s'affiche aussi dans la compilation globale; ne pas
utiliser en phase bêta du document)
- Les outils de base Morphic sont à installer (pour l'instant?):
MCHttpRepository
	location: 'http://www.squeaksource.com/PharoMorphicExtras'
	user: 'squeak'
	password: 'squeak'
puis choisir les packages: MorphicExtras et MorphicExamplesAndDemos.

IMPORTANT:
- \pbe devient \ppe pour referencer le livre en version française
- utiliser \pharo pour Pharo
- convention:
http://community.ofset.org/index.php/Squeak_par_l'exemple dont
l'essentiel se résume ainsi: Pas de "on" mais du "nous", les termes
liés aux codes ne changent pas (ex: "a debugger" devient "un
débogueur" mais "the Debugger window" devient "la fenêtre Debugger")
[martial: j'utilise le commentaire % REVOIR pour les paragraphes
incertains; % ATTENDRE pour les paragraphes dont la mise à jour dépend
de la finalisation de la VO; % CHANGE est synonyme de REVOIR mais
c'est utilisé pour tous les paragraphes remplacés entre deux versions
(ou entre SBE et PBE); je vous invite à faire de même; le but est de
faire disparaitre ces balises à la relecture]
- regarder à la fin du fichier common.tex pour ajouter/enlever les
aliases et césures typiquement françaises (en deux parties, celles de
SBE (squeak by example; qui a priori reste inchangé pour les chapitres
communs aux deux livres pour des raisons de rétrocompatibilité) et
celles de PBE (pharo by example; exemple d'ajout \truetype pour TrueType)).
- Pour écrire des accents dans les commentaires de code, il faut
utiliser les balises !. Attention de mettre la balise uniquement sur
le ou les mots concernés: ces balises d'échappement "resettent" les
composantes graphiques des zones de code (dans le cas de SBE, ça passe
inaperçu mais dans PBE, il y a un fond gris dans ces zones; englober
plusieurs mots entre les ! risquent de faire passer le fond gris au
blanc localement). Si vous n'avez pas compris et que vous avez des
rayures blanches dans les codes, contactez martial.boniou@gmx.com (PS:
le hack est nécessaire en raison d'une incompatibilité avec les
\lstlisting utilisés pour faire les codes).

Par rapport à Squeak Par L'exemple:
- les entêtes des chapitres ont changés (\usepackage, \sloppy
\frontmatter)
- \pharoweb est l'url du projet
- \pbe est l'url du livre anglais
- \ppe est l'url du livre francais
- \sq devient \pharo (et \Pharo utilisé dans Squeak Par l'Exemple est
obsolète; attention de ne pas remplacer des aliases dans le style
\sqsrc pour SqueakSource)
- 'le System Browser' devient 'le Browser' mais on garde (pour l'instant) le
terme générique 'un navigateur de classes'
- Les catégories laissent place aux paquetages
- (en finalisant) vérifier que les schémas/figures/screenshots/codes
ne soient pas séparés de leur caption; les \newpage, \clearpage et
autre \needlines{_} doivent être réglées à la fin
- les URLs web doivent impérativement avoir 'http://' en entête
- un des mantras de Model.tex (visible dans Metaclasses aussi)
changent dans PBE: 'by message sends' devient 'by sending messages':
rien n'est changé dans la VF pour l'instant: 'tout se passe par envoi
de messages' reste (mais pourrait changer par 'tout se passe en
envoyant des messages'; martial: je pense qu'il est inutile de
changer)
- 'SBE-Quinto' devient 'PBE-LightsOut' (dans les catégories notamment
(\scat)) et SBEGame devient LOGame
- trouver un titre (même problème dans SBE); parle-t-on de:
?Pharo par l'exemple
?Pharo Par l'Exemple (version PBE)
?Pharo par l'Exemple...
- on parle d'archiver pour 'commit'; actualiser pour 'update';
fusionner pour 'merge'; charger pour 'load'; les termes anglais sont
rappelés (Monticello); les paquetages "clean" et "dirty" sont définis
mais gardent leur nom anglais en italique; le 'repository inspector'
s'écrit en capitales 'Repository Inspector' (défini une fois comme
inspecteur des dépôts); 'unload' -> décharger
- pour les panneaux du Browser (de gauche à droite et de bas en haut):
panneau des paquetages, panneau des classes, panneau des protocoles,
panneau des méthodes, panneau de code
- repository browser -> Repository Browser ou navigateur de dépôts
- Method Names Browser -> Message Names Browser
- Change Set Browser -> Change Sorter
- a morphic halo handle -> une icône du halo Morphic
(Morphic/QuickTour); help balloon -> bulle d'aide; 

NOTES SECONDAIRES (pour la mise en forme des chapitres des parties I,
II, III, IV, il s'agit plus dans journal de bord de martial)
- \label{cha: devient \chalabel{
- \sq -> \pharo
- \sbe -> \pbe
- \spe -> \ppe
- attention: http:// a bien préciser dans TOUTES les urls.
- retirer toutes allusions aux toolflaps

CONSEIL:
- http://dictionnaire.reverso.net/informatique-francais-anglais/
- http://jargonf.org/wiki (pour les termes informatiques)
- http://dictionnaire.reverso.net/anglais-francais/
- http://en.bab.la/dictionary/english-french/
