import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_tune/bloc/weather_bloc_bloc.dart';
import 'package:weather_tune/models/favorite_page/location_data.dart';
import 'package:weather_tune/widgets/favorites_page/location_box.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourite Locations',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.grey.shade900,
        foregroundColor: const Color.fromARGB(207, 255, 255, 255),
        toolbarHeight: 50,
      ),
      body: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
        builder: (context, state) {
          if (state is WeatherBlocSuccess) {
            final List<LocationData> locations = [
              LocationData(
                  '${state.city1.areaName}',
                  state.city1.weatherConditionCode!,
                  '${state.city1.temperature!.celsius!.round()}ºC'),
              // LocationData('London', 'cloudy', '13°C'),
              // LocationData('Tokyo', 'rainy', '20°C'),
              // LocationData('Paris', 'snowy', '-2°C'),
              // LocationData('Sydney', 'foggy', '22°C'),
              // LocationData('Berlin', 'stormy', '15°C'),
              // Add more locations as needed
            ];
            return Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/favorites_bkg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: ListView.builder(
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 5.0),
                        child: LocationBox(
                          location: locations[index].location,
                          weatherCondition: locations[index].weatherCondition,
                          temperature: locations[index].temperature,
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
