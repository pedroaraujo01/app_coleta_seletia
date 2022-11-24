import 'package:flutter/material.dart';

class PainelSindicoView extends StatefulWidget {
  const PainelSindicoView({Key? key}) : super(key: key);

  @override
  State<PainelSindicoView> createState() => _PainelSindicoViewState();
}

class _PainelSindicoViewState extends State<PainelSindicoView> {
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
