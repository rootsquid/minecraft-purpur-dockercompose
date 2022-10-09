#!/bin/bash

if [ "$EULA" = "false" ]; then
    echo "Accepted EULA is required"
else

mkdir $PWD/mcpurpur

mv serverdownloader.py $PWD/mcpurpur

cd $PWD/mcpurpur

python3 serverdownloader.py

#Avoids redownloading .jar file on run:
touch ../mcpurpur_${VERSIONPURPUR}.jar

java -jar mcpurpur_${VERSIONPURPUR}.jar

#Accept Eula
sed -i 's/eula=false/eula=true/g' ./eula.txt

java -server -Xms${MEMORY} -Xmx${MEMORY} -jar mcpurpur_${VERSIONPURPUR}.jar  --nogui
fi