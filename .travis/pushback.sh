#!/bin/bash
set -e

git clone https://$GITHUB_AUTH_TOKEN@github.com/sbtqa/page-factory-2.git
cd page-factory-2
git remote rm origin
git remote add origin https://$GITHUB_AUTH_TOKEN@github.com/sbtqa/page-factory-2.git
sed -i 's/webdriver.version = [0-9.]*/webdriver.version = $version/' plugins/html-plugin/src/test/resources/config/application.properties
sed -i 's/webdriver.version = [0-9.]*/webdriver.version = $version/' plugins/web-plugin/src/test/resources/config/application.properties
git add -A
git commit -m "bump chrome driver version"
git pull origin master
git push origin master