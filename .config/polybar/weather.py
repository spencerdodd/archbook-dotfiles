#!/usr/bin/env python3
import requests

def get_the_weather():
	"""
	[coastal@archbox polybar]$ python weather.py
	{'coord': 
		{'lon': -71.06, 'lat': 42.36}, 
		'weather': 
			[
				{
					'id': 800, 
					'main': 'Clear', 
					'description': 'clear sky', 
					'icon': '01n'}
			], 
		'base': 'stations',
		'main': 
			{
				'temp': 290.05, 
				'pressure': 1017, 
				'humidity': 64, 
				'temp_min': 286.15, 
				'temp_max': 294.15
			}, 
		'visibility': 16093, 
		'wind': 
			{
				'speed': 2.48, 
				'deg': 230.002
			}, 
		'clouds': 
			{
				'all': 1
			}, 
		'dt': 1496450400, 
		'sys': 
			{
				'type': 1, 
				'id': 1801, 
				'message': 0.0047, 
				'country': 'US', 
				'sunrise': 1496480942, 
				'sunset': 1496535376}, 
				'id': 4930956, 'name': 
				'Boston', 'cod': 200
			}
	"""
	location = "Boston"
	api_key = "49c46ae9f0a81ae4a357fd09f75c4c26"
	r = requests.get('http://api.openweathermap.org/data/2.5/weather?q={}&APPID={}'.format(location, api_key))
	r_json = r.json()

	desc = r_json["weather"][0]["description"]
	temp = round((r_json["main"]["temp"] - 273) * 9/5 + 32)
	return "{} {}°F {}".format(location, temp, desc)
	
def main():
	print(get_the_weather())

main()
