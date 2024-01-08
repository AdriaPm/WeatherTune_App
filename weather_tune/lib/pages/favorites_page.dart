import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_tune/bloc/weather_bloc_bloc.dart';
import 'package:weather_tune/data/getWeather_getBackground.dart';
import 'package:weather_tune/models/favorite_page/location_data.dart';

class FavoritePage extends StatelessWidget {
  final List<LocationData> locations = [
    LocationData('New York', 'sunny', '25°C'),
    LocationData('London', 'cloudy', '13°C'),
    LocationData('Tokyo', 'rainy', '20°C'),
    LocationData('Paris', 'snowy', '-2°C'),
    LocationData('Sydney', 'foggy', '22°C'),
    LocationData('Berlin', 'stormy', '15°C'),
    // Add more locations as needed
  ];

  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Favourite Locations', style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.grey.shade900,
        foregroundColor: const Color.fromARGB(207, 255, 255, 255),
        toolbarHeight: 50,
      ),
      body: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
builder: (context, state) {
            if (state is WeatherBlocSuccess) {
              return Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(78, 20, 24, 27),
                    image: getBackground(state.weather.weatherMain!),
                  ),
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Text(
                                '📍 ${state.city1.areaName}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Good Morning',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Center(
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 550,
                                  child: getWeatherIcon(
                                      state.city1.weatherConditionCode!),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "${state.weather.temperature!.celsius!.round()}ºC",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 55,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Center(
                                child: Text(
                                  state.weather.weatherMain!.toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ]),
                      ),
                    ),
                  ]));
            } else {
              return Container();
            }
          },
        ));
  }
}