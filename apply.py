#!/usr/bin/python3

import toml
import jinja2
import os
import argparse

def run():
    config_file = open('config.toml', 'r')
    config = toml.loads(config_file.read())
    config_file.close()

    print(config)

run()