import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Text(title, style: Theme.of(context).textTheme.headline5, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
