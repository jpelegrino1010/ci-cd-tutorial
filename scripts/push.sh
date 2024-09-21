#!/bin/bash

echo "**************************************"
echo "********** Pushing Image *************"
echo "**************************************"

IMAGE="mavenproject"
LOCAL_IMAGE="app"


echo "****** Logging In ************"
docker login -u jpelegrino -p $PASS
echo "***Tagging Image **************"
docker tag $LOCAL_IMAGE:$BUILD_TAG jpelegrino/$IMAGE:$BUILD_TAG
echo "********** Pushing ************"
docker push jpelegrino/$IMAGE:$BUILD_TAG