apt-get update && apt-get -y install wget

composer config extra.enable-patching true
composer config minimum-stability dev
composer require -n civicrm/civicrm-{core,packages,drupal-8}:'~5.52'
composer require civicrm/cv

wget https://download.civicrm.org/civicrm-5.27.2-l10n.tar.gz
tar -zxvf civicrm-5.27.2-l10n.tar.gz
cp -R civicrm/l10n/ vendor/civicrm/civicrm-core/
cp -R civicrm/sql/ vendor/civicrm/civicrm-core/
rm -rf civicrm

chmod -R 777 web/sites/default

cv core:install --cms-base-url="http://civicrm.kirkgate.org.uk" --lang="en_GB"

