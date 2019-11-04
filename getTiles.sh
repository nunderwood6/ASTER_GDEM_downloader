BASE_URL="https://e4ftl01.cr.usgs.gov/ASTT/ASTGTM.003/2000.03.01/ASTGTMV003_"
WATER_BASE_URL="https://e4ftl01.cr.usgs.gov/ASTT/ASTWBD.001/2000.03.01/ASTWBDV001_"
# from file with only desired
STR_FILE="gdem_filtered.txt"

# get elevation
while IFS= read -r line
do
	echo Downloading $line

	curl -O -b ~/.urs_cookies -c ~/.urs_cookies -L -n https://e4ftl01.cr.usgs.gov/ASTT/ASTGTM.003/2000.03.01/ASTGTMV003_$line

done < "$STR_FILE"

unzip \*.tif
mkdir dem
mv *.tif dem
rm *.zip

# get water
while IFS= read -r line
do
	echo Downloading $line

	curl -O -b ~/.urs_cookies -c ~/.urs_cookies -L -n https://e4ftl01.cr.usgs.gov/ASTT/ASTWBD.001/2000.03.01/ASTWBDV001__$line

done < "$STR_FILE"

unzip \*.tif
mkdir water
mv *.tif water
rm *.zip