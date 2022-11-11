import 'package:flutter/material.dart';
import 'package:myfood_app/screens/homepage.dart';

import '../widgets/button.dart';
import '../widgets/email_text_formfield.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController message = TextEditingController();
  void vaildation() {
    if (emailcontroller.text.isEmpty &&
        fullname.text.isEmpty &&
        message.text.isEmpty) {
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
    } else if (message.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Message Field is empty"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.fromARGB(255, 241, 159, 6),
          duration: Duration(seconds: 3),
        ),
      );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => HomePage()));
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          backgroundColor: const Color.fromARGB(255, 1, 136, 148),
          title: const Text(
            "Contact Info",
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 200),
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          EmailTextFormField(
                              controller: fullname,
                              emailText: "FullName",
                              hintText: "Enter Your fullname"),
                          EmailTextFormField(
                              controller: emailcontroller,
                              emailText: "Email",
                              hintText: "Enter Your Email"),
                          EmailTextFormField(
                              controller: message,
                              emailText: "message",
                              hintText: "Enter Your message"),
                          Button(
                              name: "Send",
                              onPressed: () {
                                vaildation();
                              }),
                        ]),
                  )),
              Expanded(child: Container()),
            ],
          ),
        ));
  }
}
