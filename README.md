# Firewall Linux iptable

Info: Par défault linux autorise tout ! 

1- donné les droits d'exécution au fichier : **sudo chmod + x firawall.sh**
2- testé si tout fonctionne, exécution du script ( il faut se trouver dans le dossier ou est situé votre script) : **./firewall.sh**
3- copier le fichier dans /etc/init.d/ : **sudo cp firewall.sh /etc/init.d/**
4- l'activer au démarage : **sudo update-rc.d firewall defaults**

Commande pour remétrer à zéro les règles ;

1- sudo chmod +x flush.sh
2- ./flush.sh

Bien penser à désactiver le script au démarrage : **sudo update-rc.d firewall remove**