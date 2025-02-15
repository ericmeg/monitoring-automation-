# monitoring-automation

# Monitoring Automation - Filebeat, Elasticsearch, and Kibana

Ce repository contient 2 parties:
## Partie 1: 
Je développe un script interactif, **install_monitoring_interactive.sh**, qui automatise l'installation des prérequis. Structuré en fonctions, il propose un menu d'options permettant de sélectionner et d'exécuter chaque étape du processus. Pour l'utiliser, il suffit de lancer :
```./install_monitoring_interactive.sh ```-> Un menu d'options vous est proposé.
## Partie 2:
Je travaille sur la structuration et l'automatisation du déploiement d'une stack de monitoring avec **Filebeat, Elasticsearch et Kibana**. Cela inclut l'organisation des fichiers de configuration et des **playbooks Ansible** pour installer, configurer et intégrer ces outils, ainsi que la création de dashboards interactifs pour visualiser les logs et métriques. J'affinerai ensuite la configuration en approfondissant des aspects clés comme les **pipelines d'ingestion, les filtres GROK** pour le parsing des logs et l'optimisation des requêtes dans Kibana.

## Prérequis

- Ansible 2.x ou supérieur
- Elasticsearch 7.x
- Kibana 7.x
- Filebeat 7.x
- Accès aux serveurs où installer Filebeat, Elasticsearch, et Kibana

## Étapes
#### PARTIE 1

voir script bash


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

