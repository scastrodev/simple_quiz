import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({required this.text, required this.handleClick, Key? key}) : super(key: key);

  final String text;
  final VoidCallback handleClick;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ElevatedButton(
        onPressed: handleClick,
        child: Text(text),
        style: ElevatedButton.styleFrom(fixedSize: Size(screenSize.width * 0.6, screenSize.height * 0.04)),
      ),
    );
  }
}
