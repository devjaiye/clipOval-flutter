import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';


class ImageCarousel extends StatefulWidget {
  _ImageCarouselState createState() => new _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 18.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    Widget carousel =  SizedBox(
      height: 350.0,
      width: 350.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          ExactAssetImage('asset/boy.jpg'),
         NetworkImage("https://cdn.pixabay.com/photo/2020/04/14/11/21/fox-5042242_960_720.jpg"),
          NetworkImage("https://cdn.pixabay.com/photo/2020/08/08/20/41/seagulls-5473897_960_720.jpg"),
          NetworkImage("https://cdn.pixabay.com/photo/2020/04/21/06/41/bulldog-5071407_960_720.jpg"),

        ],
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(seconds: 1),
      ),
    );

    Widget banner = Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0)),
          color: Colors.amber.withOpacity(0.5),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'Beauty is here!',
          style: TextStyle(
            fontSize: animation.value,//18.0,
            //color: Colors.white,
          ),
        ),
      ),
      // ),
      //  ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          height: screenHeight /2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Stack(
              children: [
                carousel,
                banner,
              ],
            ),
          ),
        ),
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}