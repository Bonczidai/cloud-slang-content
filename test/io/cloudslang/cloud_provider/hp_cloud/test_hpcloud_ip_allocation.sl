#   (c) Copyright 2014 Hewlett-Packard Development Company, L.P.
#   All rights reserved. This program and the accompanying materials
#   are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
#   The Apache License is available at
#   http://www.apache.org/licenses/LICENSE-2.0
#
####################################################
# TEST HP CLOUD FLOW
# This flow tests HP Cloud floating IP content
#  - Allocate a new floating IP
#  - Destroy and release the IP
####################################################

namespace: io.cloudslang.cloud_provider.hp_cloud

imports:
  hpcloud: io.cloudslang.cloud_provider.hp_cloud
  net: io.cloudslang.cloud_provider.hp_cloud.net
  print: io.cloudslang.base.print

flow:
  name: test_hpcloud_ip_allocation
  inputs:
    - username
    - password
    - region
    - tenant_name
  workflow:
    - authentication:
        do:
          get_authentication_flow:
            - username
            - password
            - tenant_name
            - region
        publish:
          - token
          - tenant
          - return_result
          - error_message    

    - allocate_new_ip:
        do:
          net.create_floating_ip_flow:
            - token
            - region          
        publish:
          - return_result
          - ip_address

    - print_server_build:
        do:
          print.print_text:
            - text: "'### Floating IP was allocated: '+ip_address"

    - release_ip:
        do:
          net.delete_floating_ip_flow:
            - ip_address
            - token
            - tenant
            - region 

    - on_failure:
      - ERROR:
          do:
            print.print_text:
              - text: "'! Error in HP Cloud IP allocation test flow'"