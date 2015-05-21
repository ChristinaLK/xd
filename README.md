##XD resource use

Scripts to analyze XD resource use by campus (currently hard-coded to
University of Wisconsin - Madison), and produce graphs of total CPU hours
used and min/avg/max job size (in cores), by PI.  

Source data files are downloaded from (XDMod)[https://xdmod.ccr.buffalo.edu/#main_tab_panel2:tg_summary]
 from the usage tab. Choose a time range.  On the left menu, choose "CPU Hours: Total", "Job Size: Max", 
"Job Size: Min", "Job Size: Per Job" under the "Jobs by PI" section, and for each, use the 
"Display" tab to display as a "Datasheet".  Save the data (as .csv) using the "Export" button.  

Source datasheets are in the `data` directory. Scripts to generate an aggregate spreadsheet 
and produce graphs are in the `scripts` directory.  Aggregated spreadsheets and graphs are 
in the `reports` directory.  
