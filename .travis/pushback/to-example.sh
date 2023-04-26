#!/bin/bash
set -e

git clone https://$GITHUB_TOKEN@github.com/sbtqa/chromedriver-bin.git
cd chromedriver-bin
git remote rm origin
git remote add origin https://$GITHUB_TOKEN@github.com/sbtqa/chromedriver-bin.git
sed -i 's/webdriver.version = [0-9.]*/webdriver.version = $version/' src/test/resources/config/application.properties
git add -A
git commit -m "bump chrome driver version by chromedriver-bin"
git pull origin master
git push origin master