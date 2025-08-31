import 'package:flutter/material.dart';

class note_screen extends StatefulWidget {
  const note_screen({super.key});

  @override
  State<note_screen> createState() => _note_screenState();
}

class _note_screenState extends State<note_screen> {
  @override
  Widget build(BuildContext context) {
    final arg=ModalRoute.of(context)!.settings.arguments.toString();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 58.0,left: 20,),
        
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date: 12/12/2025'),
                   SizedBox(height: 50,),
                   Text(arg,style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                  SizedBox(height: 150,),
                   Text('Write Some thing About you this subtitele'),
      
                ],
              ),
            ),
          ),
        
      ),
    );
  }
}
