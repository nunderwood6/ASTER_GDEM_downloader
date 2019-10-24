BASE_URL="https://e4ftl01.cr.usgs.gov/ASTT/ASTGTM.003/2000.03.01/ASTGTMV003_"

# from file with only desired
STR_FILE="gdem_filtered.txt"

while IFS= read -r line
do
	echo Downloading $line

	curl -O -b ~/.urs_cookies -c ~/.urs_cookies -L -n https://e4ftl01.cr.usgs.gov/ASTT/ASTGTM.003/2000.03.01/ASTGTMV003_$line

done < "$STR_FILE"

unzip \*.tif
mkdir tifs
mv *.tif tifs
rm *.zip