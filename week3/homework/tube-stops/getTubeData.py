
#libreray
import json,urllib.request


from pythonosc import udp_client

#Setting up IP, port ( server, client from processing)
ip, port = '127.0.0.1', 12000 # server address

# server address get from lirbreray
client = udp_client.SimpleUDPClient(ip, port)

data = urllib.request.urlopen("http://fezz.in/whg/projects/data/tube-stops.json").read()

# get data from Json file
output = json.loads(data)

#keys represents "XXXXXXXXl": { format
keys =[]
for key in output.keys():

    lat = output[key]['lat']
    lon = output[key]['lon']
    loc = [lat,lon]

    #open processing first, then file can send message at the sametime
    client.send_message("/lat", loc)
