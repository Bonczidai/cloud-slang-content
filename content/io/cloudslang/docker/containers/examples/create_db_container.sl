#   (c) Copyright 2014 Hewlett-Packard Development Company, L.P.
#   All rights reserved. This program and the accompanying materials
#   are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
#   The Apache License is available at
#   http://www.apache.org/licenses/LICENSE-2.0
#
####################################################
#!!
#! @description: Creates a Docker DB container.
#! @input host: Docker machine host
#! @input port: optional - SSH port
#! @input username: Docker machine username
#! @input password: Docker machine password
#! @input port: optional - SSH port
#! @input password: optional - Docker machine password
#! @input private_key_file: optional - path to private key file
#! @input container_name: optional - name of the DB container - Default: 'mysqldb'
#! @input timeout: optional - time in milliseconds to wait for command to complete
#! @output db_IP: IP of newly created container
#! @output error_message: error message of failed operation
#!!#
####################################################
namespace: io.cloudslang.docker.containers.examples

imports:
 docker_images: io.cloudslang.docker.images
 docker_containers: io.cloudslang.docker.containers
flow:
  name: create_db_container
  inputs:
    - host
    - port:
        required: false
    - username
    - password:
        required: false
    - private_key_file:
        required: false
    - container_name: 'mysqldb'
    - timeout:
        required: false
  workflow:
    - pull_mysql_image:
        do:
          docker_images.pull_image:
            - image_name: 'mysql'
            - host
            - port
            - username
            - passworde
            - privateKeyFile: ${private_key_file}
            - timeout
        publish:
          - error_message

    - create_mysql_container:
        do:
          docker_containers.run_container:
            - image_name: 'mysql'
            - container_name
            - container_params: ${'-e MYSQL_ROOT_PASSWORD=pass -e MYSQL_DATABASE=boot -e MYSQL_USER=user -e MYSQL_PASSWORD=pass'}
            - host
            - port
            - username
            - password
            - private_key_file
            - timeout

    - get_db_ip:
        do:
          docker_containers.get_container_ip:
            - container_name
            - host
            - port
            - username
            - password
            - private_key_file
            - timeout
        publish:
          - container_ip: ${container_ip}
          - error_message

  outputs:
    - db_IP: ${'' if 'container_ip' not in locals() else container_ip}
    - error_message