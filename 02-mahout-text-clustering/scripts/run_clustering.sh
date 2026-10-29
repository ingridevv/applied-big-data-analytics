#!/bin/bash

set -e

echo "Starting Mahout text clustering pipeline..."

echo "Creating HDFS input directory..."

hdfs dfs -mkdir -p /C50


echo "Uploading Reuters dataset to HDFS..."

hdfs dfs -copyFromLocal /data/C50 /


echo "Converting documents into SequenceFiles..."

mahout seqdirectory \
    -i /C50/C50train \
    -o /seqreuters \
    -xm sequential


echo "Generating TF-IDF vectors..."

mahout seq2sparse \
    -i /seqreuters \
    -o /train-sparse


echo "Running K-Means clustering..."

mahout kmeans \
    -i /train-sparse/tfidf-vectors/ \
    -c /kmeans-train-clusters \
    -o /train-clusters-final \
    -dm org.apache.mahout.common.distance.EuclideanDistanceMeasure \
    -x 10 \
    -k 10 \
    -ow


echo "Generating cluster report..."

mahout clusterdump \
    -d /train-sparse/dictionary.file-0 \
    -dt sequencefile \
    -i /train-clusters-final/clusters-10-final \
    -n 10 \
    -b 100 \
    -o ~/saida_clusters.txt \
    -p /train-clusters-final/clustered-points


echo "Pipeline completed successfully!"