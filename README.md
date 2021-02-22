     # isj_mobility
     
     Application Mobile de covoiturage réalisé par les étudiants DONGMO KEMBOU et TOUSSET d’INGE5 MSI pour le compte du projet ISI du semestre 1 del’année académique 2020/2021.
     
     ## Getting Started
     
     ISJ Mobility est une aplication dont le but est de faciliter les déplacements pour ou depuis le nouveau campus de l’ISJ..
	 Actuellement à la version 0.7  pour lancer l'application il faut coller le dossier "flutterMysql" situé dans le dossier "Lib" à la racine de votre SGBDR mysql .
	 exemple avec XAMPP: C:\xampp\htdocs
	 Importer également la base de donnée "isj_mobile" dans votre SGBDR mysql situé dans le dossier "bd" dans le dossier "Lib".
	 Modifier l'addresse IP du serveur par la votre dans les fichiers "login" et "register" présents dans le dossier "lib/screens/authentification"
	 Puis générez votre apk ou ipa.
     
     ## Codes

	vous trouverez dans le dossier "lib" les dossiers contenant les interfaces("screens"), celui contenant les entités("model"), celui contenant le code d’encryptage des données vers la bd("crypt") et celui contenant les widgets les plus utilisés et l’interface de loading("widgets").

Remarque: Votre SGBDR mysql doit être lancé pour que l'application puisse fonctionner et votre client mobile doit être dans le même réseau que ce dernier.

NB: Par soucis de temps nous n'avons pas créer de services web mais nous avons opté à utiliser la même base de donnés avec la partie web en locale.
