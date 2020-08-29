import 'package:clip_oval_flutter/screens/image_slider.dart';
import 'package:clip_oval_flutter/screens/screen_one.dart';
import 'package:clip_oval_flutter/bankui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ImageCarousel()
      ));

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 56, 70, 0.6),
      body: Center(
          child: SizedBox.fromSize(
            size: Size(120.0, 120.0),
            child: ClipOval(
              child: Material(
               color: Color.fromRGBO(50, 56, 75, 1.0),
                elevation: 0.8,
                child: InkWell(
                  splashColor: Colors.deepOrange,
                  onTap: (){},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite, color: Colors.white,
                      size: 60.0,),
                    ],
                  ),
                ),
              )
            ),
          ),
      ),
    );
  }
}

