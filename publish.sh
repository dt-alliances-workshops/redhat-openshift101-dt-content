#!/bin/bash

echo ""
echo "-----------------------------"
echo "Publishing site content"
echo "-----------------------------"

echo "Step 1: Compile Site"
node bin/generator.js 

echo "Step 2: Sync to S3"
aws s3 sync public/ s3://redhat-openshift101-dt-workshop

echo "-----------------------------"
echo "Done"
echo "-----------------------------"
echo ""
