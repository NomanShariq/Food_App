import 'package:flutter/material.dart';
import 'package:myfood_app/model/featurefood_model.dart';
import 'package:myfood_app/provider/my_provider.dart';
import 'package:myfood_app/screens/aboutus.dart';
import 'package:myfood_app/screens/contact.dart';
import 'package:myfood_app/screens/profile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildSingleFeature(
      {String? title,
      String? subtitle,
      String? price,
      String? ratings,
      String? image}) {
    return Stack(alignment: Alignment.topRight, children: [
      Padding(
        padding: const EdgeInsets.only(right: 50),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black26),
          ),
          height: 210,
          width: 210,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                subtitle.toString(),
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Container(
                height: 50,
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 226, 171, 18),
                    ),
                    Text(
                      "$ratings Ratings",
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      "\$$price",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      CircleAvatar(
        maxRadius: 70,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(image!),
      ),
    ]);
  }

  Widget _buildSingleCategory({String? image, String? name}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black26),
        ),
        height: 200,
        width: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image!),
                      ),
                    ),
                  ),
                  Text(
                    name.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
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

  Widget _buildTopPart() {
    return Expanded(
        child: Container(
      color: const Color.fromARGB(134, 0, 138, 150),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.sort,
                    size: 35,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _scaffoldstate.currentState?.openDrawer();
                  },
                ),
                const IconButton(
                    onPressed: (null),
                    icon: Icon(
                      Icons.notifications,
                      size: 35,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          Expanded(
              child: Container(
            child: Column(
              children: [
                Container(
                  height: 120,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        maxRadius: 50,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          maxRadius: 45,
                          backgroundImage: AssetImage("images/profile1.jpg"),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        child: const ListTile(
                          title: Text(
                            "Have you upset",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          textColor: Colors.white,
                          subtitle: Text(
                            "Stomach?",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    ));
  }

  Widget _buildFeaturedPart() {
    MyProvider myProvider = MyProvider();
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 260,
        child: Column(children: [
          Container(
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: myProvider.getFeatureFoodModelList.length,
              itemBuilder: (context, index) => _buildSingleFeature(
                  image: myProvider.getFeatureFoodModelList[index].image,
                  title: myProvider.getFeatureFoodModelList[index].name,
                  ratings: myProvider.getFeatureFoodModelList[index].ratings
                      ,
                  subtitle: myProvider.getFeatureFoodModelList[index].subtitle,
                  price: myProvider.getFeatureFoodModelList[index].price
                      ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildBottomPart() {
    MyProvider myProvider = MyProvider();
    return Expanded(
        flex: 2,
        child: Container(
          color: const Color.fromARGB(211, 236, 235, 234),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 240,
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 240,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: myProvider.getCategoryModelList.length,
                            itemBuilder: (context, index) =>
                                _buildSingleCategory(
                                    name: myProvider
                                        .getCategoryModelList[index].name,
                                    image: myProvider
                                        .getCategoryModelList[index].image)),
                      ),
                    ]),
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Featured",
                      style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              _buildFeaturedPart(),
            ],
          ),
        ));
  }

  Widget _buildDrawerPart(context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.cyan,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/profile1.jpg"),
            ),
            accountName: Text("Noman Shariq"),
            accountEmail: Text("Nshariq562@gmailcom"),
          ),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text("Homepage"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => const Profile()));
            },
            leading: const Icon(Icons.people),
            title: const Text("Profile"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => const About()));
            },
            leading: const Icon(Icons.info),
            title: const Text("About us"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => const ContactUs()));
            },
            leading: const Icon(Icons.contact_phone),
            title: const Text("Contact Us"),
          ),
          const ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyProvider>(context);
    myProvider.getCategoryProduct();
    myProvider.getFeatureFood();

    return Scaffold(
      key: _scaffoldstate,
      drawer: _buildDrawerPart(context),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              _buildTopPart(),
              _buildBottomPart(),
            ],
          ),
        ),
      ),
    );
  }
}
