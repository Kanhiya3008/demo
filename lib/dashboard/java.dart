import 'package:flutter/material.dart';
import 'package:examapp/dashboard/javaquestion.dart';

class Java extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
          // Column(
          //children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3,
                //width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    color: Color(0xFFe8997d)),
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_left,
                      color: Colors.white,
                      size: 50,
                    ),
                    // onPressed: () {
                    //  Navigator.of(context).pop();
                    // },
                  ),
                ),
              ),
              Positioned(
                  top: 21,
                  right: 22,
                  child: Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  )),
              Positioned(
                  top: 21,
                  right: 50,
                  child: Icon(
                    Icons.redo,
                    color: Colors.white,
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.height / 4.5,
                  left:  30,
                  child: Text(
                    'TypeScript (Learn to Code)',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.height / 3.7,
                  left:  30,
                  child: Text(
                    'Google',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
          //   ],
          //),
          // ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                FittedBox(
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                'About',
                                style: TextStyle(fontSize: 25),
                              )),
                        ),
                        Container(
                          child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                'Topic Covered',
                                style: TextStyle(fontSize: 25),
                              )),
                        ),
                        Container(
                          child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                'Resource Material',
                                style: TextStyle(fontSize: 25),
                              )),
                        ),
                        Container(
                          child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                'Friend Attempting',
                                style: TextStyle(fontSize: 25),
                              )),
                        ),
                        Container(
                          child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                'T & C',
                                style: TextStyle(fontSize: 25),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.access_time),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text(
                      'Monday,20 April 2019',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                Container(
                  // color: Colors.orange,
                  padding: EdgeInsets.only(left: 35),
                  child: Row(
                    children: <Widget>[
                      Text('03:00 PM to 05:00 PM'),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  children: <Widget>[
                    Icon(Icons.access_time),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text(
                      'Description',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                // padding: EdgeInsets.only(left: 35),

                Padding(
                  padding: EdgeInsets.only(
                    left: 35.0,
                  ),
                  child: Text(
                    'This exam consist of questions regarding to '
                    'Typeescript.it is a basic exam that will help you learn how to get start coding'
                    'This exam consist of questions regarding to '
                    'Typeescript.it is a basic exam that will help you learn how to get start coding',
                    style: TextStyle(
                      //fontFamily: 'Montserrat',
                      fontSize: 12.0,
                    ),
                  ),
                ),
//                Container(
//                  padding: EdgeInsets.only(left: 35),
//                  child: Row(
//                    children: <Widget>[
//                      Text('This exam consist of questions regarding to Typeescript.\'it is a basic exam that will help you')
//                    ],),
//                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  children: <Widget>[
                    Icon(Icons.tag_faces),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text(
                      'Tags',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 35.0,
                  ),
                  child: FittedBox(
                    child: Row(
                      children: <Widget>[
                        OutlineButton(
                          color: Colors.white,
                          onPressed: () {},
                          child: Text('typescript'),
                        ),
                        Padding(padding: EdgeInsets.only(left: 15)),
                        OutlineButton(
                          color: Colors.white,
                          onPressed: () {},
                          child: Text('typescript'),
                        ),
                        Padding(padding: EdgeInsets.only(left: 15)),
                        OutlineButton(
                          color: Colors.white,
                          onPressed: () {},
                          child: Text('typescript'),
                        ),
                        Padding(padding: EdgeInsets.only(left: 15)),
                        OutlineButton(
                          color: Colors.white,
                          onPressed: () {},
                          child: Text('typescript'),
                        ),
                        Padding(padding: EdgeInsets.only(left: 15)),
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  children: <Widget>[
                    Icon(Icons.help),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text(
                      'Yours score',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 35),
                  child: Row(
                    children: <Widget>[Text('NOT YET APPEARED FOR EXAM')],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 25)),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => javaquestion()));
                  },
                  child: Text(
                    'ATTEMP EXAM',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
