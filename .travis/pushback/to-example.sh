git clone https://$GITHUB_TOKEN@github.com/sbtqa/page-factory-2-example.git
cd page-factory-2-example
git remote rm origin
git remote add origin https://$GITHUB_TOKEN@github.com/sbtqa/page-factory-2-example.git
sed -i "s/webdriver.version = [0-9.]*/webdriver.version = $CHROMEDRIVER_VERSION/" src/test/resources/config/application.properties
git add -A
git commit -m "bump chrome driver version by chromedriver-bin"
git pull origin master
git push origin master