//import 'package:flutter/material.dart';
//class degin extends StatefulWidget {
//  @override
//  _deginState createState() => _deginState();
//}
//
//class _deginState extends State<degin> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: SafeArea(
//        child:    Padding(
//          padding: const EdgeInsets.all(15.0),
//          child: Container(
//            height: 200,
//            padding: EdgeInsets.all(20),
//            child: Stack(
//              children: <Widget>[
//                Positioned(
//
//                  child: Text('Angular JS (Test & Deploy)',
//                    style: TextStyle(color: Colors.white,fontSize: 28),
//                  ),
//                  right: 5,
//                ),
//                Positioned(child: Text('Based On:Topic 1, Topic 2, Topic 3',style: TextStyle(color: Colors.white),),
//                  bottom: 0,),
//                Positioned(child: Text('INTERMEDIATE',style: TextStyle(color: Colors.white),),
//                  bottom: 0,
//                  right: 0,),
//                Positioned(child: Text('Date: 03/12/2020',style: TextStyle(color: Colors.white),),
//                  bottom: 25,
//                ),
//                Positioned(child: Text('Brain Mentors Pvt.Ltd.',style: TextStyle(color: Colors.white),),
//                  top: 40,
//                  left: 5,
//                )
//              ],
//            ),
//
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(20),
//              color:Colors.blue
//            )
//      ),
//        ),),
//    );
//  }
//}
  import 'package:flutter/material.dart';
class degindemo extends StatefulWidget {
  @override
  _deginState createState() => _deginState();
}

class _deginState extends State<degindemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(children: <Widget>[
            FittedBox(
              child: Container(
                //height:80,
                color: Colors.red,
                child: Row(
                  children: <Widget>[

                    Container(
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            child: Icon(Icons.person),
                            maxRadius: 30,
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(2)),
                    Column(
                      children: <Widget>[


                        Text('Kanhiya parmar \nDelhi College of Art\nB.Tech (Computer of Science',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 9 ),),
                        //Text('Delhi College of Art',style: TextStyle(fontSize: 9),),
                        // Text('B.Tech (Computer of Science)',style: TextStyle(fontSize: 9),),



                      ],
                    ),
                    Padding(padding: EdgeInsets.all(2)),
                    Column(
                      children: <Widget>[

                        RaisedButton(
                          onPressed: (){},//color:  //mainheading,
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text('25',style: TextStyle(fontWeight: FontWeight.bold ),),
                                  Padding(padding: EdgeInsets.all(2)),
                                  Text('Test Assigned',style: TextStyle(fontSize: 9),)
                                ],
                              ),
                            ],
                          ),
                        ),



                        RaisedButton(
                          onPressed: (){},//color: //mainheading,
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text('40',style: TextStyle(fontWeight: FontWeight.bold ),),
                                  Padding(padding: EdgeInsets.all(8)),
                                  Text('Teammates ',style: TextStyle(fontSize: 9),)
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),

                      Container(
                        child: Align(alignment: Alignment.bottomLeft,
                          child: Text('h'),
                        ),
                      )

//
//                    Align(
//    alignment: Alignment(0.7, -0.5),
//    child: Text(
//    "widget",
//    style: TextStyle(fontSize: 30),
//    ),
//    );
//





                  ],
                ),
              ),
            ),

          ],
          ) ),
    );
  }
}
