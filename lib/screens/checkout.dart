import 'package:flutter/material.dart';

import 'homepage.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  Widget _buildProductCard() {
    return Container(
      height: 80,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(children: [
          ListTile(
            leading: const CircleAvatar(
              maxRadius: 40,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/pastacheese.png"),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("PastaCheese", style: TextStyle(fontSize: 20)),
              ],
            ),
            subtitle: const Text(
              "5 star Hotel",
              style: TextStyle(fontSize: 15),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 5,
                ),
                Text(
                  "\$50",
                  style: TextStyle(color: Colors.cyan, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("1x", style: TextStyle(color: Colors.cyan, fontSize: 20))
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildBottomNavigatorPart() {
    return Container(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Text(
        "Price \$200",
        style: TextStyle(fontSize: 25),
      ),
      const SizedBox(width: 40),
      Container(
        height: 50, //height of button
        width: 180, //width of button
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyan, //background color of button
              elevation: 3, //elevation of button
            ),
            onPressed: () {
              //code to execute when this button is pressed.
            },
            child: const Text("Order", style: TextStyle(fontSize: 24))),
      )
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Check Out",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            _buildProductCard(),
            _buildProductCard(),
            _buildProductCard(),
            _buildProductCard(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: 200,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBottomNavigatorPart(),
          ],
        ),
      ),
    );
  }
}
