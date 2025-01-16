// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IDPassportRadioButton extends StatefulWidget {
  Function(String value) onselectedvalue;
  IDPassportRadioButton({
    super.key,
    required this.onselectedvalue,
  });

  @override
  IDPassportRadioButtonState createState() => IDPassportRadioButtonState();
}

class IDPassportRadioButtonState extends State<IDPassportRadioButton> {
  String? _selectedValue = 'ID';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Radio<String>(
              value: 'ID',
              groupValue: _selectedValue,
              onChanged: (String? value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
            const Text('ID'),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: 'PASSPORT',
              groupValue: _selectedValue,
              onChanged: (String? value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
            const Text('PASSPORT'),
          ],
        ),
      ],
    );
  }
}
