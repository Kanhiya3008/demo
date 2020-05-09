import 'package:examapp/dashboard/jsondata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as json;
import 'dart:convert';






class javaquestion extends StatefulWidget {
  @override
  _javaquestionState createState() => _javaquestionState();
}
class _javaquestionState extends State<javaquestion> {

  int questionCount = 0;
  String dName, dEmail, dPhone, dCity, question, dZip, dCompany, dSuite;
  List<User> listModel = [];
  var loading = false;

  void initState() {
    // TODO: implement initState
    super.initState();
    Future future = getAllQuestions();
    future.then((data) {
      print("Data is $data");
    }).catchError((err) {
      print("Error is $err");
    });
    getData();
    createSeatLayoutArray();
    // updateUIData();
  }

  createSeatLayoutArray() {
    List<List> mainArray = [[]];

    for (var i = 0; i < 5; i++) {
      List<String> local = [];
      for (var l = 0; l < 10; l++) {
        local.add((l + 1).toString());
      }
      mainArray.add(local);
    }

    print(mainArray);
  }

  Future<Null> getData() async {
    setState(() {
      loading = true;
    });

    final responseData =
        await http.get("https://jsonplaceholder.typicode.com/users");
    if (responseData.statusCode == 200) {
      final data = jsonDecode(responseData.body);
      print(data);
      setState(() {
        for (Map i in data) {
          listModel.add(User.fromJson(i));
        }
        updateUIData();
        loading = false;
      });
    }
  }

  updateUIData() {
    if (questionCount < listModel.length) {
      setState(() {
        final nDataList = listModel[questionCount];
        dName = nDataList.name;
        dEmail = nDataList.email;
        dPhone = nDataList.phone;
        dCity = nDataList.address.city;
        dZip = nDataList.address.zipcode;
        dCompany = nDataList.company.name;
        dSuite = nDataList.address.suite;

        questionCount += 1;
      });
    }
  }

  backUIData() {
    if (questionCount != listModel.length) {
      setState(() {
        final nDataList = listModel[questionCount];
        dName = nDataList.name;
        dEmail = nDataList.email;
        dPhone = nDataList.phone;
        dCity = nDataList.address.city;
        dZip = nDataList.address.zipcode;
        dCompany = nDataList.company.name;
        dSuite = nDataList.address.suite;

        questionCount -= 1;
      });
    }
  }






  String name = "";
  String ans = "";
  getAllQuestions() async {
    var result = null;

    const url =
        'https://raw.githubusercontent.com/amitsrivastava4all/flutterjan/master/question.json';
    //'https://www.classmarker.com/online-test/start/?quiz=yba59c342adc8815';
    try {
      result = await http.get(url);
      //print(result.body.runtimeType);
      var object = json.jsonDecode(result.body);
      setState(() {
        name = object['questions'][0]["name"];
        for (int i = 0; i < object['questions'][0]["options"].length; i++) {
          ans = ans + " " + object['questions'][0]["options"][i]["name"];
        }
        // ans = object['questions'][0]["options"][0]["name"];
      });
      //print("Result is ${result['questions']}");
    } catch (err) {
      print("Error is $err");
    }
    return result;
  }












  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  color: Color(0xFFed9f3f)),
              child: Stack(
                children: <Widget>[
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
                      bottom: MediaQuery.of(context).size.height / 30,
                      right: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        'Question No.$questionCount ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )),
                  Positioned(
                      bottom: MediaQuery.of(context).size.height / 25,
                      left: MediaQuery.of(context).size.width / 1.5,
                      child: Text(
                        '26.15 (TIME LEFT)',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            ),





//            Container(
//              child: Card(
//                child: Padding(
//                  padding: const EdgeInsets.all(30.0),
//                  child: Column(
//                    children: <Widget>[
//                      Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),),
//                      Text(ans)
//                    ],
//                  ),
//                ),
//              ),
//            ),


//=========================================JSON DATA========================================
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Card(
                  //color: Colors.amber[100],
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            dName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35.0,
                                color: Colors.green),
                          ),
                          Text(dEmail,),
                          Text(dPhone,),
                          Text(dCompany,),
                          SizedBox(height: 10,),
                          Text("Address", style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),),
                          Text(dCity,),
                          Text(dSuite,),
                          Text(dZip,),
                          SizedBox(height: 10,),
                          Text("Address", style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),),
                          Text(dCompany)
                        ],
                      )),
                ),
              ),
            ),





//===================================QUESTION LIST CONTAINER============================
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                  color: Color(0xFF101c31)),
              child: Stack(
                children: <Widget>[
                  Positioned(
                      right: MediaQuery.of(context).size.width / 2.3,
                      child: Icon(
                        Icons.remove,
                        color: Color(0xFFd1d5dc),
                        size: 60,
                      )),
                  Positioned(
                      right: MediaQuery.of(context).size.width / 2.8,
                      top: 40,
                      child: Text(
                        'Question List',
                        style: TextStyle(
                            color: Color(0xFFd1d5dc),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 65, 15, 0),
                      child: Container(
                        height: MediaQuery.of(context).size.height/5,
                        child: GridView.count(
                          crossAxisCount: 10,
                          children: List.generate(40, (index) {
                            return FittedBox(
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 10),
                                child: RaisedButton(
                                  onPressed: () {

                                  },
                                  child: Text(
                                    ' $index',
                                    style: TextStyle(fontWeight:FontWeight.bold,fontSize: 50),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      left: MediaQuery.of(context).size.width / 1.5,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color(0xFFed9f3f),
                        onPressed: () {
                          updateUIData();
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  Positioned(
                      bottom: 5,
                      right: MediaQuery.of(context).size.width / 1.5,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color(0xFFed9f3f),
                        onPressed: () {
                          backUIData();
                        },
                        child: Text(
                          'Previous',
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
