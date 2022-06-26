import 'package:flutter/material.dart';
import 'package:testonenewdevce/Data/Data.dart';
import 'package:testonenewdevce/Screens/Individual.dart';

import '../Data/Server.dart';

class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://media.istockphoto.com/photos/bank-sign-on-a-modern-glass-building-3d-render-picture-id1277143096?k=20&m=1277143096&s=612x612&w=0&h=TtutshCUCYzYd8Y5okM_CvM7vvRTpad_Rsk5RkmyVWc="),
              fit: BoxFit.cover,
            ),
          ),
          child: FutureBuilder(
              future: fetch("https://reqres.in/api/users?page=2"),
              builder: (context, snapshot) {
                Widget child = Container();
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<Details> data = snapshot.data as List<Details>;
                    child = ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListView(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(1.0),
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Individual(data[0])));
                              },
                              child: Card(
                                child: ListTile(
                                  leading: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Image.network(
                                      data[index].avatar,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loading) {
                                        if (loading == null) {
                                          return child;
                                        }
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      },
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  title: Text(data[index].first_name),
                                  subtitle: Text(data[index].email),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    child = const Center(
                      child: Text("Server Error, please try later"),
                    );
                  }
                } else {
                  child = const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return child;
              })),
    );
  }
}
