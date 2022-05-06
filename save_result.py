#!/usr/bin/python

# Input arg: the file need to be cleaned.
# Remove the uncessary lines. 
# Save it again to the same name. 

import sys
import os

file_name = sys.argv[1]

detect_mode = False
with open(file_name, "r") as f:
    lines = f.readlines()

new_file = list()

for line in lines:
    if ("fatal" in line) or ("...ignoring" in line):
        continue
    else:
        new_file.append(line)

with open(file_name, "w+") as f:
    for line in new_file:
        f.write(line)

