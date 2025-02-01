#!/bin/bash

# Définir les variables pour les services
ES_VERSION="7.17.7"
KIBANA_VERSION="7.17.7"
FILEBEAT_VERSION="7.17.7"
ES_SERVICE="elasticsearch"
KIBANA_SERVICE="kibana"
FILEBEAT_SERVICE="filebeat"

# Fonction pour vérifier le statut d'un service
check_service_status() {
    local service=$1
    if systemctl is-active --quiet $service; then
        echo "$service est en cours d'exécution."
    else
        echo "Erreur : $service n'est pas en cours d'exécution. Tentative de démarrage..."
        sudo systemctl start $service
        if systemctl is-active --quiet $service; then
            echo "$service a démarré avec succès."
        else
            echo "Erreur : Échec du démarrage de $service."
            exit 1
        fi
    fi
}

# Fonction pour télécharger et installer les paquets
install_package() {
    local package=$1
    echo "Installation de $package..."
    if sudo apt-get install -y $package; then
        echo "$package installé avec succès."
    else
        echo "Erreur lors de l'installation de $package."
        exit 1
    fi
}

# Fonction pour télécharger et installer Filebeat
install_filebeat() {
    echo "Téléchargement et installation de Filebeat version $FILEBEAT_VERSION..."
    wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$FILEBEAT_VERSION-amd64.deb
    sudo dpkg -i filebeat-$FILEBEAT_VERSION-amd64.deb
    sudo apt-get install -f  # Fixer les dépendances manquantes
}

# Fonction pour configurer Filebeat
configure_filebeat() {
    echo "Configuration de Filebeat..."
    sudo cp /etc/filebeat/filebeat.yml /etc/filebeat/filebeat.yml.bak  # Sauvegarde avant modification
    sudo sed -i 's/#output.elasticsearch:/output.elasticsearch:/g' /etc/filebeat/filebeat.yml
    sudo sed -i 's/# hosts: ["localhost:9200"]:/hosts: ["localhost:9200"]:/g' /etc/filebeat/filebeat.yml
    echo "Configuration de Filebeat terminée."
}

# Fonction pour démarrer Filebeat
start_filebeat() {
    echo "Démarrage de Filebeat..."
    sudo systemctl enable filebeat
    sudo systemctl start filebeat
    check_service_status $FILEBEAT_SERVICE
}

# Fonction pour télécharger et installer Elasticsearch
install_elasticsearch() {
    echo "Téléchargement et installation de Elasticsearch version $ES_VERSION..."
    wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ES_VERSION-amd64.deb
    sudo dpkg -i elasticsearch-$ES_VERSION-amd64.deb
    sudo apt-get install -f  # Fixer les dépendances manquantes
}

# Fonction pour configurer Elasticsearch
configure_elasticsearch() {
    echo "Configuration d'Elasticsearch..."
    sudo cp /etc/elasticsearch/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml.bak  # Sauvegarde avant modification
    sudo sed -i 's/#network.host: 192.168.0.1/network.host: 0.0.0.0/g' /etc/elasticsearch/elasticsearch.yml
    echo "Configuration d'Elasticsearch terminée."
}

# Fonction pour démarrer Elasticsearch
start_elasticsearch() {
    echo "Démarrage d'Elasticsearch..."
    sudo systemctl enable elasticsearch
    sudo systemctl start elasticsearch
    check_service_status $ES_SERVICE
}

# Fonction pour télécharger et installer Kibana
install_kibana() {
    echo "Téléchargement et installation de Kibana version $KIBANA_VERSION..."
    wget https://artifacts.elastic.co/downloads/kibana/kibana-$KIBANA_VERSION-amd64.deb
    sudo dpkg -i kibana-$KIBANA_VERSION-amd64.deb
    sudo apt-get install -f  # Fixer les dépendances manquantes
}

# Fonction pour configurer Kibana
configure_kibana() {
    echo "Configuration de Kibana..."
    sudo cp /etc/kibana/kibana.yml /etc/kibana/kibana.yml.bak  # Sauvegarde avant modification
    sudo sed -i 's/#server.host: "localhost"/server.host: "0.0.0.0"/g' /etc/kibana/kibana.yml
    echo "Configuration de Kibana terminée."
}

# Fonction pour démarrer Kibana
start_kibana() {
    echo "Démarrage de Kibana..."
    sudo systemctl enable kibana
    sudo systemctl start kibana
    check_service_status $KIBANA_SERVICE
}

# Fonction pour afficher le menu
display_menu() {
    echo "Sélectionnez les étapes à exécuter :"
    echo "1. Installer et configurer Filebeat"
    echo "2. Installer et configurer Elasticsearch"
    echo "3. Installer et configurer Kibana"
    echo "4. Vérifier l'état des services"
    echo "5. Quitter le script"
    read -p "Entrez le numéro de l'étape que vous souhaitez exécuter (ou 5 pour quitter) : " step
}

# Fonction principale pour exécuter les étapes
execute_steps() {
    while true; do
        display_menu

        case $step in
            1)
                # Installer et configurer Filebeat
                install_filebeat
                configure_filebeat
                start_filebeat
                ;;
            2)
                # Installer et configurer Elasticsearch
                install_elasticsearch
                configure_elasticsearch
                start_elasticsearch
                ;;
            3)
                # Installer et configurer Kibana
                install_kibana
                configure_kibana
                start_kibana
                ;;
            4)
                # Vérifier l'état des services
                check_service_status $FILEBEAT_SERVICE
                check_service_status $ES_SERVICE
                check_service_status $KIBANA_SERVICE
                ;;
            5)
                # Quitter le script
                echo "Quitter le script..."
                exit 0
                ;;
            *)
                echo "Option invalide, veuillez entrer un numéro de 1 à 5."
                ;;
        esac
    done
}

# Lancer le processus d'exécution des étapes
execute_steps

