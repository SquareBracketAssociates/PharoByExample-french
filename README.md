#Pharo par l'Exemple

Bienvenue dans le dépôt du code source *LaTeX* de Pharo par l'Exemple livre 1 et 2, traduction française de [Pharo by Example](https://github.com/SquareBracketAssociates/PharoByExample-english) (seul le livre 1 est traduit).

Le site web public: http://pharobyexample.org/fr/

Tous les dépôts (inclus diverses traductions) se trouvent ici: http://github.com/SquareBracketAssociates/

Référez-vous à la section *Notes des traducteurs pour les traducteurs* en fin de document pour plus d'informations concernants cette version:

#Contributions

Pour contribuer aux ouvrages *Pharo by Example*:

- inscrivez-vous sur <https://www.iam.unibe.ch/mailman/listinfo/sbe-discussion>;
- clonez le dépôt et contacter le chef du groupe en charge du projet (demandez sur la liste si vous ne trouvez pas la personne responsable);
- publiez les changements de votre copie sur le dépôt et informer les contributeurs des changements.

Pour participer à cet effort de traduction ou informer les actuels contributeurs à la version française *Pharo par l'Exemple*:

- inscrivez-vous au groupe de discussions <https://groups.google.com/group/smalltalk-fr?hl=fr> (ce fil francophone étant destiné au discussion sur Smalltalk en général, n'oublie pas de préciser que le sujet concerne *Pharo par l'Exemple*);
- (en cas d'acceptation) vous pourrez publier vos changements.

Pour participer à un effort de traductions autre:

- avertissez sur <https://www.iam.unibe.ch/mailman/listinfo/sbe-discussion> votre souhait de faire une autre traduction (en breton, par exemple);
- créez un réseau de contributeurs pour vous aider dans cette tâche;
- l'équipe SquareBracketAssociates ajoutera un dépôt sur <http://github.com/squarebracketassociates>;
- nous ajouterons un lien sur tout <http://pharobyexample.org/>.

# Licence

Tous ces documents sont publiés sous licence Creative Commons Paternité Version 3.0 de la licence générique - Partage des Conditions Initiales à l'Identique.
         <http://creativecommons.org/licenses/by-sa/3.0/>

Vous êtes libre:

- de reproduire, distribuer et communiquer cette création au public
- de modifier cette création

Selon les conditions suivantes:

- **Paternité.** Vous devez citer le nom de l'auteur original de la manière indiquée par l'auteur de l'oeuvre ou le titulaire des droits qui vous confère cette autorisation (mais pas d'une manière qui suggérerait qu'ils vous soutiennent ou approuvent votre utilisation de l'oeuvre).
- **Partage des Conditions Initiales à l'Identique.** Si vous transformez ou modifiez cette oeuvre pour en créer une nouvelle, vous devez la distribuer selon les termes du même contrat ou avec une licence similaire ou compatible.

- À chaque réutilisation ou distribution de cette création, vous devez faire apparaître clairement au public les conditions contractuelles de sa mise à disposition. La meilleure manière de les indiquer est un lien vers cette page web: http://creativecommons.org/licenses/by-sa/3.0/deed.fr
- Chacune de ces conditions peut être levée si vous obtenez l'autorisation du titulaire des droits sur cette oeuvre.
- Rien dans ce contrat ne diminue ou ne restreint le droit moral de l'auteur ou des auteurs. Ce qui précède n'affecte en rien vos droits en tant qu'utilisateur (exceptions au droit d’auteur: copies réservées à l'usage privé du copiste, courtes citations, parodie, ...). Ceci est le Résumé Explicatif du Code Juridique (la version intégrale du contrat): http://creativecommons.org/licenses/by-sa/3.0/legalcode

#Structure

