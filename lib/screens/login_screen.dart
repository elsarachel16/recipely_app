import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {

  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  bool isLogin = true;

  Future authenticate() async {

    try {

      if (isLogin) {

        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email:
              emailController.text.trim(),

          password:
              passwordController.text.trim(),
        );

      } else {

        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email:
              emailController.text.trim(),

          password:
              passwordController.text.trim(),
        );
      }

      Navigator.pushReplacement(
        context,

        MaterialPageRoute(
          builder: (_) =>
              const HomeScreen(),
        ),
      );

    } catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFF5FFFC),

      body: Center(

        child: Container(
          width: 450,

          padding:
              const EdgeInsets.all(40),

          decoration: BoxDecoration(

            color:
                Colors.white.withOpacity(0.92),

            borderRadius:
                BorderRadius.circular(30),

            boxShadow: [

              BoxShadow(
                color: Colors.teal
                    .withOpacity(0.08),

                blurRadius: 30,
              ),
            ],
          ),

          child: Column(
            mainAxisSize:
                MainAxisSize.min,

            children: [

              CircleAvatar(
                radius: 42,

                backgroundColor:
                    const Color(
                  0xFFA8E6DC,
                ),

                child: const Icon(
                  Icons.restaurant_menu,

                  size: 42,

                  color:
                      Color(0xFF005B50),
                ),
              ),

              const SizedBox(height: 25),

              Text(
                "Recipely",

                style:
                    GoogleFonts.poppins(
                  fontSize: 42,

                  fontWeight:
                      FontWeight.bold,

                  color:
                      const Color(
                    0xFF005B50,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Cook something extraordinary.",

                style:
                    GoogleFonts.poppins(
                  fontSize: 18,

                  color:
                      Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 40),

              TextField(
                controller:
                    emailController,

                decoration:
                    InputDecoration(

                  labelText: "Email",

                  border:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(
                      20,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller:
                    passwordController,

                obscureText: true,

                decoration:
                    InputDecoration(

                  labelText: "Password",

                  border:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(
                      20,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              SizedBox(
                width: double.infinity,
                height: 60,

                child: ElevatedButton(

                  style:
                      ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(
                      0xFF005B50,
                    ),

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                        20,
                      ),
                    ),
                  ),

                  onPressed:
                      authenticate,

                  child: Text(

                    isLogin
                        ? "Login"
                        : "Create Account",

                    style:
                        GoogleFonts.poppins(
                      fontSize: 20,

                      fontWeight:
                          FontWeight.bold,

                      color:
                          Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextButton(

                onPressed: () {

                  setState(() {
                    isLogin = !isLogin;
                  });
                },

                child: Text(

                  isLogin
                      ? "Create new account"
                      : "Already have an account?",

                  style:
                      GoogleFonts.poppins(
                    color:
                        const Color(
                      0xFF005B50,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
