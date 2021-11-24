#Script firewall Linux iptable basic :smile:

##Info: Par défault linux autorise tout !

### Vous devez avoir les priviléges root

1- Donné les droits d'exécution aux fichiers : **chmod 755 firawall.sh flush.sh firewall.service**

2- Copier les fichiers dans /etc : **cp firewall.sh flush.sh /etc/ && cp firewall.service /etc/systemd/system**

3- L'activer au démarage : **systemctl enable firewall.service**

4- Tester le service **systemctl enable firewall.service**

5- Status le service **systemctl status firewall.service**

###Commande remise à zéro les règles
**cd /etc/init.d && ./flush.sh**
