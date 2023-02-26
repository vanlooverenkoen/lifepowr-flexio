import 'package:flexio_kvl/model/history/history_consumption.dart';
import 'package:flutter/material.dart';

class PeakConsumptionChart extends StatelessWidget {
  final HistoryConsumption data;

  const PeakConsumptionChart({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => ClipRect(
        child: CustomPaint(
          size: Size(constraints.maxWidth, constraints.maxHeight),
          isComplex: true,
          painter: _PeakConsumptionChartPainter(data),
        ),
      ),
    );
  }
}

class _PeakConsumptionChartPainter extends CustomPainter {
  final yearlyConsumptionPaint = Paint()
    ..color = Colors.purple
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;
  final monthlyConsumptionPaint = Paint()
    ..color = Colors.grey
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;
  final monthlyBackgroundPaint = Paint()
    ..color = Colors.grey.withOpacity(0.2)
    ..style = PaintingStyle.fill;
  final consumptionConsumptionPaint = Paint()
    ..color = Colors.red
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke;
  final legend = Paint()
    ..color = Colors.grey
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke;

  final HistoryConsumption data;

  _PeakConsumptionChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final items = data.data;
    final verticalSpacing = size.width / (items.length - 1);
    final range = data.maxConsumption - data.minConsumption;
    final horizontalSpacing = size.height / range;
    final startY = size.height;

    // Draw monthly consumption
    final monthlyPath = Path();
    final monthlyBackgroundPath = Path();
    var x = 0.0;
    monthlyPath.moveTo(0, startY - items.first.monthlyPeakConsumption * horizontalSpacing);
    for (final item in items) {
      final y = startY - item.monthlyPeakConsumption * horizontalSpacing;
      monthlyPath.lineTo(x, y);
      monthlyBackgroundPath.lineTo(x, y);
      x += verticalSpacing;
    }
    monthlyBackgroundPath.lineTo(size.width, size.height);
    monthlyBackgroundPath.lineTo(0, size.height);
    monthlyBackgroundPath.close();
    canvas.drawPath(monthlyPath, monthlyConsumptionPaint);
    canvas.drawPath(monthlyBackgroundPath, monthlyBackgroundPaint);

    // Draw yearly consumption
    final yearlyPath = Path();
    x = 0.0;
    yearlyPath.moveTo(0, startY - items.first.yearlyPeakConsumption * horizontalSpacing);
    for (final item in items) {
      yearlyPath.lineTo(x, startY - item.yearlyPeakConsumption * horizontalSpacing);
      x += verticalSpacing;
    }
    canvas.drawPath(yearlyPath, yearlyConsumptionPaint);

    // Draw quarterly hour consumption
    x = 0.0;
    for (final item in items) {
      final y = startY - (item.consumption - data.minConsumption) * horizontalSpacing;
      canvas.drawLine(Offset(x, startY), Offset(x, y), consumptionConsumptionPaint);
      x += verticalSpacing;
    }
  }

  @override
  bool shouldRepaint(covariant _PeakConsumptionChartPainter oldDelegate) => data != oldDelegate.data;
}
