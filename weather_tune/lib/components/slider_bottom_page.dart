import 'package:flutter/material.dart';
import 'package:weather_tune/components/hourly_weekly.dart';
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
        if (!_isExpanded && details.primaryDelta! < -6) {
          _toggleBottomSheet();
        } else if (_isExpanded && details.primaryDelta! > 6) {
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
    return ForecastTabs();
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height); // Start at the bottom-left corner

    // Define the rounded top-left corner
    path.lineTo(0, 40); // Move to the top-left corner
    path.arcToPoint(
      const Offset(40, 0),
      radius: const Radius.circular(40),
      clockwise: false,
    );

    // Define the rounded top-right corner
    path.lineTo(size.width - 40, 0); // Move to the top-right corner
    path.arcToPoint(
      Offset(size.width, 40),
      radius: const Radius.circular(40),
      clockwise: false,
    );

    path.lineTo(size.width, size.height); // Line to the bottom-right corner
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
