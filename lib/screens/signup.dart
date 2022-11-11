import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfood_app/screens/homepage.dart';
import 'package:myfood_app/screens/login_page.dart';
import 'package:myfood_app/widgets/button.dart';
import 'package:myfood_app/widgets/email_text_formfield.dart';
import 'package:myfood_app/widgets/pass_textform_field.dart';
import 'package:myfood_app/widgets/toptitle.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isMale = false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
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
      authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text);
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
    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(authResult?.user?.uid)
        .set({
      "Username": fullname.text,
      "UserEmail": emailcontroller.text,
      "UserId": authResult?.user?.uid,
      "Userpassword": passwordcontroller.text,
      "UserphoneNumber": phoneNumber.text,
      "Usergender": isMale == true ? "Male" : "Female",
    });
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: ((ctx) => HomePage())));
    setState(() {
      isloading = false;
    });
  }

  void vaildation() {
    if (emailcontroller.text.isEmpty &&
        passwordcontroller.text.isEmpty &&
        fullname.text.isEmpty &&
        address.text.isEmpty &&
        phoneNumber.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("All Fleid Is Empty"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.fromARGB(255, 241, 159, 6),
          duration: Duration(seconds: 3),
        ),
      );
    } else if (fullname.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("FullName Is Empty"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.fromARGB(255, 241, 159, 6),
          duration: Duration(seconds: 3),
        ),
      );
    } else if (emailcontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email Is Empty"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.fromARGB(255, 241, 159, 6),
          duration: Duration(seconds: 3),
        ),
      );
    } else if (regExp.hasMatch(emailcontroller.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email Is Not Vaild"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.fromARGB(255, 241, 159, 6),
          duration: Duration(seconds: 3),
        ),
      );
    } else if (phoneNumber.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Phone Number Is Empty"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.fromARGB(255, 241, 159, 6),
          duration: Duration(seconds: 3),
        ),
      );
    } else if (phoneNumber.text.length < 11) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Phone Number Must Be 11 "),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.fromARGB(255, 241, 159, 6),
          duration: Duration(seconds: 3),
        ),
      );
    } else if (passwordcontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password Is Empty"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.fromARGB(255, 241, 159, 6),
          duration: Duration(seconds: 3),
        ),
      );
    } else if (passwordcontroller.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password Is Too Short"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.fromARGB(255, 241, 159, 6),
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      submit();
    }
  }

  Widget _buildAllFormFields() {
    return Container(
        height: 400,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          EmailTextFormField(
              controller: fullname,
              emailText: "FullName",
              hintText: "Enter Your fullname"),
          EmailTextFormField(
              controller: emailcontroller,
              emailText: "Email",
              hintText: "Enter Your Email"),
          EmailTextFormField(
              controller: address,
              emailText: "Address",
              hintText: "Enter Your Address"),
          EmailTextFormField(
              controller: phoneNumber,
              emailText: "PhoneNumber",
              hintText: "Enter Your PhoneNumber"),
          GestureDetector(
            onTap: () {
              setState(() {
                isMale = !isMale;
              });
            },
            child: Container(
              height: 60,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: Text(
                isMale == false ? "Female" : "Male",
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          PassTextFormField(
              passcontroller: passwordcontroller,
              passtitle: "Password",
              hintText: "Enter Your Password")
        ]));
  }

  Widget _buildButtonPart() {
    return isloading == false
        ? Button(
            name: "Sign Up",
            onPressed: () {
              vaildation();
            })
        : const CircularProgressIndicator(
            color: Color.fromARGB(255, 241, 159, 6),
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
                builder: (ctx) => const LoginPage(),
              ),
            );
          },
          child: const Text(
            "Log In",
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
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const TopTitle(
                  title: "Sign Up", subTitle: "Create a new account"),
              _buildAllFormFields(),
              _buildButtonPart(),
              const SizedBox(
                height: 10,
              ),
              _buildDontHaveAnyAccount(),
            ],
          ),
        ]),
      ),
    );
  }
}
