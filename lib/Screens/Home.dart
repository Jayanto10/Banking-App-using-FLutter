import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 1;
    List<String> page = ["Login", "Home", "Pages"];

    return Scaffold(
      appBar: AppBar(),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              tapText("P1", context),
              tapText("P2", context),
              tapText("P3", context),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://media.istockphoto.com/photos/bank-sign-on-a-modern-glass-building-3d-render-picture-id1277143096?k=20&m=1277143096&s=612x612&w=0&h=TtutshCUCYzYd8Y5okM_CvM7vvRTpad_Rsk5RkmyVWc="),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: SizedBox(
            height: 80,
            width: 100,
            child: Text(
              "Home Page",
              textScaleFactor: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back_sharp),
            label: 'Login',
            // activeIcon: Container(child: GestureDetector(onTap: (){Navigator.pushNamed(context, "Login");},))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            //activeIcon: Container(child: GestureDetector(onTap: (){Navigator.pushNamed(context, "Home");},))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward_sharp),
            label: 'Page',
            // activeIcon: Container(child: GestureDetector(onTap: (){Navigator.pushNamed(context, "Pages");},))
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange[650],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          (index > 1)
              ? Navigator.pushNamed(context, page[index])
              : Navigator.popAndPushNamed(context, page[index]);
        },
      ),
    );
  }
}

Widget tapText(String s, BuildContext context) {
  return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        title: Text(s, textScaleFactor: 2),
        hoverColor: Colors.indigoAccent[200],
        onTap: () {
          Navigator.pushNamed(context, "Pages");
        },
        tileColor: Colors.red[650],
      ));
}