Le fichier principal est PBE1.tex (respectivement PBE2.tex). Les chapitres sont dans des sous-répertoires. Vous pouvez compiler avec LaTeX (TeXLive 2009 est recommandé par l'équipe francophone) soit l'intégralité du livre ou chaque chapitre. Chaque chapitre commence et se termine par les mêmes invocations incluant parfois des macros.

Utilisez la macro `\ct{}` dans le code *inline*.
Utilisez les environnements `{method}` `{classdef}` `{example}` et `{script}` pour le code multi-ligne.

Si vous ajoutez un nouveau chapitre:

- assurez-vous de l'inclure dans PBE1.tex
- souvenez-vous que vous devez ajouter le sous-répertoires `/figures/` de ses nouvelles images ou graphiques dans le `\graphicspath` (dans PBE1.tex ou PBE2.tex). N'oubliez le *slash* de fin (`/`).
- assurez aussi que le chapitre compile indépendamment du livre *ET* dans le livre.

**IMPORTANT:** vérifiez que vous disposez d'une copie récente du livre et compilez le livre pour vous assurer que vous avez bien ajoutés toutes les dépendances (par ex., les figures).

## Makefile

Pour construire le fichier PDF du livre, lancer `make` dans le répertoire-racine du livre. (`make` peut compiler une version particulière du livre: ici `make pbe1` s'assure par exemple de compiler le premier livre de la version française de *Pharo by Example*.

---

# Tests

Les tests sont automatiquement générés depuis les sources LaTeX.

**ATTENTION** La documentation originale recommande de prendre une image récente de Pharo et de la placer dans le répertoire du livre et, de ne pas utiliser une image *OneClick*. En réalité vous pouvez toujours utiliser l'archive `PBE-1.0-OneClick` fournie sur <http://pharobyexample.org/fr> pour l'édition française: pour ce faire, copiez les fichiers `PBE.image`, `PBE.changes`, `PharoV10.sources` et le répertoire `Fonts/` dans le répertoire-racine du livre puis référer vous à la FAQ dans l'annexe du livre pour changer le chemin de l'image (ainsi en lançant le script ou en double-cliquant sur le bon programme de `PBE-1.0-OneClick.app` selon votre système d'exploitation, vous démarrez la bonne image dans le répertoire PBE).

De là, chargez le paquetage `PBE-Testing` dans le projet SqueakSource suivant:

    MCHttpRepository
      location: 'http://www.squeaksource.com/PharoByExample'
      user: ''
      password: ''

Lancez les tests en évaluant ensuite l'expression suivante dans votre Workspace:

    PBEMain new runTests

Pour PBE2 (*cad* Pharo par l'Exemple, second livre), lancez alors:

    PBE2Main new runTests

Ceci extraira automatiquement des sources LaTeX les tests inclus dans le zone de code et les exécutera. Les exercices pratiques seront ainsi chargés et leur bon fonctionnement sera vérifié. (Certains tests peuvent être inclus depuis des paquetages dépendants.)

Via le module d'expressions régulières `Regex`, PBE1.tex (ou PBE2.tex) sera *parsé* pour y trouver les fichiers-chapitres qui seront scannés à leur tour pour chercher les annotations de la forme `@TEST`. Une fois, un code-test `@TEST` trouvé dans le code-source LaTeX, une classe héritière de `TestCase` sera générée pour le chapitre et une méthode de test de la forme `test<numéro>` (où `<numéro>` correspond au numéro de ligne) sera écrite dans une nouvelle catégorie `PBE-GeneratedTests`. Le message `runTests`, lance une fenêtre `TestRunner` ouverte sur une nouvelle catégorie et tous ses tests seront lancés.

## Comment écrire les tests en LaTeX

Un test-échantillon dans le chapitre `BasicClasses` ressemble à cela:

    =\begin{code}{@TEST}
    =a1 := { { 'harry' } } .
    =a2 := a1 shallowCopy.
    =(a1 at: 1) at: 1 put: 'sally'.
    =(a2 at: 1) at: 1 --> 'sally'
    =\end{code}

L'invocation `print it` `(-->)` générera une assertion.

Le code généré ressemblera à ceci:

    =test204
    =       a1 := { { 'harry' } } .
    =       a2 := a1 shallowCopy.
    =       (a1 at: 1) at: 1 put: 'sally'.
    =       self assert: [ (a2 at: 1) at: 1  ] value printString = '''sally'''

Vous pouvez aussi faire des déclarations et/ou initialisations de variables discrétement en ajoutant le code après `@TEST` et vous pouvez mettre des commentaires après la chaîne de caractères du test:

    =\begin{code}{@TEST |a b|}
    =a := b := 'salut'.
    =a == b --> true "deux variables mais un objet"
    =\end{code}

La sous-classe générée est PBEBasicClassesTestCase.

Ces tests peuvent être purgés en évaluant `PBEMain removeOldTestCategory`. `PBEMain new runTests` effectue cette purge à chaque fois.

# Programmes

## LaTeX

Nous recommandons [TeXLive 2009](http://www.tug.org/texlive/).

## OmniGraffle

Nous recommandons l'outil propriétaire [OmniGraffle](http://www.omnigroup.com/products/omnigraffle/) version 5 ou plus pour Mac OS X.

Bien sur pour tout nouveau ajout de chapitre et de figures (dans le document original ou ses adaptations), vous pouvez utiliser des outils libres comme inkScape, The Gimp ou OpenOffice. Nous vous invitons à:

- sauvegarder les fichiers `graffle` en mode *flat* pour le versionnage git (autrement cela génére un dossier *bundle* difficile à versionner);
- exporter en PNG 300 dpi avec fond blanc (pas de transparence).

# Bibliographie

Le fichier scg.bib est disponible dans un dépôt git indépendant:

    git clone git@scg.unibe.ch:scgbib

Vous pouvez obtenir une version *en lecture seule*:

    git clone git://scg.unibe.ch/scgbib

#Notes des traducteurs pour les traducteurs

Se référer au document source: [Pharo by Example](https://github.com/SquareBracketAssociates/PharoByExample-english).

##État de la synchro avec PBE: cf. STATE

Pour les nouveaux arrivants, compiler avec latex ou pdflatex demo.tex
(c'est l'équivalent de commonDemo dans PBE pour tester le rendu via le
fichier common.tex)

##TRES IMPORTANT: (martial)
* Compilation en TeXLive 2009 ok (problème avec TeXLive-2010-64, manque
les uline/uwave en MacTeX)
* Tous les changements importants des parties I, II, III et IV de la
version Omnibus sont reportés en bleu via la balise \arelire{}. Je
vous invite à baliser les zones incertaines des nouveaux chapitres
ainsi les relecteurs auront plus de facilité à identifier certains
paragraphes (comme les commentaires '% REVOIR' et autre, il faut que
cela disparaisse pour les versions beta du document)
* En cas de problème dans le texte (désynchro avec la VO par exemple):
\tradalert{nom du traducteur}{message} (attention: contrairement à la
, cette commande s'affiche aussi dans la compilation globale; ne pas
utiliser en phase bêta du document)
* Les outils de base Morphic sont à installer (OBSOLETE):

MCHttpRepository
	location: 'http://www.squeaksource.com/PharoMorphicExtras'
	user: 'squeak'
	password: 'squeak'

puis choisir les packages: MorphicExtras et MorphicExamplesAndDemos.

##IMPORTANT:
* \pbe devient \ppe pour referencer le livre en version française
* utiliser \pharo pour Pharo
* convention:
[Ofset wiki](http://community.ofset.org/index.php/Squeak_par_l'exemple) dont
l'essentiel se résume ainsi: Pas de "on" mais du "nous", les termes
liés aux codes ne changent pas (ex: "a debugger" devient "un
débogueur" mais "the Debugger window" devient "la fenêtre Debugger")
[martial: j'utilise le commentaire % REVOIR pour les paragraphes
incertains; % ATTENDRE pour les paragraphes dont la mise à jour dépend
de la finalisation de la VO; % CHANGE est synonyme de REVOIR mais
c'est utilisé pour tous les paragraphes remplacés entre deux versions
(ou entre SBE et PBE); je vous invite à faire de même; le but est de
faire disparaitre ces balises à la relecture]
* regarder à la fin du fichier common.tex pour ajouter/enlever les
aliases et césures typiquement françaises (en deux parties, celles de
SBE (squeak by example; qui a priori reste inchangé pour les chapitres
communs aux deux livres pour des raisons de rétrocompatibilité) et
celles de PBE (pharo by example; exemple d'ajout \truetype pour TrueType)).
* Pour écrire des accents dans les commentaires de code, il faut
utiliser les balises !. Attention de mettre la balise uniquement sur
le ou les mots concernés: ces balises d'échappement "resettent" les
composantes graphiques des zones de code (dans le cas de SBE, ça passe
inaperçu mais dans PBE, il y a un fond gris dans ces zones; englober
plusieurs mots entre les ! risquent de faire passer le fond gris au
blanc localement). Si vous n'avez pas compris et que vous avez des
rayures blanches dans les codes, contactez martial.boniou@gmx.com (PS:
le hack est nécessaire en raison d'une incompatibilité avec les
\lstlisting utilisés pour faire les codes).

##Par rapport à Squeak Par l'Exemple:
* les entêtes des chapitres ont changés (\usepackage, \sloppy
\frontmatter)
* \pharoweb est l'url du projet
* \pbe est l'url du livre anglais
* \ppe est l'url du livre francais
* \sq devient \pharo (et \Pharo utilisé dans Squeak Par l'Exemple est
obsolète; attention de ne pas remplacer des aliases dans le style
\sqsrc pour SqueakSource)
* 'le System Browser' devient 'le Browser' mais on garde (pour l'instant) le
terme générique 'un navigateur de classes'
* Les catégories laissent place aux paquetages
* (en finalisant) vérifier que les schémas/figures/screenshots/codes
ne soient pas séparés de leur caption; les \newpage, \clearpage et
autre \needlines{} doivent être réglées à la fin
* les URLs web doivent impérativement avoir 'http://' en entête
* un des mantras de Model.tex (visible dans Metaclasses aussi)
changent dans PBE: 'by message sends' devient 'by sending messages':
rien n'est changé dans la VF pour l'instant: 'tout se passe par envoi
de messages' reste (mais pourrait changer par 'tout se passe en
envoyant des messages'; martial: je pense qu'il est inutile de
changer)
* 'SBE-Quinto' devient 'PBE-LightsOut' (dans les catégories notamment
(\scat)) et SBEGame devient LOGame
* le titre est 'Pharo par l'Exemple' (match: 'Pharo by Example'; sauf les exemples de code 'Pharo By Example')
; la graphie du logo est: '**[Pharo]** par l'exemple' (**[Pharo]** est le logo de Samuel Morello).
* on parle d'archiver pour 'commit'; actualiser pour 'update';
fusionner pour 'merge'; charger pour 'load'; les termes anglais sont
rappelés (Monticello); les paquetages "clean" et "dirty" sont définis
mais gardent leur nom anglais en italique; le 'repository inspector'
s'écrit en capitales 'Repository Inspector' (défini une fois comme
inspecteur des dépôts); 'unload' -> décharger
* pour les panneaux du Browser (de gauche à droite et de bas en haut):
panneau des paquetages, panneau des classes, panneau des protocoles,
panneau des méthodes, panneau de code
* repository browser -> Repository Browser ou navigateur de dépôts
* Method Names Browser -> Message Names Browser
* Change Set Browser -> Change Sorter
* a morphic halo handle -> une icône du halo Morphic
(Morphic/QuickTour); help balloon -> bulle d'aide; 

##NOTES SECONDAIRES (pour la mise en forme des chapitres des parties I, II, III, IV, il s'agit plus dans journal de bord de martial)
* \label{cha: devient \chalabel{
* \sq -> \pharo
* \sbe -> \pbe
* \spe -> \ppe
* attention: http:// a bien préciser dans TOUTES les urls.
* retirer toutes allusions aux toolflaps

##CONSEIL:
* http://dictionnaire.reverso.net/informatique-francais-anglais/
* http://jargonf.org/wiki (pour les termes informatiques)
* http://dictionnaire.reverso.net/anglais-francais/
* http://en.bab.la/dictionary/english-french/
