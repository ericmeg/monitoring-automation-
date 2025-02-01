# monitoring-automation

# Monitoring Automation - Filebeat, Elasticsearch, and Kibana

Ce repository contient des fichiers de configuration et des playbooks pour automatiser l'installation et la configuration de **Filebeat**, **Elasticsearch**, et **Kibana**, ainsi que la création de dashboards et l'intégration des logs.

## Prérequis

- Ansible 2.x ou supérieur
- Elasticsearch 7.x
- Kibana 7.x
- Filebeat 7.x
- Accès aux serveurs où installer Filebeat, Elasticsearch, et Kibana

## Étapes

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

