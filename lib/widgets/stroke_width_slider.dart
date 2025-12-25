import 'package:flutter/material.dart';

class StrokeWidthSlider extends StatelessWidget {
  final double strokeWidth;
  final ValueChanged<double> onChanged;

  const StrokeWidthSlider({
    super.key,
    required this.strokeWidth,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: isMobile ? 10 : 0,
      ),
      child: Row(
        children: [
          Text(
            'Толщина: ',
            style: TextStyle(
              fontSize: isMobile ? 16 : 14,
            ),
          ),
          Expanded(
            child: Slider(
              value: strokeWidth,
              min: 1,
              max: 20,
              divisions: 19,
              label: strokeWidth.round().toString(),
              onChanged: onChanged,
            ),
          ),
          SizedBox(
            width: isMobile ? 40 : 30,
            child: Text(
              '${strokeWidth.round()}',
              style: TextStyle(
                fontSize: isMobile ? 16 : 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

