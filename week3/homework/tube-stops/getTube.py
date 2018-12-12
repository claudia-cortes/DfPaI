# This code has been learned from Peng Gao, Cherie Weichen Tang and Will Gallia
# In this code you learn how to extract data from a web source in order to print it
# or to be read by an alternative coding enviornment such as processing which is a java based
# program. See detailed explanation ahead.

# This library allows you to request information from a webiste and bring it into yout terminal

import json,urllib.request
from pythonosc import udp_client

# You use this IP and port addresses
ip, port = '127.0.0.1', 12000
# You use this address in the library to get the data
client = udp_client.SimpleUDPClient(ip, port)
 #You establish the https address from which you will get the data
data = urllib.request.urlopen("http://fezz.in/whg/projects/data/tube-stops.json").read()

# You tell the sketch to get the data from the Json file
output = json.loads(data)

# A key is an specific type of data that you will retrieve from the network
keys =[]
for key in output.keys():

    # In this case you will get the latitude and longitude data
    lat = output[key]['lat']
    lon = output[key]['lon']
    loc = [lat,lon]


    # with this you can send those especific keys into a processing sketch
    # remember to open the processing sketch first
    client.send_message("/lat", loc)
