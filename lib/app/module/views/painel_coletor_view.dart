import 'package:flutter/material.dart';

class PainelColetorView extends StatefulWidget {
  const PainelColetorView({Key? key}) : super(key: key);

  @override
  State<PainelColetorView> createState() => _PainelColetorViewState();
}

class _PainelColetorViewState extends State<PainelColetorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 40,
          width: 40,
          color: Colors.amber,
        ),
      ),
    );
  }
}
