import 'package:flutter/material.dart';
import 'package:google/Choose.dart';

import 'package:google_sign_in/google_sign_in.dart';
//import 'package:avatar_glow/avatar_glow.dart';

final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isAuth = false;
  GoogleSignInAccount _currentUser;

  Widget buildAuthScreen() {
    const curveHeight = 10.0;
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.pinkAccent[400],
              shape: const MyShapeBorder(curveHeight),
              title: Text(""),
            ),
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://tse3.mm.bing.net/th?id=OIP.BLT-Qoy2iRBy7M9zsdtG0AHaHa&pid=Api&P=0&w=300&h=300",
                        height: 70,
                      ),
                      Text('You Successfully Login in'),
                      //  Text('Dream it, Wish it ,Do it'),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: GoogleUserCircleAvatar(
                            identity: _currentUser,
                            backgroundColor: Colors.white,

                            //backgroundImage: NetworkImage(_currentUser.photoUrl),
                          ),
                        ),
                      ),
                      Text(_currentUser.displayName ?? ''),
                      Text(_currentUser.email),
                      ElevatedButton(
                        onPressed: _logout,
                        child: Text("Logout".toUpperCase(),
                            style: TextStyle(fontSize: 14, letterSpacing: 2)),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blue[900]),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(
                                        color: Colors.pinkAccent[400])))),
                      ),

                      RaisedButton(
                          color: Colors.pinkAccent[400],
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Choose()));
                          },
                          child: Text(
                            "Choose your Interest area",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                    ],
                  ),
                ),
              ),
            )));
  }

  _login() {
    googleSignIn.signIn();
  }

  _logout() {
    googleSignIn.signOut();
  }

  Widget buildUnAuthScreen() {
    const curveHeight = 10.0;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent[400],
        shape: const MyShapeBorder(curveHeight),
        title: Text("SIgnIn"),
      ),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                "https://cdn.quotesgram.com/img/98/15/1035545209-443e6210fcafbc73f1e8d1d6b8d63020.jpg"),
            GestureDetector(
              onTap: () {
                _login();
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 180),
                  child: Column(
                    children: [
                      Image.asset(
                        'image/signin.png',
                        height: 75,
                        width: 250,
                        fit: BoxFit.fitWidth,
                      ),
                      Text(
                        'Sign in &  ',
                        style: TextStyle(
                            color: Colors.pinkAccent[700],
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' Kick start your SUCCESS  ',
                        style: TextStyle(
                            color: Colors.pinkAccent[700],
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    ));
  }

  void handleSignin(GoogleSignInAccount account) {
    if (account != null) {
      print("user signed in $account");

      setState(() {
        isAuth = true;
        _currentUser = account;
      });
    } else {
      setState(() {
        isAuth = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      handleSignin(account);
    }, onError: (err) {
      print("error sigining $err");
    });
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}

class MyShapeBorder extends ContinuousRectangleBorder {
  const MyShapeBorder(this.curveHeight);
  final double curveHeight;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) => Path()
    ..lineTo(0, rect.size.height)
    ..quadraticBezierTo(
      rect.size.width / 2,
      rect.size.height + curveHeight * 2,
      rect.size.width,
      rect.size.height,
    )
    ..lineTo(rect.size.width, 0)
    ..close();
}
