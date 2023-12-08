// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:weather_tune/widgets/home_page/TabMenu/tabview_pageviewer.dart';
import 'package:weather_tune/pages/details_page.dart';

class BottomSheetContainer extends StatefulWidget {
  const BottomSheetContainer({super.key});

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
        if (!_isExpanded && details.primaryDelta! < -2) {
          _toggleBottomSheet();
        } else if (_isExpanded && details.primaryDelta! > 2) {
          _toggleBottomSheet();
        }
      },
      child: AnimatedContainer(
        decoration: const BoxDecoration(
          color: Color.fromARGB(178, 0, 0, 0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        duration: const Duration(milliseconds: 300),
        height: _isExpanded
            ? MediaQuery.of(context).size.height
            : MediaQuery.of(context).size.height * 0.25,
        width: _isExpanded
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width,
        child: _isExpanded
            ? const FullScreenContent()
            : const QuarterScreenContent(),
      ),
    );
  }
}

class FullScreenContent extends StatelessWidget {
  const FullScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: DetailsPage());
  }
}

class QuarterScreenContent extends StatelessWidget {
  const QuarterScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const ForecastTabs();
  }
}
