#!/usr/bin/env bash
#
# The Alluxio Open Foundation licenses this work under the Apache License, version 2.0
# (the "License"). You may not use this work except in compliance with the License, which is
# available at www.apache.org/licenses/LICENSE-2.0
#
# This software is distributed on an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
# either express or implied, as more fully set forth in the License.
#
# See the NOTICE file distributed with this work for information regarding copyright ownership.
#

# Copy it as alluxio-env.sh and edit that to configure Alluxio for your
# site. This file is sourced to launch Alluxio servers or use Alluxio shell
# commands.
#
# This file provides one way to configure Alluxio options by setting the
# following listed environment variables. Note that, setting this file will not
# affect jobs (e.g., Spark job or MapReduce job) that are using Alluxio client
# as a library. Alternatively, you can edit alluxio-site.properties file, where
# you can set all the configuration options supported by Alluxio
# (http://alluxio.org/documentation/) which is respected by both external jobs
# and Alluxio servers (or shell).

# The directory where Alluxio deployment is installed. (Default: the parent directory of libexec/).
export ALLUXIO_HOME=/usr/local/alluxio-1.3.0

# The directory where log files are stored. (Default: ${ALLUXIO_HOME}/logs).
export ALLUXIO_LOGS_DIR=${ALLUXIO_HOME}/logs

# Hostname of the master.
export ALLUXIO_MASTER_HOSTNAME=Beyond

# This is now deprecated. Support will be removed in v2.0
# ALLUXIO_MASTER_ADDRESS

# The directory where a worker stores in-memory data. (Default: /mnt/ramdisk).
# E.g. On linux,  /mnt/ramdisk for ramdisk, /dev/shm for tmpFS; on MacOS, /Volumes/ramdisk for ramdisk
export ALLUXIO_RAM_FOLDER=${ALLUXIO_HOME}/ramdisk

# Address of the under filesystem address. (Default: ${ALLUXIO_HOME}/underFSStorage)
# E.g. "/my/local/path" to use local fs, "hdfs://localhost:9000/alluxio" to use a local hdfs
export ALLUXIO_UNDERFS_ADDRESS=/tmp

# How much memory to use per worker. (Default: 1GB)
# E.g. "1000MB", "2GB"
export ALLUXIO_WORKER_MEMORY_SIZE=50MB

# Config properties set for Alluxio master, worker and shell. (Default: "")
# E.g. "-Dalluxio.master.port=39999"
export ALLUXIO_JAVA_OPTS="-Dlog4j.configuration=file:${ALLUXIO_HOME}/conf/log4j.properties
  
 
  
  -Dorg.apache.jasper.compiler.disablejsr199=true
  -Djava.net.preferIPv4Stack=true
  
"

# Config properties set for Alluxio master daemon. (Default: "")
# E.g. "-Dalluxio.master.port=39999"
export ALLUXIO_MASTER_JAVA_OPTS="${ALLUXIO_JAVA_OPTS}"

# Config properties set for Alluxio worker daemon. (Default: "")
# E.g. "-Dalluxio.worker.port=49999" to set worker port, "-Xms2048M -Xmx2048M" to limit the heap size of worker. 
export ALLUXIO_WORKER_JAVA_OPTS=" 
  -Dalluxio.worker.tieredstore.levels=2
  -Dalluxio.worker.tieredstore.level0.alias=MEM
  -Dalluxio.worker.tieredstore.level0.dirs.path=${ALLUXIO_RAM_FOLDER}
  -Dalluxio.worker.tieredstore.level0.dirs.quota=${ALLUXIO_WORKER_MEMORY_SIZE}
  -Dalluxio.worker.tieredstore.level0.reserved.ratio=0.2
  -Dalluxio.worker.tieredstore.level1.alias=HDD
  -Dalluxio.worker.tieredstore.level1.dirs.path=/usr/hadoop
  -Dalluxio.worker.tieredstore.level1.dirs.quota=3GB
  -Dalluxio.worker.tieredstore.level1.reserved.ratio=0.1
  -Dalluxio.worker.memory.size=${ALLUXIO_WORKER_MEMORY_SIZE}
  -Dalluxio.worker.tieredstore.reserver.enabled=true
"

# Config properties set for Alluxio shell. (Default: "")
# E.g. "-Dalluxio.user.file.writetype.default=CACHE_THROUGH"
export ALLUXIO_USER_JAVA_OPTS="
  -Dalluxio.user.block.size.bytes.default=1KB
  -Dalluxio.user.file.buffer.bytes=100B
  -Dalluxio.user.ufs.delegation.write.buffer.size.bytes=100B

"
 

export JAVA_HOME=/usr/local/jdk1.8.0_111
export JAVA=${JAVA_HOME}/bin/java
