import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfood_app/screens/homepage.dart';
import 'package:myfood_app/widgets/email_text_formfield.dart';
import 'package:myfood_app/widgets/pass_textform_field.dart';
import 'package:myfood_app/widgets/toptitle.dart';

import '../widgets/button.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static RegExp regExp = RegExp(p);
  bool isloading = false;
  UserCredential? authResult;
  void submit() async {
    setState(() {
      isloading = false;
    });
    try {
      authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: ((ctx) => HomePage())));
      setState(() {
        isloading = false;
      });
    } on PlatformException catch (e) {
      String message = "please connect your internet connection";
      if (e.message != null) {
        message = e.message.toString();
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
      setState(() {
        isloading = false;
      });
    } catch (e) {
      setState(() {
        isloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  void validation(context) {
    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Both Fields is empty"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.fromARGB(255, 241, 159, 6),
          duration: Duration(seconds: 3),
        ),
      );
    } else if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Email Field is empty"),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.fromARGB(255, 241, 159, 6),
        duration: Duration(seconds: 3),
      ));
    } else if (regExp.hasMatch(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Email is not valid"),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.fromARGB(255, 241, 159, 6),
        duration: Duration(seconds: 3),
      ));
    } else if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("password Field is empty"),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.fromARGB(255, 241, 159, 6),
        duration: Duration(seconds: 3),
      ));
    } else if (passwordController.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("password is too short"),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.fromARGB(255, 241, 159, 6),
        duration: Duration(seconds: 3),
      ));
    } else {
      submit();
    }
  }

  TextEditingController passwordController = TextEditingController();
  Widget _buildAllFormFields() {
    return Center(
        child: Container(
            width: double.infinity,
            height: 260,
            alignment: Alignment.center,
            child: Column(children: [
              const SizedBox(
                height: 50,
              ),
              EmailTextFormField(
                  controller: emailController,
                  emailText: "Email",
                  hintText: "Enter Your Email"),
              const SizedBox(
                height: 30,
              ),
              PassTextFormField(
                  passcontroller: passwordController,
                  passtitle: "Password",
                  hintText: "Enter Your Password")
            ])));
  }

  Widget _buildButtonpart() {
    return isloading == false
        ? Button(
            name: "Login",
            onPressed: () {
              validation(context);
            })
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget _buildDontHaveAnyAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have any Account?"),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => const SignUp(),
              ),
            );
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 15, color: Color.fromARGB(255, 241, 159, 6)),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Container(
                  child: const TopTitle(
                      title: "Login", subTitle: "Welcome Back!")),
              _buildAllFormFields(),
              _buildButtonpart(),
              const SizedBox(
                height: 10,
              ),
              _buildDontHaveAnyAccount(),
            ],
          ),
        )));
  }
}
