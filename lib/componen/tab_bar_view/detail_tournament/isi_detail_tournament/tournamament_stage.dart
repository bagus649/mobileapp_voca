import 'package:flutter/material.dart';

class OrderStep {
  final String description;

  final String iconImagePath;

  OrderStep({
    required this.description,
    required this.iconImagePath,
  });
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color(0xffE0E0E0)
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    const double dashHeight = 5.0;
    const double dashSpace = 5.0;

    double startY = 1.0;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashHeight),
        paint,
      );

      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldPainter) {
    return true;
  }
}

class TrackOrderWidget extends StatelessWidget {
  final List<OrderStep> orderSteps;

  TrackOrderWidget({required this.orderSteps});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int index = 0; index < orderSteps.length; index++)
          _buildStep(context, orderSteps[index], index),
      ],
    );
  }

  Widget _buildStep(BuildContext context, OrderStep step, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 4),
              width: 32,
              height: 32,
              child: Image.asset(
                step.iconImagePath,
              ),
            ),
            SizedBox(width: 12),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      step.description,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (index < orderSteps.length - 1)
          Container(
            margin: EdgeInsets.only(
              left: 16,
            ),
            child: CustomPaint(
              painter: DashedLinePainter(),
              size: Size(6, 24),
            ),
          ),
      ],
    );
  }
}
