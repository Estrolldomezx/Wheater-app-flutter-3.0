import 'location.dart';
import 'network.dart';

const apiKey = '2bcf5c436b2d7a6dad2c8849d391612c';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    // await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition == 500 || condition < 400) {
      return 'https://cdn-icons-png.flaticon.com/128/1850/1850736.png'; // rain
    } else if (condition < 600) {
      return 'https://cdn-icons-png.flaticon.com/128/9755/9755210.png'; // thunder
    } else if (condition < 700) {
      return 'https://cdn-icons-png.flaticon.com/128/2315/2315309.png'; // snow
    } else if (condition < 800) {
      return 'https://cdn-icons-png.flaticon.com/128/6316/6316087.png'; // fog
    } else if (condition == 800) {
      return 'https://cdn-icons-png.flaticon.com/128/1163/1163662.png'; // sun
    } else if (condition <= 804) {
      return 'https://cdn-icons-png.flaticon.com/128/414/414927.png'; // cloud
    } else {
      return 'https://cdn-icons-png.flaticon.com/128/3815/3815449.png';
    }
  }
}