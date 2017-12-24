#!/bin/bash

ansible-playbook -i 'localhost,' provisionHardware.yml --ask-vault-pass


