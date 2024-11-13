import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_mart/pages/bottomNav.dart';
import 'package:shop_mart/pages/forgetPasswordPage.dart';
import 'package:shop_mart/pages/signUp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "", password = "";

  final _formkey = GlobalKey<FormState>();
  TextEditingController userEmailController = new TextEditingController();
  TextEditingController userPasswordController = new TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const BottomNav()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user not found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "No user Found ",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        )));

      }else if (e.code=='incorrect password'){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Incorrect password",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomRight,
                      colors: [
                    Color.fromARGB(255, 62, 29, 68),
                    Color.fromARGB(255, 18, 145, 126)
                  ])),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Text(""),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Center(
                      child: Image.asset(
                    "images/ShopMart_logo.png",
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.only(left: 40.0, right: 20.0),
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30.0,
                            ),
                            const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25.0,
                                  fontFamily: 'Poppins'),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              controller: userEmailController ,
                              validator: (value) {
                                  if (value == null||value.isEmpty ) {
                                    return 'Please enter email';
                                  }
                                  return null;
                                },
                              decoration: const InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25.0,
                                      fontFamily: 'Poppins'),
                                  prefixIcon: Icon(Icons.email)),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              controller: userPasswordController,
                              validator: (value) {
                                  if (value == null||value.isEmpty ) {
                                    return 'Please enter email';
                                  }
                                  return null;
                                },
                              obscureText: true,
                              decoration: const InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25.0,
                                      fontFamily: 'Poppins'),
                                  prefixIcon: Icon(Icons.lock)),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgetPasswordPage()));
                              },
                              child: Container(
                                alignment: Alignment.topRight,
                                child: const Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                      fontFamily: 'Poppins'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 60.0,
                            ),
                            GestureDetector(
                              onTap: (){
                              
                                  if (_formkey.currentState!.validate()) {
                                    setState(() {
                                      email = userEmailController.text;
                                      password = userPasswordController.text;
                                    });
                                  }
                                userLogin();
                              },
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10.0),
                                  width: 200,
                                  alignment: Alignment.topRight,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.center,
                                          end: Alignment.bottomRight,
                                          colors: [
                                        Color.fromARGB(255, 62, 29, 68),
                                        Color.fromARGB(255, 18, 145, 126)
                                      ])),
                                  child: const Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                    child: const Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
