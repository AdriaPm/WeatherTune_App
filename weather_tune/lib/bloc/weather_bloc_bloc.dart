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

        emit(WeatherBlocSuccess(weather, weatherlist, city1));
      } catch (e) {
        emit(WeatherBlocFailure());
      }
    });
  }
}

