import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

class Hackathon extends StatefulWidget {
  const Hackathon({super.key});

  @override
  State<Hackathon> createState() => _HackathonState();
}

List<dynamic> users = [];
// int a = 0;

class _HackathonState extends State<Hackathon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () {},
        // ),
        title: const Text("Hackathon"),
        elevation: 10,
        // centerTitle: true,
        backgroundColor: Colors.purple.withOpacity(0.7),
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadiusDirectional.vertical(bottom: Radius.circular(20))),
      ),
      body: //ListView.builder(
          //   itemCount: users.length,
          //   itemBuilder: (context, index) {
          //     print(index);
          //     print(users.length);
          //     final user = users[index];
          //     final name = user["title"];
          //     final link = user["url"];
          //     return ListTile(
          //       leading: CircleAvatar(
          //         backgroundColor: Colors.purple,
          //         child: Text('${index + 1}'),

          //         // actions:
          //       ),
          //       // actions:link
          //       // tileColor: Colors.purple,
          //       title: Text(name.toString()),
          //       subtitle: Text(link),
          //     );
          //   },
          // ),
          Center(
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return contactItem(
                users[index]["title"],
                users[index]["url"],
                index,
                users[index]["open_state"],
                users[index]["id"].toString(),
              );
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        backgroundColor: Colors.purple,
      ),
    );
  }

  Future<void> fetchUsers() async {
    print('fetchusers called');
    const url = 'https://devpost.com/api/hackathons';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['hackathons'];
    });
    print('fetchusers completed');
  }

  Widget contactItem(String name, String link, int i, String op, String id) {
    // print(i);
    // a = i;
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.purple,
        child: Text('${i + 1}'),
      ),
      title: Text(name),
      subtitle: Text(op),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const MainScreen(),
                settings: RouteSettings(arguments: i)));
      },
      // tileColor: Colors.purple,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final a = ModalRoute.of(context)!.settings.arguments;
    int i = int.parse(a.toString());
    print(i);
    return Scaffold(
      appBar: AppBar(title: Text(users[i]["title"])),
      body: Center(
        child: Text("URL: " +
            users[i]["url"] +
            "\n\nRegistration Count: " +
            users[i]["registrations_count"].toString() +
            "\n\nSubmission Date: " +
            users[i]["submission_period_dates"]),
        // child:GestureDetector
      ),
    );
  }

  // Future<void> _launchURL(String url) async {
  //   final Uri uri = Uri(scheme: "https", host: url);
  //   if (!await launchUrl(
  //     uri,
  //     mode: LaunchMode.externalApplication,
  //   )) {
  //     throw "Can not launch url";
  //   }
  // }
}
