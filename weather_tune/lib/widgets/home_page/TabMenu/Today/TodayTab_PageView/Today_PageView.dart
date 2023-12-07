import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_tune/bloc/weather_bloc_bloc.dart';
import 'package:weather_tune/widgets/home_page/TabMenu/Today/TodayTab_Info/pageview_sun.dart';
import 'package:weather_tune/widgets/home_page/TabMenu/Today/TodayTab_Info/pageview_temp.dart';

class TodayView extends StatefulWidget {
  const TodayView({super.key});

  @override
  State<TodayView> createState() => _TodayViewState();
}

class _TodayViewState extends State<TodayView> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
      builder: (context, state) {
        if (state is WeatherBlocSuccess) {
          return Stack(
            children: [
              PageView(
                controller: _controller,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                scrollDirection: Axis.horizontal,
                children: [
                  SunInfo(
                      apiinputrise: state.weather.sunrise!,
                      captionrise: "Sunrise",
                      imagePathrise: "images/weather_icons/6.png",
                      apiinputset: state.weather.sunset!,
                      captionset: "Sunset",
                      imagePathset: "images/weather_icons/12.png"),
                  TempInfo(
                      apiinputmax: state.weather.tempMax!.celsius!.round(),
                      captionrise: "High",
                      imagePathrise: "images/weather_icons/13.png",
                      apiinputmin: state.weather.tempMin!.celsius!.round(),
                      captionset: "Low",
                      imagePathset: "images/weather_icons/14.png")
                ],
              ),
              Positioned(
                bottom: 10.0,
                left: 0,
                right: 0,
                child: Center(
                    child: DotsIndicator(
                  dotsCount: 2, // Number of pages
                  position: _currentPage.toDouble(),
                  decorator: const DotsDecorator(
                    color: Colors.grey,
                    activeColor: Colors.purple,
                  ),
                )),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
