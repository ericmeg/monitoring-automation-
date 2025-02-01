# monitoring-automation

# Monitoring Automation - Filebeat, Elasticsearch, and Kibana

Ce repository contient 2 parties:
## Partie 1: 
Je scripte tout le process d'installation de prérequis dans le fichier *install_monitoring_interactive.sh* 
ce script est composé de fonctions. Pour l'exécuter: ./install_monitoring_interactive.sh , ensuite il vous propose des options.
## Partie 2:
Arborescence des fichiers de configuration et des playbooks pour automatiser l'installation et la configuration de **Filebeat**, **Elasticsearch**, et **Kibana**, ainsi que la création de dashboards et l'intégration des logs.
Le but final est de pouvoir visualiser des logs, métriques via l'interface KIBANA.
J'apporterai plus de détails concernant les fichiers à configurer (que rajouter? quid des GROK? etc...)

## Prérequis

- Ansible 2.x ou supérieur
- Elasticsearch 7.x
- Kibana 7.x
- Filebeat 7.x
- Accès aux serveurs où installer Filebeat, Elasticsearch, et Kibana

## Étapes
#### PARTIE 1


#### PARTIE 2
### 1. Installer Filebeat

Le playbook `filebeat-playbook.yml` installe et configure **Filebeat** sur les serveurs cibles.

#### Commandes :
```bash
ansible-playbook -i hosts filebeat-playbook.yml



---

### 5️⃣ **Ajouter, committer et pousser les changements vers GitHub**

Ensuite, ajoute les fichiers au dépôt Git, puis commit et pousse les modifications :

```bash
git add .
git commit -m "Ajout des fichiers de configuration et playbook pour l'automatisation du monitoring"
git push origin main

