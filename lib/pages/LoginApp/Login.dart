import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:self_practice/pages/LoginApp/Dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    // text field value always persise thats why we made texteditionController inside init method
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  var isVisible = false;

  @override
  Widget build(BuildContext context) {
    // to get the full size of the screen
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assests/qollabb_logo.jpg"),
                radius: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Qollabb",
                style: TextStyle(fontSize: 25, color: Colors.white),
              )
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 81, 56, 195),
      ),

      // body of the screen
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xFFA566FF), Color(0xFFD28CFF)])),
        child: Stack(
          children: [
            Positioned(
              left: 40,
              child: SvgPicture.asset(
                "assests/svg3.svg",
                fit: BoxFit.cover,
                width: 300,
                height: 300,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFA566FF),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(3, 1), // offset in X and Y directtion
                      )
                    ]),
                height: 500,
                width: screenSize.width,
                child: Column(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Login Your Account",
                        style: TextStyle(
                            fontSize: 32,
                            color: Color.fromARGB(255, 81, 56, 195),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 350,
                          height: 60,
                          child: TextField(
                            //  controller of email
                            controller: emailController,
                            // to close keypad on tap outside in screen
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              label: const Text(
                                "Enter your email address",
                                style: TextStyle(fontSize: 20),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 350,
                          height: 60,
                          child: TextField(
                            // controller of password
                            controller: passwordController,

                            obscureText: isVisible ? false : true,
                            // to close keypad on tap outside in screen
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                label: const Text(
                                  "Enter your password",
                                  style: TextStyle(fontSize: 20),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 81, 56, 195)),
                                    borderRadius: BorderRadius.circular(30)),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                      });
                                    },
                                    child: Icon(
                                      isVisible
                                          ? CupertinoIcons.eye
                                          : CupertinoIcons.eye_slash,
                                      size: 28,
                                    ))),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                            width: 320,
                            height: 50,
                            child: ElevatedButton(
                              // to give style to the button
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFA566FF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),

                              // on pressed on button
                              onPressed: () {
                                // take the value from the text field
                                var email = emailController.text.toString();
                                var pass = passwordController.text.toString();

                                print("email: $email , password: $pass");

                                if (email == "" || pass == "") {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext constext) {
                                        return AlertDialog(
                                          backgroundColor: const Color.fromARGB(
                                              255, 211, 182, 255),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          title: const Text(
                                            "Opps!!",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 22),
                                          ),
                                          content: const Text(
                                            "Please fill all details to login",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  "Ok",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.white),
                                                ))
                                          ],
                                        );
                                      });
                                } else if (email == "grishav137@gmail.com" &&
                                    pass == "Rishav@123") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Dashboard()));
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor:
                                            Color.fromARGB(255, 81, 56, 195),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        title: const Text("Invalid details"),
                                        content: const Text(
                                          "Wrong email & password!! Try again",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                "Ok",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.white),
                                              ))
                                        ],
                                      );
                                    },
                                  );
                                }
                              },

                              // button text
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Signup",
                              style: TextStyle(fontSize: 18),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
