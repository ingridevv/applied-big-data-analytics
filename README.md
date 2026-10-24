# Applied Big Data Analytics

A collection of hands-on projects exploring distributed data processing, classical machine learning on Hadoop, and modern big data architectures.

### Contents
01. Containerized Hadoop Environment
02. Text Clustering with Apache Mahout

---
# 1. Containerized Hadoop Architecture for Text Clustering

A Docker-based Hadoop cluster running Apache Mahout for distributed text clustering.

---
## Architecture

<picture>

<source
media="(prefers-color-scheme: dark)"
srcset="./assets/dark-big-data-mahout-arch.png">

<img
src="./assets/light-big-data-mahout-arch.png"
alt="Architecture">

</picture>

--- 
## Data Flow

1. Download dataset from Kaggle
2. Upload dataset into HDFS (`hdfs dfs -put`)
3. YARN schedules distributed MapReduce jobs
4. Apache Mahout performs TF-IDF vectorization and K-Means clustering
5. Clustering results are written back to HDFS

*The goal of this project is not only to execute Apache Mahout, but to understand the architectural foundations of distributed storage and computation using Hadoop.*