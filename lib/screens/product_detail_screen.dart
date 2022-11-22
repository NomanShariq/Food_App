import 'package:flutter/material.dart';

import 'homepage.dart';

class ProductDetailPage extends StatefulWidget {
  final String producttitle, productsubtitle, productimage;
  final String price;
  ProductDetailPage(
      {super.key,
      required this.producttitle,
      required this.productsubtitle,
      required this.productimage,
      required this.price,});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => HomePage()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(children: [
        Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: 100,
                      color: Colors.white,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.producttitle,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.cyan),
                                ),
                                Text(widget.productsubtitle,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.cyan,
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                        child: IconButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            if (counter > 0) {
                                              setState(() {
                                                counter--;
                                              });
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content:
                                                      Text("Cant reduce more"),
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  backgroundColor: Colors.cyan,
                                                  duration:
                                                      Duration(seconds: 3),
                                                ),
                                              );
                                            }
                                          },
                                          icon: Icon(Icons.remove),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        counter.toString(),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.cyan,
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                        child: IconButton(
                                            color: Colors.white,
                                            onPressed: () {
                                              if (counter < 10) {
                                                setState(() {
                                                  counter++;
                                                });
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content:
                                                        Text("Cant add more"),
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    backgroundColor:
                                                        Colors.cyan,
                                                    duration:
                                                        Duration(seconds: 3),
                                                  ),
                                                );
                                              }
                                            },
                                            icon: Icon(Icons.add)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ]),
                    ),
                    Container(
                      color: Colors.white,
                      height: 150,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          Text(
                            "Ernsten bilder wohl hinweggeschwunden ich froher, tränen sonst so es gut bang strenge nun es. In gleich geisterreich und bang.Ernsten bilder wohl hinweggeschwunden ich froher, tränen sonst so es gut bang strenge nun es. In gleich geisterreich und bang.",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "Delivery Time:",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(Icons.timelapse),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "30 minutes",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: 100,
                      color: Colors.white,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Price:",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.cyan),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40.0),
                                  child: Text("\$${widget.price}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  height: 55,
                                  decoration: BoxDecoration(
                                      color: Colors.cyan,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Add To Cart",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        child: IconButton(
                                            color: Colors.white,
                                            onPressed: () {},
                                            icon: Icon(Icons.shopping_cart)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
            left: 40,
            child: Image(
              width: 350,
              image: NetworkImage(widget.productimage),
            ))
      ]),
    );
  }
}
