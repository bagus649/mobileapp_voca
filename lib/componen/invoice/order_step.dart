import 'package:flutter/material.dart';

class OrderTracking extends StatelessWidget {
  final List<OrderStep> orderSteps;

  OrderTracking({required this.orderSteps});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            'Track Order',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          child: ListView.builder(
            itemCount: orderSteps.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildStep(context, orderSteps[index], index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStep(BuildContext context, OrderStep step, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 4),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: step.isCompleted ? Colors.green : Colors.grey,
              ),
              child: Icon(
                step.isCompleted ? Icons.check : Icons.circle,
                color: Colors.white,
                size: 16,
              ),
            ),
            SizedBox(width: 12),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    step.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (index < orderSteps.length - 1)
          Container(
            margin: EdgeInsets.only(left: 10, bottom: 8),
            child: CustomPaint(
              painter: DashedLinePainter(),
              size: Size(6, 24),
            ),
          ),
      ],
    );
  }
}

class OrderStep {
  final String title;
  final String description;
  final bool isCompleted;

  OrderStep({
    required this.title,
    required this.description,
    this.isCompleted = false,
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
