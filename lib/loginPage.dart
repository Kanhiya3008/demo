import 'package:examapp/dashboard/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Album> createAlbum(String userId, password) async {
  final http.Response response = await http.post(
    'http://1242a7ba.ngrok.io/testenginedemo/login',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'userId': userId,
      'password': password,
    }),
  );

  if (response.statusCode == 201) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class Album {
  final String userId;
  final String password;

  Album({this.userId, this.password});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      password: json['password'],
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

Map<int, Color> color = {};
MaterialColor circleCustom = MaterialColor(0xFF1d499c, color);
MaterialColor backCustom = MaterialColor(0xFF9bcaf4, color);
MaterialColor buttonCustom = MaterialColor(0xFF2d228d, color);
MaterialColor facebookCustom = MaterialColor(0xFF1d499c, color);
MaterialColor googleCustom = MaterialColor(0xFFe25141, color);

class _LoginPageState extends State<LoginPage> {
//  FirebaseAuth _auth = FirebaseAuth.instance;
//  GoogleSignIn googleSignIn = GoogleSignIn();
//  _loginWithGmail() async {
//    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//    GoogleSignInAuthentication gsa = await googleSignInAccount.authentication;
//    AuthCredential credential = GoogleAuthProvider.getCredential(
//        idToken: gsa.idToken, accessToken: gsa.accessToken);
//    AuthResult authResult = await _auth.signInWithCredential(credential);
//    FirebaseUser user = authResult.user;
//    //setState(() {
//    //  this.user = user;
//    // });
//    // print("User Details are ${user.providerData}");
//  }

//  signIn(String userid,String password) async{
//    Map data = {
//      "userid": userid,
//      "password":password
//    };
//    var jsonData = Null;
//    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//    var response = await http.post('http://1242a7ba.ngrok.io/testenginedemo/login',body: data);
//    if (response.statusCode == 200){
//      jsonData = json.decode(response.body);
//   setState(() {
//     sharedPreferences.setString('token', jsonData['token']);
//     Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder:(BuildContext context) => Dash()),
//             (Route<dynamic> route) => false);
//   });
//
//    }
//    else print(response.body);
//  }

  bool _isLoading = false;

  signIn(String email, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'email': email, 'password': password};
    var jsonResponse = null;
//    var response = await http
//        .post("http://1242a7ba.ngrok.io/testenginedemo/login", body: jsonEncode(<String, String>{
//      'email': email,
//      'password':password
//    }));





    var response = await  http.post(
      'http://1242a7ba.ngrok.io/testenginedemo/login',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password':password
      }),
    );



    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Dash()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _isLoading = false;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: 250,
              color: backCustom,
              padding: EdgeInsets.only(bottom: 100, left: 5),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    maxRadius: 50,
                    backgroundColor: circleCustom,
                    child: Text(
                      'Exam',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.white),
                    ),
                  ),
                  //Spacer(),
                  Padding(padding: EdgeInsets.all(5)),

                  Text('APP',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.white))

                  //Spacer()
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Text(
                    'Sign In',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  TextField(
                    controller: userIdController,
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            _isLoading = true;
                          });
                          signIn(
                              userIdController.text, passwordController.text);
                        },
                        color: buttonCustom,
                        child: Text('Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {}, child: (Text('Remember Me'))),
                      // Spacer(),
                      //Padding(padding: EdgeInsets.only(left: 5)),
                      FlatButton(
                          onPressed: () {}, child: (Text('Forgot Password'))),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {},
                        child: (Text(
                          'f',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                        color: facebookCustom,
                      ),
                      //Padding(padding: EdgeInsets.only(left: 5)),
                      RaisedButton(
                        onPressed: () {
                          // _loginWithGmail();
                        },
                        child: (Text(
                          'G',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                        color: googleCustom,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Don't have an account?"),
                      FlatButton(
                        onPressed: () {},
                        child: (Text(
                          'SignUp',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Dash()));
                        },
                        child: Text('Skip'),
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

TextEditingController userIdController = TextEditingController();
TextEditingController passwordController = TextEditingController();
