import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login Screen',
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _logoSlideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.5, 1.0, // Delay the start of the text animation
          curve: Curves.easeOut,
        ),
      ),
    );

    _slideAnimation = Tween<Offset>(begin: Offset(0, -0.5), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0, 0, // Delay the start of the text animation
          curve: Curves.easeOut,
        ),
      ),
    );

    _logoSlideAnimation = Tween<double>(begin: -1.0, end: -0.5).animate( // Logo animation starts immediately
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut, // Bouncy effect
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: _logoSlideAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(_logoSlideAnimation.value * MediaQuery.of(context).size.width, 0),
                child: OverflowBox(
                  maxWidth: double.infinity,
                  maxHeight: MediaQuery.of(context).size.height * 0.87,
                  child: SvgPicture.asset(
                    'assets/logo.svg',
                    height: MediaQuery.of(context).size.height * 2,
                    color: Color(0xff27459d),
                  ),
                )
              );
            },
          ),
          FadeTransition(
            opacity: _opacityAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 150),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'LOGO',
                        style: TextStyle(fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff27459d)),
                      ),
                      const SizedBox(width: 3),
                      // Расстояние между текстом и логотипом
                      SvgPicture.asset(
                        'assets/logo.svg',
                        height: 30,
                        color: Color(0xff27459d),
                      ),
                      // Image.asset(
                      //   'assets/logo.png',
                      //   height: 50,
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 15),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x30000000),
                          offset: Offset(1.0, 15.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.1,
                        ),
                      ],
                    ),
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
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 8),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x30000000),
                          offset: Offset(1.0, 15.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.1,
                        ),
                      ],
                    ),
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
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text('Login', style: TextStyle(color: Color(0xff27459d)),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20),
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
