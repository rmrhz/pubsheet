#!/usr/bin/env bash
if [ -f build/.env ]
then
  export $(cat build/deploy.env | sed 's/#.*//g' | xargs)
fi