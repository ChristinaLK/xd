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

##save to file
tmp_list = file_list[0].split('_')
save_file = "madison"
for item in tmp_list[-5:]:
	save_file = save_file+"_"+item
df.to_csv(save_file, index=False)
