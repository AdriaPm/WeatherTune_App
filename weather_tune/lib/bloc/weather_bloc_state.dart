part of 'weather_bloc_bloc.dart';

@immutable
sealed class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

final class WeatherBlocInitial extends WeatherBlocState {}

final class WeatherBlocLoading extends WeatherBlocState {}

final class WeatherBlocFailure extends WeatherBlocState {}

final class WeatherBlocSuccess extends WeatherBlocState {
  final Weather weather;

  final Weather city1;
  final Weather city2;
  final Weather city3;
  final Weather city4;
  final Weather city5;
  final Weather city6;

  final List<Weather> weatherlist;

  const WeatherBlocSuccess(this.weather, this.weatherlist, this.city1,
      this.city2, this.city3, this.city4, this.city5, this.city6);

  @override
  List<Object> get props => [weather];
}
