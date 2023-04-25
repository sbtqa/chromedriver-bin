if [ ! -z "$TRAVIS_TAG" ]
then
    echo "on a tag -> set pom.xml <version> to $TRAVIS_TAG"
    mvn --settings .travis/settings.xml org.codehaus.mojo:versions-maven-plugin:2.1:set -DnewVersion=$TRAVIS_TAG 1>/dev/null 2>/dev/null
else
    echo "not on a tag -> keep snapshot version in pom.xml"
fi

mvn clean deploy --settings .travis/settings.xml -DskipTests=true -Drelease=true -B -U

version=$(grep -o '<version>[0-9.]*</version>' pom.xml | head -1 | sed 's_<version>__' | sed 's_</version>__')
echo $version
