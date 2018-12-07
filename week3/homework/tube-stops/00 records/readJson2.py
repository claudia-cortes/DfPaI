import request

url = 'http://fezz.in/whg/projects/data/tube-stops.json'

params = {
'Oxford Circus':'lat'

response = request.get(url, params=params)

print(response.text)
