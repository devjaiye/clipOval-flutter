import 'package:clip_oval_flutter/screens/image_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


    class ScreenOne extends StatefulWidget {
      @override
      _ScreenOneState createState() => _ScreenOneState();
    }

    class _ScreenOneState extends State<ScreenOne> {

      Widget myContainer = ImageCarousel();

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 250.0,
                    color: Colors.red,
                  ),
                  Positioned(
                      bottom: 150,
                      left: -40,
                      child: Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),
                            color: Colors.grey.withOpacity(1.0)),
                      )),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Categories", style: TextStyle(fontSize: 20.0),),
              ),
              myLayout(),
              SizedBox(height: 25, ),

            ],
          ),
        );
      }

      Widget myLayout() {
        return GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          primary: false,
          childAspectRatio: (MediaQuery.of(context).size.width - 60 / 2) / 280,
          children: [
            createTile(0, _selectedIndex, false, 'Profile', Colors.purple, Icons.person),
            createTile(1, _selectedIndex, true, 'Activity', Colors.indigo, Icons.local_activity),
            createTile(2, _selectedIndex, false, 'Statement', Colors.brown, Icons.print),
          ],
        );
      }
      int _selectedIndex = -1;
      Widget createTile(int index, int _selectedIndex, bool isEven, String title, Color color, IconData icon){
            return Padding(
              padding: EdgeInsets.all(10),
                  child:  Container(
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Material(
                  elevation: 4.0,
                  color: _selectedIndex==index?Colors.orange:Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(icon,color: _selectedIndex==index?Colors.white:color,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget> [
                            Text(title,
                            style: TextStyle(
                              color: _selectedIndex==index?Colors.white:Colors.black,
                            fontSize: 14,
                            ),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),)
            );
      }
    }

