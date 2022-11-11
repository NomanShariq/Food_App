import 'package:flutter/material.dart';
import 'package:myfood_app/widgets/button.dart';
import 'package:myfood_app/widgets/email_text_formfield.dart';
import 'package:myfood_app/widgets/pass_textform_field.dart';
import 'homepage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isEdit = false;
  bool isMale = false;
  
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static RegExp regExp = RegExp(p);
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController fullname = TextEditingController();
    TextEditingController address = TextEditingController();
    TextEditingController phoneNumber = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
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
      }
    }

    Widget _buildAllFormFields() {
      return Container(
          height: 400,
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
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      isMale == false ? "Female" : "Male",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                PassTextFormField(
                  passcontroller: passwordcontroller,
                  passtitle: "Password",
                  hintText: "Enter Your Password",
                ),
                Button(
                  name: "Update",
                  onPressed: () {
                    vaildation();
                  },
                ),
              ]));
    }

    Widget _buildSingleContainer({required String name}) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(name),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => HomePage(),
              ),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "My Profile",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 15, right: 20),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isEdit = !isEdit;
                });
              },
              child: Text(
                isEdit == false ? "Edit" : "Close",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(children: [
          Column(
            children: [
              Container(
                height: 230,
                width: double.infinity,
                color: Colors.cyan,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Center(
                      child: CircleAvatar(
                        maxRadius: 64,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          maxRadius: 60,
                          backgroundImage: AssetImage("images/profile1.jpg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.white,
                  child: isEdit == false
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildSingleContainer(name: "Noman"),
                            _buildSingleContainer(name: "Nshariq562@gmail.com"),
                            _buildSingleContainer(name: "033403696831"),
                            _buildSingleContainer(name: "R-165 Sector 7d2"),
                            _buildSingleContainer(name: "Male"),
                          ],
                        )
                      : _buildAllFormFields(),
                ),
              ),
            ],
          ),
          Positioned(
            top: 180,
            left: 238,
            child: CircleAvatar(
              maxRadius: 18,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.black,
                  )),
              backgroundColor: Colors.white,
            ),
          ),
        ]),
      ),
    );
  }
}
