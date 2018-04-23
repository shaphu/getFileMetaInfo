#!/bin/bash
if [ -d sourceInfo ]; then rm -rf sourceInfo; fi
mkdir sourceInfo
touch fileChangeInfo.txt
cat flattenPackageXML.txt | while read line
do
    force-dev-tool info show spr18dev "$line" >> sourceInfo/fileChangeInfo.txt    
done