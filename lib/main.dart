import 'package:demo2/screen/contest.dart';
import 'package:demo2/screen/hackathon.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home2(),
    );
  }
}

class Home2 extends StatefulWidget {
  const Home2({super.key});
  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text("HOME"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_book),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        elevation: 10,
        // centerTitle: true,
        backgroundColor: Colors.purple.withOpacity(0.7),
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadiusDirectional.vertical(bottom: Radius.circular(20))),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Hackathon()));
            },
            style: ElevatedButton.styleFrom(
              // padding: const EdgeInsets.all(20.0),
              fixedSize: const Size(150, 40),
              backgroundColor: Colors.amber,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              foregroundColor: Colors.black87,
              elevation: 15,
              shadowColor: Colors.amber,
              shape: const StadiumBorder(),
            ),
            child: const Text('Hackathon'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Contest()));
            },
            style: ElevatedButton.styleFrom(
              // padding: const EdgeInsets.all(20.0),
              fixedSize: const Size(150, 40),
              backgroundColor: Colors.amber,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              foregroundColor: Colors.black87,
              elevation: 15,
              shadowColor: Colors.amber,
              shape: const StadiumBorder(),
            ),
            child: const Text('Contest'),
          ),
        ],
      )),
      bottomNavigationBar: BottomAppBar(
        color: Colors.purple,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    // Text(
                    //   "Home",
                    //   style: TextStyle(color: Colors.white),
                    // )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
