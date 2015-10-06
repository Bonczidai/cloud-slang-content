#   (c) Copyright 2015 Hewlett-Packard Development Company, L.P.
#   All rights reserved. This program and the accompanying materials
#   are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
#   The Apache License is available at
#   http://www.apache.org/licenses/LICENSE-2.0
#
####################################################
# Check is boolean is true or false, use for flow control
#
# Inputs:
#   - check_bool - Boolean value to check
# Results:
#   - SUCCESS - check_bool is true
#   - FAILURE - check_bool is false
####################################################

namespace: io.cloudslang.base.utils

operation:
  name: check_bool
  inputs:
    - bool_value
  action:
    python_script: |
      pass
  results:
    - SUCCESS: bool_value == True
    - FAILURE: bool_value != True