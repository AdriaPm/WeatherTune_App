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
              LocationData(
                  '${state.city2.areaName}',
                  state.city2.weatherConditionCode!,
                  '${state.city2.temperature!.celsius!.round()}ºC'),
              LocationData(
                  '${state.city3.areaName}',
                  state.city3.weatherConditionCode!,
                  '${state.city3.temperature!.celsius!.round()}ºC'),
              LocationData(
                  '${state.city4.areaName}',
                  state.city4.weatherConditionCode!,
                  '${state.city4.temperature!.celsius!.round()}ºC'),
              LocationData(
                  '${state.city5.areaName}',
                  state.city5.weatherConditionCode!,
                  '${state.city5.temperature!.celsius!.round()}ºC'),
              LocationData(
                  '${state.city6.areaName}',
                  state.city6.weatherConditionCode!,
                  '${state.city6.temperature!.celsius!.round()}ºC'),
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
