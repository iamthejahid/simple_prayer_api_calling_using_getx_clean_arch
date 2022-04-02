import 'package:flutter/material.dart';

class RowOfTheTable extends StatelessWidget {
  const RowOfTheTable({Key? key, required this.str}) : super(key: key);
  final String str;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Center(
        child: Text(
          str,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
