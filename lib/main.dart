import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Screen',
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Positioned(
          //   top: -50,
          //   left: -50,
          //   child: Container(
          //     width: 250,
          //     height: 250,
          //     decoration: BoxDecoration(
          //       color: Color(0xff27459d,
          //       shape: BoxShape.rectangle,
          //     ),
          //   ),
          // ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 150),
              child: Text(
                'LOGO',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xff27459d)),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Username',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff27459d),
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {
                    // Handle login action
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 50,
            right: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.settings, color: Color(0xff27459d)),
                Icon(Icons.help_outline, color: Color(0xff27459d)),
                Icon(Icons.email, color: Color(0xff27459d)),
                Icon(Icons.map, color: Color(0xff27459d)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
