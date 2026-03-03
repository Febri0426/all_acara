import 'package:flutter/material.dart';
import 'package:all_acara/acara16///DrawerScreen.dart';
import 'package:all_acara/acara16///Models/Chart_model.dart';

class telegram extends StatefulWidget {
  @override
  _TelegramState createState() => _TelegramState();
}

class _TelegramState extends State<telegram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Telegram"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      drawer: DrawerScreen(),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundImage:
              NetworkImage(items[index].profileUrl),
            ),
            title: Text(
              items[index].name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(items[index].message),
            trailing: Text(items[index].time),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: items.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create, color: Colors.white),
        backgroundColor: Color(0xff56A9E9),
        onPressed: () {},
      ),
    );
  }
}
