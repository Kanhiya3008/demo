
import 'package:flutter/material.dart';
class degin extends StatefulWidget {
  @override
  _deginState createState() => _deginState();
}

class _deginState extends State<degin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:    Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
              height: 220,
              padding: EdgeInsets.all(10),
              child: Stack(
                children: <Widget>[
                  Positioned(

                    child: Text('Angular JS (Test & Deploy)',
                      style: TextStyle(color: Colors.white,fontSize: 28),
                    ),
                    left: 5,
                  ),
                  Positioned(child: Text('Based On:Topic 1, Topic 2, Topic 3',style: TextStyle(color: Colors.white),),
                    bottom: 0,),
                  Positioned(child: Text('INTERMEDIATE',style: TextStyle(color: Colors.white),),
                    bottom: 0,
                    right: 2,),
                  Positioned(child: Text('Date: 03/12/2020',style: TextStyle(color: Colors.white),),
                    bottom: 25,
                  ),
                  Positioned(child: Text('Brain Mentors Pvt.Ltd.',style: TextStyle(color: Colors.white),),
                    top: 40,
                    left: 5,
                  )
                ],
              ),

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:Colors.blue
              )
          ),
        ),),
    );
  }
}





















































































