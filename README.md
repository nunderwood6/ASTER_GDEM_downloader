#Grab ASTER GDEM version 3 tiles
The *gdem_all.txt* file has a newline separated list of all the tiles available. To kick out a text file with a subset of the tiles based on a bounding box, use the *filterTiles.py* file, which will kick out your subset as *gdem_filtered.txt*. Then run the getTiles.sh bash script, which will use curl to grab the files. Note, for this script to work you need a file at ~/.netrc with your NASA EarthData login and password as follows:
machine urs.earthdata.nasa.gov
login your_username
password your_password
