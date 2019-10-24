######TAKES FILE WITH ALL GDEM STRINGS AND FILTERS TO JUST THOSE WITHIN BOUNDING BOX######

inputFile = open("gdem_all.txt", "r")
# change to grab different area
inputBounds = { "upperLeft": [-95,20],
				"bottomRight": [-87, 13]}

outputFile = open("gdem_filtered.txt", "w")

for line in inputFile:
	# get latitude and longitude
	longitude = int(line[4:7])
	if line[3]=="W":
		longitude = longitude * -1

	latitude = int(line[1:3])
	if line[0]=="S":
		latitude = latitude * -1

	# check if tile should be included
	include = longitude >= inputBounds["upperLeft"][0] and longitude <= inputBounds["bottomRight"][0] and latitude <= inputBounds["upperLeft"][1] and latitude >= inputBounds["bottomRight"][1]
	if include:
		print(line)
		outputFile.write(line)

outputFile.close()


