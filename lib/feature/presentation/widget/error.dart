
import 'package:flutter/material.dart';

class Errors extends StatefulWidget {
  final String error;
  const Errors({required this.error,Key? key}) : super(key: key);

  @override
  State<Errors> createState() => _ErrorsState();
}

class _ErrorsState extends State<Errors> {
  @override
  Widget build(BuildContext context) {
    return(
      Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text("Xatolik yuzaga keldi.\n${widget.error}"),
          ),
        ),
      )
    );
  }
}