#!/bin/bash
pushd  "`dirname \"$0\"`"
java -Xmx1024m -jar CxConsolePlugin-CLI-8.60.0.jar "$@"
popd
