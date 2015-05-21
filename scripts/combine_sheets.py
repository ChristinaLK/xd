import pandas as pd
import sys

##make list of files to include

file_list = sys.argv[1:]

##create PI list from one file
df = pd.read_csv("madison_"+file_list[0], header=6, usecols=["PI"], skip_blank_lines=True)

##read in file stats, merge into master dataframe
for file in file_list:
    tmp = pd.read_csv("madison_"+file, header=6, skip_blank_lines=True)
    df = pd.merge(df,tmp, on="PI")

##format PI column
df["PI"] = df["PI"].str.split('-').str[0]

##build file title
title = "madison"
file_title_pieces = file_list[0].split('_')
for item in file_title_pieces[-5:]:
    title = title+"_"+item

f = open('../reports/title.txt', 'w')
f.write(title)
f.close()

df.to_csv('../reports/data.txt', index=False)

print title
