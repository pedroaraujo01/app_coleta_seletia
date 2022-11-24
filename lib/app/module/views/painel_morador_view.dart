import 'package:flutter/material.dart';

class PainelMoradorView extends StatefulWidget {
  const PainelMoradorView({Key? key}) : super(key: key);

  @override
  State<PainelMoradorView> createState() => _PainelMoradorViewState();
}

class _PainelMoradorViewState extends State<PainelMoradorView> {
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
