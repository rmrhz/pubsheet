import os
import logging

from os.path import join, dirname
from dotenv import load_dotenv
from pathlib import Path

file = Path(__file__)

dotenv_path = join(file.parent, '.env')
load_dotenv(dotenv_path)

def get_env(variable):
  try:
    return os.environ[variable]
  except KeyError:
    logging.error("Environment variable '" + variable + "' not found")
