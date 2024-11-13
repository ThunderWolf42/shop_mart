import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:shop_mart/pages/bottomNav.dart';
import 'package:shop_mart/pages/login.dart';
import 'package:shop_mart/service/service.dart';
import 'package:shop_mart/service/shared_pref.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email = "", password = "", name = "";

  TextEditingController nameController =  TextEditingController();

  TextEditingController passwordController =  TextEditingController();

  TextEditingController emailController = TextEditingController();

 final _formKey = GlobalKey<FormState>();

  registration() async {
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
          backgroundColor: Colors.red,
            content: Text(
          "Registered Successfully",
          style: TextStyle(fontSize: 20.0),
        ))));
        String Id = randomAlphaNumeric(10);
        Map<String ,dynamic> addUserInfo = {
          "Name": nameController.text,
          "Email":emailController.text,
          "Wallet": "0",
          "Id": Id,
        };
       await DatabaseMethods().addUserDetail(addUserInfo, Id);
      await SharedPreferenceHelper().saveUserName(nameController.text);
      await SharedPreferenceHelper().saveUserEmail(emailController.text);
      await SharedPreferenceHelper().saveUserWallet('0');
      await SharedPreferenceHelper().saveUserId(Id);

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const BottomNav()));
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.orange,
              content: Text(
            "Password too weak",
            style: TextStyle(fontSize: 18.0),
          )));
        } else if (e.code == "email-already used") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
             backgroundColor: Colors.orange,
              content: Text(
            "Password too weak",
            style: TextStyle(fontSize: 18.0),
          )));
        }
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
                  GestureDetector(
                    onTap: () async{
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          name = nameController.text;
                        email = emailController.text;
                        password = passwordController.text;
                        });
                      }
                      registration();
                    },
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.only(left: 40.0, right: 20.0),
                        width: MediaQuery.of(context).size.width,
                        height: 500,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30.0,
                              ),
                              const Text(
                                "SignUp",
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
                                controller: nameController,
                                validator: (value) {
                                  if (value == null||value.isEmpty ) {
                                    return 'Please enter Name';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    hintText: "Name",
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25.0,
                                        fontFamily: 'Poppins'),
                                    prefixIcon: Icon(Icons.email)),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                               TextFormField(
                                controller: emailController ,
                                validator: (value) {
                                  if (value == null||value.isEmpty ) {
                                    return 'Please enter email';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25.0,
                                        fontFamily: 'Poppins'),
                                    prefixIcon: Icon(Icons.lock)),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                               TextFormField(
                                controller: passwordController,
                                validator: (value) {
                                  if (value == null||value.isEmpty ) {
                                    return 'Please enter Password';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: const InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 25.0,
                                        fontFamily: 'Poppins'),
                                    prefixIcon: Icon(Icons.lock)),
                              ),
                              const SizedBox(
                                height: 60.0,
                              ),
                              Material(
                                elevation: 5.0,
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10.0),
                                  width: 200,
                                  alignment: Alignment.topRight,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      gradient: const LinearGradient(
                                          begin: Alignment.center,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color.fromARGB(255, 62, 29, 68),
                                            Color.fromARGB(255, 18, 145, 126)
                                          ])),
                                  child: const Center(
                                    child: Text(
                                      "SignUp",
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      "Already have an account? Login",
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
