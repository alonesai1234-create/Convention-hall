#!/usr/bin/env bash
cd "$(dirname "$0")/backend"
mvn compile exec:java
