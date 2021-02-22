     # isj_mobility
     
     Application Mobile de covoiturage r�alis� par les �tudiants DONGMO KEMBOU et TOUSSET d�INGE5 MSI pour le compte du projet ISI du semestre 1 del�ann�e acad�mique 2020/2021.
     
     ## Getting Started
     
     ISJ Mobility est une aplication dont le but est de faciliter les d�placements pour ou depuis le nouveau campus de l�ISJ..
	 Actuellement � la version 0.7  pour lancer l'application il faut coller le dossier "flutterMysql" situ� dans le dossier "Lib" � la racine de votre SGBDR mysql .
	 exemple avec XAMPP: C:\xampp\htdocs
	 Importer �galement la base de donn�e "isj_mobile" dans votre SGBDR mysql situ� dans le dossier "bd" dans le dossier "Lib".
	 Modifier l'addresse IP du serveur par la votre dans les fichiers "login" et "register" pr�sents dans le dossier "lib/screens/authentification"
	 Puis g�n�rez votre apk ou ipa.
     
     ## Codes

	vous trouverez dans le dossier "lib" les dossiers contenant les interfaces("screens"), celui contenant les entit�s("model"), celui contenant le code d�encryptage des donn�es vers la bd("crypt") et celui contenant les widgets les plus utilis�s et l�interface de loading("widgets").

Remarque: Votre SGBDR mysql doit �tre lanc� pour que l'application puisse fonctionner et votre client mobile doit �tre dans le m�me r�seau que ce dernier.

NB: Par soucis de temps nous n'avons pas cr�er de services web mais nous avons opt� � utiliser la m�me base de donn�s avec la partie web en locale.
