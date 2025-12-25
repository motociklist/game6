import 'package:flutter/material.dart';
import '../models/drawing_point.dart';
import '../widgets/color_palette.dart';
import '../widgets/stroke_width_slider.dart';
import '../widgets/drawing_canvas.dart';
import '../constants/app_colors.dart';

class PaintScreen extends StatefulWidget {
  const PaintScreen({super.key});

  @override
  State<PaintScreen> createState() => _PaintScreenState();
}

class _PaintScreenState extends State<PaintScreen> {
  final List<DrawingPoint> _points = [];
  Color _selectedColor = Colors.black;
  double _strokeWidth = 3.0;
  final ScrollController _scrollController = ScrollController();

  void _clearCanvas() {
    setState(() {
      _points.clear();
    });
  }

  void _onPointAdded(DrawingPoint point) {
    setState(() {
      _points.add(point);
    });
  }

  void _onDrawingStart() {
    // Можно добавить логику при начале рисования
  }

  void _onDrawingEnd() {
    // Можно добавить логику при окончании рисования
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Paint'),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: _clearCanvas,
            tooltip: 'Очистить',
          ),
        ],
      ),
      body: Column(
        children: [
          ColorPalette(
            colors: AppColors.palette,
            selectedColor: _selectedColor,
            onColorSelected: (color) {
              setState(() {
                _selectedColor = color;
              });
            },
            scrollController: _scrollController,
          ),
          StrokeWidthSlider(
            strokeWidth: _strokeWidth,
            onChanged: (value) {
              setState(() {
                _strokeWidth = value;
              });
            },
          ),
          Expanded(
            child: DrawingCanvas(
              points: _points,
              selectedColor: _selectedColor,
              strokeWidth: _strokeWidth,
              onPointAdded: _onPointAdded,
              onDrawingStart: _onDrawingStart,
              onDrawingEnd: _onDrawingEnd,
            ),
          ),
        ],
      ),
    );
  }
}

