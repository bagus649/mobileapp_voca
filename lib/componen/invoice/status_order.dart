import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HorizontalOrderTracking extends StatelessWidget {
  final List<OrderStepItem> orderStatus;

  HorizontalOrderTracking({required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: orderStatus.length,
        itemBuilder: (context, index) {
          return _buildStep(
              orderStatus[index], index == orderStatus.length - 1);
        },
      ),
    );
  }

  Widget _buildStep(OrderStepItem step, bool isLastStep) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 14),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: step.isCompleted ? Colors.green : Colors.grey,
          ),
          child: step.isCompleted
              ? Icon(
                  Icons.check,
                  // color: Colors.white,
                  size: 20,
                )
              : SvgPicture.asset(
                  step.svgAsset!,
                  width: 80,
                  height: 80,
                ),
        ),
        if (!isLastStep)
          CustomPaint(
            painter: DashedLinePainter(),
            size: Size(40, 2),
          ),
      ],
    );
  }
}

class OrderStepItem {
  final String? svgAsset;
  final bool isCompleted;

  OrderStepItem({
    this.svgAsset,
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

    const double dashWidth = 5.0;
    const double dashSpace = 5.0;

    double startX = 0.0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );

      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldPainter) {
    return false;
  }
}
