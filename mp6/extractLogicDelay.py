#!/usr/bin/python3

import os.path as osp
import re

PATTERN = ""

# returns NULL if failed to load file
def get_lines(fpath):
   print("loading: "+fpath)
   # check that file exists
   if(not osp.isfile(fpath)):
      print("(!) ERROR: "+fpath+" does not exist.")
      return None

   # open and read lines
   f = open('file_name.ext', 'r')
   return f.readlines()

# search for this pattern
# “Total logic delay: 8.98824e-10 (s) Total net delay: 6.44429e-10 (s) ”

def main():
   x = re.compile(PATTERN)

   #for all files in current directory
      # load and get lines
      lines = get_lines(fname)



   return

