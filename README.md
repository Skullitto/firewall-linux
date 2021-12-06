# Script firewall Linux iptable basic :smile:

## Info: Par défault linux autorise tout !

### Vous devez avoir les priviléges root

- Donné les droits d'exécution aux fichiers : **_chmod 755 firawall.sh flush.sh firewall.service_**
- Copier les fichiers dans /etc/init.d : **_cp firewall.sh flush.sh /etc/init.d/ && cp firewall.service /etc/systemd/system_**
- L'activer au démarage : **_systemctl enable firewall.service_**
- Tester le service **_systemctl enable firewall.service_**
- Status du service **_systemctl status firewall.service_**

### Commande remise à zéro des règles
**_cd /etc/init.d && ./flush.sh_**
