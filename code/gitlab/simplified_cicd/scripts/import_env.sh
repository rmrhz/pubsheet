#!/usr/bin/env bash
if [ -f .ci.env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi