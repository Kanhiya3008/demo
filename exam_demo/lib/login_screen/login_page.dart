import 'package:flutter/material.dart';
//import 'package:examapp/dashboard/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  _loginWithGmail() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gsa = await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: gsa.idToken, accessToken: gsa.accessToken);
    AuthResult authResult = await _auth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
//    setState(() {
//     // this.user = user;
//     });
//     print("User Details are ${user.providerData}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: <Widget>[
          Container(
            height: 250,
            color: backCustom,
            padding: EdgeInsets.only(bottom: 100,left: 5),
            child: Row(
              children: <Widget>[

                CircleAvatar(
                  maxRadius: 50,
                  backgroundColor: circleCustom,
                  child: Text('Exam', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),),
                ),
                //Spacer(),
                Padding(padding: EdgeInsets.all(5)),

                Text('APP', style: TextStyle(fontWeight: FontWeight.bold,
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
                Text('Sign In',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Username'
                  ),

                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Password'
                  ),

                ),
                Padding(padding: EdgeInsets.all(5)),
                Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    RaisedButton(onPressed: () {},
                      color: buttonCustom,
                      child: Text('Login',
                          style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white)),
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FlatButton(onPressed: () {}, child: (Text('Remember Me'))
                    ),
                    // Spacer(),
                    //Padding(padding: EdgeInsets.only(left: 5)),
                    FlatButton(
                        onPressed: () {}, child: (Text('Forgot Password'))
                    ),

                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(onPressed: () {},
                      child: (Text('f', style: TextStyle(color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),)),
                      color: facebookCustom,
                    ),
                    //Padding(padding: EdgeInsets.only(left: 5)),
                    RaisedButton(onPressed: () {
                      _loginWithGmail();
                    },
                      child: (Text('G', style: TextStyle(color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),)),
                      color: googleCustom,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    FlatButton(onPressed: () {},
                      child: (Text(
                        'SignUp', style: TextStyle(fontWeight: FontWeight
                          .bold),)),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    RaisedButton(onPressed: (){
                     // Navigator.push(context, MaterialPageRoute(builder: (context) => Dash()));
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
