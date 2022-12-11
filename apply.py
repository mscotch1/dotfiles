#!python

import toml
from jinja2 import Environment, FileSystemLoader
from os import path, mkdir

def create_if_not_exists(dir_path):
    if not path.isdir(dir_path):
        mkdir(dir_path)

DIRECTORY = 'build'

def run():
    config = toml.load('config.toml')
    file_loader = FileSystemLoader('templates')
    env = Environment(loader=file_loader)
    for template_path in env.list_templates():
        template = env.get_template(template_path)

        split_path = path.split(template_path)
        create_if_not_exists(path.join(DIRECTORY, split_path[0]))

        f = open(path.join(DIRECTORY, *split_path), 'w')
        f.write(template.render(**config))
        f.close()

run()
