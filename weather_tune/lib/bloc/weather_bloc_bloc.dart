import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';
import 'package:weather_tune/data/data.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

        List<Weather> weatherlist = await wf.fiveDayForecastByLocation(
            event.position.latitude, event.position.longitude);

        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);

        Weather city1 = await wf.currentWeatherByCityName("Paris");
        Weather city2 = await wf.currentWeatherByCityName("New York");
        Weather city3 = await wf.currentWeatherByCityName("London");
        Weather city4 = await wf.currentWeatherByCityName("Tokio");
        Weather city5 = await wf.currentWeatherByCityName("Sydney");
        Weather city6 = await wf.currentWeatherByCityName("Berlin");
        // Add more locations as needed

        emit(WeatherBlocSuccess(
            weather, weatherlist, city1, city2, city3, city4, city5, city6));
      } catch (e) {
        emit(WeatherBlocFailure());
      }
    });
  }
}
