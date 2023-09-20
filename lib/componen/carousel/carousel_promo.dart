import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile/componen/carousel/card_promo.dart';

class CarouselPromo extends StatefulWidget {
  @override
  _CarouselPromoState createState() => _CarouselPromoState();
}

class _CarouselPromoState extends State<CarouselPromo>
    with SingleTickerProviderStateMixin {
  DateTime _endTime =
      DateTime.now().add(Duration(hours: 24, minutes: 00, seconds: 00));

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TsClip2(),
      child: Container(
        padding: EdgeInsets.only(left: 1.6, top: 12),
        color: Color.fromRGBO(14, 81, 68, 1),
        height: 340,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Penawaran Terbatas',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  CountdownWidget(
                    endTime: _endTime,
                    textColor: Color.fromARGB(255, 255, 162, 0),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              width: double.infinity,
              height: 216,
              child: Promo(),
            )
          ],
        ),
      ),
    );
  }
}

class CountdownWidget extends StatefulWidget {
  final DateTime endTime;
  final Color textColor;

  CountdownWidget({required this.endTime, required this.textColor});

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  late Duration _timeLeft;
  bool isTimerEnding = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timeLeft = widget.endTime.difference(DateTime.now());
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timeLeft = widget.endTime.difference(DateTime.now());

        if (_timeLeft.inMinutes <= 10) {
          isTimerEnding = true;
        } else {
          isTimerEnding = false;
        }
      });

      if (_timeLeft.isNegative) {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hours = _timeLeft.inHours;
    final minutes = _timeLeft.inMinutes.remainder(60);
    final seconds = _timeLeft.inSeconds.remainder(60);

    return Text(
      '${hours.toString().padLeft(2, '0')}h:${minutes.toString().padLeft(2, '0')}m:${seconds.toString().padLeft(2, '0')}s',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: isTimerEnding ? Colors.red : widget.textColor,
      ),
    );
  }
}

class TsClip2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
