import 'package:flutter/material.dart';

class MyTextBox extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool? readonly;
  final Widget? prefixIcon;
  //final TextEditingController controller;
  final bool isPassword;
  final TextInputType inputType;

  const MyTextBox({
    super.key,
    required this.labelText,
    this.prefixIcon,
    required this.readonly,
    required this.hintText,
    // required this.controller,
    this.isPassword = false,
    this.inputType = TextInputType.text,
  });

  @override
  State<MyTextBox> createState() => _MyTextBoxState();
}

class _MyTextBoxState extends State<MyTextBox> {
  late FocusNode _focusNode;
  @override
  void initState() {
    _focusNode = FocusNode();

    // Request focus when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        // controller: controller,
        enabled: widget.readonly ?? true,
        obscureText: widget.isPassword,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          labelText: widget.labelText,
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 15.0,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
