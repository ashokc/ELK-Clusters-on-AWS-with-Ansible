#!/bin/bash

ansible-playbook -u ubuntu -i ./getAwsInventory.sh provisionSoftware.yml --ask-vault-pass

