import 'package:flutter/material.dart';
import '../models/drawing_point.dart';

class DrawingPainter extends CustomPainter {
  final List<DrawingPoint> points;

  DrawingPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    // Рисуем белый фон
    final backgroundPaint = Paint()..color = Colors.white;
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    if (points.isEmpty) {
      return;
    }

    // Фильтруем только валидные точки
    final validPoints = <DrawingPoint>[];
    for (final point in points) {
      if (point.point != null) {
        validPoints.add(point);
      }
    }

    if (validPoints.isEmpty) {
      return;
    }

    // Рисуем линии между соседними валидными точками
    // Но только если они находятся в одной непрерывной линии (без null между ними)
    for (int i = 0; i < points.length - 1; i++) {
      final currentPoint = points[i];
      final nextPoint = points[i + 1];

      // Пропускаем, если текущая точка null (конец линии)
      if (currentPoint.point == null) {
        continue;
      }

      // Пропускаем, если следующая точка null (конец линии) - не рисуем линию к null
      if (nextPoint.point == null) {
        continue;
      }

      // Рисуем линию только между двумя валидными точками
      final paint = Paint()
        ..color = currentPoint.color
        ..strokeWidth = currentPoint.width
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..isAntiAlias = true;

      canvas.drawLine(
        currentPoint.point!,
        nextPoint.point!,
        paint,
      );
    }

    // Рисуем круги для каждой точки для лучшей видимости
    for (final point in validPoints) {
      final paint = Paint()
        ..color = point.color
        ..style = PaintingStyle.fill
        ..isAntiAlias = true;

      canvas.drawCircle(
        point.point!,
        point.width / 2,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) {
    // Всегда перерисовываем, если количество точек изменилось
    if (oldDelegate.points.length != points.length) {
      return true;
    }
    // Также перерисовываем, если это разные списки
    return oldDelegate.points != points;
  }
}

