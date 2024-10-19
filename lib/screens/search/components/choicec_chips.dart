import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChoiceChips extends StatelessWidget {
  const ChoiceChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Choose an item'),
            const SizedBox(height: 10.0),
            Wrap(
              spacing: 5.0,
              children: List<Widget>.generate(
                3,
                (int index) {
                  return ChoiceChip(
                    label: Text('Item $index'),
                    selected: true, //_value == index,
                    onSelected: (bool selected) {
                     // setState(() {
                        //_value = selected ? index : null;
                     // });
                    },
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
