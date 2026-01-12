#!/usr/bin/env bash
ssh n0 -t '''
    cd ~/distComp;
    watch ".venv/bin/python3 redisManager.py --task \"checkTask&checkWorker\" --finished false --todo false --in_progress 0 --failed false --failed_reason false"
'''
