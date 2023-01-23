# rds_webapp


# Projet de déploiement d'une page web sur AWS.

## 1. Créez une instance EC2 (Utiliser l'offre gratuite de AWS)
Il est important d'appliquer les recommandations sécurité réseau vu en cours.
 - Network ACL.
 - Security Group.
 - Authentification en utilisant une clé d'authentification.

## 2. Installez les composant suivants sur la machine EC2:
 - httpd/Apache2
 - PHP7 (follow this tutorial https://www.tutorialswebsite.com/how-to-install-php-on-aws-ec2-instance/)

## 3. Clonez le code du projet:
 git clone https://github.com/atifrani/rds_webapp.git

## 4. Créez une base de données RDS postgresql  (Utiliser l'offre gratuite de AWS):
Il est important d'appliquer les recommandations sécurité réseau vu en cours.
 - Network ACL.
 - Security Group.
 - Authentification en utilisant username, password

## 5. Connectez-vous à la base postgresql:
Une fois connecter à la base de données exécutez le script sql employees.sql.

## 6. Modifiez le fichier de configuration base de données:
Retrounez sur la machine EC2 et editez le fichier de configuration app/db-config.php
Mettez à jour les informations pour autoriser l'application à se connecter à la base de données.

## 7. Copiez le code de votre application.
Sur la machine EC2, copiez le code de votre application (Le répertoire app) dans le répertoire /var/www/html.
Redémarrez le service apache2, sudo /usr/sbin/apache2ctl restart.

Connectez vous sur l'ip publique de votre machine EC2 pour vérifier si votre application est correctement déployée. http://ip-public/app/insert.php


