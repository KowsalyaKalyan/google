import 'package:flutter/material.dart';

class Choose extends StatefulWidget {
  Choose({Key key}) : super(key: key);

  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  @override
  Widget build(BuildContext context) {
    const curveHeight = 10.0;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent[400],
          title: Text(""),
          shape: const MyShapeBorder(curveHeight),
        ),
        body: ListView(
          children: [
            Card(
              child: Row(
                children: [
                  Image.network(
                      "https://www.image.edu.in/images/course-banner/higher-diploma-in-3d-animation-course.jpg",
                      height: 150,
                      width: 200),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          '3D Animation',
                          style: TextStyle(
                              color: Colors.pinkAccent[700],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      RaisedButton(
                        color: Colors.pinkAccent[400],
                        onPressed: () {},
                        child: Text(
                          'Choose',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            //2nd card
            Card(
              child: Row(
                children: [
                  Image.network(
                    "https://www.image.edu.in/images/course-li-2.jpg",
                    height: 100,
                    width: 100,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          '3D Animation',
                          style: TextStyle(
                              color: Colors.pinkAccent[700],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      RaisedButton(
                        color: Colors.pinkAccent[400],
                        onPressed: () {},
                        child: Text(
                          'Choose',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            //3rd card
            Card(
              child: Row(
                children: [
                  Image.network(
                      "https://www.image.edu.in/images/course-banner/higher-diploma-in-3d-animation-course.jpg",
                      height: 150,
                      width: 200),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          '3D Animation',
                          style: TextStyle(
                              color: Colors.pinkAccent[700],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      RaisedButton(
                        color: Colors.pinkAccent[400],
                        onPressed: () {},
                        child: Text(
                          'Choose',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            //4th card

            Card(
              child: Row(
                children: [
                  Image.network(
                      "https://www.image.edu.in/images/course-banner/higher-diploma-in-3d-animation-course.jpg",
                      height: 150,
                      width: 200),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          '3D Animation',
                          style: TextStyle(
                              color: Colors.pinkAccent[700],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      RaisedButton(
                        color: Colors.pinkAccent[400],
                        onPressed: () {},
                        child: Text(
                          'Choose',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyShapeBorder extends ContinuousRectangleBorder {
  const MyShapeBorder(this.curveHeight);
  final double curveHeight;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) => Path()
    ..lineTo(0, rect.size.height)
    ..quadraticBezierTo(
      rect.size.width / 2,
      rect.size.height + curveHeight * 2,
      rect.size.width,
      rect.size.height,
    )
    ..lineTo(rect.size.width, 0)
    ..close();
}
