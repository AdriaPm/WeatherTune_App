import 'package:flutter/material.dart';
import 'package:weather_tune/components/hourly_weekly.dart';
import 'package:weather_tune/pages/details_page.dart';

class BottomSheetContainer extends StatefulWidget {
  @override
  _BottomSheetContainerState createState() => _BottomSheetContainerState();
}

class _BottomSheetContainerState extends State<BottomSheetContainer> {
  bool _isExpanded = false;

  void _toggleBottomSheet() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (!_isExpanded && details.primaryDelta! < -6) {
          _toggleBottomSheet();
        } else if (_isExpanded && details.primaryDelta! > 6) {
          _toggleBottomSheet();
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: _isExpanded ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
        ),
        child: _isExpanded ? FullScreenContent() : QuarterScreenContent(),
      ),
    );
  }
}

class FullScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DetailsPage(),
    );
  }
}

class QuarterScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ForecastTabs();
  }
}