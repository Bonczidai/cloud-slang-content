#   (c) Copyright 2014 Hewlett-Packard Development Company, L.P.
#   All rights reserved. This program and the accompanying materials
#   are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
#   The Apache License is available at
#   http://www.apache.org/licenses/LICENSE-2.0
#
####################################################
#   This operation generates a new uuid
#
#   Outputs:
#       - new_uuid - the genarated uuid
#   Results:
#       - SUCCESS - always
####################################################
namespace: org.openscore.slang.base.utils

operation:
  name: uuid_generator
  action:
    python_script: |
      import uuid
      new_uuid = str(uuid.uuid1())
      print new_uuid
  outputs:
    - new_uuid
  results:
    - SUCCESS