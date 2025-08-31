
import 'package:flutter/material.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: 1000,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/note_screen',arguments: 'title' + index.toString() );
              },
              title: Text('title' + index.toString()),
              subtitle: Text('Wite some thing about you' + index.toString()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.edit),Icon(Icons.delete),]),
            );
          },
        ),
      ),
    );
  }
}
