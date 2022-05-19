#!/usr/bin/env python3

import jinja2, yaml
import requests

templateFilePath = jinja2.FileSystemLoader('./')
jinjaEnv = jinja2.Environment(loader=templateFilePath)
jTemplate = jinjaEnv.get_template("index.html.jinja")

branches = ['development', 'wip-db-id-gen']

def branch_exists(path, branch) :
  url = f"https://github.com/{path}/tree/{branch}"
  print ("Checking ", url)
  r = requests.get(url)
  return r.status_code == 200

with open("input.yml") as config:
  config = yaml.safe_load(config)
  projects = config['projects']
  config['branches'] = branches
  for project in projects :
    path = project['path']
    for branch in branches :
      if (branch_exists(path, branch)) :
        project[branch] = True
  output = jTemplate.render(config)
  outFileH = open('public/index.html', 'w')
  outFileH.write(output)
  outFileH.close()
