#!/usr/bin/env bash

#    Aysad Kozanoglu
#
# DRUPAL vhost erweitung
#
#  @ Änderung der Wartungmodus auf ONLINE
#  @ Setzen der public path auf den neuen Pfad (Pfad des öffentlichen Dateisystems)
#  @ aktuelle drupal Umgebungwerte in datei speichern
#  @ drupal cache löschen
#
# Stand 23.03.2017
#

execPath="/srv/www/multisite/site/sites/klon.adelphi.de"
newPath=$execPath"/files"

# drush befehle müssen im der neu angelegten vhost/drupal Verzeichnis ausgeführt damit sie wirksam werden 
cd $execPath

# drupal online
 drush vset maintenance_mode 0

#drupal wartung
# //  drush vset maintenance_mode 1

# Pfad des öffentlichen Dateisystems
drush vset file_public_path $newPath

# drupal umgebungs status ins neue verzeichnis abspeichern
drush  status > $newPath/drupalEnvointment.log && cat $newPath/drupalEnvointment.log
# drupal cache löschen
drush cache-clear all


exit;

