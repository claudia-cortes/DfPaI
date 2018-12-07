import request

url = 'http://fezz.in/whg/projects/data/tube-stops.json'


response = request.get(url)
dataJson = resp.text

with open('tubestops.json', 'w') as f:
    f.write(dataJson)
