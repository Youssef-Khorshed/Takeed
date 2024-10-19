import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DepatureDateCard extends StatelessWidget{
  const DepatureDateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              TextField(),
              TextField()
            ],
          ),
          CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now(), onDateChanged: (DateTime value) {  },),
          CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now(), onDateChanged: (DateTime value) {  },),

        ],
      ),
    );
  }

}