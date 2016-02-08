#   (c) Copyright 2014 Hewlett-Packard Development Company, L.P.
#   All rights reserved. This program and the accompanying materials
#   are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
#   The Apache License is available at
#   http://www.apache.org/licenses/LICENSE-2.0
#
####################################################
#!!
#! @description: Sends an email.
#! @input hostname: email host
#! @input port: email port
#! @input from: email sender
#! @input to: email recipient
#! @input cc: optional - comma-delimited list of cc recipients - Default: none
#! @input bcc: optional - comma-delimited list of bcc recipients - Default: none
#! @input subject: email subject
#! @input body: email text
#! @input html_email: optional - Default: true
#! @input read_receipt: optional - Default: false
#! @input attachments: optional - Default: none
#! @input username: optional - Default: none
#! @input password: optional - Default: none
#! @input character_set: optional - Default: UTF-8
#! @input content_transfer_encoding: optional - Default: base64
#! @input delimiter: optional - Default: none
#! @input enableTLS: optional - enable startTLS - Default : false
#! @result SUCCESS: succeeds if mail was sent successfully (returnCode is equal to 0)
#! @result FAILURE: otherwise
#!!#
####################################################

namespace: io.cloudslang.base.mail

operation:
  name: send_mail
  inputs:
    - hostname
    - port
    - from
    - to
    - cc:
        required: false
    - bcc:
        required: false
    - subject
    - body
    - html_email:
        required: false
    - htmlEmail:
        default: ${get("html_email", "true")}
        overridable: false
    - read_receipt:
        required: false
    - readReceipt:
        default: ${get("read_receipt", "false")}
        overridable: false
    - attachments:
        required: false
    - username:
        required: false
    - password:
        required: false
    - character_set:
        required: false
    - characterSet:
        default: ${get("character_set", "UTF-8")}
        overridable: false
    - content_transfer_encoding:
        required: false
    - contentTransferEncoding:
        default: ${get("content_transfer_encoding", "base64")}
        overridable: false
    - delimiter:
        required: false
    - enable_TLS:
        required: false
    - enableTLS:
        default: ${get("enable_TLS", "")}
        overridable: false
  action:
    java_action:
      className: io.cloudslang.content.mail.actions.SendMailAction
      methodName: execute
  results:
    - SUCCESS: ${returnCode == '0'}
    - FAILURE
