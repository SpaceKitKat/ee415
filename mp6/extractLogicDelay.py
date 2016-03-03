#!/usr/bin/python3

import os.path as osp
import glob
import re

NUMBER_RE = '\d\.\d*e-\d*'
DELAY_RE = 'Total \w* delay: '

# load file and extract and return lines
# returns NULL if failed to load file.
# ARGS: filepath
# RETURN: list of files
def get_lines(fpath):
   # check that file exists
   if(not osp.isfile(fpath)):
      print("(!) ERROR: "+fpath+" does not exist.")
      return None

   # open and read lines
   f = open(fpath, 'r')
   return f.readlines()

# search lines for match and return the matching string
# return NULL if no match exists in list.
# ARGS: list of strings to search
# RETURN: list of matches found in list
def find_match(lines):
   results = [0,0]
   for ll in lines:
      # get line mentioning delays
      delay_lines = re.findall(r''+DELAY_RE+NUMBER_RE,ll)
      if(len(delay_lines) != 0):
         # print(delay_lines)
         # extract delay values from first two lines
         results[0] = re.findall(r''+NUMBER_RE,delay_lines[0])[0]
         results[1] = re.findall(r''+NUMBER_RE,delay_lines[1])[0]
         # make sure to return only when delay line has two numbers
         # print(results)
         return results

   return None


def main():
   #for all files in current directory
   for filename in glob.glob('./logfiles/*.txt'):
      # load and get lines
      lines = get_lines(filename)
      # print( filename+":"+str(len(lines)) )

      # get numbers
      matches = find_match(lines)

      # report file and numbers
      print(filename)

   return

main()

