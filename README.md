# WeatherTune

## Overview

WeatherTune is a sleek and intuitive weather forecast app developed by a  team of four students from CITM-UPC University. Stay ahead of the weather with accurate forecasts and a delightful user experience.

## Features

- **Real-time Weather Updates:** Get up-to-the-minute weather information for your location.
- **4-Day Forecast:** Plan your week with a detailed 4-day weather forecast.
- **Intuitive Interface:** User-friendly design for a seamless experience.
- ***[OpenWeatherMap API](https://openweathermap.org/api)***: Simple, fast and free weather API to get data in a rapid and easy-to-use way.

## Developers Team

WeatherTune is the collaborative effort of four passionate students from CITM-UPC University:

- **[Rylan Graham](https://github.com/RylanJGraham)**
- **[Adria Pons](https://github.com/AdriaPm)**
- **[Joel Chaves](https://github.com/joeycm)**
- **[Xavi Alcañiz](https://github.com/StarvinXarvin)**

## Figma UI/UX Design Prototype
[Figma Prototype](https://www.figma.com/file/BKuhK7U4KPhKFwizA75vph/WeatherTune-App-Design-Sketch?type=design&node-id=0%3A1&mode=design&t=Gq3LmjmpS7cM8ayr-1) Check out our UI/UX Basis!

## How to Run the App

1. Open the project directory with your favorite IDE (**Visual Studio Code** is highly recommended).
2. Run "flutter pub get" in the terminal to install the project dependencies.
3. Select the "Chrome" or Android Emulator device and run the project ("flutter run").

## Features
<div style="display: flex; justify-content: space-between;">
  <div style="text-align: center; width: 45%; border: 1px solid #ccc; padding: 20px;">
    <h3>Login Page</h3>
    <img src="https://github.com/RylanJGraham/WeatherTune/blob/main/weather_tune/images/readme_images/LoginPage.png" alt="Image 1" style="width: 200px; height: 400px">
    <p style="font-style: italic;">Login Screen for user entry into application. User login is authenticated using Firebase authentification. Users login is stored locally, allowing user to re-enter app without having to login again.</p>
  </div>
  <div style="text-align: center; width: 45%; border: 1px solid #ccc; padding: 20px;">
    <h3>Register Page</h3>
    <img src="https://github.com/RylanJGraham/WeatherTune/blob/main/weather_tune/images/readme_images/RegisterPage.png" alt="Image 2" style="width: 200px; height: 400px">
    <p style="font-style: italic;">User is able to register account with Firebase Authentification. Providing Username (email), and password.</p>
  </div>
  <div style="text-align: center; width: 45%; border: 1px solid #ccc; padding: 20px;">
    <h3>Home Page</h3>
    <img src="https://github.com/RylanJGraham/WeatherTune/blob/main/weather_tune/images/readme_images/HomePage.png" alt="Image 2" style="width: 200px; height: 400px">
    <p style="font-style: italic;">Application Homepage. User is able to navigate around bottom widget to view upcoming weather forecast, sunset/sunrise times, and max-min temperature. User location is 
    automatically obtained by application using OpenWeather API</p>
  </div>
  <div style="text-align: center; width: 45%; border: 1px solid #ccc; padding: 20px;">
    <h3>Extended Homepage</h3>
    <img src="https://github.com/RylanJGraham/WeatherTune/blob/main/weather_tune/images/readme_images/HomePageExtended.png" alt="Image 2" style="width: 200px; height: 400px">
    <p style="font-style: italic;">User can view additional information for weather in their location by swiping up on the home screen. User gains access to information about air concentration, wind, and precipitation</p>
  </div>
  <div style="text-align: center; width: 45%; border: 1px solid #ccc; padding: 20px;">
    <h3>Favorites Page</h3>
    <img src="https://github.com/RylanJGraham/WeatherTune/blob/main/weather_tune/images/readme_images/FavoritesPage.png" alt="Image 2" style="width: 200px; height: 400px">
    <p style="font-style: italic;">User can see favorited locations and their respective temperatures. This is accessible by selecting the icon on the bottom bar</p>
  </div>
  <div style="text-align: center; width: 45%; border: 1px solid #ccc; padding: 20px;">
    <h3>Radar Page</h3>
    <img src="https://github.com/RylanJGraham/WeatherTune/blob/main/weather_tune/images/readme_images/RadarPage.png" alt="Image 2" style="width: 200px; height: 400px">
    <p style="font-style: italic;">Using Google Maps API user is able to check location of their favorite spots on the map, browse the globe with ease!</p>
  </div>
  <div style="text-align: center; width: 45%; border: 1px solid #ccc; padding: 20px;">
    <h3>Settings Page</h3>
    <img src="https://github.com/RylanJGraham/WeatherTune/blob/main/weather_tune/images/readme_images/SettingsPage.png" alt="Image 2" style="width: 200px; height: 400px">
    <p style="font-style: italic;">User can check their settings by selecting the settings icon from the bottom bar. While in settings user gains access to profile personalization, and personalization of Temperature values, API information and languages!</p>
  </div>
  <div style="text-align: center; width: 45%; border: 1px solid #ccc; padding: 20px;">
    <h3>Profile Page</h3>
    <img src="https://github.com/RylanJGraham/WeatherTune/blob/main/weather_tune/images/readme_images/ProfilePage.png" alt="Image 2" style="width: 200px; height: 400px">
    <p style="font-style: italic;">Uses Firebase Firestore user is able to change username, view their location, change their avatar or logout. This data is stored and refreshes when user updates!</p>
  </div>
</div>

## Feedback and Issues

If you encounter any issues or have suggestions for improvement, please [create an issue](https://github.com/RylanJGraham/WeatherTune/issues). We appreciate your feedback!

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/RylanJGraham/WeatherTune/blob/main/LICENSE) for further details.


***WeatherTune is not affiliated with any official weather service and is developed for educational purposes.***