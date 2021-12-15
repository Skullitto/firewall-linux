# Script firewall Linux iptable basic :smile:

## Info: Par défault linux autorise tout !

### Vous devez avoir les priviléges root

1- Donné les droits d'exécution aux fichiers : **chmod +x firawall flush firewall.service**

2- Copier les fichiers dans /etc/init.d : **cp firewall flush /etc//init.d && cp firewall.service /etc/systemd/system**

3- L'activer au démarage : **systemctl enable firewall.service**

4- Status le service **systemctl status firewall.service**

###Commande pour remétrer à zéro les règles
**cd /etc/init.d && ./flush.sh**
