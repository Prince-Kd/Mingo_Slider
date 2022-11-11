import 'package:flutter/material.dart';

class MingoSlider extends StatefulWidget {
  const MingoSlider({Key? key}) : super(key: key);

  @override
  State<MingoSlider> createState() => _MingoSliderState();
}

class _MingoSliderState extends State<MingoSlider> {
  double progress = 0.0;
  double pointerLeft = 0;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width - 40;
    double point0 = 0;
    double point1 = width * 0.25;
    double point2 = width * 0.50;
    double point3 = width * 0.75;
    double point4 = width - 4;
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                value: progress,
                minHeight: 10,
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: pointerLeft,
            child: GestureDetector(
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  if (details.globalPosition.dx > 20 &&
                      details.globalPosition.dx < width) {
                    pointerLeft = details.globalPosition.dx;
                    progress = details.globalPosition.dx / width;
                  }
                  // if (details.localPosition.dx > point1 / 2) {
                  //   pointerLeft = point1;
                  //   print("delta: ${details.primaryDelta}");
                  // }
                  debugPrint("${details.globalPosition.dx}");
                  debugPrint("${MediaQuery.of(context).size.width - 40}");
                });
              },
              onHorizontalDragEnd: (DragEndDetails details) {
                setState(() {
                  if (pointerLeft > (point1 / 2) && pointerLeft < point1) {
                    pointerLeft = point1 - 10;
                    progress = point1 / width;
                  } else if (pointerLeft > point0 &&
                      pointerLeft < (point1 / 2)) {
                    pointerLeft = point0;
                    progress = point0 / width;
                  }

                  if (pointerLeft > (point1 + point1 / 2) &&
                      pointerLeft < point2) {
                    pointerLeft = point2 - 10;
                    progress = point2 / width;
                  } else if (pointerLeft > point1 &&
                      pointerLeft < (point1 + point1 / 2)) {
                    pointerLeft = point1 - 10;
                    progress = point1 / width;
                  }
                  if (pointerLeft > (point2 + point1 / 2) &&
                      pointerLeft < point3) {
                    pointerLeft = point3 - 10;
                    progress = point3 / width;
                  } else if (pointerLeft > point2 &&
                      pointerLeft < (point2 + point1 / 2)) {
                    pointerLeft = point2 - 10;
                    progress = point2 / width;
                  }
                  if (pointerLeft > (point3 + point1 / 2) &&
                      pointerLeft < point4) {
                    pointerLeft = point4 - 15;
                    progress = point4 / width;
                  } else if (pointerLeft > point3 &&
                      pointerLeft < (point3 + point1 / 2)) {
                    pointerLeft = point3 - 10;
                    progress = point3 / width;
                  }
                  //pointerLeft = 351;
                  print("ended: $pointerLeft");
                });
              },
              onHorizontalDragStart: (DragStartDetails details) {
                setState(() {
                  pointerLeft + details.localPosition.dx;
                  debugPrint("start: ${details.localPosition.dx}");
                });
              },
              child: Container(
                height: 40,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Positioned(
            left: point0,
            bottom: 0,
            child: Container(
              height: 12,
              width: 2,
              color: Colors.white,
            ),
          ),
          Positioned(
            left: point1,
            bottom: 0,
            child: Container(
              height: 12,
              width: 2,
              color: Colors.white,
            ),
          ),
          Positioned(
            left: point2,
            bottom: 0,
            child: Container(
              height: 12,
              width: 2,
              color: Colors.white,
            ),
          ),
          Positioned(
            left: point3,
            bottom: 0,
            child: Container(
              height: 12,
              width: 2,
              color: Colors.white,
            ),
          ),
          Positioned(
            left: point4,
            bottom: 0,
            child: Container(
              height: 12,
              width: 2,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
