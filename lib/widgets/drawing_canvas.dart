import 'package:flutter/material.dart';
import '../models/drawing_point.dart';
import 'drawing_painter.dart';

class DrawingCanvas extends StatefulWidget {
  final List<DrawingPoint> points;
  final Color selectedColor;
  final double strokeWidth;
  final ValueChanged<DrawingPoint> onPointAdded;
  final VoidCallback onDrawingStart;
  final VoidCallback onDrawingEnd;

  const DrawingCanvas({
    super.key,
    required this.points,
    required this.selectedColor,
    required this.strokeWidth,
    required this.onPointAdded,
    required this.onDrawingStart,
    required this.onDrawingEnd,
  });

  @override
  State<DrawingCanvas> createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  Offset? _cursorPosition;
  bool _isDrawing = false;

  void _handlePointerDown(PointerDownEvent event) {
    setState(() {
      _isDrawing = true;
      _cursorPosition = event.localPosition;
      widget.onDrawingStart();
    });
    widget.onPointAdded(DrawingPoint(
      point: event.localPosition,
      color: widget.selectedColor,
      width: widget.strokeWidth,
    ));
  }

  void _handlePointerMove(PointerMoveEvent event) {
    setState(() {
      _cursorPosition = event.localPosition;
      if (_isDrawing) {
        widget.onPointAdded(DrawingPoint(
          point: event.localPosition,
          color: widget.selectedColor,
          width: widget.strokeWidth,
        ));
      }
    });
  }

  void _handlePointerUp(PointerUpEvent event) {
    setState(() {
      _isDrawing = false;
      widget.onDrawingEnd();
    });
    // Добавляем маркер конца линии
    widget.onPointAdded(DrawingPoint(
      point: null,
      color: widget.selectedColor,
      width: widget.strokeWidth,
    ));
  }

  void _handlePointerCancel(PointerCancelEvent event) {
    setState(() {
      _isDrawing = false;
      widget.onDrawingEnd();
    });
    // Добавляем маркер конца линии
    widget.onPointAdded(DrawingPoint(
      point: null,
      color: widget.selectedColor,
      width: widget.strokeWidth,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerDown: _handlePointerDown,
      onPointerMove: _handlePointerMove,
      onPointerUp: _handlePointerUp,
      onPointerCancel: _handlePointerCancel,
      child: MouseRegion(
        onHover: (event) {
          if (!_isDrawing) {
            setState(() {
              _cursorPosition = event.localPosition;
            });
          }
        },
        onExit: (event) {
          if (!_isDrawing) {
            setState(() {
              _cursorPosition = null;
            });
          }
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: DrawingPainter(points: widget.points),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            if (_cursorPosition != null && _isDrawing)
              _PencilIndicator(
                position: _cursorPosition!,
                color: widget.selectedColor,
                size: widget.strokeWidth,
              ),
          ],
        ),
      ),
    );
  }
}

class _PencilIndicator extends StatelessWidget {
  final Offset position;
  final Color color;
  final double size;

  const _PencilIndicator({
    required this.position,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Positioned(
      left: position.dx - size / 2,
      top: position.dy - size / 2,
      child: IgnorePointer(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color.withOpacity(0.6),
            shape: BoxShape.circle,
            border: Border.all(
              color: color,
              width: isMobile ? 3 : 2,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

