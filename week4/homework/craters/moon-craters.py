# This code has been learned from Peng Gao, Cherie Weichen Tang and Will Gallia
# In this code you learn how to extract data from a web source in order to print it
# or to be read by an alternative coding enviornment such as processing which is a java based
# program. In this particular case how to draw the craters of the moon by obtaining the latitude
# longitude and diameter of them from a wikipedia source. See detailed explanation ahead.


import requests
from lxml import etree
import time

# you establish the links from where the data is obtained
urls = [
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_A%E2%80%93B',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_C%E2%80%93F',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_G%E2%80%93K',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_O%E2%80%93Q',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_R%E2%80%93S',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_T%E2%80%93Z',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_L%E2%80%93N'
]

parser = etree.HTMLParser()

# With this function you obtain the coordinates of the craters from the website (longitude and latitude)
def get_coords(url):
    res = requests.get(url)

    tree = etree.fromstring(res.text, parser)
    coords = tree.xpath('//span[@class="geo"]/text()')


    return coords

# With this function you obtain the diameters of the craters from the website
def get_dia(url):
    res = requests.get(url)

    tree = etree.fromstring(res.text, parser)

    dia = tree.xpath('//tbody[1]/tr/td[3]/text()')

    return dia

# with this you call the code to obtain the data from the website
all_coords = []
all_dia =[]
for url in urls:
    coords = get_coords(url)
    dia=get_dia(url)
    all_coords += coords
    all_dia += dia
    #  ^ this is the same as all_coords.extend(coords)

    print('added {} coords'.format(len(coords)))

print('total of {}'.format(len(all_coords)))

# you tell the code to return a csv file with the latitude, longitude and diameters of the crater
# with this csv file you will translate that information inside a processing sketch
i=0
with open('moon_crater_coords.csv', 'w') as f:

    f.write('lat,lon,dia\n')
    for coord in all_coords:
        lat, lon = coord.split('; ')

        dia = all_dia[i]

        f.write('{},{},{}\n'.format(lat, lon,dia))
        i+=1
