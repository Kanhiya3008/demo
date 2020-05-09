import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  dynamic _userData;
  String _token;

  @override
  void initState() {
    super.initState();
    _checkIfIsLogged();
  }

  _printCredentials(LoginResult result) {
    _token = result.accessToken.token;
    print("userId: ${result.accessToken.userId}");
    print("token: $_token");
    print("expires: ${result.accessToken.expires}");
    print("grantedPermission: ${result.grantedPermissions}");
    print("declinedPermissions: ${result.declinedPermissions}");
  }

  _checkIfIsLogged() async {
    final accessToken = await FacebookAuth.instance.isLogged;
    if (accessToken != null) {
      print("is Logged");
      _token = accessToken.token;
      // now you can call to  FacebookAuth.instance.getUserData();
      final userData = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields:"email,birthday");
      setState(() {
        _userData = userData;
      });
    }
  }

  _login() async {
   // final result = await FacebookAuth.instance.login();
    // final result = await FacebookAuth.instance.login(permissions:['email','user_birthday']);
    final result = await FacebookAuth.instance.login();
    // final result = await FacebookAuth.instance.login(permissions:['email','user_birthday']);

    switch (result.status) {
      case FacebookAuthLoginResponse.ok: // result.status == 200
        _printCredentials(result);
        // get the user data
        final userData = await FacebookAuth.instance.getUserData();
        // final userData = await _fb.getUserData(fields:"email,birthday");
        setState(() {
          _userData = userData;
        });
        break;
      case FacebookAuthLoginResponse.cancelled: // result.status == 403
        print("login cancelled");
        break;
      default: // result.status == 500
        print("login failed");
    }
  }

  _logOut() async {
    await FacebookAuth.instance.logOut();
    _token = null;
    setState(() {
      _userData = null;
    });
  }

  _checkPermissions() async {
    final FacebookAuthPermissions response =
    await FacebookAuth.instance.permissions(_token);
    print("permissions granted: ${response.granted}");
    print("permissions declined: ${response.declined}");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Facebook Auth Example'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(_userData != null ? _userData.toString() : "NO LOGGED"),
            _userData != null
                ? CupertinoButton(
              child: Text("Check permissions"),
              onPressed: _checkPermissions,
              color: Colors.greenAccent,
            )
                : Container(),
            SizedBox(height: 20),
            CupertinoButton(
              color: Colors.blue,
              child: Text(
                _userData != null ? "LOGOUT" : "LOGIN",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: _userData != null ? _logOut : _login,
            ),
          ],
        ),
      ),
    );
  }
}