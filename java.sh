#!/bin/bash

if ! command -v java &> /dev/null; then

    sudo apt update
    sudo apt install -y openjdk-17-jre
    sudo apt install -y openjdk-17-jdk
    echo 'JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"' | sudo tee -a /etc/environment
    source /etc/environment

    # Check if JAVA_HOME is set correctly
    if [ "$JAVA_HOME" == "/usr/lib/jvm/java-11-openjdk-amd64" ]; then
        echo "JAVA_HOME is set correctly: $JAVA_HOME"
    else
        echo "Error: JAVA_HOME is not set correctly."
    fi

else
    echo "Java is already installed:"
    java -version
fi