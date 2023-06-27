import 'dart:convert';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Contest extends StatefulWidget {
  const Contest({super.key});

  @override
  State<Contest> createState() => _ContestState();
}

class _ContestState extends State<Contest> {
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () {},
        // ),tileColor: Colors.purple,
        title: const Text("Contest"),
        // actions: [
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.shopping_cart),
        // ),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.menu_book),
        // ),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.search),
        // ),
        // ],
        elevation: 10,
        // centerTitle: true,
        backgroundColor: Colors.purple.withOpacity(0.7),
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadiusDirectional.vertical(bottom: Radius.circular(20))),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            print(index);
            print(users.length);
            final user = users[index];
            final name = user["name"];
            final link = user["url"];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text('${index + 1}'),
              ),
              // tileColor: Colors.purple[100],
              onTap: () => _MainScreenState(),
              // tileColor: Colors.purple,
              title: Text(name),
              subtitle: Text(link),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        backgroundColor: Colors.purple,
      ),
    );
  }

  Future<void> fetchUsers() async {
    print('fetchusers called');
    const url = 'https://kontests.net/api/v1/all';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    users = json;
    print(json);
    print('HI');
    print(json[0]);
    // setState(() {
    // users = json['name'];
    // meta = json['meta'];
    // });
    print(users.length);
    print('fetchusers completed');
  }
}
// class Urlink extends StatefulWidget {
//   const Urlink({super.key});
//   @override
//   State<Urlink> createState() => _UrlinkState();
// }
// Class _UrlinkState extends StatefulWidget{

// }
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('URL')),
    );
  }
}
