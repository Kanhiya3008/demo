import 'package:flutter/material.dart';
import 'package:examapp/dashboard/subject.dart';
class Dash extends StatefulWidget {//92c79f
  @override
  _DashState createState() => _DashState();

}
Map<int, Color> color = {};
MaterialColor mainheading = MaterialColor(0xFFc6e3eb, color);
MaterialColor grid1color = MaterialColor(0xFFe8997d, color);
MaterialColor last1color = MaterialColor(0xFF3b86dc, color);
MaterialColor grid2color = MaterialColor(0xFF92c79f, color);
MaterialColor grid3color = MaterialColor(0xFF9f8bbc, color);
MaterialColor grid4color = MaterialColor(0xFFe17678, color);

class _DashState extends State<Dash> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
            //  children: <Widget>[
              child:
                Column(
                  children: <Widget>[
                  Container(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(icon: (Icon(Icons.clear_all)),  onPressed: (){}),
                        IconButton(icon: (Icon(Icons.search)),  onPressed: (){}),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                     Column(
                      children: <Widget>[
                        Container(
                          //color: Colors.redAccent,
                          height: 100,
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: mainheading),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                  left: 10,
                                  top: 20,
                                  child: CircleAvatar(
                                    child: Icon(Icons.person),
                                    maxRadius: 25,
                                  )
                              ),
                              Positioned(
                                  right: 0,
                                  top: 0,
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                        size: 15,
                                      ),
                                      onPressed: () {})),
                              Positioned(
                                right: 50,
                                top: 3,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: RaisedButton(
                                        onPressed: (){},color: mainheading,
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
                                    ),
                                    Container(
                                      child: RaisedButton(
                                        onPressed: (){},color: mainheading,
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
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                left:80 ,
                                top: 20,
                                child:
                                Text('Kanhiya parmar',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 9),),
                              ),
                              Positioned(
                                left:80 ,
                                top: 40,
                                child:
                                Text('Delhi College of Art',style: TextStyle(fontSize: 9),),
                              ),
                              Positioned(
                                left:80 ,
                                bottom: 30,
                                child:
                                Text('B.Tech (Computer of Science)',style: TextStyle(fontSize: 9),),
                              )
                            ],
                          ),
                        ),
                       // Padding(padding: EdgeInsets.all(5)),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Text('HELLO, ',style: TextStyle(fontSize: 25),),
                                Text('Kanhaiya!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.all(2)),
                                  Expanded(
                                    child: Container(
                                        height: 80,
                                        //width: 180,
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned(child: Text('Exams',
                                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                          bottom: 5,
                                            left: 10,
                                          ),
                                          Positioned(child: Icon(Icons.note,color: Colors.white,),
                                            right: 10,

                                          ),

                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      color: grid1color,
                                      )
                                    ),
                                  ),
                                 // Spacer(),
                                  Padding(padding: EdgeInsets.all(3)),
                                  Expanded(
                                    child: Container(
                                        height: 80,
                                       // width: 180,
                                        child: Stack(
                                          children: <Widget>[
                                            Positioned(child: Text('Discussion',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                              bottom: 5,
                                              left: 10,
                                            ),
                                            Positioned(child: Icon(Icons.chat,color: Colors.white,),
                                              right: 10,

                                            ),

                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: grid2color,
                                        )
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),


                        Padding(padding: EdgeInsets.all(5)),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.all(2)),
                                  Expanded(
                                    child: Container(
                                        height: 80,
                                        //width: 180,
                                        child: Stack(
                                          children: <Widget>[
                                            Positioned(child: Text('Bookmarks',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                              bottom: 5,
                                              left: 10,
                                            ),
                                            Positioned(child: Icon(Icons.bookmark,color: Colors.white,),
                                              right: 10,

                                            ),

                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: grid3color,
                                        )
                                    ),
                                  ),
                                  //Spacer(),
                                  Padding(padding: EdgeInsets.all(3)),
                                  Expanded(
                                    child: Container(
                                        height: 80,

                                        child: Stack(
                                          children: <Widget>[
                                            Positioned(child: Text('Teachers',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                              bottom: 5,
                                              left: 10,
                                            ),
                                            Positioned(child: Icon(Icons.person,color: Colors.white,),
                                              right: 10,

                                            ),

                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: grid4color,
                                        )
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Container(

                          child: Column(
                            children: <Widget>[
                              Text('Recently Assigned Tests',style: TextStyle(fontSize: 25),),
                            ],
                          ),
                        ),
                       // Padding(padding: EdgeInsets.all(5)),
                        Container(//color: Colors.red,
                          height: 250,

                          child: ListView.builder(
                              itemCount: 15,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context,int index){
                                return Column(
                                  children: <Widget>[
                                    SizedBox(//padding: EdgeInsets.all(40),
                                        height: 240,
                                        width: 360,
                                        child: degin()
                                    ),
                                  //  Text('Angular Js (Test & Deploy',
                                     // style: TextStyle(fontSize: 15),)
                                  ],
                                );
                              }),
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        FittedBox(
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: FlatButton(onPressed: (){}, child: Text('Assigned Tests')),
                                ),
                                Container(
                                  child: FlatButton(onPressed: (){}, child: Text('Featured Topic')),
                                ),
                                Container(
                                  child: FlatButton(onPressed: (){}, child: Text('Resources')),
                                ),
                                Container(
                                  child: FlatButton(onPressed: (){}, child: Text('Mock Tests')),
                                ),
                                Container(
                                  child: FlatButton(onPressed: (){}, child: Text('Live Session')),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    ]
                  ),
               // ],
                )
            ),
      ),
    );
  }
}
