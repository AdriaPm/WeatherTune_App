import 'package:flutter/material.dart';

class ExpandableBottomSheet extends StatefulWidget {
  const ExpandableBottomSheet({super.key});

  @override
  _ExpandableBottomSheetState createState() => _ExpandableBottomSheetState();
}

class _ExpandableBottomSheetState extends State<ExpandableBottomSheet> {
  bool _isExpanded = false;

  void _expandBottomSheet() {
    setState(() {
      _isExpanded = true;
    });
  }

  void _collapseBottomSheet() {
    setState(() {
      _isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        // Expand the bottom sheet if dragged up
        if (details.primaryDelta! < -10) {
          _expandBottomSheet();
        }
      },
      onVerticalDragEnd: (details) {
        // Collapse the bottom sheet if dragging ends
        _collapseBottomSheet();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: _isExpanded ? MediaQuery.of(context).size.height : 80.0,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        child: Center(
          child: Text('Drag me up for more info!'),
        ),
      ),
    );
  }
}
